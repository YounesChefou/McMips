	.data
	
TabN :	.word 60, 61, 62, 63 ,64, 65, 66, 67, 68, 69, 70, 71, 72

TabT : 	.byte 'q', 'z', 's', 'e', 'd', 'f', 't', 'g', 'y', 'h', 'u', 'j', 'k'
TabJ :	.word 60, 60, 62, 60, 64, 65, 60
msgB :	.asciiz "Bienvenue sur le super Synthé 2000 !!\n Les notes sont réparties entre la lettre q : Do et k : Do\n"
msgM : 	.ascii "Menu :\n 1- Instrument\n"
	.ascii "2 - Volume\n"
	.ascii "3 - Duration de la note\n"
	.asciiz "4 - Quitter le menu\n"
msgParam: .ascii "Appuyez sur + pour augmenter, - pour diminuer, * pour revenir à la valeur par défaut\n"
	  .asciiz "et = pour valider les paramètres.\n"
msgVol:	.asciiz "\nVolume => "
msgDuree: .asciiz " <= Durée de la note \n"
msgQuit:.asciiz "Vous avez choisi de quitter le menu. Retour sur le mode synthétiseur. \n"
msgI :	.ascii "\nChoisis un instrument !\n0-7   Piano	\n"
	.ascii "8-15    Chromatic Percussion\n16-23    Organ	\n24-31    Guitar\n32-39    Bass\n"
	.ascii "40-47    Strings\n48-55    Ensemble \n56-63    Brass\n64-71    Reed\n72-79    Pipe \n80-87    Synth Lead \n88-95    Synth Pad \n"
	.ascii "96-103    Synth Effects	\n104-111    Ethnic 	\n"
	.asciiz "112-119    Percussion	\n120-127    Sound Effects\nAppuie sur 128 pour quitter\n"
msgF :	.asciiz "Merci d'avoir joué !"

	.text

######### DEBUT ############

Jingl :	la $t0, TabJ
	addi $t3, $t3, 0
	li $a1, 150
loop1 :	beq $t3, 6, Bienv
	jal Joue
	addi $t0, $t0, 4
	addi $t3, $t3, 1
	li $v0, 32
	li $a0, 250
	syscall
	j loop1
	
	
	
Bienv :	li $v0, 4
	la $a0, msgB
	syscall
	li $t3, 60 #Registre contenant le Volume
	li $t4, 400 #Registre contenant la Duration de la note
	
ChoixI :la $a0, msgI
	li $v0, 4
	syscall
	li $v0	5
	syscall
	addi $a2, $v0, 0
	beq $v0, 128, FIN #A REVOIR
	li $a1, 400
	
########### MAIN ##################

LireChar:li $v0, 12	#lire un charactere
	syscall
	beq $v0, 'm', Menu #Si il appuie sur m : le menu s'affiche
	jal fJoueNote #Joue la note correspondante
	j LireChar	#relis une note

Menu:	la $a0, msgM
	li $v0, 4
	syscall
	li $v0, 5
	syscall

Choix:	beq $v0, 1, ChoixI
	beq $v0, 2, Volume
	beq $v0, 3, Duration
	beq $v0, 4, Quitter
	
Volume:	jal fChgtVolume
	j Menu

Duration:jal fChgtDuration
	j Menu 

Quitter:la $a0, msgQuit 
	li $v0, 4
	syscall
	j LireChar
	 
	
	
########### FONCTIONS ##############	

fJoueNote :	la $t0, TabN #$t0 contient le tableau de Note
	la $t1, TabT	#$t1 contient le tableau de touche
CondNote: lb $t2, 0($t1) #contient un caractere du tableau de caractere
	beq $t2, $v0, Joue
	addi $t1, $t1, 1 #On passe au caractere suivant
	addi $t0, $t0, 4 #On passe a la note suivante
	j CondNote
Joue :	lw $a0, 0($t0) #Parametre de la note
	li $v0, 31 #Syscall pour jouer la note
	add $a1, $t4, $zero #duration
	add $a3, $t3, $zero
	syscall
	jr $ra

fChgtVolume: li $v0, 4
	     la $a0, msgParam
	     syscall
Boucle:	     li $v0, 4		#Affichage du niveau actuel du volume
	     la $a0, msgVol
	     syscall
	     li $v0, 1
	     add $a0, $zero, $t3
	     syscall
	     li $v0, 11
	     add $a0, $zero, '\n'
	     syscall
	     li $v0, 12
	     syscall
	     beq $v0, '=', ConfirmerVolume
	     beq $v0, '+', AugmenterVolume
	     beq $v0, '-', DiminuerVolume
	     beq $v0, '*', DefautVolume
	     
AugmenterVolume:   addi $t3, $t3, 2
	           j Boucle
	     
DiminuerVolume:    addi $t3, $t3, -2
	           j Boucle
	     
DefautVolume: 	   addi $t3, $t3, 60
		   j Boucle

ConfirmerVolume:   bgez $t3, FinVolume
		   addi $t3, $zero, 60
		   
FinVolume:	   jr $ra

fChgtDuration:	   jr $ra #SOOn
	
########### FIN ###################
	
FIN : 	li $v0, 10
	syscall
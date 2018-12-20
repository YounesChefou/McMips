	.data
	
TabN :	.word 60, 61, 62, 63 ,64, 65, 66, 67, 68, 69, 70, 71, 72

TabT : 	.byte 'q', 'z', 's', 'e', 'd', 'f', 't', 'g', 'y', 'h', 'u', 'j', 'k'
TabJ :	.word 60, 60, 62, 60, 64, 65, 60
msgB :	.asciiz "Bienvenue sur le super Synthé 2000 !!\n Les notes sont réparties entre la lettre q : Do et k : Do\n"
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
	beq $v0, 'm', ChoixI #Si il appuie sur m : retour sur le Menu Instrument
	jal fJoueNote #Joue la note correspondante
	j LireChar	#relis une note
	
########### FONCTIONS ##############	

fJoueNote :	la $t0, TabN #$t0 contient le tableau de Note
	la $t1, TabT	#$t1 contient le tableau de touche
Cond :	lb $t2, 0($t1) #contient un caractere du tableau de caractere
	beq $t2, $v0, Joue
	addi $t1, $t1, 1 #On passe au caractere suivant
	addi $t0, $t0, 4 #On passe a la note suivante
	j Cond
Joue :	lw $a0, 0($t0) #Parametre de la note
	li $v0, 31 #Syscall pour jouer la note
	li $a1, 400 #duration
	li $a3, 60
	syscall
	jr $ra
	
########### FIN ###################
	
FIN : 	li $v0, 10
	syscall


	
	

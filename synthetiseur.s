	.data
	
TabN :	.word 60, 61, 62, 63 ,64, 65, 66, 67, 68, 69, 70, 71, 72

TabT : 	.byte 'q', 'z', 's', 'e', 'd', 'f', 't', 'g', 'y', 'h', 'u', 'j', 'k'
TabJ :	.word 60, 60, 62, 60, 64, 65, 60
msgB :	.asciiz "Bienvenue sur le super Synthé 2000 !!\n Les notes sont réparties entre la lettre q : Do et k : Do\n"
msgI :	.ascii "Choisis un instrument !\n0-7   Piano	\n64-71    Reed \n"
	.ascii "8-15    Chromatic Percussion\n72-79    Pipe \n16-23    Organ	\n"
	.ascii "80-87    Synth Lead \n24-31    Guitar	\n88-95    Synth Pad \n32-39    Bass	\n"
	.ascii "96-103    Synth Effects \n40-47    Strings	\n104-111    Ethnic \n48-55    Ensemble	\n"
	.asciiz "112-119    Percussion \n56-63    Brass	\n120-127    Sound Effects\nAppuie sur q pour quitter\n"
msgF :	.asciiz "Merci d'avoir joué !"

	.text

	la $t0, TabJ
	addi $t3, $t3, 0
	li $a1, 250
Jingl :	beq $t3, 6, Bienv
	jal Joue
	addi $t0, $t0, 4
	addi $t3, $t3, 1
	j Jingl
	
	
	
Bienv :	li $v0, 4
	la $a0, msgB
	syscall
ChoixI :la $a0, msgI
	li $v0, 4
	syscall
	li $v0	5
	syscall
	addi $a2, $v0, 0
	#beq $v0, 'q', FIN #A REVOIR
	li $a1, 400
LireChar:li $v0, 12	#lire un charactere
	syscall
	beq $v0, 'm', ChoixI #Si il appuie sur m : retour sur le Menu Instrument
	jal fJoueNote #Joue la note correspondante
	j LireChar	#relis une note
	
fJoueNote :	la $t0, TabN #$t0 contient le tableau de Note
	la $t1, TabT	#$t1 contient le tableau de touche
Cond :	lb $t2, 0($t1) #contient un caractere du tableau de caractere
	beq $t2, $v0, Joue
	addi $t1, $t1, 1 #On passe au caractere suivant
	addi $t0, $t0, 4 #On passe a la note suivante
	j Cond
Joue :	lw $a0, 0($t0) #Parametre de la note
	li $v0, 33 #Syscall pour jouer la note
	li $a1, 400 #duration
	li $a3, 60
	syscall
	jr $ra


	
	

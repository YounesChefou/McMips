	.data
DO:	.word 60
REb:	.word 61
RE :	.word 62
MIb :	.word 63
MI :	.word 64
FA : 	.word 65
SOLb :	.word 66
SOL :	.word 67
LAb :	.word 68
LA :	.word 69
SIb :	.word 70
SI :	.word 71
DO1 :	.word 72
msgB :	.asciiz "Bienvenu sur le super Synthé 2000 !!\n Les notes sont réparties entre la lettre q : Do et k : Do\n"
msgI :	.asciiz "Choisi un instrument !\n0-7   Piano	\n64-71    Reed \n8-15    Chromatic Percussion\n72-79    Pipe \n16-23    Organ	\n80-87    Synth Lead \n24-31    Guitar	\n88-95    Synth Pad \n32-39    Bass	\n96-103    Synth Effects \n40-47    Strings	\n104-111    Ethnic \n48-55    Ensemble	\n112-119    Percussion \n56-63    Brass	\n120-127    Sound Effects\nAppuie sur BACKSPACE pour quitter\n"


	.text
	
affiche:li $v0, 4
	la $a0, msgB
	syscall
message:la $a0, msgI
	syscall
	li $v0	5
	syscall
	add $s7, $v0, $0
	li $s6, 32 #CODE TOUCHE ECHAP
	beq $s7, $s6, FIN
Choix :	li $v0, 12
	syscall
	li $t1, 113 	#q
	li $t2, 122	#z
	li $t3, 115	#s
	li $t4, 101	#e
	li $t5, 100	#d
	li $t6, 102	#f
	li $t7, 116	#t
	li $t8, 103	#g
	li $t9, 121	#y
	li $s0, 104	#h
	li $s1, 117	#u
	li $s2, 106	#j
	li $s3, 107	#k
	li $s4, 32 #BACKSPACE POUR QUITTER LE MODE JOUER ET RETOURNER DANS LE MODE CHOISIR UN INSTRUMENT
	beq $v0, $t1, JoueDo
	beq $v0, $t2, JoueReb
	beq $v0, $t3, JoueRe
	beq $v0, $t4, JoueMib
	beq $v0, $t5, JoueMi
	beq $v0, $t6, JoueFa
	beq $v0, $t7, JoueSolb
	beq $v0, $t8, JoueSol
	beq $v0, $t9, JoueLab
	beq $v0, $s0, JoueLa
	beq $v0, $s1, JoueSib
	beq $v0, $s2, JoueSi
	beq $v0, $s3, JoueDo1
	beq $v0, $s4, message
	j Choix
	
JoueDo:	lw $a0, DO
	add $a2, $s7, $0
	li $a1, 400
	li $a3, 60
	li $v0, 33
	syscall
	j Choix
	
JoueReb:	lw $a0, REb
	add $a2, $s7, $0
	li $a1, 400
	li $a3, 60
	li $v0, 33
	syscall
	j Choix

JoueRe:	lw $a0, RE
	add $a2, $s7, $0
	li $a1, 400
	li $a3, 60
	li $v0, 33
	syscall
	j Choix
	
JoueMib:	lw $a0, MIb
	add $a2, $s7, $0
	li $a1, 400
	li $a3, 60
	li $v0, 33
	syscall
	j Choix
	
JoueMi:	lw $a0, MI
	add $a2, $s7, $0
	li $a1, 400
	li $a3, 60
	li $v0, 33
	syscall
	j Choix
	
JoueFa:	lw $a0, FA
	add $a2, $s7, $0
	li $a1, 400
	li $a3, 60
	li $v0, 33
	syscall
	j Choix
	
JoueSolb:	lw $a0, SOLb
	add $a2, $s7, $0
	li $a1, 400
	li $a3, 60
	li $v0, 33
	syscall
	j Choix
	
JoueSol:	lw $a0, SOL
	add $a2, $s7, $0
	li $a1, 400
	li $a3, 60
	li $v0, 33
	syscall
	j Choix
	
JoueLab:	lw $a0, LAb
	add $a2, $s7, $0
	li $a1, 400
	li $a3, 60
	li $v0, 33
	syscall
	j Choix
	
JoueLa:	lw $a0, LA
	add $a2, $s7, $0
	li $a1, 400
	li $a3, 60
	li $v0, 33
	syscall
	j Choix
	
JoueSib:	lw $a0, SIb
	add $a2, $s7, $0
	li $a1, 400
	li $a3, 60
	li $v0, 33
	syscall
	j Choix
	
JoueSi:	lw $a0, SI
	add $a2, $s7, $0
	li $a1, 400
	li $a3, 60
	li $v0, 33
	syscall
	j Choix
	
JoueDo1:	lw $a0, DO1
	add $a2, $s7, $0
	li $a1, 400
	li $a3, 60
	li $v0, 33
	syscall
	j Choix

FIN :	li $v0, 10
	syscall
	

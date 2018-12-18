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

	.text
	
	
Choix :	li $v0, 12
	syscall
	li $t1, 113 	#q
	li $t2, 122	#z
	li $t3, 115	#s
	li $t4, 251	#e
	li $t5, 250	#d
	li $t6, 252	#f
	li $t7, 116	#t
	li $t8, 253	#g
	li $t9, 121	#y
	li $s0, 254	#h
	li $s1, 117	#u
	li $s2, 256	#j
	li $s3, 257	#k
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
	j Choix
	
JoueDo:	lw $a0, DO
	li $a2, 5
	li $a1, 25
	li $a3, 60
	li $v0, 33
	syscall
	j Choix
	
JoueReb:	lw $a0, REb
	li $a2, 5
	li $a1, 25
	li $a3, 60
	li $v0, 33
	syscall
	j Choix

JoueRe:	lw $a0, RE
	li $a2, 5
	li $a1, 25
	li $a3, 60
	li $v0, 33
	syscall
	j Choix
	
JoueMib:	lw $a0, MIb
	li $a2, 5
	li $a1, 25
	li $a3, 60
	li $v0, 33
	syscall
	j Choix
	
JoueMi:	lw $a0, MI
	li $a2, 5
	li $a1, 25
	li $a3, 60
	li $v0, 33
	syscall
	j Choix
	
JoueFa:	lw $a0, FA
	li $a2, 5
	li $a1, 25
	li $a3, 60
	li $v0, 33
	syscall
	j Choix
	
JoueSolb:	lw $a0, SOLb
	li $a2, 5
	li $a1, 25
	li $a3, 60
	li $v0, 33
	syscall
	j Choix
	
JoueSol:	lw $a0, SOL
	li $a2, 5
	li $a1, 25
	li $a3, 60
	li $v0, 33
	syscall
	j Choix
	
JoueLab:	lw $a0, LAb
	li $a2, 5
	li $a1, 25
	li $a3, 60
	li $v0, 33
	syscall
	j Choix
	
JoueLa:	lw $a0, LA
	li $a2, 5
	li $a1, 25
	li $a3, 60
	li $v0, 33
	syscall
	j Choix
	
JoueSib:	lw $a0, SIb
	li $a2, 5
	li $a1, 25
	li $a3, 60
	li $v0, 33
	syscall
	j Choix
	
JoueSi:	lw $a0, SI
	li $a2, 5
	li $a1, 25
	li $a3, 60
	li $v0, 33
	syscall
	j Choix
	
JoueDo1:	lw $a0, DO1
	li $a2, 5
	li $a1, 25
	li $a3, 60
	li $v0, 33
	syscall
	j Choix
	

	
	

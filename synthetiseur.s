	.data

TabN:
	.word 0, 1, 2, 3 ,4, 5, 6, 7, 8, 9, 10, 11, 12

TabT:
	.byte 'q', 'z', 's', 'e', 'd', 'f', 't', 'g', 'y', 'h', 'u', 'j', 'k'
TabJ:
	.word 00, 00, 02, 00, 04, 05, 00
Instrument:
	.word 1
ParamVolume:
	.word 60
ParamOctave:
	.word 60
ParamDuree:
	.word 400
msgB:
	.asciiz "Bienvenue sur le super Synthé 3000 !!\n"
ascArt:
	.ascii "===============================================================================\n"
	.ascii "| ====  =   =  =     =  =======  =    =  =====   ====    ====   ====   ====   |\n"
	.ascii "| |      = =   |=    |     |     |    |  |           =  =    = =    = =    =  |\n"
	.ascii "| |       =    | =   |     |     |    |  |           =  |    | |    | |    |  |\n"
	.ascii "| ====    |    |  =  |     |     |====|  ====     = =   |    | |    | |    |  |\n"
	.ascii "|    |    |    |   = |     |     |    |  |           =  |    | |    | |    |  |\n"
	.ascii "|    |    |    |    =|     |     |    |  |           =  =    = =    = =    =  |\n"
	.ascii "| ====    =    =     =     =     =    =  =====   ====    ====   ====   ====   |\n"
	.asciiz "===============================================================================\n\n\n"
msgM:
	.ascii 	"\nMenu :\n1- Instrument\n"
	.ascii	"2 - Octave\n"
	.ascii 	"3 - Volume\n"
	.ascii 	"4 - Duration de la note\n"
	.ascii 	"5 - Quitter le menu\n"
	.asciiz "6 - Quitter le synthétiseur\n"

SyntArt:
	.ascii"-----------------------------------------------------\n"
	.ascii"|   |   |   |   |   |   |   |   |   |   |   |   |   |\n"
	.ascii"|   |   |   |   |   |   |   |   |   |   |   |   |   |\n"
	.ascii"|   |   |   |   |   |   |   |   |   |   |   |   |   |\n"
	.ascii"|   |   |   |   |   |   |   |   |   |   |   |   |   |\n"
	.ascii"|   |   |   |   |   |   |   |   |   |   |   |   |   |\n"
	.ascii"|   | z |   | e |   |   | t |   | y |   | u |   |   |\n"
	.ascii"|   |___|   |___|   |   |___|   |___|   |___|   |   |_ \n"
	.ascii"|     |       |     |     |       |       |     |     |\n"
	.ascii"|     |       |     |     |       |       |     |     |\n"
	.ascii"|  q  |   s   |  d  |  f  |   g   |   h   |  j  |  k  |\n"
	.ascii"|     |       |     |     |       |       |     |     |\n"
	.ascii"|     |       |     |     |       |       |     |     |\n"
	.ascii"-------------------------------------------------------\n\n"
	.ascii"Appuie sur m pour retourner au menu ! et pouvoir profiter de centaines d'instruments\n"
	.asciiz"ou encore modifier les paramètres de tes instruments préférés\n"
msgParam:
	.ascii "\n Appuyez sur + pour augmenter, - pour diminuer, * pour revenir à la valeur par défaut\n"
	.asciiz "et = pour valider les paramètres.\n"
msgVol:
	.asciiz "\nVolume => "
msgDuree:
	.asciiz "\nDurée de la note => "
msgOctave:
	.asciiz "\n Note => "
msgParamOctave:
	.asciiz "\n Les valeurs vont de 0 à 100.\n"
msgQuitMenu:
	.asciiz "Vous avez choisi de quitter le menu. Retour sur le mode synthétiseur. \n"
msgQuitSynthe:
	.ascii  "\nEtes-vous sûr de vouloir quitter le magnifique et superbement admirable synthétiseur ?\n"
	.asciiz "Appuie sur 'y' pour nous briser le coeur,Appuie sur 'n' pour continuer à t'amuser\n"
msgErreurQuitter:
	.asciiz "\nVeuillez entrer soit y, soit n\n"
msgI:
	.ascii "\nChoisis un instrument !\n0-7   Piano	\n"
	.ascii "8-15    Percussions Chromatique\n16-23    Orgue	\n24-31    Guitare\n32-39    Basse\n"
	.ascii "40-47    Instruments à Cordes\n48-55    Ensemble \n56-63    Cuivre\n64-71    Bois\n72-79    Flûte \n80-87    Synth Lead \n88-95    Synth Pad \n"
	.ascii "96-103    Effets Synthétiseurs	\n104-111    Éxotique 	\n"
	.asciiz "112-119    Percussion	\n120-127    Effets Sonores\n"
msgF:
	.asciiz "Merci d'avoir joué !"

	.text

######### DEBUT ############
afficheArt:
	la $a0, ascArt
	
	li $v0, 4
	
	syscall

Jingl:

	la $t0, TabJ
	
	addi $t3, $t3, 0
	
	li $a1, 150
	
loop1:

	beq $t3, 6, Bienv
	
	jal Joue
	
	addi $t0, $t0, 4
	
	addi $t3, $t3, 1
	
	li $v0, 32
	
	li $a0, 250
	
	syscall
	
	j loop1



Bienv:
	li $v0, 4
	
	la $a0, msgB
	
	syscall


########### MAIN ##################

Menu:

	la $a0, msgM
	
	li $v0, 4
	
	syscall
	
	li $v0, 5
	
	syscall

Choix:

	beq $v0, 1, ChoixI
	
	beq $v0, 2, Octave
	
	beq $v0, 3, Volume
	
	beq $v0, 4, Duration
	
	beq $v0, 5, QuitterMenu
	
	beq $v0, 6, QuitterSynthe

ChoixI:

	la $a0, msgI
	
	li $v0, 4
	
	syscall
	
	li $v0	5
	
	syscall
	
	la $t0, Instrument
	
	sw $v0, 0($t0)
	
	li $a1, 400
	
	la $a0, SyntArt
	
	li $v0, 4
	
	syscall
	
LireChar:

	li $v0, 12		#lire un charactere
	
	syscall
	
	beq $v0, 'm', Menu 	#Si il appuie sur m : le menu s'affiche
	
	jal fJoueNote 		#Joue la note correspondante
	
	j LireChar		#relis une note

Octave:

	jal fChgtOctave
	
	j Menu

Volume:

	jal fChgtVolume
	
	j Menu

Duration:

	jal fChgtDuration
	
	j Menu

QuitterMenu:

	la $a0, msgQuitMenu
	
	li $v0, 4
	
	syscall
	
	la $a0, SyntArt
	
	syscall
	
	j LireChar

QuitterSynthe:

	li $v0, 4
	
	la $a0, msgQuitSynthe
	
	syscall
	
	li $v0, 12
	
	syscall
	
	beq $v0, 'y', FIN
	
	beq $v0, 'n', Menu
	
	li $v0, 4
	
	la $a0, msgErreurQuitter
	
	syscall
	
	j QuitterSynthe



########### FONCTIONS ##############

fJoueNote:

	la $t0, TabN 		#$t0 contient le tableau de Note
	
	la $t1, TabT		#$t1 contient le tableau de touche
	
	li $t3, 0
	
CondNote:

	beq $t3, 13, FinJoueNote
	
	lb $t2, 0($t1)		#contient un caractere du tableau de caractere
	
	beq $t2, $v0, Joue
	
	addi $t1, $t1, 1 	#On passe au caractere suivant
	
	addi $t0, $t0, 4 	#On passe a la note suivante
	
	addi $t3, $t3, 1
	
	j CondNote
	
Joue:

	lw $a0, 0($t0) 		#Parametre de la note
	
	lw $t2, ParamOctave 	#$t2 prend l'octave actuel
	
	add $a0, $a0, $t2 	#On ajoute l'octace correspondant au choix de l'utilisateur (60 par défaut)
	
	li $v0, 31 		#Syscall pour jouer la note
	
	lw $a1, ParamDuree
	
	lw $a2, Instrument
	
	lw $a3, ParamVolume
	
	syscall

FinJoueNote:

	jr $ra

fChgtVolume:

	li $v0, 4
	
	la $a0, msgParam
	
	syscall
	
	lw $t0, ParamVolume	#$t0 contient la valeur contenue à l'adresse "Volume"
	
	la $t1, ParamVolume	#$t1 contient l'adresse "Volume"
	
	li $t2, 126		#Valeur maximale accepté
	
BoucleVol:

				#Affichage du niveau actuel du volume
	
	li $v0, 4
	
	la $a0, msgVol 		#Affichage de "Volume => "
	
 	syscall
 	
	li $v0, 1
	
	add $a0, $zero, $t0
	
	syscall        		#Affichage du volume
	
	li $v0, 11
	
	add $a0, $zero, '\n'
	
	syscall  		#Saut a la ligne
	
	li $v0, 12
	
	syscall			#Choix de l'utilisateur"
	
	beq $v0, '=', ConfirmerVolume	#Confirmer les modifications en appuyant sur =
	
	beq $v0, '+', AugmenterVolume	#Augmenter le volume en appuyant sur +
	
	beq $v0, '-', DiminuerVolume	#Diminuer le volume en appuyant sur -
	
	beq $v0, '*', DefautVolume	#Remettre la valeur par défaut : 60

AugmenterVolume:

	addi $t0, $t0, 2
	
	bge  $t0, $t2, ValeurMaxVolume
	
	j BoucleVol

DiminuerVolume:

	addi $t0, $t0, -2
	
	bltz $t0, ValeurMinDuree
	
	j BoucleVol

DefautVolume:

	li $t0, 60
	
	j BoucleVol

ValeurMinVolume:

	li $t0, 0
	
	j BoucleVol

ValeurMaxVolume:

	add $t0, $t2, $zero
	
	j BoucleVol

ConfirmerVolume:

	sw $t0, 0($t1)	 	#On enregistre la nouvelle valeur du volume a l'adresse designee par l'etiquette "Volume"

FinVolume:

	jr $ra


fChgtDuration:

	li $v0, 4
	
  	la $a0, msgParam
  	
	syscall
	
	lw $t0, ParamDuree	#$t0 contient la valeur contenue à l'adresse "Duree"
	
	la $t1, ParamDuree	#$t1 contient l'adresse "Duree"
	
	
BoucleDuree:

				#Affichage du niveau actuel du volume
	
	li $v0, 4
	
	la $a0, msgDuree	#Affiche la chaine de caractères : "Duree de la note => "
	
	syscall
	
	li $v0, 1
	
	add $a0, $zero, $t0
	
	syscall
	
	li $v0, 11
	
	add $a0, $zero, '\n'
	
	syscall
	
	li $v0, 12
	
	syscall			#Attend le caractère correspondant à l'action choisie
	
	
				#Choix de l'utilisateur
	
	
	beq $v0, '=', ConfirmerDuration #Confirmer les modifications en appuyant sur =
	
	beq $v0, '+', AugmenterDuration #Augmenter la durée de la note en appuyant sur +
	
	beq $v0, '-', DiminuerDuration 	#Diminuer la durée de la note en appuyant sur -
	
	beq $v0, '*', DefautDuration 	#Remettre la valeur par défaut : 400

AugmenterDuration:

	addi $t0, $t0, 100
	
	j BoucleDuree

DiminuerDuration:

	addi $t0, $t0, -100
	
	beqz $t0, ValeurMinDuree
	
	j BoucleDuree

DefautDuration:

	addi $t0, $zero, 400
	
	j BoucleDuree

ValeurMinDuree:

	addi $t0, $zero, 100
	
	j BoucleDuree

ConfirmerDuration:

	sw $t0, 0($t1)	 	#On enregistre la nouvelle valeur de la duree a l'adresse designee par l'etiquette "Duree"

FinDuration:

	jr $ra


fChgtOctave:

	li $v0, 4
	
	la $a0, msgParamOctave
	
	syscall
	
	la $a0, msgParam
	
	syscall
	
	lw $t0, ParamOctave	# $t0 contient la valeur contenue à l'adresse "Octave"
	
	la $t1, ParamOctave	# $t1 contient l'adresse "Octave"
				
	li $t2, 110		
	
BoucleOctave:

				#Affichage du niveau actuel de l'octave
	
	li $v0, 4
	
	la $a0, msgOctave 	#Affiche "Note => "
	
 	syscall
 	
	li $v0, 1
	
	add $a0, $zero, $t0
	
	syscall 		#Affiche la note
	
	li $v0, 11
	
	add $a0, $zero, '\n' 	#Retour à la ligne
	
	syscall
	
	li $v0, 12
	
	syscall 		#L'utilisateur a maintenant la main pour choisir l'option qui lui convient
	
	beq $v0, '=', ConfirmerOctave 	#Confirmer les modifications en appuyant sur =
	
	beq $v0, '+', MonterOctave	#Monter d'une octave en appuyant sur +
	
	beq $v0, '-', DescendreOctave	#Descendre d'une octave en appuyant sur -
	
	beq $v0, '*', DefautOctave	#Remettre la valeur par défaut : 60
	

MonterOctave:

	addi $t0, $t0, 10
	
	bgt	 $t0, $t2, ValeurMaxOctave
	
	j BoucleOctave
	

DescendreOctave:

	addi $t0, $t0, -10
	
	bltz $t0, ValeurMinOctave
	
	j BoucleOctave
	

DefautOctave:

	li $t0, 60
	
	j BoucleOctave
	

ValeurMinOctave:

	li  $t0, 0
	
	j BoucleOctave
	

ValeurMaxOctave:

	add $t0, $t2, $zero
	
	j BoucleOctave

ConfirmerOctave:

	sw $t0, 0($t1)		 #On enregistre la nouvelle octave a l'adresse designee par l'etiquette "Octave"

FinOctave:

	jr $ra

########### FIN ###################

FIN:

	li $v0, 10
	
	syscall

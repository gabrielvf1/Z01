leaw $R0, %A
movw (%A), %D
;              SE FOR 0 OU 1
;--------------------------------------------
decw %D
leaw $UM %A
jle %D
nop

leaw $R0, %A
movw (%A), %D
leaw $R6, %A
movw %D, (%A)

leaw $R7, %A
movw %D, (%A)
movw (%A), %S	
decw %S
movw %S, (%A)


leaw $R7, %A
movw (%A), %S
leaw $R4, %A
movw %S, (%A)

while1:
;                 MULTIPLICADOR
;----------------------------------------------


	while2:
		leaw $R6, %A
		movw (%A), %D
		leaw $R1, %A
		addw (%A), %D, %S
		leaw $R1, %A
		movw %S, (%A)


		leaw $R4, %A
		movw (%A), %S
		decw %S
		movw %S, (%A)


		leaw %while2, %A
		jg %S
		nop


;---------------------------------------------------

	leaw $R1, %A
	movw (%A), %S
	leaw $R6, %A
	movw %S, (%A)


	leaw $R7, %A
	movw (%A), %S	
	decw %S
	movw %S, (%A)
	decw %S
	leaw $R4, %A
	movw %S, (%A)
	leaw %END, %A
	jle %S
	nop

	leaw %while1, %A
	jmp
	nop

UM:
leaw $1, %A
movw %A, %S
leaw $R1, %A
movw %S, (%A)


END:

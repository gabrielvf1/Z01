; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Multiplica o valor de RAM[1] com RAM[0] salvando em RAM[3]
while1:
	leaw $R1, %A
	movw (%A), %D
	leaw $R2, %A
	addw (%A), %D, %S
	movw %S, (%A)


	leaw $R4, %A
	movw (%A), %S
	incw %S
	movw %S, (%A)


	leaw $R0, %A
	movw (%A), %D
	leaw $R4, %A
	subw (%A), %D,%S


	leaw %while1, %A
	jne %S
	nop


leaw $R2, %A
movw (%A), %D
leaw $R3, %A
movw %D, (%A)

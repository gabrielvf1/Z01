; Arquivo: Pow.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Eleva ao quadrado o valor da RAM[1] e armazena o resultado na RAM[0].
; Só funciona com números positivos
leaw $R1, %A
movw (%A), %D
leaw $R2, %A
movw %D, (%A)
leaw $R5, %A
movw %D, (%A)
leaw $0, %A
movw %A, %S
leaw $R4, %A
movw %S, (%A)
leaw $R3, %A
movw %S, (%A)
leaw $1, %A
movw %A, %S
while1:
	leaw $R2, %A
	addw (%A), %D, %S
	movw %S, (%A)
	leaw $R4, %A
	movw (%A), %S
	incw %S
	movw %S, (%A)
	subw (%A), %D,%S
	leaw %while1, %A
	jne %S
	nop
leaw $R2, %A
subw (%A), %D,%S
leaw $R0, %A
movw %S, (%A)

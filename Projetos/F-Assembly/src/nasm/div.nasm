
leaw $R0,%A 
movw (%A),%D
leaw $R3,%A
movw %D,(%A) ;valor R0 salvo em R3.
leaw $R1,%A
movw (%A),%D ; d com valor de R1
leaw $R4,%A
movw %D,(%A) ; R1 em R4

while1:
	leaw $R3, %A
	movw (%A),%D
	leaw $R4, %A
	subw %D,(%A),%S
	leaw $R3,%A
	movw %S,(%A)
	leaw $R5,%A
	movw (%A),%D
	incw %D
	leaw $R5,%A
	movw %D,(%A)

	leaw $RESULT0,%A
	je %S
	nop

	leaw $RESULTNEG,%A
	jl %S
	nop

	leaw %while1,%A
	jmp
	nop


RESULTNEG:
leaw $R2,%A
subw %D,$1,%S
movw %S,(%A)
leaw $END,%A
jmp
nop


RESULT0:
leaw $R2,%A
movw %D,(%A)

END:
nop

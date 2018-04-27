<<<<<<< HEAD
<<<<<<< HEAD
leaw $R1,%A
movw (%A),%D
leaw $R3,%A
movw %D,(%A) ;valor R0 salvo em R3.
leaw $R2,%A
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
leaw $R2, %A
addw %S,(%A),%D
leaw $R0,%A
movw %D,(%A)
leaw $END,%A
jmp
nop
RESULT0:
leaw $R0,%A
movw %S,(%A)
END:
nop
=======
=======
leaw $R0,%A
movw $0,(%A)
leaw $R2,%A
movw (%A), %D ;valor no RAM[2] que será dividido
leaw $END,%A
je  ;caso D seja igual a zero pula para o loop infinito
nop
leaw $R1,%A
movw (%A), %D ; valor no RAM[1] que será dividido
LOOP:
leaw $R2,%A
subw %D,(%A),%D  ; D = M[1]-M[2]
leaw $END,%A
jl  ;caso D seja igual a zero pula para o loop infinito
nop
leaw $R0,%A
movw %D, (%A)
leaw $LOOP,%A
jmp
nop
END:
leaw $END,%A ; loop infinito para parar
jmp
nop
>>>>>>> upstream/master































<<<<<<< HEAD
>>>>>>> upstream/master
=======











































































































>>>>>>> upstream/master






































































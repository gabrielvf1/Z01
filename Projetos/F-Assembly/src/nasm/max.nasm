; Calcula R2 = max(R0, R1)  (R0,R1,R2 se referem a  RAM[0],RAM[1],RAM[2])
; ou seja, o maior valor que estiver, ou em R0 ou R1 sera copiado para R2
leaw $R1,%A
movw (%A), %D
leaw $R0,%A

subw %D,(%A),%S

leaw $MAXL,%A
jg %S
nop

leaw $R0,%A
movw (%A),%D
leaw $R2, %A
movw %D,(%A)
leaw $END,%A
jmp
nop

MAXL:
leaw $R2, %A
movw %D, (%A)

END:
nop

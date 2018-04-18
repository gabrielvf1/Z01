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


















































































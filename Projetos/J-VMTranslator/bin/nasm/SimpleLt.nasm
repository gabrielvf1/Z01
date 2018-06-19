; 0 - LT
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
subw (%A), %D, %S
leaw $LOWER0, %A  
jl %S
nop
leaw $SP, %A
movw (%A), %A
decw %A
decw %A
movw %A, %D
leaw $0,%A
movw %A, %S
movw %D, %A
movw %S, (%A)
leaw $END0,%A
jmp
nop
LOWER0:
leaw $0,%A
movw %A,%D
decw %D
leaw $SP,%A
movw (%A), %A
decw %A
decw %A
movw %D (%A)
incw %A
movw %A %D
leaw $SP,%A
movw %D,(%A)
leaw $END20,%A
jmp
nop
END0:
nop
leaw $SP,%A
movw (%A),%D
decw %D
movw %D,(%A)
END20:
; End

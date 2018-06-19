; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH constant 14
leaw $14, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 2 - PUSH constant 2
leaw $2, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 3 - ADD
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
addw (%A),%S,%D
movw %D, (%A)
leaw $SP,%A
movw (%A),%D
decw %D
movw %D,(%A)
; 4 - PUSH constant 123
leaw $123, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 5 - PUSH constant 1
leaw $1, %A
movw %A, %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 6 - SUB testando
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
subw (%A),%S,%D
movw %D, (%A)
leaw $SP,%A
movw (%A),%D
decw %D
movw %D,(%A)
; 7 - SUB testando
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
subw (%A),%S,%D
movw %D, (%A)
leaw $SP,%A
movw (%A),%D
decw %D
movw %D,(%A)
; 8 - POP temp 0
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $5, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; End

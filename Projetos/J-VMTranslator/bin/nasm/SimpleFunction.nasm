; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH constant 1
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
; 3 - chamada de funcao SimpleFunction
leaw $SP,%A
movw (%A),%S
leaw $SP,%A
movw (%A),%A
incw %A
movw %S,(%A)
incw %S
leaw $R1,%A
movw (%A),%S
incw %S
leaw $R2,%A
movw (%A),%S
incw %S
leaw $R3,%A
movw (%A),%S
incw %S
leaw $R4,%A
movw (%A),%S
leaw $SP,%A
movw (%A),%D
leaw $R1,%A
movw %D,%A
leaw $5,%A
movw %A,%S
leaw $2,%A
incw %S, %A, %A
subw %D, %A, %S
leaw $R2,%A
movw %S,%A
leaw $SimpleFunction,%A
movw %A,%D
jmp %D
nop
; Label (marcador)
Main-loop:
; 4 - Goto Incondicional
leaw $Main-loop, %A
jmp
nop
; 6 - PUSH constant 0
leaw $0, %A
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
; 5 - Declarando função SimpleFunction
SimpleFunction-SimpleFunction:
; 7 - PUSH constant 0
leaw $0, %A
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
; 5 - Declarando função SimpleFunction
SimpleFunction-SimpleFunction:
; 8 - PUSH argument 0
leaw $ARG, %A
movw (%A), %D
leaw $0, %A
addw %D, %A, %S
movw %S, %A
movw (%A), %S
leaw $SP, %A
movw (%A), %A
movw %S, (%A)
leaw $SP, %A
movw (%A), %A
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 9 - PUSH argument 1
leaw $ARG, %A
movw (%A), %D
leaw $1, %A
addw %D, %A, %S
movw %S, %A
movw (%A), %S
leaw $SP, %A
movw (%A), %A
movw %S, (%A)
leaw $SP, %A
movw (%A), %A
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 10 - ADD
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
; 11 - Retorno de função
leaw $R1,%A
movw (%A),%S
movw %S,%D
leaw $5,%A
subw %D, %A, %D
leaw $R1,%A
movw (%A),%S
incw %S
leaw $R0,%A
movw %S,%A
leaw $1,%A
subw %S, %A, %S
leaw $R4,%A
movw %S,%A
leaw $2,%A
subw %S, %A, %S
leaw $R3,%A
movw %S,%A
leaw $3,%A
subw %S, %A, %S
leaw $R2,%A
movw %S,%A
leaw $4,%A
subw %S, %A, %S
leaw $R1,%A
movw %S,%A
jmp %D
nop
; End

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
; 4 - PUSH constant 8
leaw $8, %A
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
; 7 - chamada de funcao mult
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
leaw $mult,%A
movw %A,%D
jmp %D
nop
; 8 - POP temp 1
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $6, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 10 - PUSH constant 0
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
; 9 - Declarando função mult
mult-mult:
; 11 - PUSH constant 0
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
; 9 - Declarando função mult
mult-mult:
; 12 - PUSH constant 0
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
; 13 - POP local 0
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $LCL, %A
movw (%A), %S
leaw $0, %A
addw %S, %A, %S
movw %S, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 14 - PUSH argument 1
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
; 15 - POP local 1
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $LCL, %A
movw (%A), %S
leaw $1, %A
addw %S, %A, %S
movw %S, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; Label (marcador)
mult-loop:
; 16 - PUSH constant 0
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
; 17 - PUSH local 1
leaw $LCL, %A
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
; 18 - EQ
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
subw (%A), %D, %S
leaw $EQUALS0, %A  
je %S
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
EQUAL0:
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
; 19 - Goto Condicional
leaw $SP,%A
movw (%A),%A
decw %A
movw %A,%S
movw (%A),%D
leaw $SP, %A
movw %S, (%A)
leaw $mult-end, %A
jne %D
nop
; 20 - PUSH local 0
leaw $LCL, %A
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
; 21 - PUSH argument 0
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
; 22 - ADD
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
; 23 - POP local 0
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $LCL, %A
movw (%A), %S
leaw $0, %A
addw %S, %A, %S
movw %S, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 24 - PUSH local 1
leaw $LCL, %A
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
; 25 - PUSH constant 1
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
; 26 - SUB testando
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
; 27 - POP local 1
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $LCL, %A
movw (%A), %S
leaw $1, %A
addw %S, %A, %S
movw %S, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 28 - Goto Incondicional
leaw $mult-loop, %A
jmp
nop
; Label (marcador)
mult-end:
; 29 - PUSH local 0
leaw $LCL, %A
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
; 30 - Retorno de função
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

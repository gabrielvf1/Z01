; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH argument 0
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
; 2 - POP static 0
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $16, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 3 - PUSH argument 1
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
; 4 - POP static 1
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $17, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 5 - PUSH constant 0
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
; 6 - Retorno de função
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
; 8 - PUSH static 0
leaw $16, %A
movw (%A), %D
leaw $SP, %A
movw %A, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 9 - PUSH static 1
leaw $17, %A
movw (%A), %D
leaw $SP, %A
movw %A, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 10 - SUB testando
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
; 13 - PUSH argument 0
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
; 14 - POP static 0
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $16, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 15 - PUSH argument 1
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
; 16 - POP static 1
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $17, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 17 - PUSH constant 0
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
; 18 - Retorno de função
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
; 20 - PUSH static 0
leaw $16, %A
movw (%A), %D
leaw $SP, %A
movw %A, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 21 - PUSH static 1
leaw $17, %A
movw (%A), %D
leaw $SP, %A
movw %A, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 22 - SUB testando
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
; 23 - Retorno de função
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
; 25 - PUSH constant 6
leaw $6, %A
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
; 26 - PUSH constant 8
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
; 27 - chamada de funcao Class1.set
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
leaw $Class1.set,%A
movw %A,%D
jmp %D
nop
; 28 - POP temp 0
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
; 29 - PUSH constant 23
leaw $23, %A
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
; 30 - PUSH constant 15
leaw $15, %A
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
; 31 - chamada de funcao Class2.set
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
leaw $Class2.set,%A
movw %A,%D
jmp %D
nop
; 32 - POP temp 0
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
; 33 - chamada de funcao Class1.get
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
leaw $0,%A
incw %S, %A, %A
subw %D, %A, %S
leaw $R2,%A
movw %S,%A
leaw $Class1.get,%A
movw %A,%D
jmp %D
nop
; 34 - chamada de funcao Class2.get
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
leaw $0,%A
incw %S, %A, %A
subw %D, %A, %S
leaw $R2,%A
movw %S,%A
leaw $Class2.get,%A
movw %A,%D
jmp %D
nop
; Label (marcador)
Sys-WHILE:
; 35 - Goto Incondicional
leaw $Sys-WHILE, %A
jmp
nop
; End

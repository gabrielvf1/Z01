; 0 - PUSH constant 0
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
; 1 - POP temp 0
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
; 2 - PUSH constant 1
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
; 3 - POP temp 1
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
; Label (marcador)
scripts/../../I-VM/src/vmExamples/BasicLoop-LOOP_START:
; 4 - PUSH temp 0
leaw $5, %A
movw (%A), %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 5 - PUSH constant 10
leaw $10, %A
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
; 6 - EQ
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
; 7 - Goto Condicional
leaw $SP,%A
movw (%A),%A
decw %A
movw %A,%S
movw (%A),%D
leaw $SP, %A
movw %S, (%A)
leaw $scripts/../../I-VM/src/vmExamples/BasicLoop-END, %A
jne %D
nop
; 8 - PUSH temp 0
leaw $5, %A
movw (%A), %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 9 - PUSH constant 1
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
; 11 - POP temp 0
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
; 12 - PUSH temp 1
leaw $6, %A
movw (%A), %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 13 - PUSH temp 1
leaw $6, %A
movw (%A), %D
leaw $SP, %A
movw (%A), %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 14 - ADD
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
; 15 - POP temp 1
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
; 16 - Goto Incondicional
leaw $scripts/../../I-VM/src/vmExamples/BasicLoop-LOOP_START, %A
jmp
nop
; Label (marcador)
scripts/../../I-VM/src/vmExamples/BasicLoop-END:
; End

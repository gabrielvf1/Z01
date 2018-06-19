; 0 - PUSH constant 5
leaw $5, %A
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
; 1 - Goto Incondicional
leaw $scripts/../../I-VM/src/vmExamples/SimpleGoto-END2, %A
jmp
nop
; Label (marcador)
scripts/../../I-VM/src/vmExamples/SimpleGoto-DUMMY:
; 2 - PUSH constant 3
leaw $3, %A
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
; Label (marcador)
scripts/../../I-VM/src/vmExamples/SimpleGoto-END2:
; 3 - POP temp 0
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

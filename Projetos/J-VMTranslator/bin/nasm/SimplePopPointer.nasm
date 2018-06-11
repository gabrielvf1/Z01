; 0 - POP pointer 0
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $3, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 1 - POP pointer 1
movw (%A), %A
decw %A
movw (%A), %D
leaw $4, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; End

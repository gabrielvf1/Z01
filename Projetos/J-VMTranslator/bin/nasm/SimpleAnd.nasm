; 0 - AND
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
andw (%A),%S,%D
movw %D, (%A)
leaw $SP,%A
movw (%A),%D
decw %D
movw %D,(%A)
; End

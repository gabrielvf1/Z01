; 0 - ADD
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
; End

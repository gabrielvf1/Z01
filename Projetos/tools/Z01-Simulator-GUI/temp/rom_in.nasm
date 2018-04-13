<<<<<<< HEAD
leaw $R1,%A
movw (%A), %D
leaw %RO,%A
addw (%A),%D,%S
leaw %R2, %A
movw %S, (%A)


=======
INICIO:
leaw $0, %A
movw %A, %S                   ; Carrega 0 em S
ADD:                              ; Label para saltar
incw %S                       ; Incrementa S
leaw $ADD, %A                 ; Carrega endereço do label ADD
jmp                           ; Salto incondicional
nop                           ; No-Operation
>>>>>>> upstream/master





























































































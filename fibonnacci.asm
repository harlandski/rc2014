        org 0

; allow for bad exit from rum
        nop
; Setup initial register values

        ld b,0
        ld c,1

; Do Fibonacci calculations
LOOP:   xor a
        add b
        add c
        ld b,c
        ld c,a

; Setup delay registers
        ld d,0
        ld e,0

DELAY:  out ($00),a
        dec e
        jr nz, DELAY
        dec d
        jr nz, DELAY
        jp LOOP

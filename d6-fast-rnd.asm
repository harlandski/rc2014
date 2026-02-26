; d6 based on z80.info fast rnd
; requires the input-output unit

        org 0 ; to avoid corruption after non-halt exit

        nop

START:  ld a, (SEED)
        ld b,a

        rrca ; multiply by 32
        rrca
        rrca
        xor $1f

        add a,b
        sbc a,255; carry

        ld (SEED), a; save number as next seed

; Convert to range 1-6
        and %00000111   ; keep lowest 3 bits (0-7)
        inc a           ; now 1-8
        cp 7            ; if result is >=7
        jr nc,START     ; reject and start again

VIEW:   out ($00),a
        jr VIEW

SEED:   db $01          ; must be non-zero

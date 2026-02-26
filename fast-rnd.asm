; Source: https://www.z80.info/pseudo-random.txt
; I like this - it appears to produce a good random number

; Original commentary:

; Fast RND
;
; An 8-bit pseudo-random number generator,
; using a similar method to the Spectrum ROM,
; - without the overhead of the Spectrum ROM.
;
; R = random number seed
; an integer in the range [1, 256]
;
; R -> (33*R) mod 257
;
; S = R - 1
; an 8-bit unsigned integer

        org 0

        nop ; to avoid corruption after non-halt exit

        ld a, (SEED)
        ld b,a

        rrca ; multiply by 32
        rrca
        rrca
        xor $1f

        add a,b
        sbc a,255; carry

        ld (SEED), a; save number as next seed

OUT:    out ($00),a
        jr OUT

SEED:   db $01 ; must be non-zero

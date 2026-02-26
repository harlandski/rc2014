; roll any die
; random routine taken from z80.info fast rnd
; requires input-output module
; Note: switches should be set before the program runs
; Note: once a program is running, just flicking ⟳ will re-run it

        org 0

        nop ; to avoid corruption after non-halt exit

RANDOM: ld a, (SEED)
        ld b,a

        rrca
        rrca
        rrca
        xor $1f

        add a,b
        sbc a,255; carry

        ld (SEED), a; save number as next seed, and also for use in CONV

; read the input, and deal with edge cases of $00 and $FF
INPUT:  in A,($00)
        cp $00
        jr z, OUTPUT
        cp $FF
        jr z, IS255
        ld b,a ; b is the maximum we want
        inc b; but we need to test one more than max
        jr TESTS
IS255:  ld b,a; unless a is 255, then we'll leave it as that

; test bits and set mask. Only the highest mask remains
TESTS:  ld c,0; reset mask
TEST0:  bit 0,a ; is bit 0 set?
        jr z, TEST1
        ld c,%00000001; mask
TEST1:  bit 1,a; is bit 1 set?
        jr z, TEST2
        ld c,%00000011
TEST2:  bit 2,a; is bit 2 set?
        jr z, TEST3
        ld c,%00000111
TEST3:  bit 3,a ; etc
        jr z, TEST4
        ld c,%00001111
TEST4:  bit 4,a
        jr z, TEST5
        ld c,%00011111
TEST5:  bit 5,a
        jr z, TEST6
        ld c,%00111111
TEST6:  bit 6,a
        jr z, TEST7
        ld c,%01111111
TEST7:  bit 7,a
        jr z, CONV
        ld c,%11111111

; Convert to range 1-max, and truncate numbers higher than desired
CONV:   ld a, (SEED) ; bring our random number back
        and c   ; keep lowest bits as per mask
        inc a   ; make range start at 1
        cp b    ; if result is > max
        jr nc,RANDOM     ; reject and start again

OUTPUT: out ($00),a ; infinite loop
        jr OUTPUT

SEED:   db $01          ; must be non-zero

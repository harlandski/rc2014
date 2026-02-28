;; kill the bit
;; adapted from https://altairclone.com/downloads/killbits.pdf

        org 0

        nop

        ld hl, 0    ; initialize counter
        ld d, $80   ; set up initial display bit
        ld bc, $0e  ; higher value = faster
START:  ld a, d     ; display pattern on Orton 3C lights
        out ($00),a
        out ($00),a
        out ($00),a
        out ($00),a
        add hl,bc   ; increment display counter
        jr nc, START
        in a, ($00) ; input data from input switches
        xor d       ; exclusive or with A
        rrca        ; rotate display right one bit
        ld d,a      ; move data to display reg
        jr START    ; repeat sequence

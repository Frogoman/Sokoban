tileType:
    push bc
    push hl
    push af   

    LD DE, level2
    inc de
    ld a, (de)
    ld d, a
    ld a, 0

sumMov:
    add d
    djnz sumMov

    ld h, 0
    ld l, a

    LD D, 0
    LD E, C
    ADD HL, DE

    LD DE, level2
    inc de
    inc de
    inc de
    inc de
    inc de
    ADD HL, DE

    ld a, h
    ld d, A
    ld a, L
    ld e, a

    pop af
    pop hl
    pop bc

    call fixColor

    ret
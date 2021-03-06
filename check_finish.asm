checkFinish:
    push de
    push hl
    push bc
    push af

    ld a, 48
    ld (boxUni), a
    ld (boxDec), a

    LD hl, currentLevel
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    ld ix, currentLevel
    ld a, (ix)
    LD b, a

    ld a, 0
    ld d, a

loopyF:
    ld a, (ix+1)
    ld c, a
loopxF:
    LD A, (hl)
    and $60
    cp $60
    call z, increaseCount

    INC hl
    dec c
    jr nz, loopxF
    djnz loopyF

    ld a, d
    cp (ix+4)

    call z, nextLevel

    pop af
    pop bc
    pop hl
    pop de

    ret
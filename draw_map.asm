drawMap:
    push de
    push bc
    push af

    LD DE, currentLevel
    inc de
    inc de
    inc de
    inc de
    inc de
    ld ix, currentLevel
    ld a, (ix)
    LD b, a

loopy:
    ld a, (ix+1)
    ld c, a
loopx:
    LD A, (DE)
    call fixAxis
    INC DE
    dec c
    jr nz, loopx
    djnz loopy

    pop af
    pop bc
    pop de

    ret


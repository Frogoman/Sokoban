drawMap:
    push de
    push bc
    push af

    LD DE, level2
    inc de
    inc de
    inc de
    inc de
    inc de
    ld ix, level2
    ld a, (ix)
    ld (PY), a
    LD b, a

loopy:
    ld a, (ix+1)
    ld (PX), a
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


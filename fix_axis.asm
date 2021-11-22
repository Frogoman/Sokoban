fixAxis:
    push bc
    push de

    ld a, b
    ld e, a
    ld a, (ix)
    sub e
    ld b, a

    ld a, c
    ld e, a
    ld a, (ix+1)
    sub e
    ld c, a

    pop de
    call fixColor
    call drawTexture

    pop bc

    ret
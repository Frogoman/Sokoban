fixAxis:
    push bc
    push de

    ld a, b
    ld e, a
    ld a, (PY)
    sub e
    ld b, a

    ld a, c
    ld e, a
    ld a, (PX)
    sub e
    ld c, a

    pop de

    call fixColor
    call drawXYC

    pop bc

    ret
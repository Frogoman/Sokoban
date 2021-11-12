movePlayer:
    push de
    push hl


    ld a, (CY)
    ld b, a
    ld a, (CX)
    ld c, a
    call tileType
    ld hl, de
    res 4, (hl)
    call tileType
    call drawXYC
    
    ld a, (DY)
    add b
    ld b, a
    ld a, (DX)
    add c
    ld c, a
    call tileType
    ld hl, de
    set 4, (hl)
    res 5, (hl)
    call tileType
    call drawXYC

    ld a, b
    ld (CY), a
    ld a, c
    ld (CX), a

    pop hl
    pop de

    ret
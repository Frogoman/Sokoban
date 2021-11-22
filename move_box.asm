moveBox:
    ld a, (DY)
    ld b, a
    ld a, (CY)
    add b
    add b
    ld b, a
    ld a, (DX)
    ld c, a    
    ld a, (CX)
    add c
    add c
    ld c, a
    call tileType
    ld hl, de
    set 5, (hl)
    call fixColor
    call drawTexture

    ret
fixTexture:
    push bc

    ld a, $00
    ld b, a
    ld a, (de)
    cp b
    jr z, floorTileTex

    ld a, $08
    ld b, a
    ld a, (de)
    cp b
    jr z, exteriorTileTex

    ld a, $10
    ld b, a
    ld a, (de)
    cp b
    jr z, cursorTileTex
    ld a, $50
    ld b, a
    ld a, (de)
    cp b
    jr z, cursorTileTex

    ld a, $20
    ld b, a
    ld a, (de)
    cp b
    jr z, boxTileTex
    ld a, $60
    ld b, a
    ld a, (de)
    cp b
    jr z, boxTileTex

    ld a, $40
    ld b, a
    ld a, (de)
    cp b
    jr z, goalTileTex

    ld a, $80
    ld b, a
    ld a, (de)
    cp b
    jr z, wallTileTex

    ld a, $88
    jr endTextures

floorTileTex:
    ld a, 129
    pop bc
    jr endTextures
exteriorTileTex:
    ld a, 133
    pop bc
    jr endTextures
cursorTileTex:
    ld a, 130
    pop bc
    jr endTextures
boxTileTex:
    ld a, 131
    pop bc
    jr endTextures
goalTileTex:
    ld a, 132
    pop bc
    jr endTextures
wallTileTex:
    ld a, 128
    pop bc
    jr endTextures

    ld a, 128

endTextures:

    ret
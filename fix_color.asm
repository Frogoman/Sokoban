fixColor:
    push bc

    ld a, $00
    ld b, a
    ld a, (de)
    cp b
    jr z, floorTile

    ld a, $08
    ld b, a
    ld a, (de)
    cp b
    jr z, exteriorTile

    ld a, $10
    ld b, a
    ld a, (de)
    cp b
    jr z, cursorTile
    ld a, $50
    ld b, a
    ld a, (de)
    cp b
    jr z, cursorTile

    ld a, $20
    ld b, a
    ld a, (de)
    cp b
    jr z, boxTile
    ld a, $60
    ld b, a
    ld a, (de)
    cp b
    jr z, boxTile

    ld a, $40
    ld b, a
    ld a, (de)
    cp b
    jr z, goalTile

    ld a, $80
    ld b, a
    ld a, (de)
    cp b
    jr z, wallTile

    ld a, $88
    jr endColors

floorTile:
    ld a, $30
    jr endColors
exteriorTile:
    ld a, $00
    jr endColors
cursorTile:
    ld a, $28
    jr endColors
boxTile:
    ld a, $10
    jr endColors
goalTile:
    ld a, $20
    jr endColors
wallTile:
    ld a, $08
    jr endColors

    ld a, $00

endColors:
    pop bc

    ret
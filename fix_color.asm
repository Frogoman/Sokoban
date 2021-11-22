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
    jr z, boxGoalTile

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
    ld a, %00110000
    pop bc
    jr endColors
exteriorTile:
    ld a, %00000000
    pop bc
    jr endColors
cursorTile:
    ld a, %00110000
    pop bc
    jr endColors
boxTile:
    ld a, %00110010
    pop bc
    jr endColors
boxGoalTile:
    ld a, %00100010
    pop bc
    jr endColors
goalTile:
    ld a, %00110100
    pop bc
    jr endColors
wallTile:
    ld a, %00010111
    pop bc
    jr endColors

    ld a, %00000000

endColors:

    ret
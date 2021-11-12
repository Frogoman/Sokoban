checkMov:
    call tileType
    ld a, $80
    ld b, a
    ld a, (de)
    cp b
    call z, skipCycle
    ld a, $20
    ld b, a
    ld a, (de)
    cp b
    jr z, checkBox
    ld a, $60
    ld b, a
    ld a, (de)
    cp b
    jr z, checkBox
    call playerOnly

checkBox:
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
    ld a, $80
    ld b, a
    ld a, (de)
    cp b
    call z, skipCycle
    ld a, $20
    ld b, a
    ld a, (de)
    cp b
    call z, skipCycle
    ld a, $60
    ld b, a
    ld a, (de)
    cp b
    call z, skipCycle

    ret
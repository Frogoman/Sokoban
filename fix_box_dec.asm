fixBoxUnits:
    ld hl, boxUni
    inc (hl)
    ld a, 58
    ld b, a
    ld a, (boxUni)
    cp b
    call z, increaseBox

    ret

increaseBox:
    ld hl, boxDec
    inc (hl)
    ld a, 48
    ld (boxUni), a

    ret
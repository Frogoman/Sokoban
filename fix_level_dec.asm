fixLevelUnits:
    ld hl, levelUni
    inc (hl)
    ld a, 58
    ld b, a
    ld a, (levelUni)
    cp b
    call z, increase

    ret

increase:
    ld hl, levelDec
    inc (hl)
    ld a, 48
    ld (levelUni), a

    ret

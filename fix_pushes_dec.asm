fixPushesUnits:
    ld hl, pushesUni
    inc (hl)
    ld a, 58
    ld b, a
    ld a, (pushesUni)
    cp b
    call z, increasePushesDec

    ld a, 58
    ld b, a
    ld a, (pushesDec)
    cp b
    call z, increasePushesCen

    ld a, 58
    ld b, a
    ld a, (pushesCen)
    cp b
    call z, reached999Pushes

    ret

increasePushesDec:
    ld hl, pushesDec
    inc (hl)
    ld a, 48
    ld (pushesUni), a

    ret

increasePushesCen:
    ld hl, pushesCen
    inc (hl)
    ld a, 48
    ld (pushesDec), a

reached999Pushes:
    ld a, 48
    ld (pushesCen), a

    ret
fixMovesUnits:
    ld hl, movesUni
    inc (hl)
    ld a, 58
    ld b, a
    ld a, (movesUni)
    cp b
    call z, increaseMovesDec

    ld a, 58
    ld b, a
    ld a, (movesDec)
    cp b
    call z, increaseMovesCen

    ld a, 58
    ld b, a
    ld a, (movesCen)
    cp b
    call z, reached999

    ret

increaseMovesDec:
    ld hl, movesDec
    inc (hl)
    ld a, 48
    ld (movesUni), a

    ret

increaseMovesCen:
    ld hl, movesCen
    inc (hl)
    ld a, 48
    ld (movesDec), a

reached999:
    ld a, 48
    ld (movesCen), a

    ret
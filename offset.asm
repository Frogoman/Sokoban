setOffset:
    ld a, (currentLevel)
    ld b, a
    ld a, 24
	sub b
    srl a
	ld b, a
    ld (ScrOffsetY), a
	
	ld a, (currentLevel+1)
    ld c, a
    ld a, 32
	sub c
    srl a
	ld c, a
    ld (ScrOffsetX), a

    ret

    
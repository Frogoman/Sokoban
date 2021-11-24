drawTexture:
	push bc
    push de
	push af

	ld a, (ScrOffsetY)
	add b
	ld b,a
	
	ld a, (ScrOffsetX)
	add c
	ld c,a

	pop af
	call PREP_PRT


	call fixTexture
    push af
	push bc
	call PRINTCHNUM
	pop bc
	pop af
	pop de
	pop bc

	ret
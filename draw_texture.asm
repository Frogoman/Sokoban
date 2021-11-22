drawTexture:
	push bc
    push de
	call PREP_PRT
	ld b, 32

	call fixTexture
    push af
	push bc
	call PRINTCHNUM
	pop bc
	pop af
	pop de
	pop bc

	ret
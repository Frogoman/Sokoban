prelevelInfo:
    ld b, 10
	ld c, 0		
    ld a, %01001101 
    ld ix, nextLevelText
	call PRINTAT 

    ld b, 10
	ld c, 18
    ld a, %01001101 	
    ld ix, levelDec
	call PRINTAT 

    ld b, 10
	ld c, 19
    ld a, %01001101 	
    ld ix, levelUni
	call PRINTAT 

    ld b, 10
	ld c, 20
    ld a, %01001101	
    ld ix, nextLevelTextEnd
	call PRINTAT 
    call pausa

    ret
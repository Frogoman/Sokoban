levelInfo:
    ld b, 0
	ld c, 0		
    ld a, %00000101 
    ld ix, overviewText1
	call PRINTAT 

    ld b, 0
	ld c, 6
    ld a, %00000101 	
    ld ix, levelDec
	call PRINTAT 

    ld b, 0
	ld c, 7
    ld a, %00000101 	
    ld ix, levelUni
	call PRINTAT 

    ld b, 0
	ld c, 23
    ld a, %00000101 	
    ld ix, overviewText2
	call PRINTAT

    call levelInfoBoxes

    ld b, 23
	ld c, 0
    ld a, %00000101 	
    ld ix, overviewText3
	call PRINTAT

    call levelInfoMoves

    ld b, 23
	ld c, 21
    ld a, %00000101 	
    ld ix, overviewText4
	call PRINTAT

    call levelInfoPushes

    ret

levelInfoBoxes:
    ld b, 0
	ld c, 30
    ld a, %00000101 	
    ld ix, boxDec
	call PRINTAT 

    ld b, 0
	ld c, 31
    ld a, %00000101 	
    ld ix, boxUni
	call PRINTAT 

    ret

levelInfoMoves:
    ld b, 23
	ld c, 7
    ld a, %00000101 	
    ld ix, movesCen
	call PRINTAT 

    ld b, 23
	ld c, 8
    ld a, %00000101 	
    ld ix, movesDec
	call PRINTAT 

    ld b, 23
	ld c, 9
    ld a, %00000101 	
    ld ix, movesUni
	call PRINTAT 

    ret

levelInfoPushes:
    ld b, 23
	ld c, 29
    ld a, %00000101 	
    ld ix, pushesCen
	call PRINTAT 

    ld b, 23
	ld c, 30
    ld a, %00000101 	
    ld ix, pushesDec
	call PRINTAT 

    ld b, 23
	ld c, 31
    ld a, %00000101 	
    ld ix, pushesUni
	call PRINTAT 

    ret
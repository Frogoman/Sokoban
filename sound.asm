; ---------------------------------------------
; ZX Spectrum Sound
; Square wave creation with changing cycle time
; Daniel León - AOC - UFV 2021
; ---------------------------------------------

startSound: 
    push hl
    push de
    push bc
    push af

	ld d, 16  	
	ld e, 0 	
	ld h, 0 
    ld c, 16  

bucleExt:       
	dec h   	
	ld b,h
bucleInt:           
	ld a,d 		
	out ($FE),a
paus: djnz paus     
	ld a,e          
	out ($FE),a
	ld b,h
paus2: djnz paus2
    dec c
	jr nz, bucleInt

    pop af
    pop bc
    pop de
    pop hl
    
    ret
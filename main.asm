    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION

    org $8000
    di
    ld sp, 0

    call CLEARSCR
    ld hl, pregame
    ld de, $4000
    ld bc, 6912
    ldir 
    call pausa
    call pausa

    ld iy, maplist
resetLevel:
    call fixLevelUnits
    call CLEARSCR
    ld b, 10
	ld c, 0		
    ld a, %01001101 
    ld ix, miTexto 
	call PRINTAT 
    call pausa

    ld de, currentLevel
    ld hl, (iy)
    ld bc, 773
    ldir

    call CLEARSCR
    call setOffset
    call drawMap

    ld de, currentLevel
    inc de
    inc de
    ld a, (de)
    ld (CY), a
    inc de
    ld a, (de)
    ld (CX), a

    jr keyPressed

waitKeys:
    call waitAKey

keyPressed:
    ld a, (CY)
    ld b, a
    ld a, (DY)
    add b
    ld b, a
    ld a, (CX)
    ld c, a
    ld a, (DX)
    add c
    ld c, a
    call checkMov

boxAndPlayer:
    call moveBox

playerOnly:
    call movePlayer
    call startSound
    call checkFinish

skipCycle:
    ld a, 0
    ld (DY), a
    ld (DX), a
    call waitNoKeys
    jr waitKeys

nextLevel:
    ld a, 0
    ld (DY), a
    ld (DX), a
    inc iy
    inc iy
    ld a, (iy)
    cp 0
    jr z, endOfGame
    jp resetLevel

endOfGame:
    call CLEARSCR
    ld hl, gameOver
    ld de, $4000
    ld bc, 6912
    ldir  

fin: jr fin

currentLevel: defs 773

CY: equ currentLevel+2
CX: equ currentLevel+3
DY: db 0
DX: db 0

ScrOffsetY: db 10
ScrOffsetX: db 5

miTexto: defm $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, "Level "
levelDec: db 48
levelUni: db 48
miTextoFin: defm $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, 0


pregame:    incbin "pregame.scr"
gameOver:   incbin "game_over.scr"

    include "niveles_basicos.asm"
    include "pausa.asm"
    include "fix_level_dec.asm"

    include "wait_no_keys.asm"
    include "wait_keys.asm"

    include "draw_map.asm"
    include "draw_texture.asm"

    include "offset.asm"
    include "fix_axis.asm"
    include "fix_color.asm"
    include "fix_texture.asm"
    include "tile_type.asm"
    
    include "check_mov.asm"
    include "move_player.asm"
    include "move_box.asm"

    include "check_finish.asm"
    include "increase_count.asm"

    include "sound.asm"
    include "texto.asm"
wallTexture: 		defb $FF, $01, $01, $81, $FF, $10, $10, $18     ;128
floorTexture: 		defb $00, $00, $00, $00, $00, $00, $00, $00     ;129
cursorTexture: 		defb $3C, $3C, $3C, $18, $FF, $18, $3C, $66     ;130
boxTexture: 		defb $FF, $C3, $A5, $99, $99, $A5, $C3, $FF     ;131
goalTexture: 		defb $00, $00, $18, $3C, $3C, $18, $00, $00     ;132
exteriorTexture:    defb $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF     ;133

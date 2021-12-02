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
    call prelevelInfo

    ld de, currentLevel
    ld hl, (iy)
    ld bc, 773
    ldir

    call setOffset

    call CLEARSCR
    call drawMap
    call levelInfo

    ld de, currentLevel
    inc de
    inc de
    ld a, (de)
    ld (CY), a
    inc de
    ld a, (de)
    ld (CX), a

    ld a, 48
    ld (boxUni), a
    ld (boxDec), a
    ld (movesCen), a
    ld (movesDec), a
    ld (movesUni), a

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
    call fixPushesUnits

playerOnly:
    call movePlayer
    call startSound
    call checkFinish
    call levelInfoBoxes
    call levelInfoMoves
    call fixMovesUnits
    call levelInfoPushes

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

levelDec: db 48, 0
levelUni: db 48, 0

boxDec: db 48, 0
boxUni: db 48, 0

movesCen: db 48, 0
movesDec: db 48, 0
movesUni: db 48, 0

pushesCen: db 48, 0
pushesDec: db 48, 0
pushesUni: db 48, 0



nextLevelText: defm "            Level ", 0
nextLevelTextEnd: defm "            ", 0

overviewText1: defm "Level ", 0
overviewText2: defm "Boxes: ", 0
overviewText3: defm "Moves: ", 0
overviewText4: defm "Pushes: ", 0


pregame:    incbin "pre_game.scr"
gameOver:   incbin "game_over.scr"

    include "niveles_basicos.asm"
    include "pausa.asm"

    include "fix_level_dec.asm"
    include "fix_box_dec.asm"
    include "fix_moves_dec.asm"
    include "fix_pushes_dec.asm"
    include "prelevel_info.asm"
    include "level_info.asm"

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

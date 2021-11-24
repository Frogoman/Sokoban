    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION

    org $8000
    di
    ld sp, 0

    ld iy, maplist
resetLevel:
    ld hl, (iy)
    ld de, currentLevel
    ld bc, 773
    ldir

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
    jr resetLevel

endOfGame:
    call CLEARSCR    

fin: jr fin


currentLevel: defs 773
CX: equ currentLevel+3
CY: equ currentLevel+2
DX: db 0
DY: db 0

background: incbin sus.scr

    include "niveles_basicos.asm"

    include "wait_no_keys.asm"
    include "wait_keys.asm"

    include "draw_map.asm"
    include "draw_texture.asm"

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

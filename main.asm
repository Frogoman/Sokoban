    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION

    org $8000
    di
    ld sp, 0

    ld iy, maplist
resetLevel:
    ; ld hl, background
    ; ld de, $4000
    ; ld bc, 6912
    ; ldir
    ld hl, (iy)
    ld de, actualLevel
    ld bc, 773
    ldir

    call drawMap

    ld de, actualLevel
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
    call checkFinish
    call startSound

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
    ld hl, $4000
    ld de, $4001
    ld bc, 6911
    
    ld (hl), $00

    ldir

fin: jr fin

actualLevel: defs 773
CX: equ actualLevel+3
CY: equ actualLevel+2
DX: db 0
DY: db 0

background: incbin sus.scr

    include wait_no_keys.asm
    include draw_xyc.asm
    include niveles_basicos.asm
    include draw_map.asm
    include fix_axis.asm
    include fix_color.asm
    include tile_type.asm
    include wait_keys.asm
    include check_mov.asm
    include move_player.asm
    include move_box.asm
    include check_finish.asm
    include increase_count.asm
    include sound.asm
    include texto.asm

    DEVICE ZXSPECTRUM48
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION

    org $8000
    di
    ld sp, 0

    call drawMap

    ld de, level2
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

skipCycle:
    ld a, 0
    ld (DY), a
    ld (DX), a
    call waitNoKeys
    jr waitKeys

fin: jr fin

CX: db 0
CY: db 0
DX: db 0
DY: db 0
PX: db 0
PY: db 0

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

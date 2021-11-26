pausa:
    push af
    push bc 
    push de
    push hl
    ld bc, $ffff
btonto:
    dec bc 
    ld a, b
    inc hl
    dec hl
    or c 
    jr nz, btonto

    pop hl
    pop de
    pop bc
    pop af

    ret 
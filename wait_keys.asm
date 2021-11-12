waitAKey:
    ld bc, $fdfe
    in a, (c)
    bit 0, a
    jr nz, waitDkey
    ld a, -1
    ld (DX), a
    call keyPressed

waitDkey:
    in a, (c)
    bit 2, a
    jr nz, waitSkey
    ld a, 1
    ld (DX), a
    call keyPressed

waitSkey:
    in a, (c)
    bit 1, a
    jr nz, waitWkey
    ld a, 1
    ld (DY), a
    call keyPressed

waitWkey:
    ld bc, $fbfe
    in a, (c)
    bit 1, a
    jr nz, waitAKey
    ld a, -1
    ld (DY), a
    call keyPressed
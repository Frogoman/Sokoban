waitNoKeys:
    push af
    push bc
startScan:
    ld bc, $fefe
continueScan:
    in a, (c)
    and 31
    cp 31
    jr nz, startScan
    rlc b
    jr c, continueScan

    pop bc
    pop af

    ret
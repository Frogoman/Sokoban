increaseCount:
    inc d

    push hl
    push bc
    push af

    call fixBoxUnits

    pop af
    pop bc
    pop hl
    
    ret
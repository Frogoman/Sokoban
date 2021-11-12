drawXYC:
        push af
        push de
        push hl

        LD H, 0 
        LD L, B 
        ADD HL, HL
        ADD HL, HL
        ADD HL, HL
        ADD HL, HL
        ADD HL, HL

        LD D, 0
        LD E, C
        ADD HL, DE
        
        LD DE, $5800
        ADD HL, DE

        LD (HL), a

        pop hl
        pop de
        pop af

        ret
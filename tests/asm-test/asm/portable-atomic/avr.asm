asm_test::fence::acqrel:
        ret

asm_test::fence::seqcst:
        ret

asm_test::fence::acquire:
        ret

asm_test::fence::release:
        ret

asm_test::bit_toggle::u8::acqrel:
        movw              r26, r24
        andi              r20, 0x07	; 7
        ldi               r24, 0x01	; 1
        ldi               r25, 0x01	; 1
        dec               r20
0:
        brmi              0f
        add               r25, r25
        dec               r20
1:
        brpl              1f
        in                r18, 0x3f	; 63
        cli
        ld                r19, X
        mov               r20, r19
        eor               r20, r25
        st                X, r20
        out               0x3f, r18	; 63
        and               r19, r25
        cpi               r19, 0x00	; 0
2:
        brne              2f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::bit_toggle::u8::seqcst:
        movw              r26, r24
        andi              r20, 0x07	; 7
        ldi               r24, 0x01	; 1
        ldi               r25, 0x01	; 1
        dec               r20
0:
        brmi              0f
        add               r25, r25
        dec               r20
1:
        brpl              1f
        in                r18, 0x3f	; 63
        cli
        ld                r19, X
        mov               r20, r19
        eor               r20, r25
        st                X, r20
        out               0x3f, r18	; 63
        and               r19, r25
        cpi               r19, 0x00	; 0
2:
        brne              2f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::bit_toggle::u8::acquire:
        movw              r26, r24
        andi              r20, 0x07	; 7
        ldi               r24, 0x01	; 1
        ldi               r25, 0x01	; 1
        dec               r20
0:
        brmi              0f
        add               r25, r25
        dec               r20
1:
        brpl              1f
        in                r18, 0x3f	; 63
        cli
        ld                r19, X
        mov               r20, r19
        eor               r20, r25
        st                X, r20
        out               0x3f, r18	; 63
        and               r19, r25
        cpi               r19, 0x00	; 0
2:
        brne              2f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::bit_toggle::u8::relaxed:
        movw              r26, r24
        andi              r20, 0x07	; 7
        ldi               r24, 0x01	; 1
        ldi               r25, 0x01	; 1
        dec               r20
0:
        brmi              0f
        add               r25, r25
        dec               r20
1:
        brpl              1f
        in                r18, 0x3f	; 63
        cli
        ld                r19, X
        mov               r20, r19
        eor               r20, r25
        st                X, r20
        out               0x3f, r18	; 63
        and               r19, r25
        cpi               r19, 0x00	; 0
2:
        brne              2f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::bit_toggle::u8::release:
        movw              r26, r24
        andi              r20, 0x07	; 7
        ldi               r24, 0x01	; 1
        ldi               r25, 0x01	; 1
        dec               r20
0:
        brmi              0f
        add               r25, r25
        dec               r20
1:
        brpl              1f
        in                r18, 0x3f	; 63
        cli
        ld                r19, X
        mov               r20, r19
        eor               r20, r25
        st                X, r20
        out               0x3f, r18	; 63
        and               r19, r25
        cpi               r19, 0x00	; 0
2:
        brne              2f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::bit_toggle::u16::acqrel:
        andi              r20, 0x0F	; 15
        ldi               r18, 0x01	; 1
        ldi               r19, 0x00	; 0
        dec               r20
0:
        brmi              0f
        add               r18, r18
        adc               r19, r19
        dec               r20
1:
        brpl              1f
        in                r20, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r22, Z
        ldd               r23, Z+1	; 0x01
        movw              r24, r22
        eor               r24, r18
        eor               r25, r19
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r20	; 63
        and               r22, r18
        and               r23, r19
        ldi               r24, 0x01	; 1
        cp                r22, r1
        cpc               r23, r1
2:
        brne              2f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::bit_toggle::u16::seqcst:
        andi              r20, 0x0F	; 15
        ldi               r18, 0x01	; 1
        ldi               r19, 0x00	; 0
        dec               r20
0:
        brmi              0f
        add               r18, r18
        adc               r19, r19
        dec               r20
1:
        brpl              1f
        in                r20, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r22, Z
        ldd               r23, Z+1	; 0x01
        movw              r24, r22
        eor               r24, r18
        eor               r25, r19
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r20	; 63
        and               r22, r18
        and               r23, r19
        ldi               r24, 0x01	; 1
        cp                r22, r1
        cpc               r23, r1
2:
        brne              2f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::bit_toggle::u16::acquire:
        andi              r20, 0x0F	; 15
        ldi               r18, 0x01	; 1
        ldi               r19, 0x00	; 0
        dec               r20
0:
        brmi              0f
        add               r18, r18
        adc               r19, r19
        dec               r20
1:
        brpl              1f
        in                r20, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r22, Z
        ldd               r23, Z+1	; 0x01
        movw              r24, r22
        eor               r24, r18
        eor               r25, r19
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r20	; 63
        and               r22, r18
        and               r23, r19
        ldi               r24, 0x01	; 1
        cp                r22, r1
        cpc               r23, r1
2:
        brne              2f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::bit_toggle::u16::relaxed:
        andi              r20, 0x0F	; 15
        ldi               r18, 0x01	; 1
        ldi               r19, 0x00	; 0
        dec               r20
0:
        brmi              0f
        add               r18, r18
        adc               r19, r19
        dec               r20
1:
        brpl              1f
        in                r20, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r22, Z
        ldd               r23, Z+1	; 0x01
        movw              r24, r22
        eor               r24, r18
        eor               r25, r19
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r20	; 63
        and               r22, r18
        and               r23, r19
        ldi               r24, 0x01	; 1
        cp                r22, r1
        cpc               r23, r1
2:
        brne              2f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::bit_toggle::u16::release:
        andi              r20, 0x0F	; 15
        ldi               r18, 0x01	; 1
        ldi               r19, 0x00	; 0
        dec               r20
0:
        brmi              0f
        add               r18, r18
        adc               r19, r19
        dec               r20
1:
        brpl              1f
        in                r20, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r22, Z
        ldd               r23, Z+1	; 0x01
        movw              r24, r22
        eor               r24, r18
        eor               r25, r19
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r20	; 63
        and               r22, r18
        and               r23, r19
        ldi               r24, 0x01	; 1
        cp                r22, r1
        cpc               r23, r1
2:
        brne              2f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_nand::u8::acqrel_all:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        mov               r18, r24
        com               r18
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_nand::u8::seqcst_all:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        mov               r18, r24
        com               r18
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_nand::u8::acqrel_zero:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        ldi               r18, 0xFF	; 255
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_nand::u8::acquire_all:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        mov               r18, r24
        com               r18
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_nand::u8::relaxed_all:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        mov               r18, r24
        com               r18
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_nand::u8::release_all:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        mov               r18, r24
        com               r18
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_nand::u8::seqcst_zero:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        ldi               r18, 0xFF	; 255
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_nand::u8::acquire_zero:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        ldi               r18, 0xFF	; 255
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_nand::u8::relaxed_zero:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        ldi               r18, 0xFF	; 255
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_nand::u8::release_zero:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        ldi               r18, 0xFF	; 255
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_nand::u8::acqrel:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        and               r22, r24
        com               r22
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_nand::u8::seqcst:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        and               r22, r24
        com               r22
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_nand::u8::acquire:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        and               r22, r24
        com               r22
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_nand::u8::relaxed:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        and               r22, r24
        com               r22
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_nand::u8::release:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        and               r22, r24
        com               r22
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_nand::u16::acqrel_all:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        movw              r20, r24
        com               r20
        com               r21
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_nand::u16::seqcst_all:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        movw              r20, r24
        com               r20
        com               r21
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_nand::u16::acqrel_zero:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        ldi               r20, 0xFF	; 255
        ldi               r21, 0xFF	; 255
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_nand::u16::acquire_all:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        movw              r20, r24
        com               r20
        com               r21
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_nand::u16::relaxed_all:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        movw              r20, r24
        com               r20
        com               r21
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_nand::u16::release_all:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        movw              r20, r24
        com               r20
        com               r21
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_nand::u16::seqcst_zero:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        ldi               r20, 0xFF	; 255
        ldi               r21, 0xFF	; 255
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_nand::u16::acquire_zero:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        ldi               r20, 0xFF	; 255
        ldi               r21, 0xFF	; 255
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_nand::u16::relaxed_zero:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        ldi               r20, 0xFF	; 255
        ldi               r21, 0xFF	; 255
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_nand::u16::release_zero:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        ldi               r20, 0xFF	; 255
        ldi               r21, 0xFF	; 255
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_nand::u16::acqrel:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        and               r22, r24
        and               r23, r25
        com               r22
        com               r23
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::fetch_nand::u16::seqcst:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        and               r22, r24
        and               r23, r25
        com               r22
        com               r23
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::fetch_nand::u16::acquire:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        and               r22, r24
        and               r23, r25
        com               r22
        com               r23
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::fetch_nand::u16::relaxed:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        and               r22, r24
        and               r23, r25
        com               r22
        com               r23
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::fetch_nand::u16::release:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        and               r22, r24
        and               r23, r25
        com               r22
        com               r23
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::fetch_nand::bool::acqrel_true:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r18, X
        ldi               r24, 0x01	; 1
        mov               r19, r18
        eor               r19, r24
        st                X, r19
        out               0x3f, r25	; 63
        cpi               r18, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_nand::bool::seqcst_true:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r18, X
        ldi               r24, 0x01	; 1
        mov               r19, r18
        eor               r19, r24
        st                X, r19
        out               0x3f, r25	; 63
        cpi               r18, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_nand::bool::acqrel_false:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r18, X
        ldi               r24, 0x01	; 1
        st                X, r24
        out               0x3f, r25	; 63
        cpi               r18, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_nand::bool::acquire_true:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r18, X
        ldi               r24, 0x01	; 1
        mov               r19, r18
        eor               r19, r24
        st                X, r19
        out               0x3f, r25	; 63
        cpi               r18, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_nand::bool::relaxed_true:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r18, X
        ldi               r24, 0x01	; 1
        mov               r19, r18
        eor               r19, r24
        st                X, r19
        out               0x3f, r25	; 63
        cpi               r18, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_nand::bool::release_true:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r18, X
        ldi               r24, 0x01	; 1
        mov               r19, r18
        eor               r19, r24
        st                X, r19
        out               0x3f, r25	; 63
        cpi               r18, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_nand::bool::seqcst_false:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r18, X
        ldi               r24, 0x01	; 1
        st                X, r24
        out               0x3f, r25	; 63
        cpi               r18, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_nand::bool::acquire_false:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r18, X
        ldi               r24, 0x01	; 1
        st                X, r24
        out               0x3f, r25	; 63
        cpi               r18, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_nand::bool::relaxed_false:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r18, X
        ldi               r24, 0x01	; 1
        st                X, r24
        out               0x3f, r25	; 63
        cpi               r18, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_nand::bool::release_false:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r18, X
        ldi               r24, 0x01	; 1
        st                X, r24
        out               0x3f, r25	; 63
        cpi               r18, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_nand::bool::acqrel:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        ldi               r18, 0x01	; 1
        cpi               r22, 0x00	; 0
0:
        breq              0f
        eor               r18, r24
        st                X, r18
        out               0x3f, r25	; 63
        ldi               r25, 0x01	; 1
        cpi               r24, 0x00	; 0
1:
        breq              1f
2:
        rjmp              2f
        st                X, r18
        out               0x3f, r25	; 63
        ldi               r25, 0x01	; 1
        cpi               r24, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        mov               r24, r25
        eor               r25, r25
        ret

asm_test::fetch_nand::bool::seqcst:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        ldi               r18, 0x01	; 1
        cpi               r22, 0x00	; 0
0:
        breq              0f
        eor               r18, r24
        st                X, r18
        out               0x3f, r25	; 63
        ldi               r25, 0x01	; 1
        cpi               r24, 0x00	; 0
1:
        breq              1f
2:
        rjmp              2f
        st                X, r18
        out               0x3f, r25	; 63
        ldi               r25, 0x01	; 1
        cpi               r24, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        mov               r24, r25
        eor               r25, r25
        ret

asm_test::fetch_nand::bool::acquire:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        ldi               r18, 0x01	; 1
        cpi               r22, 0x00	; 0
0:
        breq              0f
        eor               r18, r24
        st                X, r18
        out               0x3f, r25	; 63
        ldi               r25, 0x01	; 1
        cpi               r24, 0x00	; 0
1:
        breq              1f
2:
        rjmp              2f
        st                X, r18
        out               0x3f, r25	; 63
        ldi               r25, 0x01	; 1
        cpi               r24, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        mov               r24, r25
        eor               r25, r25
        ret

asm_test::fetch_nand::bool::relaxed:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        ldi               r18, 0x01	; 1
        cpi               r22, 0x00	; 0
0:
        breq              0f
        eor               r18, r24
        st                X, r18
        out               0x3f, r25	; 63
        ldi               r25, 0x01	; 1
        cpi               r24, 0x00	; 0
1:
        breq              1f
2:
        rjmp              2f
        st                X, r18
        out               0x3f, r25	; 63
        ldi               r25, 0x01	; 1
        cpi               r24, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        mov               r24, r25
        eor               r25, r25
        ret

asm_test::fetch_nand::bool::release:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        ldi               r18, 0x01	; 1
        cpi               r22, 0x00	; 0
0:
        breq              0f
        eor               r18, r24
        st                X, r18
        out               0x3f, r25	; 63
        ldi               r25, 0x01	; 1
        cpi               r24, 0x00	; 0
1:
        breq              1f
2:
        rjmp              2f
        st                X, r18
        out               0x3f, r25	; 63
        ldi               r25, 0x01	; 1
        cpi               r24, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        mov               r24, r25
        eor               r25, r25
        ret

asm_test::fetch_umax::u8::acqrel:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r22, r24
        mov               r18, r24
0:
        brcs              0f
        mov               r18, r22
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_umax::u8::seqcst:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r22, r24
        mov               r18, r24
0:
        brcs              0f
        mov               r18, r22
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_umax::u8::acquire:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r22, r24
        mov               r18, r24
0:
        brcs              0f
        mov               r18, r22
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_umax::u8::relaxed:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r22, r24
        mov               r18, r24
0:
        brcs              0f
        mov               r18, r22
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_umax::u8::release:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r22, r24
        mov               r18, r24
0:
        brcs              0f
        mov               r18, r22
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_umax::u16::acqrel:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r22, r24
        cpc               r23, r25
        movw              r26, r24
0:
        brcs              0f
        movw              r26, r22
        movw              r30, r18
        std               Z+1, r27	; 0x01
        st                Z, r26
        out               0x3f, r20	; 63
        ret

asm_test::fetch_umax::u16::seqcst:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r22, r24
        cpc               r23, r25
        movw              r26, r24
0:
        brcs              0f
        movw              r26, r22
        movw              r30, r18
        std               Z+1, r27	; 0x01
        st                Z, r26
        out               0x3f, r20	; 63
        ret

asm_test::fetch_umax::u16::acquire:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r22, r24
        cpc               r23, r25
        movw              r26, r24
0:
        brcs              0f
        movw              r26, r22
        movw              r30, r18
        std               Z+1, r27	; 0x01
        st                Z, r26
        out               0x3f, r20	; 63
        ret

asm_test::fetch_umax::u16::relaxed:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r22, r24
        cpc               r23, r25
        movw              r26, r24
0:
        brcs              0f
        movw              r26, r22
        movw              r30, r18
        std               Z+1, r27	; 0x01
        st                Z, r26
        out               0x3f, r20	; 63
        ret

asm_test::fetch_umax::u16::release:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r22, r24
        cpc               r23, r25
        movw              r26, r24
0:
        brcs              0f
        movw              r26, r22
        movw              r30, r18
        std               Z+1, r27	; 0x01
        st                Z, r26
        out               0x3f, r20	; 63
        ret

asm_test::fetch_umin::u8::acqrel:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r24, r22
        mov               r18, r24
0:
        brcs              0f
        mov               r18, r22
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_umin::u8::seqcst:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r24, r22
        mov               r18, r24
0:
        brcs              0f
        mov               r18, r22
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_umin::u8::acquire:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r24, r22
        mov               r18, r24
0:
        brcs              0f
        mov               r18, r22
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_umin::u8::relaxed:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r24, r22
        mov               r18, r24
0:
        brcs              0f
        mov               r18, r22
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_umin::u8::release:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r24, r22
        mov               r18, r24
0:
        brcs              0f
        mov               r18, r22
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_umin::u16::acqrel:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r24, r22
        cpc               r25, r23
        movw              r26, r24
0:
        brcs              0f
        movw              r26, r22
        movw              r30, r18
        std               Z+1, r27	; 0x01
        st                Z, r26
        out               0x3f, r20	; 63
        ret

asm_test::fetch_umin::u16::seqcst:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r24, r22
        cpc               r25, r23
        movw              r26, r24
0:
        brcs              0f
        movw              r26, r22
        movw              r30, r18
        std               Z+1, r27	; 0x01
        st                Z, r26
        out               0x3f, r20	; 63
        ret

asm_test::fetch_umin::u16::acquire:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r24, r22
        cpc               r25, r23
        movw              r26, r24
0:
        brcs              0f
        movw              r26, r22
        movw              r30, r18
        std               Z+1, r27	; 0x01
        st                Z, r26
        out               0x3f, r20	; 63
        ret

asm_test::fetch_umin::u16::relaxed:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r24, r22
        cpc               r25, r23
        movw              r26, r24
0:
        brcs              0f
        movw              r26, r22
        movw              r30, r18
        std               Z+1, r27	; 0x01
        st                Z, r26
        out               0x3f, r20	; 63
        ret

asm_test::fetch_umin::u16::release:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r24, r22
        cpc               r25, r23
        movw              r26, r24
0:
        brcs              0f
        movw              r26, r22
        movw              r30, r18
        std               Z+1, r27	; 0x01
        st                Z, r26
        out               0x3f, r20	; 63
        ret

asm_test::compare_exchange::u8::acqrel_seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cp                r25, r22
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
1:
        breq              1f
        ret
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
2:
        brne              2f
        mov               r24, r1
        ret

asm_test::compare_exchange::u8::seqcst_seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cp                r25, r22
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
1:
        breq              1f
        ret
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
2:
        brne              2f
        mov               r24, r1
        ret

asm_test::compare_exchange::u8::acqrel_acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cp                r25, r22
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
1:
        breq              1f
        ret
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
2:
        brne              2f
        mov               r24, r1
        ret

asm_test::compare_exchange::u8::acqrel_relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cp                r25, r22
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
1:
        breq              1f
        ret
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
2:
        brne              2f
        mov               r24, r1
        ret

asm_test::compare_exchange::u8::acquire_seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cp                r25, r22
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
1:
        breq              1f
        ret
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
2:
        brne              2f
        mov               r24, r1
        ret

asm_test::compare_exchange::u8::relaxed_seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cp                r25, r22
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
1:
        breq              1f
        ret
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
2:
        brne              2f
        mov               r24, r1
        ret

asm_test::compare_exchange::u8::release_seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cp                r25, r22
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
1:
        breq              1f
        ret
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
2:
        brne              2f
        mov               r24, r1
        ret

asm_test::compare_exchange::u8::seqcst_acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cp                r25, r22
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
1:
        breq              1f
        ret
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
2:
        brne              2f
        mov               r24, r1
        ret

asm_test::compare_exchange::u8::seqcst_relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cp                r25, r22
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
1:
        breq              1f
        ret
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
2:
        brne              2f
        mov               r24, r1
        ret

asm_test::compare_exchange::u8::acquire_acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cp                r25, r22
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
1:
        breq              1f
        ret
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
2:
        brne              2f
        mov               r24, r1
        ret

asm_test::compare_exchange::u8::acquire_relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cp                r25, r22
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
1:
        breq              1f
        ret
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
2:
        brne              2f
        mov               r24, r1
        ret

asm_test::compare_exchange::u8::relaxed_acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cp                r25, r22
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
1:
        breq              1f
        ret
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
2:
        brne              2f
        mov               r24, r1
        ret

asm_test::compare_exchange::u8::relaxed_relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cp                r25, r22
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
1:
        breq              1f
        ret
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
2:
        brne              2f
        mov               r24, r1
        ret

asm_test::compare_exchange::u8::release_acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cp                r25, r22
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
1:
        breq              1f
        ret
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
2:
        brne              2f
        mov               r24, r1
        ret

asm_test::compare_exchange::u8::release_relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cp                r25, r22
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
1:
        breq              1f
        ret
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
2:
        brne              2f
        mov               r24, r1
        ret

asm_test::compare_exchange::u16::acqrel_seqcst:
        movw              r18, r22
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        movw              r30, r26
        ld                r23, Z
        ldd               r24, Z+1	; 0x01
        cp                r23, r18
        cpc               r24, r19
0:
        brne              0f
        movw              r30, r26
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r25	; 63
        ldi               r22, 0x01	; 1
        cp                r23, r18
        cpc               r24, r19
1:
        brne              1f
        mov               r22, r1
        ret

asm_test::compare_exchange::u16::seqcst_seqcst:
        movw              r18, r22
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        movw              r30, r26
        ld                r23, Z
        ldd               r24, Z+1	; 0x01
        cp                r23, r18
        cpc               r24, r19
0:
        brne              0f
        movw              r30, r26
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r25	; 63
        ldi               r22, 0x01	; 1
        cp                r23, r18
        cpc               r24, r19
1:
        brne              1f
        mov               r22, r1
        ret

asm_test::compare_exchange::u16::acqrel_acquire:
        movw              r18, r22
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        movw              r30, r26
        ld                r23, Z
        ldd               r24, Z+1	; 0x01
        cp                r23, r18
        cpc               r24, r19
0:
        brne              0f
        movw              r30, r26
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r25	; 63
        ldi               r22, 0x01	; 1
        cp                r23, r18
        cpc               r24, r19
1:
        brne              1f
        mov               r22, r1
        ret

asm_test::compare_exchange::u16::acqrel_relaxed:
        movw              r18, r22
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        movw              r30, r26
        ld                r23, Z
        ldd               r24, Z+1	; 0x01
        cp                r23, r18
        cpc               r24, r19
0:
        brne              0f
        movw              r30, r26
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r25	; 63
        ldi               r22, 0x01	; 1
        cp                r23, r18
        cpc               r24, r19
1:
        brne              1f
        mov               r22, r1
        ret

asm_test::compare_exchange::u16::acquire_seqcst:
        movw              r18, r22
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        movw              r30, r26
        ld                r23, Z
        ldd               r24, Z+1	; 0x01
        cp                r23, r18
        cpc               r24, r19
0:
        brne              0f
        movw              r30, r26
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r25	; 63
        ldi               r22, 0x01	; 1
        cp                r23, r18
        cpc               r24, r19
1:
        brne              1f
        mov               r22, r1
        ret

asm_test::compare_exchange::u16::relaxed_seqcst:
        movw              r18, r22
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        movw              r30, r26
        ld                r23, Z
        ldd               r24, Z+1	; 0x01
        cp                r23, r18
        cpc               r24, r19
0:
        brne              0f
        movw              r30, r26
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r25	; 63
        ldi               r22, 0x01	; 1
        cp                r23, r18
        cpc               r24, r19
1:
        brne              1f
        mov               r22, r1
        ret

asm_test::compare_exchange::u16::release_seqcst:
        movw              r18, r22
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        movw              r30, r26
        ld                r23, Z
        ldd               r24, Z+1	; 0x01
        cp                r23, r18
        cpc               r24, r19
0:
        brne              0f
        movw              r30, r26
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r25	; 63
        ldi               r22, 0x01	; 1
        cp                r23, r18
        cpc               r24, r19
1:
        brne              1f
        mov               r22, r1
        ret

asm_test::compare_exchange::u16::seqcst_acquire:
        movw              r18, r22
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        movw              r30, r26
        ld                r23, Z
        ldd               r24, Z+1	; 0x01
        cp                r23, r18
        cpc               r24, r19
0:
        brne              0f
        movw              r30, r26
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r25	; 63
        ldi               r22, 0x01	; 1
        cp                r23, r18
        cpc               r24, r19
1:
        brne              1f
        mov               r22, r1
        ret

asm_test::compare_exchange::u16::seqcst_relaxed:
        movw              r18, r22
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        movw              r30, r26
        ld                r23, Z
        ldd               r24, Z+1	; 0x01
        cp                r23, r18
        cpc               r24, r19
0:
        brne              0f
        movw              r30, r26
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r25	; 63
        ldi               r22, 0x01	; 1
        cp                r23, r18
        cpc               r24, r19
1:
        brne              1f
        mov               r22, r1
        ret

asm_test::compare_exchange::u16::acquire_acquire:
        movw              r18, r22
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        movw              r30, r26
        ld                r23, Z
        ldd               r24, Z+1	; 0x01
        cp                r23, r18
        cpc               r24, r19
0:
        brne              0f
        movw              r30, r26
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r25	; 63
        ldi               r22, 0x01	; 1
        cp                r23, r18
        cpc               r24, r19
1:
        brne              1f
        mov               r22, r1
        ret

asm_test::compare_exchange::u16::acquire_relaxed:
        movw              r18, r22
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        movw              r30, r26
        ld                r23, Z
        ldd               r24, Z+1	; 0x01
        cp                r23, r18
        cpc               r24, r19
0:
        brne              0f
        movw              r30, r26
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r25	; 63
        ldi               r22, 0x01	; 1
        cp                r23, r18
        cpc               r24, r19
1:
        brne              1f
        mov               r22, r1
        ret

asm_test::compare_exchange::u16::relaxed_acquire:
        movw              r18, r22
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        movw              r30, r26
        ld                r23, Z
        ldd               r24, Z+1	; 0x01
        cp                r23, r18
        cpc               r24, r19
0:
        brne              0f
        movw              r30, r26
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r25	; 63
        ldi               r22, 0x01	; 1
        cp                r23, r18
        cpc               r24, r19
1:
        brne              1f
        mov               r22, r1
        ret

asm_test::compare_exchange::u16::relaxed_relaxed:
        movw              r18, r22
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        movw              r30, r26
        ld                r23, Z
        ldd               r24, Z+1	; 0x01
        cp                r23, r18
        cpc               r24, r19
0:
        brne              0f
        movw              r30, r26
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r25	; 63
        ldi               r22, 0x01	; 1
        cp                r23, r18
        cpc               r24, r19
1:
        brne              1f
        mov               r22, r1
        ret

asm_test::compare_exchange::u16::release_acquire:
        movw              r18, r22
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        movw              r30, r26
        ld                r23, Z
        ldd               r24, Z+1	; 0x01
        cp                r23, r18
        cpc               r24, r19
0:
        brne              0f
        movw              r30, r26
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r25	; 63
        ldi               r22, 0x01	; 1
        cp                r23, r18
        cpc               r24, r19
1:
        brne              1f
        mov               r22, r1
        ret

asm_test::compare_exchange::u16::release_relaxed:
        movw              r18, r22
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        movw              r30, r26
        ld                r23, Z
        ldd               r24, Z+1	; 0x01
        cp                r23, r18
        cpc               r24, r19
0:
        brne              0f
        movw              r30, r26
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r25	; 63
        ldi               r22, 0x01	; 1
        cp                r23, r18
        cpc               r24, r19
1:
        brne              1f
        mov               r22, r1
        ret

asm_test::compare_exchange::bool::acqrel_seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cp                r18, r22
0:
        brne              0f
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cp                r18, r22
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::seqcst_seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cp                r18, r22
0:
        brne              0f
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cp                r18, r22
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::acqrel_acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cp                r18, r22
0:
        brne              0f
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cp                r18, r22
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::acqrel_relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cp                r18, r22
0:
        brne              0f
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cp                r18, r22
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::acquire_seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cp                r18, r22
0:
        brne              0f
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cp                r18, r22
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::relaxed_seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cp                r18, r22
0:
        brne              0f
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cp                r18, r22
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::release_seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cp                r18, r22
0:
        brne              0f
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cp                r18, r22
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::seqcst_acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cp                r18, r22
0:
        brne              0f
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cp                r18, r22
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::seqcst_relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cp                r18, r22
0:
        brne              0f
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cp                r18, r22
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::acquire_acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cp                r18, r22
0:
        brne              0f
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cp                r18, r22
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::acquire_relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cp                r18, r22
0:
        brne              0f
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cp                r18, r22
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::relaxed_acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cp                r18, r22
0:
        brne              0f
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cp                r18, r22
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::relaxed_relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cp                r18, r22
0:
        brne              0f
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cp                r18, r22
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::release_acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cp                r18, r22
0:
        brne              0f
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cp                r18, r22
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::release_relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cp                r18, r22
0:
        brne              0f
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cp                r18, r22
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_true_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cpi               r18, 0x01	; 1
        ldi               r24, 0x01	; 1
0:
        breq              0f
        cpi               r18, 0x00	; 0
1:
        breq              1f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
2:
        brne              2f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_true_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cpi               r18, 0x01	; 1
        ldi               r24, 0x01	; 1
0:
        breq              0f
        cpi               r18, 0x00	; 0
1:
        breq              1f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
2:
        brne              2f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::acqrel_acquire_true_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cpi               r18, 0x01	; 1
        ldi               r24, 0x01	; 1
0:
        breq              0f
        cpi               r18, 0x00	; 0
1:
        breq              1f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
2:
        brne              2f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_true_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cpi               r18, 0x01	; 1
        ldi               r24, 0x01	; 1
0:
        breq              0f
        cpi               r18, 0x00	; 0
1:
        breq              1f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
2:
        brne              2f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_false_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cpi               r25, 0x00	; 0
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
1:
        breq              1f
        mov               r25, r24
        ret
        ldi               r18, 0x01	; 1
        st                X, r18
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
2:
        brne              2f
        mov               r24, r1
        mov               r25, r24
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_true_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cpi               r18, 0x01	; 1
0:
        brne              0f
        st                X, r1
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cpi               r18, 0x01	; 1
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::acquire_seqcst_true_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cpi               r18, 0x01	; 1
        ldi               r24, 0x01	; 1
0:
        breq              0f
        cpi               r18, 0x00	; 0
1:
        breq              1f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
2:
        brne              2f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_true_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cpi               r18, 0x01	; 1
        ldi               r24, 0x01	; 1
0:
        breq              0f
        cpi               r18, 0x00	; 0
1:
        breq              1f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
2:
        brne              2f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::release_seqcst_true_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cpi               r18, 0x01	; 1
        ldi               r24, 0x01	; 1
0:
        breq              0f
        cpi               r18, 0x00	; 0
1:
        breq              1f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
2:
        brne              2f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::seqcst_acquire_true_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cpi               r18, 0x01	; 1
        ldi               r24, 0x01	; 1
0:
        breq              0f
        cpi               r18, 0x00	; 0
1:
        breq              1f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
2:
        brne              2f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_true_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cpi               r18, 0x01	; 1
        ldi               r24, 0x01	; 1
0:
        breq              0f
        cpi               r18, 0x00	; 0
1:
        breq              1f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
2:
        brne              2f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_false_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cpi               r25, 0x00	; 0
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
1:
        breq              1f
        mov               r25, r24
        ret
        ldi               r18, 0x01	; 1
        st                X, r18
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
2:
        brne              2f
        mov               r24, r1
        mov               r25, r24
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_true_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cpi               r18, 0x01	; 1
0:
        brne              0f
        st                X, r1
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cpi               r18, 0x01	; 1
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::acqrel_acquire_false_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cpi               r25, 0x00	; 0
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
1:
        breq              1f
        mov               r25, r24
        ret
        ldi               r18, 0x01	; 1
        st                X, r18
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
2:
        brne              2f
        mov               r24, r1
        mov               r25, r24
        ret

asm_test::compare_exchange::bool::acqrel_acquire_true_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cpi               r18, 0x01	; 1
0:
        brne              0f
        st                X, r1
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cpi               r18, 0x01	; 1
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_false_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cpi               r25, 0x00	; 0
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
1:
        breq              1f
        mov               r25, r24
        ret
        ldi               r18, 0x01	; 1
        st                X, r18
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
2:
        brne              2f
        mov               r24, r1
        mov               r25, r24
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_true_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cpi               r18, 0x01	; 1
0:
        brne              0f
        st                X, r1
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cpi               r18, 0x01	; 1
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_false_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        mov               r25, r24
        ret

asm_test::compare_exchange::bool::acquire_acquire_true_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cpi               r18, 0x01	; 1
        ldi               r24, 0x01	; 1
0:
        breq              0f
        cpi               r18, 0x00	; 0
1:
        breq              1f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
2:
        brne              2f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::acquire_relaxed_true_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cpi               r18, 0x01	; 1
        ldi               r24, 0x01	; 1
0:
        breq              0f
        cpi               r18, 0x00	; 0
1:
        breq              1f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
2:
        brne              2f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::acquire_seqcst_false_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cpi               r25, 0x00	; 0
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
1:
        breq              1f
        mov               r25, r24
        ret
        ldi               r18, 0x01	; 1
        st                X, r18
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
2:
        brne              2f
        mov               r24, r1
        mov               r25, r24
        ret

asm_test::compare_exchange::bool::acquire_seqcst_true_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cpi               r18, 0x01	; 1
0:
        brne              0f
        st                X, r1
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cpi               r18, 0x01	; 1
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::relaxed_acquire_true_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cpi               r18, 0x01	; 1
        ldi               r24, 0x01	; 1
0:
        breq              0f
        cpi               r18, 0x00	; 0
1:
        breq              1f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
2:
        brne              2f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_true_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cpi               r18, 0x01	; 1
        ldi               r24, 0x01	; 1
0:
        breq              0f
        cpi               r18, 0x00	; 0
1:
        breq              1f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
2:
        brne              2f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_false_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cpi               r25, 0x00	; 0
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
1:
        breq              1f
        mov               r25, r24
        ret
        ldi               r18, 0x01	; 1
        st                X, r18
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
2:
        brne              2f
        mov               r24, r1
        mov               r25, r24
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_true_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cpi               r18, 0x01	; 1
0:
        brne              0f
        st                X, r1
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cpi               r18, 0x01	; 1
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::release_acquire_true_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cpi               r18, 0x01	; 1
        ldi               r24, 0x01	; 1
0:
        breq              0f
        cpi               r18, 0x00	; 0
1:
        breq              1f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
2:
        brne              2f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::release_relaxed_true_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cpi               r18, 0x01	; 1
        ldi               r24, 0x01	; 1
0:
        breq              0f
        cpi               r18, 0x00	; 0
1:
        breq              1f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
2:
        brne              2f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::release_seqcst_false_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cpi               r25, 0x00	; 0
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
1:
        breq              1f
        mov               r25, r24
        ret
        ldi               r18, 0x01	; 1
        st                X, r18
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
2:
        brne              2f
        mov               r24, r1
        mov               r25, r24
        ret

asm_test::compare_exchange::bool::release_seqcst_true_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cpi               r18, 0x01	; 1
0:
        brne              0f
        st                X, r1
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cpi               r18, 0x01	; 1
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::seqcst_acquire_false_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cpi               r25, 0x00	; 0
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
1:
        breq              1f
        mov               r25, r24
        ret
        ldi               r18, 0x01	; 1
        st                X, r18
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
2:
        brne              2f
        mov               r24, r1
        mov               r25, r24
        ret

asm_test::compare_exchange::bool::seqcst_acquire_true_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cpi               r18, 0x01	; 1
0:
        brne              0f
        st                X, r1
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cpi               r18, 0x01	; 1
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_false_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cpi               r25, 0x00	; 0
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
1:
        breq              1f
        mov               r25, r24
        ret
        ldi               r18, 0x01	; 1
        st                X, r18
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
2:
        brne              2f
        mov               r24, r1
        mov               r25, r24
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_true_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cpi               r18, 0x01	; 1
0:
        brne              0f
        st                X, r1
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cpi               r18, 0x01	; 1
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_false_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        mov               r25, r24
        ret

asm_test::compare_exchange::bool::acqrel_acquire_false_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        mov               r25, r24
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_false_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        mov               r25, r24
        ret

asm_test::compare_exchange::bool::acquire_acquire_false_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cpi               r25, 0x00	; 0
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
1:
        breq              1f
        mov               r25, r24
        ret
        ldi               r18, 0x01	; 1
        st                X, r18
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
2:
        brne              2f
        mov               r24, r1
        mov               r25, r24
        ret

asm_test::compare_exchange::bool::acquire_acquire_true_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cpi               r18, 0x01	; 1
0:
        brne              0f
        st                X, r1
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cpi               r18, 0x01	; 1
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::acquire_relaxed_false_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cpi               r25, 0x00	; 0
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
1:
        breq              1f
        mov               r25, r24
        ret
        ldi               r18, 0x01	; 1
        st                X, r18
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
2:
        brne              2f
        mov               r24, r1
        mov               r25, r24
        ret

asm_test::compare_exchange::bool::acquire_relaxed_true_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cpi               r18, 0x01	; 1
0:
        brne              0f
        st                X, r1
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cpi               r18, 0x01	; 1
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::acquire_seqcst_false_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        mov               r25, r24
        ret

asm_test::compare_exchange::bool::relaxed_acquire_false_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cpi               r25, 0x00	; 0
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
1:
        breq              1f
        mov               r25, r24
        ret
        ldi               r18, 0x01	; 1
        st                X, r18
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
2:
        brne              2f
        mov               r24, r1
        mov               r25, r24
        ret

asm_test::compare_exchange::bool::relaxed_acquire_true_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cpi               r18, 0x01	; 1
0:
        brne              0f
        st                X, r1
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cpi               r18, 0x01	; 1
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_false_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cpi               r25, 0x00	; 0
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
1:
        breq              1f
        mov               r25, r24
        ret
        ldi               r18, 0x01	; 1
        st                X, r18
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
2:
        brne              2f
        mov               r24, r1
        mov               r25, r24
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_true_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cpi               r18, 0x01	; 1
0:
        brne              0f
        st                X, r1
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cpi               r18, 0x01	; 1
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_false_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        mov               r25, r24
        ret

asm_test::compare_exchange::bool::release_acquire_false_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cpi               r25, 0x00	; 0
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
1:
        breq              1f
        mov               r25, r24
        ret
        ldi               r18, 0x01	; 1
        st                X, r18
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
2:
        brne              2f
        mov               r24, r1
        mov               r25, r24
        ret

asm_test::compare_exchange::bool::release_acquire_true_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cpi               r18, 0x01	; 1
0:
        brne              0f
        st                X, r1
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cpi               r18, 0x01	; 1
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::release_relaxed_false_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cpi               r25, 0x00	; 0
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
1:
        breq              1f
        mov               r25, r24
        ret
        ldi               r18, 0x01	; 1
        st                X, r18
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
2:
        brne              2f
        mov               r24, r1
        mov               r25, r24
        ret

asm_test::compare_exchange::bool::release_relaxed_true_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cpi               r18, 0x01	; 1
0:
        brne              0f
        st                X, r1
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cpi               r18, 0x01	; 1
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange::bool::release_seqcst_false_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        mov               r25, r24
        ret

asm_test::compare_exchange::bool::seqcst_acquire_false_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        mov               r25, r24
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_false_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        mov               r25, r24
        ret

asm_test::compare_exchange::bool::acquire_acquire_false_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        mov               r25, r24
        ret

asm_test::compare_exchange::bool::acquire_relaxed_false_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        mov               r25, r24
        ret

asm_test::compare_exchange::bool::relaxed_acquire_false_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        mov               r25, r24
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_false_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        mov               r25, r24
        ret

asm_test::compare_exchange::bool::release_acquire_false_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        mov               r25, r24
        ret

asm_test::compare_exchange::bool::release_relaxed_false_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        mov               r25, r24
        ret

asm_test::compare_exchange_weak::u8::acqrel_seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cp                r25, r22
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
1:
        breq              1f
        ret
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
2:
        brne              2f
        mov               r24, r1
        ret

asm_test::compare_exchange_weak::u8::seqcst_seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cp                r25, r22
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
1:
        breq              1f
        ret
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
2:
        brne              2f
        mov               r24, r1
        ret

asm_test::compare_exchange_weak::u8::acqrel_acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cp                r25, r22
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
1:
        breq              1f
        ret
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
2:
        brne              2f
        mov               r24, r1
        ret

asm_test::compare_exchange_weak::u8::acqrel_relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cp                r25, r22
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
1:
        breq              1f
        ret
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
2:
        brne              2f
        mov               r24, r1
        ret

asm_test::compare_exchange_weak::u8::acquire_seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cp                r25, r22
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
1:
        breq              1f
        ret
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
2:
        brne              2f
        mov               r24, r1
        ret

asm_test::compare_exchange_weak::u8::relaxed_seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cp                r25, r22
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
1:
        breq              1f
        ret
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
2:
        brne              2f
        mov               r24, r1
        ret

asm_test::compare_exchange_weak::u8::release_seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cp                r25, r22
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
1:
        breq              1f
        ret
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
2:
        brne              2f
        mov               r24, r1
        ret

asm_test::compare_exchange_weak::u8::seqcst_acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cp                r25, r22
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
1:
        breq              1f
        ret
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
2:
        brne              2f
        mov               r24, r1
        ret

asm_test::compare_exchange_weak::u8::seqcst_relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cp                r25, r22
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
1:
        breq              1f
        ret
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
2:
        brne              2f
        mov               r24, r1
        ret

asm_test::compare_exchange_weak::u8::acquire_acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cp                r25, r22
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
1:
        breq              1f
        ret
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
2:
        brne              2f
        mov               r24, r1
        ret

asm_test::compare_exchange_weak::u8::acquire_relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cp                r25, r22
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
1:
        breq              1f
        ret
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
2:
        brne              2f
        mov               r24, r1
        ret

asm_test::compare_exchange_weak::u8::relaxed_acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cp                r25, r22
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
1:
        breq              1f
        ret
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
2:
        brne              2f
        mov               r24, r1
        ret

asm_test::compare_exchange_weak::u8::relaxed_relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cp                r25, r22
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
1:
        breq              1f
        ret
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
2:
        brne              2f
        mov               r24, r1
        ret

asm_test::compare_exchange_weak::u8::release_acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cp                r25, r22
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
1:
        breq              1f
        ret
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
2:
        brne              2f
        mov               r24, r1
        ret

asm_test::compare_exchange_weak::u8::release_relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        cp                r25, r22
0:
        breq              0f
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
1:
        breq              1f
        ret
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cp                r25, r22
2:
        brne              2f
        mov               r24, r1
        ret

asm_test::compare_exchange_weak::u16::acqrel_seqcst:
        movw              r18, r22
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        movw              r30, r26
        ld                r23, Z
        ldd               r24, Z+1	; 0x01
        cp                r23, r18
        cpc               r24, r19
0:
        brne              0f
        movw              r30, r26
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r25	; 63
        ldi               r22, 0x01	; 1
        cp                r23, r18
        cpc               r24, r19
1:
        brne              1f
        mov               r22, r1
        ret

asm_test::compare_exchange_weak::u16::seqcst_seqcst:
        movw              r18, r22
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        movw              r30, r26
        ld                r23, Z
        ldd               r24, Z+1	; 0x01
        cp                r23, r18
        cpc               r24, r19
0:
        brne              0f
        movw              r30, r26
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r25	; 63
        ldi               r22, 0x01	; 1
        cp                r23, r18
        cpc               r24, r19
1:
        brne              1f
        mov               r22, r1
        ret

asm_test::compare_exchange_weak::u16::acqrel_acquire:
        movw              r18, r22
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        movw              r30, r26
        ld                r23, Z
        ldd               r24, Z+1	; 0x01
        cp                r23, r18
        cpc               r24, r19
0:
        brne              0f
        movw              r30, r26
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r25	; 63
        ldi               r22, 0x01	; 1
        cp                r23, r18
        cpc               r24, r19
1:
        brne              1f
        mov               r22, r1
        ret

asm_test::compare_exchange_weak::u16::acqrel_relaxed:
        movw              r18, r22
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        movw              r30, r26
        ld                r23, Z
        ldd               r24, Z+1	; 0x01
        cp                r23, r18
        cpc               r24, r19
0:
        brne              0f
        movw              r30, r26
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r25	; 63
        ldi               r22, 0x01	; 1
        cp                r23, r18
        cpc               r24, r19
1:
        brne              1f
        mov               r22, r1
        ret

asm_test::compare_exchange_weak::u16::acquire_seqcst:
        movw              r18, r22
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        movw              r30, r26
        ld                r23, Z
        ldd               r24, Z+1	; 0x01
        cp                r23, r18
        cpc               r24, r19
0:
        brne              0f
        movw              r30, r26
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r25	; 63
        ldi               r22, 0x01	; 1
        cp                r23, r18
        cpc               r24, r19
1:
        brne              1f
        mov               r22, r1
        ret

asm_test::compare_exchange_weak::u16::relaxed_seqcst:
        movw              r18, r22
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        movw              r30, r26
        ld                r23, Z
        ldd               r24, Z+1	; 0x01
        cp                r23, r18
        cpc               r24, r19
0:
        brne              0f
        movw              r30, r26
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r25	; 63
        ldi               r22, 0x01	; 1
        cp                r23, r18
        cpc               r24, r19
1:
        brne              1f
        mov               r22, r1
        ret

asm_test::compare_exchange_weak::u16::release_seqcst:
        movw              r18, r22
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        movw              r30, r26
        ld                r23, Z
        ldd               r24, Z+1	; 0x01
        cp                r23, r18
        cpc               r24, r19
0:
        brne              0f
        movw              r30, r26
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r25	; 63
        ldi               r22, 0x01	; 1
        cp                r23, r18
        cpc               r24, r19
1:
        brne              1f
        mov               r22, r1
        ret

asm_test::compare_exchange_weak::u16::seqcst_acquire:
        movw              r18, r22
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        movw              r30, r26
        ld                r23, Z
        ldd               r24, Z+1	; 0x01
        cp                r23, r18
        cpc               r24, r19
0:
        brne              0f
        movw              r30, r26
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r25	; 63
        ldi               r22, 0x01	; 1
        cp                r23, r18
        cpc               r24, r19
1:
        brne              1f
        mov               r22, r1
        ret

asm_test::compare_exchange_weak::u16::seqcst_relaxed:
        movw              r18, r22
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        movw              r30, r26
        ld                r23, Z
        ldd               r24, Z+1	; 0x01
        cp                r23, r18
        cpc               r24, r19
0:
        brne              0f
        movw              r30, r26
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r25	; 63
        ldi               r22, 0x01	; 1
        cp                r23, r18
        cpc               r24, r19
1:
        brne              1f
        mov               r22, r1
        ret

asm_test::compare_exchange_weak::u16::acquire_acquire:
        movw              r18, r22
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        movw              r30, r26
        ld                r23, Z
        ldd               r24, Z+1	; 0x01
        cp                r23, r18
        cpc               r24, r19
0:
        brne              0f
        movw              r30, r26
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r25	; 63
        ldi               r22, 0x01	; 1
        cp                r23, r18
        cpc               r24, r19
1:
        brne              1f
        mov               r22, r1
        ret

asm_test::compare_exchange_weak::u16::acquire_relaxed:
        movw              r18, r22
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        movw              r30, r26
        ld                r23, Z
        ldd               r24, Z+1	; 0x01
        cp                r23, r18
        cpc               r24, r19
0:
        brne              0f
        movw              r30, r26
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r25	; 63
        ldi               r22, 0x01	; 1
        cp                r23, r18
        cpc               r24, r19
1:
        brne              1f
        mov               r22, r1
        ret

asm_test::compare_exchange_weak::u16::relaxed_acquire:
        movw              r18, r22
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        movw              r30, r26
        ld                r23, Z
        ldd               r24, Z+1	; 0x01
        cp                r23, r18
        cpc               r24, r19
0:
        brne              0f
        movw              r30, r26
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r25	; 63
        ldi               r22, 0x01	; 1
        cp                r23, r18
        cpc               r24, r19
1:
        brne              1f
        mov               r22, r1
        ret

asm_test::compare_exchange_weak::u16::relaxed_relaxed:
        movw              r18, r22
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        movw              r30, r26
        ld                r23, Z
        ldd               r24, Z+1	; 0x01
        cp                r23, r18
        cpc               r24, r19
0:
        brne              0f
        movw              r30, r26
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r25	; 63
        ldi               r22, 0x01	; 1
        cp                r23, r18
        cpc               r24, r19
1:
        brne              1f
        mov               r22, r1
        ret

asm_test::compare_exchange_weak::u16::release_acquire:
        movw              r18, r22
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        movw              r30, r26
        ld                r23, Z
        ldd               r24, Z+1	; 0x01
        cp                r23, r18
        cpc               r24, r19
0:
        brne              0f
        movw              r30, r26
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r25	; 63
        ldi               r22, 0x01	; 1
        cp                r23, r18
        cpc               r24, r19
1:
        brne              1f
        mov               r22, r1
        ret

asm_test::compare_exchange_weak::u16::release_relaxed:
        movw              r18, r22
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        movw              r30, r26
        ld                r23, Z
        ldd               r24, Z+1	; 0x01
        cp                r23, r18
        cpc               r24, r19
0:
        brne              0f
        movw              r30, r26
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r25	; 63
        ldi               r22, 0x01	; 1
        cp                r23, r18
        cpc               r24, r19
1:
        brne              1f
        mov               r22, r1
        ret

asm_test::compare_exchange_weak::bool::acqrel_seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cp                r18, r22
0:
        brne              0f
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cp                r18, r22
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange_weak::bool::seqcst_seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cp                r18, r22
0:
        brne              0f
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cp                r18, r22
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange_weak::bool::acqrel_acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cp                r18, r22
0:
        brne              0f
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cp                r18, r22
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange_weak::bool::acqrel_relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cp                r18, r22
0:
        brne              0f
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cp                r18, r22
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange_weak::bool::acquire_seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cp                r18, r22
0:
        brne              0f
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cp                r18, r22
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange_weak::bool::relaxed_seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cp                r18, r22
0:
        brne              0f
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cp                r18, r22
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange_weak::bool::release_seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cp                r18, r22
0:
        brne              0f
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cp                r18, r22
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange_weak::bool::seqcst_acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cp                r18, r22
0:
        brne              0f
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cp                r18, r22
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange_weak::bool::seqcst_relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cp                r18, r22
0:
        brne              0f
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cp                r18, r22
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange_weak::bool::acquire_acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cp                r18, r22
0:
        brne              0f
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cp                r18, r22
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange_weak::bool::acquire_relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cp                r18, r22
0:
        brne              0f
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cp                r18, r22
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange_weak::bool::relaxed_acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cp                r18, r22
0:
        brne              0f
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cp                r18, r22
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange_weak::bool::relaxed_relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cp                r18, r22
0:
        brne              0f
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cp                r18, r22
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange_weak::bool::release_acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cp                r18, r22
0:
        brne              0f
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cp                r18, r22
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::compare_exchange_weak::bool::release_relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r18, X
        cp                r18, r22
0:
        brne              0f
        st                X, r20
        out               0x3f, r24	; 63
        ldi               r25, 0x01	; 1
        cp                r18, r22
        ldi               r24, 0x01	; 1
1:
        breq              1f
        cpi               r18, 0x00	; 0
2:
        breq              2f
        ret
        mov               r24, r1
        cpi               r18, 0x00	; 0
3:
        brne              3f
        mov               r25, r1
        ret

asm_test::or::u8::acqrel_all:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ldi               r25, 0xFF	; 255
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::or::u8::seqcst_all:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ldi               r25, 0xFF	; 255
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::or::u8::acqrel_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::or::u8::acquire_all:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ldi               r25, 0xFF	; 255
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::or::u8::relaxed_all:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ldi               r25, 0xFF	; 255
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::or::u8::release_all:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ldi               r25, 0xFF	; 255
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::or::u8::seqcst_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::or::u8::acquire_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::or::u8::relaxed_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::or::u8::release_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::or::u8::acqrel:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        or                r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::or::u8::seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        or                r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::or::u8::acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        or                r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::or::u8::relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        or                r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::or::u8::release:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        or                r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::or::u16::acqrel_all:
        in                r18, 0x3f	; 63
        cli
        ldi               r20, 0xFF	; 255
        ldi               r21, 0xFF	; 255
        movw              r30, r24
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::or::u16::seqcst_all:
        in                r18, 0x3f	; 63
        cli
        ldi               r20, 0xFF	; 255
        ldi               r21, 0xFF	; 255
        movw              r30, r24
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::or::u16::acqrel_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::or::u16::acquire_all:
        in                r18, 0x3f	; 63
        cli
        ldi               r20, 0xFF	; 255
        ldi               r21, 0xFF	; 255
        movw              r30, r24
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::or::u16::relaxed_all:
        in                r18, 0x3f	; 63
        cli
        ldi               r20, 0xFF	; 255
        ldi               r21, 0xFF	; 255
        movw              r30, r24
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::or::u16::release_all:
        in                r18, 0x3f	; 63
        cli
        ldi               r20, 0xFF	; 255
        ldi               r21, 0xFF	; 255
        movw              r30, r24
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::or::u16::seqcst_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::or::u16::acquire_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::or::u16::relaxed_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::or::u16::release_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::or::u16::acqrel:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        or                r24, r22
        or                r25, r23
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::or::u16::seqcst:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        or                r24, r22
        or                r25, r23
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::or::u16::acquire:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        or                r24, r22
        or                r25, r23
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::or::u16::relaxed:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        or                r24, r22
        or                r25, r23
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::or::u16::release:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        or                r24, r22
        or                r25, r23
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::or::bool::acqrel_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        ori               r25, 0x01	; 1
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::or::bool::seqcst_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        ori               r25, 0x01	; 1
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::or::bool::acqrel_false:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::or::bool::acquire_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        ori               r25, 0x01	; 1
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::or::bool::relaxed_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        ori               r25, 0x01	; 1
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::or::bool::release_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        ori               r25, 0x01	; 1
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::or::bool::seqcst_false:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::or::bool::acquire_false:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::or::bool::relaxed_false:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::or::bool::release_false:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::or::bool::acqrel:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        or                r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::or::bool::seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        or                r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::or::bool::acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        or                r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::or::bool::relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        or                r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::or::bool::release:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        or                r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::add::u8::acqrel_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::add::u8::seqcst_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::add::u8::acquire_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::add::u8::relaxed_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::add::u8::release_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::add::u8::acqrel:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        add               r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::add::u8::seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        add               r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::add::u8::acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        add               r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::add::u8::relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        add               r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::add::u8::release:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        add               r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::add::u16::acqrel_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::add::u16::seqcst_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::add::u16::acquire_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::add::u16::relaxed_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::add::u16::release_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::add::u16::acqrel:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        add               r24, r22
        adc               r25, r23
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::add::u16::seqcst:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        add               r24, r22
        adc               r25, r23
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::add::u16::acquire:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        add               r24, r22
        adc               r25, r23
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::add::u16::relaxed:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        add               r24, r22
        adc               r25, r23
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::add::u16::release:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        add               r24, r22
        adc               r25, r23
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::and::u8::acqrel_all:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::and::u8::seqcst_all:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::and::u8::acqrel_zero:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        st                X, r1
        out               0x3f, r24	; 63
        ret

asm_test::and::u8::acquire_all:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::and::u8::relaxed_all:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::and::u8::release_all:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::and::u8::seqcst_zero:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        st                X, r1
        out               0x3f, r24	; 63
        ret

asm_test::and::u8::acquire_zero:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        st                X, r1
        out               0x3f, r24	; 63
        ret

asm_test::and::u8::relaxed_zero:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        st                X, r1
        out               0x3f, r24	; 63
        ret

asm_test::and::u8::release_zero:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        st                X, r1
        out               0x3f, r24	; 63
        ret

asm_test::and::u8::acqrel:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        and               r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::and::u8::seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        and               r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::and::u8::acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        and               r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::and::u8::relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        and               r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::and::u8::release:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        and               r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::and::u16::acqrel_all:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::and::u16::seqcst_all:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::and::u16::acqrel_zero:
        in                r18, 0x3f	; 63
        cli
        ldi               r20, 0x00	; 0
        ldi               r21, 0x00	; 0
        movw              r30, r24
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::and::u16::acquire_all:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::and::u16::relaxed_all:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::and::u16::release_all:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::and::u16::seqcst_zero:
        in                r18, 0x3f	; 63
        cli
        ldi               r20, 0x00	; 0
        ldi               r21, 0x00	; 0
        movw              r30, r24
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::and::u16::acquire_zero:
        in                r18, 0x3f	; 63
        cli
        ldi               r20, 0x00	; 0
        ldi               r21, 0x00	; 0
        movw              r30, r24
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::and::u16::relaxed_zero:
        in                r18, 0x3f	; 63
        cli
        ldi               r20, 0x00	; 0
        ldi               r21, 0x00	; 0
        movw              r30, r24
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::and::u16::release_zero:
        in                r18, 0x3f	; 63
        cli
        ldi               r20, 0x00	; 0
        ldi               r21, 0x00	; 0
        movw              r30, r24
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::and::u16::acqrel:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        and               r24, r22
        and               r25, r23
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::and::u16::seqcst:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        and               r24, r22
        and               r25, r23
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::and::u16::acquire:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        and               r24, r22
        and               r25, r23
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::and::u16::relaxed:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        and               r24, r22
        and               r25, r23
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::and::u16::release:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        and               r24, r22
        and               r25, r23
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::and::bool::acqrel_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        andi              r25, 0x01	; 1
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::and::bool::seqcst_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        andi              r25, 0x01	; 1
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::and::bool::acqrel_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        st                X, r1
        out               0x3f, r24	; 63
        ret

asm_test::and::bool::acquire_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        andi              r25, 0x01	; 1
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::and::bool::relaxed_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        andi              r25, 0x01	; 1
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::and::bool::release_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        andi              r25, 0x01	; 1
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::and::bool::seqcst_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        st                X, r1
        out               0x3f, r24	; 63
        ret

asm_test::and::bool::acquire_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        st                X, r1
        out               0x3f, r24	; 63
        ret

asm_test::and::bool::relaxed_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        st                X, r1
        out               0x3f, r24	; 63
        ret

asm_test::and::bool::release_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        st                X, r1
        out               0x3f, r24	; 63
        ret

asm_test::and::bool::acqrel:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        and               r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::and::bool::seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        and               r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::and::bool::acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        and               r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::and::bool::relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        and               r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::and::bool::release:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        and               r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::neg::u8::acqrel:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        neg               r25
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::neg::u8::seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        neg               r25
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::neg::u8::acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        neg               r25
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::neg::u8::relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        neg               r25
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::neg::u8::release:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        neg               r25
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::neg::u16::acqrel:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        neg               r25
        neg               r24
        sbc               r25, r1
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::neg::u16::seqcst:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        neg               r25
        neg               r24
        sbc               r25, r1
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::neg::u16::acquire:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        neg               r25
        neg               r24
        sbc               r25, r1
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::neg::u16::relaxed:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        neg               r25
        neg               r24
        sbc               r25, r1
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::neg::u16::release:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        neg               r25
        neg               r24
        sbc               r25, r1
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::not::u8::acqrel:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        com               r25
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::not::u8::seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        com               r25
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::not::u8::acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        com               r25
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::not::u8::relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        com               r25
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::not::u8::release:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        com               r25
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::not::u16::acqrel:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        com               r24
        com               r25
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::not::u16::seqcst:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        com               r24
        com               r25
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::not::u16::acquire:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        com               r24
        com               r25
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::not::u16::relaxed:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        com               r24
        com               r25
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::not::u16::release:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        com               r24
        com               r25
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::not::bool::acqrel:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        ldi               r18, 0x01	; 1
        eor               r18, r25
        st                X, r18
        out               0x3f, r24	; 63
        ret

asm_test::not::bool::seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        ldi               r18, 0x01	; 1
        eor               r18, r25
        st                X, r18
        out               0x3f, r24	; 63
        ret

asm_test::not::bool::acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        ldi               r18, 0x01	; 1
        eor               r18, r25
        st                X, r18
        out               0x3f, r24	; 63
        ret

asm_test::not::bool::relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        ldi               r18, 0x01	; 1
        eor               r18, r25
        st                X, r18
        out               0x3f, r24	; 63
        ret

asm_test::not::bool::release:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        ldi               r18, 0x01	; 1
        eor               r18, r25
        st                X, r18
        out               0x3f, r24	; 63
        ret

asm_test::sub::u8::acqrel_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::sub::u8::seqcst_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::sub::u8::acquire_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::sub::u8::relaxed_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::sub::u8::release_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::sub::u8::acqrel:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        sub               r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::sub::u8::seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        sub               r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::sub::u8::acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        sub               r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::sub::u8::relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        sub               r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::sub::u8::release:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        sub               r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::sub::u16::acqrel_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::sub::u16::seqcst_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::sub::u16::acquire_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::sub::u16::relaxed_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::sub::u16::release_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::sub::u16::acqrel:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        sub               r24, r22
        sbc               r25, r23
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::sub::u16::seqcst:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        sub               r24, r22
        sbc               r25, r23
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::sub::u16::acquire:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        sub               r24, r22
        sbc               r25, r23
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::sub::u16::relaxed:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        sub               r24, r22
        sbc               r25, r23
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::sub::u16::release:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        sub               r24, r22
        sbc               r25, r23
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::xor::u8::acqrel_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::xor::u8::seqcst_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::xor::u8::acquire_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::xor::u8::relaxed_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::xor::u8::release_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::xor::u8::acqrel:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        eor               r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::xor::u8::seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        eor               r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::xor::u8::acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        eor               r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::xor::u8::relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        eor               r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::xor::u8::release:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        eor               r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::xor::u16::acqrel_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::xor::u16::seqcst_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::xor::u16::acquire_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::xor::u16::relaxed_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::xor::u16::release_zero:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::xor::u16::acqrel:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        eor               r24, r22
        eor               r25, r23
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::xor::u16::seqcst:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        eor               r24, r22
        eor               r25, r23
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::xor::u16::acquire:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        eor               r24, r22
        eor               r25, r23
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::xor::u16::relaxed:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        eor               r24, r22
        eor               r25, r23
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::xor::u16::release:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        eor               r24, r22
        eor               r25, r23
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r18	; 63
        ret

asm_test::xor::bool::acqrel_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        ldi               r18, 0x01	; 1
        eor               r18, r25
        st                X, r18
        out               0x3f, r24	; 63
        ret

asm_test::xor::bool::seqcst_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        ldi               r18, 0x01	; 1
        eor               r18, r25
        st                X, r18
        out               0x3f, r24	; 63
        ret

asm_test::xor::bool::acqrel_false:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::xor::bool::acquire_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        ldi               r18, 0x01	; 1
        eor               r18, r25
        st                X, r18
        out               0x3f, r24	; 63
        ret

asm_test::xor::bool::relaxed_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        ldi               r18, 0x01	; 1
        eor               r18, r25
        st                X, r18
        out               0x3f, r24	; 63
        ret

asm_test::xor::bool::release_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        ldi               r18, 0x01	; 1
        eor               r18, r25
        st                X, r18
        out               0x3f, r24	; 63
        ret

asm_test::xor::bool::seqcst_false:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::xor::bool::acquire_false:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::xor::bool::relaxed_false:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::xor::bool::release_false:
        in                r24, 0x3f	; 63
        cli
        out               0x3f, r24	; 63
        ret

asm_test::xor::bool::acqrel:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        eor               r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::xor::bool::seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        eor               r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::xor::bool::acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        eor               r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::xor::bool::relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        eor               r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::xor::bool::release:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        eor               r25, r22
        st                X, r25
        out               0x3f, r24	; 63
        ret

asm_test::load::u8::seqcst:
        movw              r30, r24
        ld                r24, Z
        ret

asm_test::load::u8::acquire:
        movw              r30, r24
        ld                r24, Z
        ret

asm_test::load::u8::relaxed:
        movw              r30, r24
        ld                r24, Z
        ret

asm_test::load::u16::seqcst:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        out               0x3f, r18	; 63
        ret

asm_test::load::u16::acquire:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        out               0x3f, r18	; 63
        ret

asm_test::load::u16::relaxed:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        out               0x3f, r18	; 63
        ret

asm_test::load::bool::seqcst:
        movw              r30, r24
        ld                r25, Z
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::load::bool::acquire:
        movw              r30, r24
        ld                r25, Z
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::load::bool::relaxed:
        movw              r30, r24
        ld                r25, Z
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::swap::u8::acqrel:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::swap::u8::seqcst:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::swap::u8::acquire:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::swap::u8::relaxed:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::swap::u8::release:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::swap::u16::acqrel:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::swap::u16::seqcst:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::swap::u16::acquire:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::swap::u16::relaxed:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::swap::u16::release:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::swap::bool::acqrel_true:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r18, X
        ldi               r24, 0x01	; 1
        st                X, r24
        out               0x3f, r25	; 63
        cpi               r18, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::swap::bool::seqcst_true:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r18, X
        ldi               r24, 0x01	; 1
        st                X, r24
        out               0x3f, r25	; 63
        cpi               r18, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::swap::bool::acqrel_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        st                X, r1
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::swap::bool::acquire_true:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r18, X
        ldi               r24, 0x01	; 1
        st                X, r24
        out               0x3f, r25	; 63
        cpi               r18, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::swap::bool::relaxed_true:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r18, X
        ldi               r24, 0x01	; 1
        st                X, r24
        out               0x3f, r25	; 63
        cpi               r18, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::swap::bool::release_true:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r18, X
        ldi               r24, 0x01	; 1
        st                X, r24
        out               0x3f, r25	; 63
        cpi               r18, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::swap::bool::seqcst_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        st                X, r1
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::swap::bool::acquire_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        st                X, r1
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::swap::bool::relaxed_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        st                X, r1
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::swap::bool::release_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        st                X, r1
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::swap::bool::acqrel:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        st                X, r22
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::swap::bool::seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        st                X, r22
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::swap::bool::acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        st                X, r22
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::swap::bool::relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        st                X, r22
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::swap::bool::release:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        st                X, r22
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::store::u8::seqcst:
        movw              r30, r24
        st                Z, r22
        ret

asm_test::store::u8::relaxed:
        movw              r30, r24
        st                Z, r22
        ret

asm_test::store::u8::release:
        movw              r30, r24
        st                Z, r22
        ret

asm_test::store::u16::seqcst:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::store::u16::relaxed:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::store::u16::release:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::store::bool::seqcst:
        movw              r30, r24
        st                Z, r22
        ret

asm_test::store::bool::relaxed:
        movw              r30, r24
        st                Z, r22
        ret

asm_test::store::bool::release:
        movw              r30, r24
        st                Z, r22
        ret

asm_test::bit_set::u8::acqrel:
        movw              r26, r24
        andi              r20, 0x07	; 7
        ldi               r24, 0x01	; 1
        ldi               r25, 0x01	; 1
        dec               r20
0:
        brmi              0f
        add               r25, r25
        dec               r20
1:
        brpl              1f
        in                r18, 0x3f	; 63
        cli
        ld                r19, X
        mov               r20, r19
        or                r20, r25
        st                X, r20
        out               0x3f, r18	; 63
        and               r19, r25
        cpi               r19, 0x00	; 0
2:
        brne              2f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::bit_set::u8::seqcst:
        movw              r26, r24
        andi              r20, 0x07	; 7
        ldi               r24, 0x01	; 1
        ldi               r25, 0x01	; 1
        dec               r20
0:
        brmi              0f
        add               r25, r25
        dec               r20
1:
        brpl              1f
        in                r18, 0x3f	; 63
        cli
        ld                r19, X
        mov               r20, r19
        or                r20, r25
        st                X, r20
        out               0x3f, r18	; 63
        and               r19, r25
        cpi               r19, 0x00	; 0
2:
        brne              2f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::bit_set::u8::acquire:
        movw              r26, r24
        andi              r20, 0x07	; 7
        ldi               r24, 0x01	; 1
        ldi               r25, 0x01	; 1
        dec               r20
0:
        brmi              0f
        add               r25, r25
        dec               r20
1:
        brpl              1f
        in                r18, 0x3f	; 63
        cli
        ld                r19, X
        mov               r20, r19
        or                r20, r25
        st                X, r20
        out               0x3f, r18	; 63
        and               r19, r25
        cpi               r19, 0x00	; 0
2:
        brne              2f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::bit_set::u8::relaxed:
        movw              r26, r24
        andi              r20, 0x07	; 7
        ldi               r24, 0x01	; 1
        ldi               r25, 0x01	; 1
        dec               r20
0:
        brmi              0f
        add               r25, r25
        dec               r20
1:
        brpl              1f
        in                r18, 0x3f	; 63
        cli
        ld                r19, X
        mov               r20, r19
        or                r20, r25
        st                X, r20
        out               0x3f, r18	; 63
        and               r19, r25
        cpi               r19, 0x00	; 0
2:
        brne              2f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::bit_set::u8::release:
        movw              r26, r24
        andi              r20, 0x07	; 7
        ldi               r24, 0x01	; 1
        ldi               r25, 0x01	; 1
        dec               r20
0:
        brmi              0f
        add               r25, r25
        dec               r20
1:
        brpl              1f
        in                r18, 0x3f	; 63
        cli
        ld                r19, X
        mov               r20, r19
        or                r20, r25
        st                X, r20
        out               0x3f, r18	; 63
        and               r19, r25
        cpi               r19, 0x00	; 0
2:
        brne              2f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::bit_set::u16::acqrel:
        andi              r20, 0x0F	; 15
        ldi               r18, 0x01	; 1
        ldi               r19, 0x00	; 0
        dec               r20
0:
        brmi              0f
        add               r18, r18
        adc               r19, r19
        dec               r20
1:
        brpl              1f
        in                r20, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r22, Z
        ldd               r23, Z+1	; 0x01
        movw              r24, r22
        or                r24, r18
        or                r25, r19
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r20	; 63
        and               r22, r18
        and               r23, r19
        ldi               r24, 0x01	; 1
        cp                r22, r1
        cpc               r23, r1
2:
        brne              2f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::bit_set::u16::seqcst:
        andi              r20, 0x0F	; 15
        ldi               r18, 0x01	; 1
        ldi               r19, 0x00	; 0
        dec               r20
0:
        brmi              0f
        add               r18, r18
        adc               r19, r19
        dec               r20
1:
        brpl              1f
        in                r20, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r22, Z
        ldd               r23, Z+1	; 0x01
        movw              r24, r22
        or                r24, r18
        or                r25, r19
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r20	; 63
        and               r22, r18
        and               r23, r19
        ldi               r24, 0x01	; 1
        cp                r22, r1
        cpc               r23, r1
2:
        brne              2f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::bit_set::u16::acquire:
        andi              r20, 0x0F	; 15
        ldi               r18, 0x01	; 1
        ldi               r19, 0x00	; 0
        dec               r20
0:
        brmi              0f
        add               r18, r18
        adc               r19, r19
        dec               r20
1:
        brpl              1f
        in                r20, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r22, Z
        ldd               r23, Z+1	; 0x01
        movw              r24, r22
        or                r24, r18
        or                r25, r19
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r20	; 63
        and               r22, r18
        and               r23, r19
        ldi               r24, 0x01	; 1
        cp                r22, r1
        cpc               r23, r1
2:
        brne              2f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::bit_set::u16::relaxed:
        andi              r20, 0x0F	; 15
        ldi               r18, 0x01	; 1
        ldi               r19, 0x00	; 0
        dec               r20
0:
        brmi              0f
        add               r18, r18
        adc               r19, r19
        dec               r20
1:
        brpl              1f
        in                r20, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r22, Z
        ldd               r23, Z+1	; 0x01
        movw              r24, r22
        or                r24, r18
        or                r25, r19
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r20	; 63
        and               r22, r18
        and               r23, r19
        ldi               r24, 0x01	; 1
        cp                r22, r1
        cpc               r23, r1
2:
        brne              2f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::bit_set::u16::release:
        andi              r20, 0x0F	; 15
        ldi               r18, 0x01	; 1
        ldi               r19, 0x00	; 0
        dec               r20
0:
        brmi              0f
        add               r18, r18
        adc               r19, r19
        dec               r20
1:
        brpl              1f
        in                r20, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r22, Z
        ldd               r23, Z+1	; 0x01
        movw              r24, r22
        or                r24, r18
        or                r25, r19
        std               Z+1, r25	; 0x01
        st                Z, r24
        out               0x3f, r20	; 63
        and               r22, r18
        and               r23, r19
        ldi               r24, 0x01	; 1
        cp                r22, r1
        cpc               r23, r1
2:
        brne              2f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_or::u8::acqrel_all:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        ldi               r18, 0xFF	; 255
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_or::u8::seqcst_all:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        ldi               r18, 0xFF	; 255
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_or::u8::acqrel_zero:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        out               0x3f, r25	; 63
        ret

asm_test::fetch_or::u8::acquire_all:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        ldi               r18, 0xFF	; 255
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_or::u8::relaxed_all:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        ldi               r18, 0xFF	; 255
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_or::u8::release_all:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        ldi               r18, 0xFF	; 255
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_or::u8::seqcst_zero:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        out               0x3f, r25	; 63
        ret

asm_test::fetch_or::u8::acquire_zero:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        out               0x3f, r25	; 63
        ret

asm_test::fetch_or::u8::relaxed_zero:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        out               0x3f, r25	; 63
        ret

asm_test::fetch_or::u8::release_zero:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        out               0x3f, r25	; 63
        ret

asm_test::fetch_or::u8::acqrel:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        or                r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_or::u8::seqcst:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        or                r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_or::u8::acquire:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        or                r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_or::u8::relaxed:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        or                r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_or::u8::release:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        or                r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_or::u16::acqrel_all:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        ldi               r20, 0xFF	; 255
        ldi               r21, 0xFF	; 255
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_or::u16::seqcst_all:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        ldi               r20, 0xFF	; 255
        ldi               r21, 0xFF	; 255
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_or::u16::acqrel_zero:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        out               0x3f, r18	; 63
        ret

asm_test::fetch_or::u16::acquire_all:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        ldi               r20, 0xFF	; 255
        ldi               r21, 0xFF	; 255
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_or::u16::relaxed_all:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        ldi               r20, 0xFF	; 255
        ldi               r21, 0xFF	; 255
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_or::u16::release_all:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        ldi               r20, 0xFF	; 255
        ldi               r21, 0xFF	; 255
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_or::u16::seqcst_zero:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        out               0x3f, r18	; 63
        ret

asm_test::fetch_or::u16::acquire_zero:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        out               0x3f, r18	; 63
        ret

asm_test::fetch_or::u16::relaxed_zero:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        out               0x3f, r18	; 63
        ret

asm_test::fetch_or::u16::release_zero:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        out               0x3f, r18	; 63
        ret

asm_test::fetch_or::u16::acqrel:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        or                r22, r24
        or                r23, r25
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::fetch_or::u16::seqcst:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        or                r22, r24
        or                r23, r25
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::fetch_or::u16::acquire:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        or                r22, r24
        or                r23, r25
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::fetch_or::u16::relaxed:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        or                r22, r24
        or                r23, r25
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::fetch_or::u16::release:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        or                r22, r24
        or                r23, r25
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::fetch_or::bool::acqrel_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        mov               r18, r25
        ori               r18, 0x01	; 1
        st                X, r18
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_or::bool::seqcst_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        mov               r18, r25
        ori               r18, 0x01	; 1
        st                X, r18
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_or::bool::acqrel_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_or::bool::acquire_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        mov               r18, r25
        ori               r18, 0x01	; 1
        st                X, r18
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_or::bool::relaxed_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        mov               r18, r25
        ori               r18, 0x01	; 1
        st                X, r18
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_or::bool::release_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        mov               r18, r25
        ori               r18, 0x01	; 1
        st                X, r18
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_or::bool::seqcst_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_or::bool::acquire_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_or::bool::relaxed_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_or::bool::release_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_or::bool::acqrel:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        or                r22, r25
        st                X, r22
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_or::bool::seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        or                r22, r25
        st                X, r22
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_or::bool::acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        or                r22, r25
        st                X, r22
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_or::bool::relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        or                r22, r25
        st                X, r22
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_or::bool::release:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        or                r22, r25
        st                X, r22
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::bit_clear::u8::acqrel:
        movw              r26, r24
        andi              r20, 0x07	; 7
        ldi               r25, 0xFE	; 254
        mov               r24, r20
        dec               r24
0:
        brmi              0f
        add               r25, r25
        adc               r25, r1
        dec               r24
1:
        brpl              1f
        in                r18, 0x3f	; 63
        cli
        ld                r24, X
        and               r25, r24
        st                X, r25
        out               0x3f, r18	; 63
        dec               r20
2:
        brmi              2f
        lsr               r24
        dec               r20
3:
        brpl              3f
        andi              r24, 0x01	; 1
        eor               r25, r25
        ret

asm_test::bit_clear::u8::seqcst:
        movw              r26, r24
        andi              r20, 0x07	; 7
        ldi               r25, 0xFE	; 254
        mov               r24, r20
        dec               r24
0:
        brmi              0f
        add               r25, r25
        adc               r25, r1
        dec               r24
1:
        brpl              1f
        in                r18, 0x3f	; 63
        cli
        ld                r24, X
        and               r25, r24
        st                X, r25
        out               0x3f, r18	; 63
        dec               r20
2:
        brmi              2f
        lsr               r24
        dec               r20
3:
        brpl              3f
        andi              r24, 0x01	; 1
        eor               r25, r25
        ret

asm_test::bit_clear::u8::acquire:
        movw              r26, r24
        andi              r20, 0x07	; 7
        ldi               r25, 0xFE	; 254
        mov               r24, r20
        dec               r24
0:
        brmi              0f
        add               r25, r25
        adc               r25, r1
        dec               r24
1:
        brpl              1f
        in                r18, 0x3f	; 63
        cli
        ld                r24, X
        and               r25, r24
        st                X, r25
        out               0x3f, r18	; 63
        dec               r20
2:
        brmi              2f
        lsr               r24
        dec               r20
3:
        brpl              3f
        andi              r24, 0x01	; 1
        eor               r25, r25
        ret

asm_test::bit_clear::u8::relaxed:
        movw              r26, r24
        andi              r20, 0x07	; 7
        ldi               r25, 0xFE	; 254
        mov               r24, r20
        dec               r24
0:
        brmi              0f
        add               r25, r25
        adc               r25, r1
        dec               r24
1:
        brpl              1f
        in                r18, 0x3f	; 63
        cli
        ld                r24, X
        and               r25, r24
        st                X, r25
        out               0x3f, r18	; 63
        dec               r20
2:
        brmi              2f
        lsr               r24
        dec               r20
3:
        brpl              3f
        andi              r24, 0x01	; 1
        eor               r25, r25
        ret

asm_test::bit_clear::u8::release:
        movw              r26, r24
        andi              r20, 0x07	; 7
        ldi               r25, 0xFE	; 254
        mov               r24, r20
        dec               r24
0:
        brmi              0f
        add               r25, r25
        adc               r25, r1
        dec               r24
1:
        brpl              1f
        in                r18, 0x3f	; 63
        cli
        ld                r24, X
        and               r25, r24
        st                X, r25
        out               0x3f, r18	; 63
        dec               r20
2:
        brmi              2f
        lsr               r24
        dec               r20
3:
        brpl              3f
        andi              r24, 0x01	; 1
        eor               r25, r25
        ret

asm_test::bit_clear::u16::acqrel:
        andi              r20, 0x0F	; 15
        ldi               r18, 0x01	; 1
        ldi               r19, 0x00	; 0
        dec               r20
0:
        brmi              0f
        add               r18, r18
        adc               r19, r19
        dec               r20
1:
        brpl              1f
        movw              r20, r18
        com               r20
        com               r21
        in                r22, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r26, Z
        ldd               r27, Z+1	; 0x01
        and               r20, r26
        and               r21, r27
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r22	; 63
        and               r26, r18
        and               r27, r19
        ldi               r24, 0x01	; 1
        cp                r26, r1
        cpc               r27, r1
2:
        brne              2f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::bit_clear::u16::seqcst:
        andi              r20, 0x0F	; 15
        ldi               r18, 0x01	; 1
        ldi               r19, 0x00	; 0
        dec               r20
0:
        brmi              0f
        add               r18, r18
        adc               r19, r19
        dec               r20
1:
        brpl              1f
        movw              r20, r18
        com               r20
        com               r21
        in                r22, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r26, Z
        ldd               r27, Z+1	; 0x01
        and               r20, r26
        and               r21, r27
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r22	; 63
        and               r26, r18
        and               r27, r19
        ldi               r24, 0x01	; 1
        cp                r26, r1
        cpc               r27, r1
2:
        brne              2f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::bit_clear::u16::acquire:
        andi              r20, 0x0F	; 15
        ldi               r18, 0x01	; 1
        ldi               r19, 0x00	; 0
        dec               r20
0:
        brmi              0f
        add               r18, r18
        adc               r19, r19
        dec               r20
1:
        brpl              1f
        movw              r20, r18
        com               r20
        com               r21
        in                r22, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r26, Z
        ldd               r27, Z+1	; 0x01
        and               r20, r26
        and               r21, r27
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r22	; 63
        and               r26, r18
        and               r27, r19
        ldi               r24, 0x01	; 1
        cp                r26, r1
        cpc               r27, r1
2:
        brne              2f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::bit_clear::u16::relaxed:
        andi              r20, 0x0F	; 15
        ldi               r18, 0x01	; 1
        ldi               r19, 0x00	; 0
        dec               r20
0:
        brmi              0f
        add               r18, r18
        adc               r19, r19
        dec               r20
1:
        brpl              1f
        movw              r20, r18
        com               r20
        com               r21
        in                r22, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r26, Z
        ldd               r27, Z+1	; 0x01
        and               r20, r26
        and               r21, r27
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r22	; 63
        and               r26, r18
        and               r27, r19
        ldi               r24, 0x01	; 1
        cp                r26, r1
        cpc               r27, r1
2:
        brne              2f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::bit_clear::u16::release:
        andi              r20, 0x0F	; 15
        ldi               r18, 0x01	; 1
        ldi               r19, 0x00	; 0
        dec               r20
0:
        brmi              0f
        add               r18, r18
        adc               r19, r19
        dec               r20
1:
        brpl              1f
        movw              r20, r18
        com               r20
        com               r21
        in                r22, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r26, Z
        ldd               r27, Z+1	; 0x01
        and               r20, r26
        and               r21, r27
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r22	; 63
        and               r26, r18
        and               r27, r19
        ldi               r24, 0x01	; 1
        cp                r26, r1
        cpc               r27, r1
2:
        brne              2f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_add::u8::acqrel_zero:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        out               0x3f, r25	; 63
        ret

asm_test::fetch_add::u8::seqcst_zero:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        out               0x3f, r25	; 63
        ret

asm_test::fetch_add::u8::acquire_zero:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        out               0x3f, r25	; 63
        ret

asm_test::fetch_add::u8::relaxed_zero:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        out               0x3f, r25	; 63
        ret

asm_test::fetch_add::u8::release_zero:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        out               0x3f, r25	; 63
        ret

asm_test::fetch_add::u8::acqrel:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        add               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_add::u8::seqcst:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        add               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_add::u8::acquire:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        add               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_add::u8::relaxed:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        add               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_add::u8::release:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        add               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_add::u16::acqrel_zero:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        out               0x3f, r18	; 63
        ret

asm_test::fetch_add::u16::seqcst_zero:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        out               0x3f, r18	; 63
        ret

asm_test::fetch_add::u16::acquire_zero:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        out               0x3f, r18	; 63
        ret

asm_test::fetch_add::u16::relaxed_zero:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        out               0x3f, r18	; 63
        ret

asm_test::fetch_add::u16::release_zero:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        out               0x3f, r18	; 63
        ret

asm_test::fetch_add::u16::acqrel:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        add               r22, r24
        adc               r23, r25
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::fetch_add::u16::seqcst:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        add               r22, r24
        adc               r23, r25
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::fetch_add::u16::acquire:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        add               r22, r24
        adc               r23, r25
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::fetch_add::u16::relaxed:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        add               r22, r24
        adc               r23, r25
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::fetch_add::u16::release:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        add               r22, r24
        adc               r23, r25
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::fetch_and::u8::acqrel_all:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        out               0x3f, r25	; 63
        ret

asm_test::fetch_and::u8::seqcst_all:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        out               0x3f, r25	; 63
        ret

asm_test::fetch_and::u8::acqrel_zero:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        st                X, r1
        out               0x3f, r25	; 63
        ret

asm_test::fetch_and::u8::acquire_all:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        out               0x3f, r25	; 63
        ret

asm_test::fetch_and::u8::relaxed_all:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        out               0x3f, r25	; 63
        ret

asm_test::fetch_and::u8::release_all:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        out               0x3f, r25	; 63
        ret

asm_test::fetch_and::u8::seqcst_zero:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        st                X, r1
        out               0x3f, r25	; 63
        ret

asm_test::fetch_and::u8::acquire_zero:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        st                X, r1
        out               0x3f, r25	; 63
        ret

asm_test::fetch_and::u8::relaxed_zero:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        st                X, r1
        out               0x3f, r25	; 63
        ret

asm_test::fetch_and::u8::release_zero:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        st                X, r1
        out               0x3f, r25	; 63
        ret

asm_test::fetch_and::u8::acqrel:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        and               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_and::u8::seqcst:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        and               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_and::u8::acquire:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        and               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_and::u8::relaxed:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        and               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_and::u8::release:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        and               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_and::u16::acqrel_all:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        out               0x3f, r18	; 63
        ret

asm_test::fetch_and::u16::seqcst_all:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        out               0x3f, r18	; 63
        ret

asm_test::fetch_and::u16::acqrel_zero:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        ldi               r20, 0x00	; 0
        ldi               r21, 0x00	; 0
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_and::u16::acquire_all:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        out               0x3f, r18	; 63
        ret

asm_test::fetch_and::u16::relaxed_all:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        out               0x3f, r18	; 63
        ret

asm_test::fetch_and::u16::release_all:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        out               0x3f, r18	; 63
        ret

asm_test::fetch_and::u16::seqcst_zero:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        ldi               r20, 0x00	; 0
        ldi               r21, 0x00	; 0
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_and::u16::acquire_zero:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        ldi               r20, 0x00	; 0
        ldi               r21, 0x00	; 0
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_and::u16::relaxed_zero:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        ldi               r20, 0x00	; 0
        ldi               r21, 0x00	; 0
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_and::u16::release_zero:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        ldi               r20, 0x00	; 0
        ldi               r21, 0x00	; 0
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_and::u16::acqrel:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        and               r22, r24
        and               r23, r25
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::fetch_and::u16::seqcst:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        and               r22, r24
        and               r23, r25
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::fetch_and::u16::acquire:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        and               r22, r24
        and               r23, r25
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::fetch_and::u16::relaxed:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        and               r22, r24
        and               r23, r25
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::fetch_and::u16::release:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        and               r22, r24
        and               r23, r25
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::fetch_and::bool::acqrel_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        mov               r18, r25
        andi              r18, 0x01	; 1
        st                X, r18
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_and::bool::seqcst_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        mov               r18, r25
        andi              r18, 0x01	; 1
        st                X, r18
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_and::bool::acqrel_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        st                X, r1
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_and::bool::acquire_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        mov               r18, r25
        andi              r18, 0x01	; 1
        st                X, r18
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_and::bool::relaxed_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        mov               r18, r25
        andi              r18, 0x01	; 1
        st                X, r18
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_and::bool::release_true:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        mov               r18, r25
        andi              r18, 0x01	; 1
        st                X, r18
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_and::bool::seqcst_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        st                X, r1
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_and::bool::acquire_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        st                X, r1
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_and::bool::relaxed_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        st                X, r1
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_and::bool::release_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        st                X, r1
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_and::bool::acqrel:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        and               r22, r25
        st                X, r22
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_and::bool::seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        and               r22, r25
        st                X, r22
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_and::bool::acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        and               r22, r25
        st                X, r22
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_and::bool::relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        and               r22, r25
        st                X, r22
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_and::bool::release:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        and               r22, r25
        st                X, r22
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_max::i8::acqrel:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r22, r24
        mov               r18, r24
0:
        brlt              0f
        mov               r18, r22
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_max::i8::seqcst:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r22, r24
        mov               r18, r24
0:
        brlt              0f
        mov               r18, r22
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_max::i8::acquire:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r22, r24
        mov               r18, r24
0:
        brlt              0f
        mov               r18, r22
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_max::i8::relaxed:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r22, r24
        mov               r18, r24
0:
        brlt              0f
        mov               r18, r22
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_max::i8::release:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r22, r24
        mov               r18, r24
0:
        brlt              0f
        mov               r18, r22
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_max::i16::acqrel:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r22, r24
        cpc               r23, r25
        movw              r26, r24
0:
        brlt              0f
        movw              r26, r22
        movw              r30, r18
        std               Z+1, r27	; 0x01
        st                Z, r26
        out               0x3f, r20	; 63
        ret

asm_test::fetch_max::i16::seqcst:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r22, r24
        cpc               r23, r25
        movw              r26, r24
0:
        brlt              0f
        movw              r26, r22
        movw              r30, r18
        std               Z+1, r27	; 0x01
        st                Z, r26
        out               0x3f, r20	; 63
        ret

asm_test::fetch_max::i16::acquire:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r22, r24
        cpc               r23, r25
        movw              r26, r24
0:
        brlt              0f
        movw              r26, r22
        movw              r30, r18
        std               Z+1, r27	; 0x01
        st                Z, r26
        out               0x3f, r20	; 63
        ret

asm_test::fetch_max::i16::relaxed:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r22, r24
        cpc               r23, r25
        movw              r26, r24
0:
        brlt              0f
        movw              r26, r22
        movw              r30, r18
        std               Z+1, r27	; 0x01
        st                Z, r26
        out               0x3f, r20	; 63
        ret

asm_test::fetch_max::i16::release:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r22, r24
        cpc               r23, r25
        movw              r26, r24
0:
        brlt              0f
        movw              r26, r22
        movw              r30, r18
        std               Z+1, r27	; 0x01
        st                Z, r26
        out               0x3f, r20	; 63
        ret

asm_test::fetch_min::i8::acqrel:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r24, r22
        mov               r18, r24
0:
        brlt              0f
        mov               r18, r22
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_min::i8::seqcst:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r24, r22
        mov               r18, r24
0:
        brlt              0f
        mov               r18, r22
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_min::i8::acquire:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r24, r22
        mov               r18, r24
0:
        brlt              0f
        mov               r18, r22
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_min::i8::relaxed:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r24, r22
        mov               r18, r24
0:
        brlt              0f
        mov               r18, r22
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_min::i8::release:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r24, r22
        mov               r18, r24
0:
        brlt              0f
        mov               r18, r22
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_min::i16::acqrel:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r24, r22
        cpc               r25, r23
        movw              r26, r24
0:
        brlt              0f
        movw              r26, r22
        movw              r30, r18
        std               Z+1, r27	; 0x01
        st                Z, r26
        out               0x3f, r20	; 63
        ret

asm_test::fetch_min::i16::seqcst:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r24, r22
        cpc               r25, r23
        movw              r26, r24
0:
        brlt              0f
        movw              r26, r22
        movw              r30, r18
        std               Z+1, r27	; 0x01
        st                Z, r26
        out               0x3f, r20	; 63
        ret

asm_test::fetch_min::i16::acquire:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r24, r22
        cpc               r25, r23
        movw              r26, r24
0:
        brlt              0f
        movw              r26, r22
        movw              r30, r18
        std               Z+1, r27	; 0x01
        st                Z, r26
        out               0x3f, r20	; 63
        ret

asm_test::fetch_min::i16::relaxed:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r24, r22
        cpc               r25, r23
        movw              r26, r24
0:
        brlt              0f
        movw              r26, r22
        movw              r30, r18
        std               Z+1, r27	; 0x01
        st                Z, r26
        out               0x3f, r20	; 63
        ret

asm_test::fetch_min::i16::release:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r24, r22
        cpc               r25, r23
        movw              r26, r24
0:
        brlt              0f
        movw              r26, r22
        movw              r30, r18
        std               Z+1, r27	; 0x01
        st                Z, r26
        out               0x3f, r20	; 63
        ret

asm_test::fetch_neg::u8::acqrel:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        mov               r18, r24
        neg               r18
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_neg::u8::seqcst:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        mov               r18, r24
        neg               r18
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_neg::u8::acquire:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        mov               r18, r24
        neg               r18
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_neg::u8::relaxed:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        mov               r18, r24
        neg               r18
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_neg::u8::release:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        mov               r18, r24
        neg               r18
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_neg::u16::acqrel:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        movw              r20, r24
        neg               r21
        neg               r20
        sbc               r21, r1
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_neg::u16::seqcst:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        movw              r20, r24
        neg               r21
        neg               r20
        sbc               r21, r1
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_neg::u16::acquire:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        movw              r20, r24
        neg               r21
        neg               r20
        sbc               r21, r1
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_neg::u16::relaxed:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        movw              r20, r24
        neg               r21
        neg               r20
        sbc               r21, r1
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_neg::u16::release:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        movw              r20, r24
        neg               r21
        neg               r20
        sbc               r21, r1
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_not::u8::acqrel:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        mov               r18, r24
        com               r18
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_not::u8::seqcst:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        mov               r18, r24
        com               r18
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_not::u8::acquire:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        mov               r18, r24
        com               r18
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_not::u8::relaxed:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        mov               r18, r24
        com               r18
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_not::u8::release:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        mov               r18, r24
        com               r18
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_not::u16::acqrel:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        movw              r20, r24
        com               r20
        com               r21
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_not::u16::seqcst:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        movw              r20, r24
        com               r20
        com               r21
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_not::u16::acquire:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        movw              r20, r24
        com               r20
        com               r21
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_not::u16::relaxed:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        movw              r20, r24
        com               r20
        com               r21
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_not::u16::release:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        movw              r20, r24
        com               r20
        com               r21
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_not::bool::acqrel:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r18, X
        ldi               r24, 0x01	; 1
        mov               r19, r18
        eor               r19, r24
        st                X, r19
        out               0x3f, r25	; 63
        cpi               r18, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_not::bool::seqcst:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r18, X
        ldi               r24, 0x01	; 1
        mov               r19, r18
        eor               r19, r24
        st                X, r19
        out               0x3f, r25	; 63
        cpi               r18, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_not::bool::acquire:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r18, X
        ldi               r24, 0x01	; 1
        mov               r19, r18
        eor               r19, r24
        st                X, r19
        out               0x3f, r25	; 63
        cpi               r18, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_not::bool::relaxed:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r18, X
        ldi               r24, 0x01	; 1
        mov               r19, r18
        eor               r19, r24
        st                X, r19
        out               0x3f, r25	; 63
        cpi               r18, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_not::bool::release:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r18, X
        ldi               r24, 0x01	; 1
        mov               r19, r18
        eor               r19, r24
        st                X, r19
        out               0x3f, r25	; 63
        cpi               r18, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_sub::u8::acqrel_zero:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        out               0x3f, r25	; 63
        ret

asm_test::fetch_sub::u8::seqcst_zero:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        out               0x3f, r25	; 63
        ret

asm_test::fetch_sub::u8::acquire_zero:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        out               0x3f, r25	; 63
        ret

asm_test::fetch_sub::u8::relaxed_zero:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        out               0x3f, r25	; 63
        ret

asm_test::fetch_sub::u8::release_zero:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        out               0x3f, r25	; 63
        ret

asm_test::fetch_sub::u8::acqrel:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        mov               r18, r24
        sub               r18, r22
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_sub::u8::seqcst:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        mov               r18, r24
        sub               r18, r22
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_sub::u8::acquire:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        mov               r18, r24
        sub               r18, r22
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_sub::u8::relaxed:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        mov               r18, r24
        sub               r18, r22
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_sub::u8::release:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        mov               r18, r24
        sub               r18, r22
        st                X, r18
        out               0x3f, r25	; 63
        ret

asm_test::fetch_sub::u16::acqrel_zero:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        out               0x3f, r18	; 63
        ret

asm_test::fetch_sub::u16::seqcst_zero:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        out               0x3f, r18	; 63
        ret

asm_test::fetch_sub::u16::acquire_zero:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        out               0x3f, r18	; 63
        ret

asm_test::fetch_sub::u16::relaxed_zero:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        out               0x3f, r18	; 63
        ret

asm_test::fetch_sub::u16::release_zero:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        out               0x3f, r18	; 63
        ret

asm_test::fetch_sub::u16::acqrel:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        movw              r20, r24
        sub               r20, r22
        sbc               r21, r23
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_sub::u16::seqcst:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        movw              r20, r24
        sub               r20, r22
        sbc               r21, r23
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_sub::u16::acquire:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        movw              r20, r24
        sub               r20, r22
        sbc               r21, r23
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_sub::u16::relaxed:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        movw              r20, r24
        sub               r20, r22
        sbc               r21, r23
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_sub::u16::release:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        movw              r20, r24
        sub               r20, r22
        sbc               r21, r23
        std               Z+1, r21	; 0x01
        st                Z, r20
        out               0x3f, r18	; 63
        ret

asm_test::fetch_xor::u8::acqrel_zero:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        out               0x3f, r25	; 63
        ret

asm_test::fetch_xor::u8::seqcst_zero:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        out               0x3f, r25	; 63
        ret

asm_test::fetch_xor::u8::acquire_zero:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        out               0x3f, r25	; 63
        ret

asm_test::fetch_xor::u8::relaxed_zero:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        out               0x3f, r25	; 63
        ret

asm_test::fetch_xor::u8::release_zero:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        out               0x3f, r25	; 63
        ret

asm_test::fetch_xor::u8::acqrel:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        eor               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_xor::u8::seqcst:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        eor               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_xor::u8::acquire:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        eor               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_xor::u8::relaxed:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        eor               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_xor::u8::release:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        eor               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_xor::u16::acqrel_zero:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        out               0x3f, r18	; 63
        ret

asm_test::fetch_xor::u16::seqcst_zero:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        out               0x3f, r18	; 63
        ret

asm_test::fetch_xor::u16::acquire_zero:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        out               0x3f, r18	; 63
        ret

asm_test::fetch_xor::u16::relaxed_zero:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        out               0x3f, r18	; 63
        ret

asm_test::fetch_xor::u16::release_zero:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        out               0x3f, r18	; 63
        ret

asm_test::fetch_xor::u16::acqrel:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        eor               r22, r24
        eor               r23, r25
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::fetch_xor::u16::seqcst:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        eor               r22, r24
        eor               r23, r25
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::fetch_xor::u16::acquire:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        eor               r22, r24
        eor               r23, r25
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::fetch_xor::u16::relaxed:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        eor               r22, r24
        eor               r23, r25
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::fetch_xor::u16::release:
        in                r18, 0x3f	; 63
        cli
        movw              r30, r24
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        eor               r22, r24
        eor               r23, r25
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r18	; 63
        ret

asm_test::fetch_xor::bool::acqrel_true:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r18, X
        ldi               r24, 0x01	; 1
        mov               r19, r18
        eor               r19, r24
        st                X, r19
        out               0x3f, r25	; 63
        cpi               r18, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_xor::bool::seqcst_true:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r18, X
        ldi               r24, 0x01	; 1
        mov               r19, r18
        eor               r19, r24
        st                X, r19
        out               0x3f, r25	; 63
        cpi               r18, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_xor::bool::acqrel_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_xor::bool::acquire_true:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r18, X
        ldi               r24, 0x01	; 1
        mov               r19, r18
        eor               r19, r24
        st                X, r19
        out               0x3f, r25	; 63
        cpi               r18, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_xor::bool::relaxed_true:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r18, X
        ldi               r24, 0x01	; 1
        mov               r19, r18
        eor               r19, r24
        st                X, r19
        out               0x3f, r25	; 63
        cpi               r18, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_xor::bool::release_true:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r18, X
        ldi               r24, 0x01	; 1
        mov               r19, r18
        eor               r19, r24
        st                X, r19
        out               0x3f, r25	; 63
        cpi               r18, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_xor::bool::seqcst_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_xor::bool::acquire_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_xor::bool::relaxed_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_xor::bool::release_false:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_xor::bool::acqrel:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        eor               r22, r25
        st                X, r22
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_xor::bool::seqcst:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        eor               r22, r25
        st                X, r22
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_xor::bool::acquire:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        eor               r22, r25
        st                X, r22
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_xor::bool::relaxed:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        eor               r22, r25
        st                X, r22
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

asm_test::fetch_xor::bool::release:
        movw              r26, r24
        in                r24, 0x3f	; 63
        cli
        ld                r25, X
        eor               r22, r25
        st                X, r22
        out               0x3f, r24	; 63
        ldi               r24, 0x01	; 1
        cpi               r25, 0x00	; 0
0:
        brne              0f
        mov               r24, r1
        eor               r25, r25
        ret

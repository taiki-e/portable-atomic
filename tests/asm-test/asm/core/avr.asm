asm_test::load::u8::seqcst:
        movw              r26, r24
        in                r0, 0x3f	; 63
        cli
        ld                r24, X
        out               0x3f, r0	; 63
        ret

asm_test::load::u8::acquire:
        movw              r26, r24
        in                r0, 0x3f	; 63
        cli
        ld                r24, X
        out               0x3f, r0	; 63
        ret

asm_test::load::u8::relaxed:
        movw              r26, r24
        in                r0, 0x3f	; 63
        cli
        ld                r24, X
        out               0x3f, r0	; 63
        ret

asm_test::load::u16::seqcst:
        movw              r30, r24
        in                r0, 0x3f	; 63
        cli
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        out               0x3f, r0	; 63
        ret

asm_test::load::u16::acquire:
        movw              r30, r24
        in                r0, 0x3f	; 63
        cli
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        out               0x3f, r0	; 63
        ret

asm_test::load::u16::relaxed:
        movw              r30, r24
        in                r0, 0x3f	; 63
        cli
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        out               0x3f, r0	; 63
        ret

asm_test::store::u8::seqcst:
        movw              r26, r24
        in                r0, 0x3f	; 63
        cli
        st                X, r22
        out               0x3f, r0	; 63
        ret

asm_test::store::u8::relaxed:
        movw              r26, r24
        in                r0, 0x3f	; 63
        cli
        st                X, r22
        out               0x3f, r0	; 63
        ret

asm_test::store::u8::release:
        movw              r26, r24
        in                r0, 0x3f	; 63
        cli
        st                X, r22
        out               0x3f, r0	; 63
        ret

asm_test::store::u16::seqcst:
        movw              r30, r24
        in                r0, 0x3f	; 63
        cli
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r0	; 63
        ret

asm_test::store::u16::relaxed:
        movw              r30, r24
        in                r0, 0x3f	; 63
        cli
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r0	; 63
        ret

asm_test::store::u16::release:
        movw              r30, r24
        in                r0, 0x3f	; 63
        cli
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r0	; 63
        ret


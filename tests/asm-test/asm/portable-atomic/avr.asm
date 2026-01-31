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
        cp                r24, r22
0:
        brcs              0f
        mov               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_umax::u8::seqcst:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r24, r22
0:
        brcs              0f
        mov               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_umax::u8::acquire:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r24, r22
0:
        brcs              0f
        mov               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_umax::u8::relaxed:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r24, r22
0:
        brcs              0f
        mov               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_umax::u8::release:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r24, r22
0:
        brcs              0f
        mov               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_umax::u16::acqrel:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r24, r22
        cpc               r25, r23
0:
        brcs              0f
        movw              r22, r24
        movw              r30, r18
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r20	; 63
        ret

asm_test::fetch_umax::u16::seqcst:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r24, r22
        cpc               r25, r23
0:
        brcs              0f
        movw              r22, r24
        movw              r30, r18
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r20	; 63
        ret

asm_test::fetch_umax::u16::acquire:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r24, r22
        cpc               r25, r23
0:
        brcs              0f
        movw              r22, r24
        movw              r30, r18
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r20	; 63
        ret

asm_test::fetch_umax::u16::relaxed:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r24, r22
        cpc               r25, r23
0:
        brcs              0f
        movw              r22, r24
        movw              r30, r18
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r20	; 63
        ret

asm_test::fetch_umax::u16::release:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r24, r22
        cpc               r25, r23
0:
        brcs              0f
        movw              r22, r24
        movw              r30, r18
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r20	; 63
        ret

asm_test::fetch_umin::u8::acqrel:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r22, r24
0:
        brcs              0f
        mov               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_umin::u8::seqcst:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r22, r24
0:
        brcs              0f
        mov               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_umin::u8::acquire:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r22, r24
0:
        brcs              0f
        mov               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_umin::u8::relaxed:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r22, r24
0:
        brcs              0f
        mov               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_umin::u8::release:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r22, r24
0:
        brcs              0f
        mov               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_umin::u16::acqrel:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r22, r24
        cpc               r23, r25
0:
        brcs              0f
        movw              r22, r24
        movw              r30, r18
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r20	; 63
        ret

asm_test::fetch_umin::u16::seqcst:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r22, r24
        cpc               r23, r25
0:
        brcs              0f
        movw              r22, r24
        movw              r30, r18
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r20	; 63
        ret

asm_test::fetch_umin::u16::acquire:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r22, r24
        cpc               r23, r25
0:
        brcs              0f
        movw              r22, r24
        movw              r30, r18
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r20	; 63
        ret

asm_test::fetch_umin::u16::relaxed:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r22, r24
        cpc               r23, r25
0:
        brcs              0f
        movw              r22, r24
        movw              r30, r18
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r20	; 63
        ret

asm_test::fetch_umin::u16::release:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r22, r24
        cpc               r23, r25
0:
        brcs              0f
        movw              r22, r24
        movw              r30, r18
        std               Z+1, r23	; 0x01
        st                Z, r22
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
        cp                r24, r22
0:
        brlt              0f
        mov               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_max::i8::seqcst:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r24, r22
0:
        brlt              0f
        mov               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_max::i8::acquire:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r24, r22
0:
        brlt              0f
        mov               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_max::i8::relaxed:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r24, r22
0:
        brlt              0f
        mov               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_max::i8::release:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r24, r22
0:
        brlt              0f
        mov               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_max::i16::acqrel:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r24, r22
        cpc               r25, r23
0:
        brlt              0f
        movw              r22, r24
        movw              r30, r18
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r20	; 63
        ret

asm_test::fetch_max::i16::seqcst:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r24, r22
        cpc               r25, r23
0:
        brlt              0f
        movw              r22, r24
        movw              r30, r18
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r20	; 63
        ret

asm_test::fetch_max::i16::acquire:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r24, r22
        cpc               r25, r23
0:
        brlt              0f
        movw              r22, r24
        movw              r30, r18
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r20	; 63
        ret

asm_test::fetch_max::i16::relaxed:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r24, r22
        cpc               r25, r23
0:
        brlt              0f
        movw              r22, r24
        movw              r30, r18
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r20	; 63
        ret

asm_test::fetch_max::i16::release:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r24, r22
        cpc               r25, r23
0:
        brlt              0f
        movw              r22, r24
        movw              r30, r18
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r20	; 63
        ret

asm_test::fetch_min::i8::acqrel:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r22, r24
0:
        brlt              0f
        mov               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_min::i8::seqcst:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r22, r24
0:
        brlt              0f
        mov               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_min::i8::acquire:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r22, r24
0:
        brlt              0f
        mov               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_min::i8::relaxed:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r22, r24
0:
        brlt              0f
        mov               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_min::i8::release:
        movw              r26, r24
        in                r25, 0x3f	; 63
        cli
        ld                r24, X
        cp                r22, r24
0:
        brlt              0f
        mov               r22, r24
        st                X, r22
        out               0x3f, r25	; 63
        ret

asm_test::fetch_min::i16::acqrel:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r22, r24
        cpc               r23, r25
0:
        brlt              0f
        movw              r22, r24
        movw              r30, r18
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r20	; 63
        ret

asm_test::fetch_min::i16::seqcst:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r22, r24
        cpc               r23, r25
0:
        brlt              0f
        movw              r22, r24
        movw              r30, r18
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r20	; 63
        ret

asm_test::fetch_min::i16::acquire:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r22, r24
        cpc               r23, r25
0:
        brlt              0f
        movw              r22, r24
        movw              r30, r18
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r20	; 63
        ret

asm_test::fetch_min::i16::relaxed:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r22, r24
        cpc               r23, r25
0:
        brlt              0f
        movw              r22, r24
        movw              r30, r18
        std               Z+1, r23	; 0x01
        st                Z, r22
        out               0x3f, r20	; 63
        ret

asm_test::fetch_min::i16::release:
        movw              r18, r24
        in                r20, 0x3f	; 63
        cli
        movw              r30, r18
        ld                r24, Z
        ldd               r25, Z+1	; 0x01
        cp                r22, r24
        cpc               r23, r25
0:
        brlt              0f
        movw              r22, r24
        movw              r30, r18
        std               Z+1, r23	; 0x01
        st                Z, r22
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


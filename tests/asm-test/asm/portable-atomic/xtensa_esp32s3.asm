asm_test::fence::acqrel:
        entry             a1, 32
        memw
        retw.n

asm_test::fence::seqcst:
        entry             a1, 32
        memw
        retw.n

asm_test::fence::acquire:
        entry             a1, 32
        memw
        retw.n

asm_test::fence::release:
        entry             a1, 32
        memw
        retw.n

asm_test::fetch_nand::u8::acqrel:
        entry             a1, 32
        movi              a10, 255
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a12, a10, a11
        movi.n            a13, -4
        and               a13, a2, a13
        memw
        l32i.n            a7, a13, 0
        movi.n            a14, 0
        movi.n            a15, 1
        j                 1f
0:
        mov.n             a7, a6
        beqi              a5, 1, 2f
1:
        and               a6, a7, a12
        and               a5, a7, a9
        xor               a5, a5, a11
        and               a5, a5, a10
        or                a6, a6, a5
        wsr.scompare1     a7
        s32c1i            a6, a13, 0
        mov.n             a5, a15
        beq               a6, a7, 0b
        mov.n             a5, a14
        j                 0b
2:
        ssr               a8
        srl               a2, a6
        memw
        retw.n

asm_test::fetch_nand::u8::seqcst:
        entry             a1, 32
        movi              a10, 255
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a12, a10, a11
        movi.n            a13, -4
        and               a13, a2, a13
        memw
        l32i.n            a7, a13, 0
        movi.n            a14, 0
        movi.n            a15, 1
        j                 1f
0:
        mov.n             a7, a6
        beqi              a5, 1, 2f
1:
        and               a6, a7, a12
        and               a5, a7, a9
        xor               a5, a5, a11
        and               a5, a5, a10
        or                a6, a6, a5
        wsr.scompare1     a7
        s32c1i            a6, a13, 0
        mov.n             a5, a15
        beq               a6, a7, 0b
        mov.n             a5, a14
        j                 0b
2:
        ssr               a8
        srl               a2, a6
        memw
        retw.n

asm_test::fetch_nand::u8::acquire:
        entry             a1, 32
        movi              a10, 255
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a12, a10, a11
        movi.n            a13, -4
        and               a13, a2, a13
        l32i.n            a7, a13, 0
        movi.n            a14, 0
        movi.n            a15, 1
        j                 1f
0:
        mov.n             a7, a6
        beqi              a5, 1, 2f
1:
        and               a6, a7, a12
        and               a5, a7, a9
        xor               a5, a5, a11
        and               a5, a5, a10
        or                a6, a6, a5
        wsr.scompare1     a7
        s32c1i            a6, a13, 0
        mov.n             a5, a15
        beq               a6, a7, 0b
        mov.n             a5, a14
        j                 0b
2:
        ssr               a8
        srl               a2, a6
        memw
        retw.n

asm_test::fetch_nand::u8::relaxed:
        entry             a1, 32
        movi              a10, 255
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a12, a10, a11
        movi.n            a13, -4
        and               a13, a2, a13
        l32i.n            a7, a13, 0
        movi.n            a14, 0
        movi.n            a15, 1
        j                 1f
0:
        mov.n             a7, a6
        beqi              a5, 1, 2f
1:
        and               a6, a7, a12
        and               a5, a7, a9
        xor               a5, a5, a11
        and               a5, a5, a10
        or                a6, a6, a5
        wsr.scompare1     a7
        s32c1i            a6, a13, 0
        mov.n             a5, a15
        beq               a6, a7, 0b
        mov.n             a5, a14
        j                 0b
2:
        ssr               a8
        srl               a2, a6
        retw.n

asm_test::fetch_nand::u8::release:
        entry             a1, 32
        movi              a10, 255
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a12, a10, a11
        movi.n            a13, -4
        and               a13, a2, a13
        memw
        l32i.n            a7, a13, 0
        movi.n            a14, 0
        movi.n            a15, 1
        j                 1f
0:
        mov.n             a7, a6
        beqi              a5, 1, 2f
1:
        and               a6, a7, a12
        and               a5, a7, a9
        xor               a5, a5, a11
        and               a5, a5, a10
        or                a6, a6, a5
        wsr.scompare1     a7
        s32c1i            a6, a13, 0
        mov.n             a5, a15
        beq               a6, a7, 0b
        mov.n             a5, a14
        j                 0b
2:
        ssr               a8
        srl               a2, a6
        retw.n

.literal.asm_test::fetch_nand::u16::acqrel:
        .byte             0xff
        .byte             0xff

asm_test::fetch_nand::u16::acqrel:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::fetch_nand::u16::acqrel+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a12, a10, a11
        movi.n            a13, -4
        and               a13, a2, a13
        memw
        l32i.n            a7, a13, 0
        movi.n            a14, 0
        movi.n            a15, 1
        j                 2f
1:
        mov.n             a7, a6
        beqi              a5, 1, 3f
2:
        and               a6, a7, a12
        and               a5, a7, a9
        xor               a5, a5, a11
        and               a5, a5, a10
        or                a6, a6, a5
        wsr.scompare1     a7
        s32c1i            a6, a13, 0
        mov.n             a5, a15
        beq               a6, a7, 1b
        mov.n             a5, a14
        j                 1b
3:
        ssr               a8
        srl               a2, a6
        memw
        retw.n

.literal.asm_test::fetch_nand::u16::seqcst:
        .byte             0xff
        .byte             0xff

asm_test::fetch_nand::u16::seqcst:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::fetch_nand::u16::seqcst+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a12, a10, a11
        movi.n            a13, -4
        and               a13, a2, a13
        memw
        l32i.n            a7, a13, 0
        movi.n            a14, 0
        movi.n            a15, 1
        j                 2f
1:
        mov.n             a7, a6
        beqi              a5, 1, 3f
2:
        and               a6, a7, a12
        and               a5, a7, a9
        xor               a5, a5, a11
        and               a5, a5, a10
        or                a6, a6, a5
        wsr.scompare1     a7
        s32c1i            a6, a13, 0
        mov.n             a5, a15
        beq               a6, a7, 1b
        mov.n             a5, a14
        j                 1b
3:
        ssr               a8
        srl               a2, a6
        memw
        retw.n

.literal.asm_test::fetch_nand::u16::acquire:
        .byte             0xff
        .byte             0xff

asm_test::fetch_nand::u16::acquire:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::fetch_nand::u16::acquire+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a12, a10, a11
        movi.n            a13, -4
        and               a13, a2, a13
        l32i.n            a7, a13, 0
        movi.n            a14, 0
        movi.n            a15, 1
        j                 2f
1:
        mov.n             a7, a6
        beqi              a5, 1, 3f
2:
        and               a6, a7, a12
        and               a5, a7, a9
        xor               a5, a5, a11
        and               a5, a5, a10
        or                a6, a6, a5
        wsr.scompare1     a7
        s32c1i            a6, a13, 0
        mov.n             a5, a15
        beq               a6, a7, 1b
        mov.n             a5, a14
        j                 1b
3:
        ssr               a8
        srl               a2, a6
        memw
        retw.n

.literal.asm_test::fetch_nand::u16::relaxed:
        .byte             0xff
        .byte             0xff

asm_test::fetch_nand::u16::relaxed:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::fetch_nand::u16::relaxed+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a12, a10, a11
        movi.n            a13, -4
        and               a13, a2, a13
        l32i.n            a7, a13, 0
        movi.n            a14, 0
        movi.n            a15, 1
        j                 2f
1:
        mov.n             a7, a6
        beqi              a5, 1, 3f
2:
        and               a6, a7, a12
        and               a5, a7, a9
        xor               a5, a5, a11
        and               a5, a5, a10
        or                a6, a6, a5
        wsr.scompare1     a7
        s32c1i            a6, a13, 0
        mov.n             a5, a15
        beq               a6, a7, 1b
        mov.n             a5, a14
        j                 1b
3:
        ssr               a8
        srl               a2, a6
        retw.n

.literal.asm_test::fetch_nand::u16::release:
        .byte             0xff
        .byte             0xff

asm_test::fetch_nand::u16::release:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::fetch_nand::u16::release+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a12, a10, a11
        movi.n            a13, -4
        and               a13, a2, a13
        memw
        l32i.n            a7, a13, 0
        movi.n            a14, 0
        movi.n            a15, 1
        j                 2f
1:
        mov.n             a7, a6
        beqi              a5, 1, 3f
2:
        and               a6, a7, a12
        and               a5, a7, a9
        xor               a5, a5, a11
        and               a5, a5, a10
        or                a6, a6, a5
        wsr.scompare1     a7
        s32c1i            a6, a13, 0
        mov.n             a5, a15
        beq               a6, a7, 1b
        mov.n             a5, a14
        j                 1b
3:
        ssr               a8
        srl               a2, a6
        retw.n

asm_test::fetch_nand::u32::acqrel:
        entry             a1, 32
        memw
        l32i.n            a12, a2, 0
        movi.n            a9, -1
        movi.n            a10, 0
        movi.n            a11, 1
        j                 1f
0:
        mov.n             a12, a8
        beqi              a13, 1, 2f
1:
        and               a8, a12, a3
        xor               a8, a8, a9
        wsr.scompare1     a12
        s32c1i            a8, a2, 0
        mov.n             a13, a11
        beq               a8, a12, 0b
        mov.n             a13, a10
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u32::seqcst:
        entry             a1, 32
        memw
        l32i.n            a12, a2, 0
        movi.n            a9, -1
        movi.n            a10, 0
        movi.n            a11, 1
        j                 1f
0:
        mov.n             a12, a8
        beqi              a13, 1, 2f
1:
        and               a8, a12, a3
        xor               a8, a8, a9
        wsr.scompare1     a12
        s32c1i            a8, a2, 0
        mov.n             a13, a11
        beq               a8, a12, 0b
        mov.n             a13, a10
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u32::acquire:
        entry             a1, 32
        l32i.n            a12, a2, 0
        movi.n            a9, -1
        movi.n            a10, 0
        movi.n            a11, 1
        j                 1f
0:
        mov.n             a12, a8
        beqi              a13, 1, 2f
1:
        and               a8, a12, a3
        xor               a8, a8, a9
        wsr.scompare1     a12
        s32c1i            a8, a2, 0
        mov.n             a13, a11
        beq               a8, a12, 0b
        mov.n             a13, a10
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u32::relaxed:
        entry             a1, 32
        l32i.n            a12, a2, 0
        movi.n            a9, -1
        movi.n            a10, 0
        movi.n            a11, 1
        j                 1f
0:
        mov.n             a12, a8
        beqi              a13, 1, 2f
1:
        and               a8, a12, a3
        xor               a8, a8, a9
        wsr.scompare1     a12
        s32c1i            a8, a2, 0
        mov.n             a13, a11
        beq               a8, a12, 0b
        mov.n             a13, a10
        j                 0b
2:
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u32::release:
        entry             a1, 32
        memw
        l32i.n            a12, a2, 0
        movi.n            a9, -1
        movi.n            a10, 0
        movi.n            a11, 1
        j                 1f
0:
        mov.n             a12, a8
        beqi              a13, 1, 2f
1:
        and               a8, a12, a3
        xor               a8, a8, a9
        wsr.scompare1     a12
        s32c1i            a8, a2, 0
        mov.n             a13, a11
        beq               a8, a12, 0b
        mov.n             a13, a10
        j                 0b
2:
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::bool::acqrel:
        entry             a1, 32
        movi              a8, 255
        beqz              a3, 2f
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        movi.n            a10, 1
        ssl               a9
        sll               a11, a10
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 1f
0:
        mov.n             a15, a14
        beqi              a7, 1, 5f
1:
        xor               a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 0b
        mov.n             a7, a13
        j                 0b
2:
        movi.n            a9, 1
        movi.n            a10, 0
        slli              a11, a2, 3
        movi.n            a12, 24
        and               a11, a11, a12
        ssl               a11
        sll               a12, a9
        ssl               a11
        sll               a13, a8
        movi.n            a14, -1
        xor               a13, a13, a14
        movi.n            a14, -4
        and               a14, a2, a14
        memw
        l32i.n            a7, a14, 0
        j                 4f
3:
        mov.n             a7, a15
        beqi              a6, 1, 6f
4:
        and               a15, a7, a13
        or                a15, a15, a12
        wsr.scompare1     a7
        s32c1i            a15, a14, 0
        mov.n             a6, a9
        beq               a15, a7, 3b
        mov.n             a6, a10
        j                 3b
5:
        ssr               a9
        srl               a9, a14
        memw
        and               a8, a9, a8
        movi.n            a2, 0
        bne               a8, a2, 7f
        j                 8f
6:
        ssr               a11
        srl               a9, a15
        memw
        and               a8, a9, a8
        movi.n            a2, 0
        beq               a8, a2, 8f
7:
        movi.n            a2, 1
8:
        retw.n

asm_test::fetch_nand::bool::seqcst:
        entry             a1, 32
        movi              a8, 255
        beqz              a3, 2f
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        movi.n            a10, 1
        ssl               a9
        sll               a11, a10
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 1f
0:
        mov.n             a15, a14
        beqi              a7, 1, 5f
1:
        xor               a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 0b
        mov.n             a7, a13
        j                 0b
2:
        movi.n            a9, 1
        movi.n            a10, 0
        slli              a11, a2, 3
        movi.n            a12, 24
        and               a11, a11, a12
        ssl               a11
        sll               a12, a9
        ssl               a11
        sll               a13, a8
        movi.n            a14, -1
        xor               a13, a13, a14
        movi.n            a14, -4
        and               a14, a2, a14
        memw
        l32i.n            a7, a14, 0
        j                 4f
3:
        mov.n             a7, a15
        beqi              a6, 1, 6f
4:
        and               a15, a7, a13
        or                a15, a15, a12
        wsr.scompare1     a7
        s32c1i            a15, a14, 0
        mov.n             a6, a9
        beq               a15, a7, 3b
        mov.n             a6, a10
        j                 3b
5:
        ssr               a9
        srl               a9, a14
        memw
        and               a8, a9, a8
        movi.n            a2, 0
        bne               a8, a2, 7f
        j                 8f
6:
        ssr               a11
        srl               a9, a15
        memw
        and               a8, a9, a8
        movi.n            a2, 0
        beq               a8, a2, 8f
7:
        movi.n            a2, 1
8:
        retw.n

asm_test::fetch_nand::bool::acquire:
        entry             a1, 32
        movi              a8, 255
        beqz              a3, 2f
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        movi.n            a10, 1
        ssl               a9
        sll               a11, a10
        movi.n            a12, -4
        and               a12, a2, a12
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 1f
0:
        mov.n             a15, a14
        beqi              a7, 1, 5f
1:
        xor               a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 0b
        mov.n             a7, a13
        j                 0b
2:
        movi.n            a9, 1
        movi.n            a10, 0
        slli              a11, a2, 3
        movi.n            a12, 24
        and               a11, a11, a12
        ssl               a11
        sll               a12, a9
        ssl               a11
        sll               a13, a8
        movi.n            a14, -1
        xor               a13, a13, a14
        movi.n            a14, -4
        and               a14, a2, a14
        l32i.n            a7, a14, 0
        j                 4f
3:
        mov.n             a7, a15
        beqi              a6, 1, 6f
4:
        and               a15, a7, a13
        or                a15, a15, a12
        wsr.scompare1     a7
        s32c1i            a15, a14, 0
        mov.n             a6, a9
        beq               a15, a7, 3b
        mov.n             a6, a10
        j                 3b
5:
        ssr               a9
        srl               a9, a14
        memw
        and               a8, a9, a8
        movi.n            a2, 0
        bne               a8, a2, 7f
        j                 8f
6:
        ssr               a11
        srl               a9, a15
        memw
        and               a8, a9, a8
        movi.n            a2, 0
        beq               a8, a2, 8f
7:
        movi.n            a2, 1
8:
        retw.n

asm_test::fetch_nand::bool::relaxed:
        entry             a1, 32
        movi              a8, 255
        beqz              a3, 2f
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        movi.n            a10, 1
        ssl               a9
        sll               a11, a10
        movi.n            a12, -4
        and               a12, a2, a12
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 1f
0:
        mov.n             a15, a14
        beqi              a7, 1, 5f
1:
        xor               a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 0b
        mov.n             a7, a13
        j                 0b
2:
        movi.n            a9, 1
        movi.n            a10, 0
        slli              a11, a2, 3
        movi.n            a12, 24
        and               a11, a11, a12
        ssl               a11
        sll               a12, a9
        ssl               a11
        sll               a13, a8
        movi.n            a14, -1
        xor               a13, a13, a14
        movi.n            a14, -4
        and               a14, a2, a14
        l32i.n            a7, a14, 0
        j                 4f
3:
        mov.n             a7, a15
        beqi              a6, 1, 6f
4:
        and               a15, a7, a13
        or                a15, a15, a12
        wsr.scompare1     a7
        s32c1i            a15, a14, 0
        mov.n             a6, a9
        beq               a15, a7, 3b
        mov.n             a6, a10
        j                 3b
5:
        ssr               a9
        srl               a9, a14
        and               a8, a9, a8
        movi.n            a2, 0
        bne               a8, a2, 7f
        j                 8f
6:
        ssr               a11
        srl               a9, a15
        and               a8, a9, a8
        movi.n            a2, 0
        beq               a8, a2, 8f
7:
        movi.n            a2, 1
8:
        retw.n

asm_test::fetch_nand::bool::release:
        entry             a1, 32
        movi              a8, 255
        beqz              a3, 2f
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        movi.n            a10, 1
        ssl               a9
        sll               a11, a10
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 1f
0:
        mov.n             a15, a14
        beqi              a7, 1, 5f
1:
        xor               a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 0b
        mov.n             a7, a13
        j                 0b
2:
        movi.n            a9, 1
        movi.n            a10, 0
        slli              a11, a2, 3
        movi.n            a12, 24
        and               a11, a11, a12
        ssl               a11
        sll               a12, a9
        ssl               a11
        sll               a13, a8
        movi.n            a14, -1
        xor               a13, a13, a14
        movi.n            a14, -4
        and               a14, a2, a14
        memw
        l32i.n            a7, a14, 0
        j                 4f
3:
        mov.n             a7, a15
        beqi              a6, 1, 6f
4:
        and               a15, a7, a13
        or                a15, a15, a12
        wsr.scompare1     a7
        s32c1i            a15, a14, 0
        mov.n             a6, a9
        beq               a15, a7, 3b
        mov.n             a6, a10
        j                 3b
5:
        ssr               a9
        srl               a9, a14
        and               a8, a9, a8
        movi.n            a2, 0
        bne               a8, a2, 7f
        j                 8f
6:
        ssr               a11
        srl               a9, a15
        and               a8, a9, a8
        movi.n            a2, 0
        beq               a8, a2, 8f
7:
        movi.n            a2, 1
8:
        retw.n

asm_test::fetch_umax::u8::acqrel:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a10, a9
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a15, a11, 0
        and               a12, a3, a9
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a15, a7
        beqi              a6, 1, 2f
1:
        ssr               a8
        srl               a7, a15
        and               a7, a7, a9
        maxu              a7, a7, a12
        ssl               a8
        sll               a7, a7
        and               a6, a15, a10
        or                a7, a6, a7
        wsr.scompare1     a15
        s32c1i            a7, a11, 0
        mov.n             a6, a14
        beq               a7, a15, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a2, a7
        memw
        retw.n

asm_test::fetch_umax::u8::seqcst:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a10, a9
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a15, a11, 0
        and               a12, a3, a9
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a15, a7
        beqi              a6, 1, 2f
1:
        ssr               a8
        srl               a7, a15
        and               a7, a7, a9
        maxu              a7, a7, a12
        ssl               a8
        sll               a7, a7
        and               a6, a15, a10
        or                a7, a6, a7
        wsr.scompare1     a15
        s32c1i            a7, a11, 0
        mov.n             a6, a14
        beq               a7, a15, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a2, a7
        memw
        retw.n

asm_test::fetch_umax::u8::acquire:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a10, a9
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a15, a11, 0
        and               a12, a3, a9
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a15, a7
        beqi              a6, 1, 2f
1:
        ssr               a8
        srl               a7, a15
        and               a7, a7, a9
        maxu              a7, a7, a12
        ssl               a8
        sll               a7, a7
        and               a6, a15, a10
        or                a7, a6, a7
        wsr.scompare1     a15
        s32c1i            a7, a11, 0
        mov.n             a6, a14
        beq               a7, a15, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a2, a7
        memw
        retw.n

asm_test::fetch_umax::u8::relaxed:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a10, a9
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a15, a11, 0
        and               a12, a3, a9
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a15, a7
        beqi              a6, 1, 2f
1:
        ssr               a8
        srl               a7, a15
        and               a7, a7, a9
        maxu              a7, a7, a12
        ssl               a8
        sll               a7, a7
        and               a6, a15, a10
        or                a7, a6, a7
        wsr.scompare1     a15
        s32c1i            a7, a11, 0
        mov.n             a6, a14
        beq               a7, a15, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a2, a7
        retw.n

asm_test::fetch_umax::u8::release:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a10, a9
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a15, a11, 0
        and               a12, a3, a9
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a15, a7
        beqi              a6, 1, 2f
1:
        ssr               a8
        srl               a7, a15
        and               a7, a7, a9
        maxu              a7, a7, a12
        ssl               a8
        sll               a7, a7
        and               a6, a15, a10
        or                a7, a6, a7
        wsr.scompare1     a15
        s32c1i            a7, a11, 0
        mov.n             a6, a14
        beq               a7, a15, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a2, a7
        retw.n

.literal.asm_test::fetch_umax::u16::acqrel:
        .byte             0xff
        .byte             0xff

asm_test::fetch_umax::u16::acqrel:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
0:
        and               a8, a8, a9
        l32r              a9, 0b (91108890 <asm_test::fetch_umax::u16::acqrel+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a13, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 3f
1:
        mov.n             a13, a14
2:
        beqi              a15, 1, 4f
3:
        l32r              a14, 2b (e12d1f26 <asm_test::fetch_umax::u16::acqrel+0xe12d1f26>)
        and               a15, a3, a14
        ssr               a8
        srl               a7, a13
        and               a14, a7, a14
        maxu              a14, a14, a15
        ssl               a8
        sll               a14, a14
        and               a15, a13, a9
        or                a14, a15, a14
        wsr.scompare1     a13
        s32c1i            a14, a10, 0
        mov.n             a15, a12
        beq               a14, a13, 1b
        mov.n             a15, a11
        j                 1b
4:
        ssr               a8
        srl               a2, a14
        memw
        retw.n

.literal.asm_test::fetch_umax::u16::seqcst:
        .byte             0xff
        .byte             0xff

asm_test::fetch_umax::u16::seqcst:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
0:
        and               a8, a8, a9
        l32r              a9, 0b (91108890 <asm_test::fetch_umax::u16::seqcst+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a13, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 3f
1:
        mov.n             a13, a14
2:
        beqi              a15, 1, 4f
3:
        l32r              a14, 2b (e12d1f26 <asm_test::fetch_umax::u16::seqcst+0xe12d1f26>)
        and               a15, a3, a14
        ssr               a8
        srl               a7, a13
        and               a14, a7, a14
        maxu              a14, a14, a15
        ssl               a8
        sll               a14, a14
        and               a15, a13, a9
        or                a14, a15, a14
        wsr.scompare1     a13
        s32c1i            a14, a10, 0
        mov.n             a15, a12
        beq               a14, a13, 1b
        mov.n             a15, a11
        j                 1b
4:
        ssr               a8
        srl               a2, a14
        memw
        retw.n

.literal.asm_test::fetch_umax::u16::acquire:
        .byte             0xff
        .byte             0xff

asm_test::fetch_umax::u16::acquire:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
0:
        and               a8, a8, a9
        l32r              a9, 0b (91108890 <asm_test::fetch_umax::u16::acquire+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a13, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 2f
1:
        mov.n             a13, a14
        beqi              a15, 1, 3f
2:
        l32r              a14, fffc002c <asm_test::fetch_umax::u16::acquire+0xfffc002c>
        and               a15, a3, a14
        ssr               a8
        srl               a7, a13
        and               a14, a7, a14
        maxu              a14, a14, a15
        ssl               a8
        sll               a14, a14
        and               a15, a13, a9
        or                a14, a15, a14
        wsr.scompare1     a13
        s32c1i            a14, a10, 0
        mov.n             a15, a12
        beq               a14, a13, 1b
        mov.n             a15, a11
        j                 1b
3:
        ssr               a8
        srl               a2, a14
        memw
        retw.n

.literal.asm_test::fetch_umax::u16::relaxed:
        .byte             0xff
        .byte             0xff

asm_test::fetch_umax::u16::relaxed:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
0:
        and               a8, a8, a9
        l32r              a9, 0b (91108890 <asm_test::fetch_umax::u16::relaxed+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a13, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 2f
1:
        mov.n             a13, a14
        beqi              a15, 1, 3f
2:
        l32r              a14, fffc002c <asm_test::fetch_umax::u16::relaxed+0xfffc002c>
        and               a15, a3, a14
        ssr               a8
        srl               a7, a13
        and               a14, a7, a14
        maxu              a14, a14, a15
        ssl               a8
        sll               a14, a14
        and               a15, a13, a9
        or                a14, a15, a14
        wsr.scompare1     a13
        s32c1i            a14, a10, 0
        mov.n             a15, a12
        beq               a14, a13, 1b
        mov.n             a15, a11
        j                 1b
3:
        ssr               a8
        srl               a2, a14
        retw.n

.literal.asm_test::fetch_umax::u16::release:
        .byte             0xff
        .byte             0xff

asm_test::fetch_umax::u16::release:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
0:
        and               a8, a8, a9
        l32r              a9, 0b (91108890 <asm_test::fetch_umax::u16::release+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a13, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 3f
1:
        mov.n             a13, a14
2:
        beqi              a15, 1, 4f
3:
        l32r              a14, 2b (e12d1f26 <asm_test::fetch_umax::u16::release+0xe12d1f26>)
        and               a15, a3, a14
        ssr               a8
        srl               a7, a13
        and               a14, a7, a14
        maxu              a14, a14, a15
        ssl               a8
        sll               a14, a14
        and               a15, a13, a9
        or                a14, a15, a14
        wsr.scompare1     a13
        s32c1i            a14, a10, 0
        mov.n             a15, a12
        beq               a14, a13, 1b
        mov.n             a15, a11
        j                 1b
4:
        ssr               a8
        srl               a2, a14
        retw.n

asm_test::fetch_umax::u32::acqrel:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        maxu              a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_umax::u32::seqcst:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        maxu              a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_umax::u32::acquire:
        entry             a1, 32
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        maxu              a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_umax::u32::relaxed:
        entry             a1, 32
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        maxu              a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        mov.n             a2, a8
        retw.n

asm_test::fetch_umax::u32::release:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        maxu              a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        mov.n             a2, a8
        retw.n

asm_test::fetch_umin::u8::acqrel:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a10, a9
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a15, a11, 0
        and               a12, a3, a9
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a15, a7
        beqi              a6, 1, 2f
1:
        ssr               a8
        srl               a7, a15
        and               a7, a7, a9
        minu              a7, a7, a12
        ssl               a8
        sll               a7, a7
        and               a6, a15, a10
        or                a7, a6, a7
        wsr.scompare1     a15
        s32c1i            a7, a11, 0
        mov.n             a6, a14
        beq               a7, a15, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a2, a7
        memw
        retw.n

asm_test::fetch_umin::u8::seqcst:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a10, a9
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a15, a11, 0
        and               a12, a3, a9
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a15, a7
        beqi              a6, 1, 2f
1:
        ssr               a8
        srl               a7, a15
        and               a7, a7, a9
        minu              a7, a7, a12
        ssl               a8
        sll               a7, a7
        and               a6, a15, a10
        or                a7, a6, a7
        wsr.scompare1     a15
        s32c1i            a7, a11, 0
        mov.n             a6, a14
        beq               a7, a15, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a2, a7
        memw
        retw.n

asm_test::fetch_umin::u8::acquire:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a10, a9
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a15, a11, 0
        and               a12, a3, a9
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a15, a7
        beqi              a6, 1, 2f
1:
        ssr               a8
        srl               a7, a15
        and               a7, a7, a9
        minu              a7, a7, a12
        ssl               a8
        sll               a7, a7
        and               a6, a15, a10
        or                a7, a6, a7
        wsr.scompare1     a15
        s32c1i            a7, a11, 0
        mov.n             a6, a14
        beq               a7, a15, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a2, a7
        memw
        retw.n

asm_test::fetch_umin::u8::relaxed:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a10, a9
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a15, a11, 0
        and               a12, a3, a9
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a15, a7
        beqi              a6, 1, 2f
1:
        ssr               a8
        srl               a7, a15
        and               a7, a7, a9
        minu              a7, a7, a12
        ssl               a8
        sll               a7, a7
        and               a6, a15, a10
        or                a7, a6, a7
        wsr.scompare1     a15
        s32c1i            a7, a11, 0
        mov.n             a6, a14
        beq               a7, a15, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a2, a7
        retw.n

asm_test::fetch_umin::u8::release:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a10, a9
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a15, a11, 0
        and               a12, a3, a9
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a15, a7
        beqi              a6, 1, 2f
1:
        ssr               a8
        srl               a7, a15
        and               a7, a7, a9
        minu              a7, a7, a12
        ssl               a8
        sll               a7, a7
        and               a6, a15, a10
        or                a7, a6, a7
        wsr.scompare1     a15
        s32c1i            a7, a11, 0
        mov.n             a6, a14
        beq               a7, a15, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a2, a7
        retw.n

.literal.asm_test::fetch_umin::u16::acqrel:
        .byte             0xff
        .byte             0xff

asm_test::fetch_umin::u16::acqrel:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
0:
        and               a8, a8, a9
        l32r              a9, 0b (91108890 <asm_test::fetch_umin::u16::acqrel+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a13, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 3f
1:
        mov.n             a13, a14
2:
        beqi              a15, 1, 4f
3:
        l32r              a14, 2b (e12d1f26 <asm_test::fetch_umin::u16::acqrel+0xe12d1f26>)
        and               a15, a3, a14
        ssr               a8
        srl               a7, a13
        and               a14, a7, a14
        minu              a14, a14, a15
        ssl               a8
        sll               a14, a14
        and               a15, a13, a9
        or                a14, a15, a14
        wsr.scompare1     a13
        s32c1i            a14, a10, 0
        mov.n             a15, a12
        beq               a14, a13, 1b
        mov.n             a15, a11
        j                 1b
4:
        ssr               a8
        srl               a2, a14
        memw
        retw.n

.literal.asm_test::fetch_umin::u16::seqcst:
        .byte             0xff
        .byte             0xff

asm_test::fetch_umin::u16::seqcst:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
0:
        and               a8, a8, a9
        l32r              a9, 0b (91108890 <asm_test::fetch_umin::u16::seqcst+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a13, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 3f
1:
        mov.n             a13, a14
2:
        beqi              a15, 1, 4f
3:
        l32r              a14, 2b (e12d1f26 <asm_test::fetch_umin::u16::seqcst+0xe12d1f26>)
        and               a15, a3, a14
        ssr               a8
        srl               a7, a13
        and               a14, a7, a14
        minu              a14, a14, a15
        ssl               a8
        sll               a14, a14
        and               a15, a13, a9
        or                a14, a15, a14
        wsr.scompare1     a13
        s32c1i            a14, a10, 0
        mov.n             a15, a12
        beq               a14, a13, 1b
        mov.n             a15, a11
        j                 1b
4:
        ssr               a8
        srl               a2, a14
        memw
        retw.n

.literal.asm_test::fetch_umin::u16::acquire:
        .byte             0xff
        .byte             0xff

asm_test::fetch_umin::u16::acquire:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
0:
        and               a8, a8, a9
        l32r              a9, 0b (91108890 <asm_test::fetch_umin::u16::acquire+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a13, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 2f
1:
        mov.n             a13, a14
        beqi              a15, 1, 3f
2:
        l32r              a14, fffc002c <asm_test::fetch_umin::u16::acquire+0xfffc002c>
        and               a15, a3, a14
        ssr               a8
        srl               a7, a13
        and               a14, a7, a14
        minu              a14, a14, a15
        ssl               a8
        sll               a14, a14
        and               a15, a13, a9
        or                a14, a15, a14
        wsr.scompare1     a13
        s32c1i            a14, a10, 0
        mov.n             a15, a12
        beq               a14, a13, 1b
        mov.n             a15, a11
        j                 1b
3:
        ssr               a8
        srl               a2, a14
        memw
        retw.n

.literal.asm_test::fetch_umin::u16::relaxed:
        .byte             0xff
        .byte             0xff

asm_test::fetch_umin::u16::relaxed:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
0:
        and               a8, a8, a9
        l32r              a9, 0b (91108890 <asm_test::fetch_umin::u16::relaxed+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a13, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 2f
1:
        mov.n             a13, a14
        beqi              a15, 1, 3f
2:
        l32r              a14, fffc002c <asm_test::fetch_umin::u16::relaxed+0xfffc002c>
        and               a15, a3, a14
        ssr               a8
        srl               a7, a13
        and               a14, a7, a14
        minu              a14, a14, a15
        ssl               a8
        sll               a14, a14
        and               a15, a13, a9
        or                a14, a15, a14
        wsr.scompare1     a13
        s32c1i            a14, a10, 0
        mov.n             a15, a12
        beq               a14, a13, 1b
        mov.n             a15, a11
        j                 1b
3:
        ssr               a8
        srl               a2, a14
        retw.n

.literal.asm_test::fetch_umin::u16::release:
        .byte             0xff
        .byte             0xff

asm_test::fetch_umin::u16::release:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
0:
        and               a8, a8, a9
        l32r              a9, 0b (91108890 <asm_test::fetch_umin::u16::release+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a13, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 3f
1:
        mov.n             a13, a14
2:
        beqi              a15, 1, 4f
3:
        l32r              a14, 2b (e12d1f26 <asm_test::fetch_umin::u16::release+0xe12d1f26>)
        and               a15, a3, a14
        ssr               a8
        srl               a7, a13
        and               a14, a7, a14
        minu              a14, a14, a15
        ssl               a8
        sll               a14, a14
        and               a15, a13, a9
        or                a14, a15, a14
        wsr.scompare1     a13
        s32c1i            a14, a10, 0
        mov.n             a15, a12
        beq               a14, a13, 1b
        mov.n             a15, a11
        j                 1b
4:
        ssr               a8
        srl               a2, a14
        retw.n

asm_test::fetch_umin::u32::acqrel:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        minu              a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_umin::u32::seqcst:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        minu              a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_umin::u32::acquire:
        entry             a1, 32
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        minu              a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_umin::u32::relaxed:
        entry             a1, 32
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        minu              a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        mov.n             a2, a8
        retw.n

asm_test::fetch_umin::u32::release:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        minu              a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        mov.n             a2, a8
        retw.n

asm_test::compare_exchange::u8::acqrel_seqcst:
        entry             a1, 32
        movi              a11, 255
        and               a9, a3, a11
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        and               a10, a4, a11
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a11, a11
        movi.n            a12, -1
        xor               a11, a11, a12
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a13, a12, 0
        and               a5, a13, a11
        movi.n            a13, 0
        movi.n            a15, 1
0:
        mov.n             a7, a5
        or                a14, a7, a10
        or                a5, a7, a9
        wsr.scompare1     a5
        s32c1i            a14, a12, 0
        mov.n             a6, a15
        beq               a14, a5, 1f
        mov.n             a6, a13
1:
        bnez              a6, 2f
        and               a5, a14, a11
        bne               a7, a5, 0b
2:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
        retw.n

asm_test::compare_exchange::u8::seqcst_seqcst:
        entry             a1, 32
        movi              a11, 255
        and               a9, a3, a11
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        and               a10, a4, a11
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a11, a11
        movi.n            a12, -1
        xor               a11, a11, a12
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a13, a12, 0
        and               a5, a13, a11
        movi.n            a13, 0
        movi.n            a15, 1
0:
        mov.n             a7, a5
        or                a14, a7, a10
        or                a5, a7, a9
        wsr.scompare1     a5
        s32c1i            a14, a12, 0
        mov.n             a6, a15
        beq               a14, a5, 1f
        mov.n             a6, a13
1:
        bnez              a6, 2f
        and               a5, a14, a11
        bne               a7, a5, 0b
2:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
        retw.n

asm_test::compare_exchange::u8::acqrel_acquire:
        entry             a1, 32
        movi              a11, 255
        and               a9, a3, a11
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        and               a10, a4, a11
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a11, a11
        movi.n            a12, -1
        xor               a11, a11, a12
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a13, a12, 0
        and               a5, a13, a11
        movi.n            a13, 0
        movi.n            a15, 1
0:
        mov.n             a7, a5
        or                a14, a7, a10
        or                a5, a7, a9
        wsr.scompare1     a5
        s32c1i            a14, a12, 0
        mov.n             a6, a15
        beq               a14, a5, 1f
        mov.n             a6, a13
1:
        bnez              a6, 2f
        and               a5, a14, a11
        bne               a7, a5, 0b
2:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
        retw.n

asm_test::compare_exchange::u8::acqrel_relaxed:
        entry             a1, 32
        movi              a11, 255
        and               a9, a3, a11
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        and               a10, a4, a11
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a11, a11
        movi.n            a12, -1
        xor               a11, a11, a12
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a13, a12, 0
        and               a5, a13, a11
        movi.n            a13, 0
        movi.n            a15, 1
0:
        mov.n             a7, a5
        or                a14, a7, a10
        or                a5, a7, a9
        wsr.scompare1     a5
        s32c1i            a14, a12, 0
        mov.n             a6, a15
        beq               a14, a5, 1f
        mov.n             a6, a13
1:
        bnez              a6, 2f
        and               a5, a14, a11
        bne               a7, a5, 0b
2:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
        retw.n

asm_test::compare_exchange::u8::acquire_seqcst:
        entry             a1, 32
        movi              a11, 255
        and               a9, a3, a11
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        and               a10, a4, a11
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a11, a11
        movi.n            a12, -1
        xor               a11, a11, a12
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a13, a12, 0
        and               a5, a13, a11
        movi.n            a13, 0
        movi.n            a15, 1
0:
        mov.n             a7, a5
        or                a14, a7, a10
        or                a5, a7, a9
        wsr.scompare1     a5
        s32c1i            a14, a12, 0
        mov.n             a6, a15
        beq               a14, a5, 1f
        mov.n             a6, a13
1:
        bnez              a6, 2f
        and               a5, a14, a11
        bne               a7, a5, 0b
2:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
        retw.n

asm_test::compare_exchange::u8::relaxed_seqcst:
        entry             a1, 32
        movi              a11, 255
        and               a9, a3, a11
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        and               a10, a4, a11
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a11, a11
        movi.n            a12, -1
        xor               a11, a11, a12
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a13, a12, 0
        and               a5, a13, a11
        movi.n            a13, 0
        movi.n            a15, 1
0:
        mov.n             a7, a5
        or                a14, a7, a10
        or                a5, a7, a9
        wsr.scompare1     a5
        s32c1i            a14, a12, 0
        mov.n             a6, a15
        beq               a14, a5, 1f
        mov.n             a6, a13
1:
        bnez              a6, 2f
        and               a5, a14, a11
        bne               a7, a5, 0b
2:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
        retw.n

asm_test::compare_exchange::u8::release_seqcst:
        entry             a1, 32
        movi              a11, 255
        and               a9, a3, a11
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        and               a10, a4, a11
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a11, a11
        movi.n            a12, -1
        xor               a11, a11, a12
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a13, a12, 0
        and               a5, a13, a11
        movi.n            a13, 0
        movi.n            a15, 1
0:
        mov.n             a7, a5
        or                a14, a7, a10
        or                a5, a7, a9
        wsr.scompare1     a5
        s32c1i            a14, a12, 0
        mov.n             a6, a15
        beq               a14, a5, 1f
        mov.n             a6, a13
1:
        bnez              a6, 2f
        and               a5, a14, a11
        bne               a7, a5, 0b
2:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
        retw.n

asm_test::compare_exchange::u8::seqcst_acquire:
        entry             a1, 32
        movi              a11, 255
        and               a9, a3, a11
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        and               a10, a4, a11
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a11, a11
        movi.n            a12, -1
        xor               a11, a11, a12
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a13, a12, 0
        and               a5, a13, a11
        movi.n            a13, 0
        movi.n            a15, 1
0:
        mov.n             a7, a5
        or                a14, a7, a10
        or                a5, a7, a9
        wsr.scompare1     a5
        s32c1i            a14, a12, 0
        mov.n             a6, a15
        beq               a14, a5, 1f
        mov.n             a6, a13
1:
        bnez              a6, 2f
        and               a5, a14, a11
        bne               a7, a5, 0b
2:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
        retw.n

asm_test::compare_exchange::u8::seqcst_relaxed:
        entry             a1, 32
        movi              a11, 255
        and               a9, a3, a11
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        and               a10, a4, a11
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a11, a11
        movi.n            a12, -1
        xor               a11, a11, a12
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a13, a12, 0
        and               a5, a13, a11
        movi.n            a13, 0
        movi.n            a15, 1
0:
        mov.n             a7, a5
        or                a14, a7, a10
        or                a5, a7, a9
        wsr.scompare1     a5
        s32c1i            a14, a12, 0
        mov.n             a6, a15
        beq               a14, a5, 1f
        mov.n             a6, a13
1:
        bnez              a6, 2f
        and               a5, a14, a11
        bne               a7, a5, 0b
2:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
        retw.n

asm_test::compare_exchange::u8::acquire_acquire:
        entry             a1, 32
        movi              a11, 255
        and               a9, a3, a11
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        and               a10, a4, a11
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a11, a11
        movi.n            a12, -1
        xor               a11, a11, a12
        movi.n            a12, -4
        and               a12, a2, a12
        l32i.n            a13, a12, 0
        and               a5, a13, a11
        movi.n            a13, 0
        movi.n            a15, 1
0:
        mov.n             a7, a5
        or                a14, a7, a10
        or                a5, a7, a9
        wsr.scompare1     a5
        s32c1i            a14, a12, 0
        mov.n             a6, a15
        beq               a14, a5, 1f
        mov.n             a6, a13
1:
        bnez              a6, 2f
        and               a5, a14, a11
        bne               a7, a5, 0b
2:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
        retw.n

asm_test::compare_exchange::u8::acquire_relaxed:
        entry             a1, 32
        movi              a11, 255
        and               a9, a3, a11
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        and               a10, a4, a11
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a11, a11
        movi.n            a12, -1
        xor               a11, a11, a12
        movi.n            a12, -4
        and               a12, a2, a12
        l32i.n            a13, a12, 0
        and               a5, a13, a11
        movi.n            a13, 0
        movi.n            a15, 1
0:
        mov.n             a7, a5
        or                a14, a7, a10
        or                a5, a7, a9
        wsr.scompare1     a5
        s32c1i            a14, a12, 0
        mov.n             a6, a15
        beq               a14, a5, 1f
        mov.n             a6, a13
1:
        bnez              a6, 2f
        and               a5, a14, a11
        bne               a7, a5, 0b
2:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
        retw.n

asm_test::compare_exchange::u8::relaxed_acquire:
        entry             a1, 32
        movi              a11, 255
        and               a9, a3, a11
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        and               a10, a4, a11
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a11, a11
        movi.n            a12, -1
        xor               a11, a11, a12
        movi.n            a12, -4
        and               a12, a2, a12
        l32i.n            a13, a12, 0
        and               a5, a13, a11
        movi.n            a13, 0
        movi.n            a15, 1
0:
        mov.n             a7, a5
        or                a14, a7, a10
        or                a5, a7, a9
        wsr.scompare1     a5
        s32c1i            a14, a12, 0
        mov.n             a6, a15
        beq               a14, a5, 1f
        mov.n             a6, a13
1:
        bnez              a6, 2f
        and               a5, a14, a11
        bne               a7, a5, 0b
2:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
        retw.n

asm_test::compare_exchange::u8::relaxed_relaxed:
        entry             a1, 32
        movi              a11, 255
        and               a9, a3, a11
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        and               a10, a4, a11
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a11, a11
        movi.n            a12, -1
        xor               a11, a11, a12
        movi.n            a12, -4
        and               a12, a2, a12
        l32i.n            a13, a12, 0
        and               a5, a13, a11
        movi.n            a13, 0
        movi.n            a15, 1
0:
        mov.n             a7, a5
        or                a14, a7, a10
        or                a5, a7, a9
        wsr.scompare1     a5
        s32c1i            a14, a12, 0
        mov.n             a6, a15
        beq               a14, a5, 1f
        mov.n             a6, a13
1:
        bnez              a6, 2f
        and               a5, a14, a11
        bne               a7, a5, 0b
2:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        retw.n

asm_test::compare_exchange::u8::release_acquire:
        entry             a1, 32
        movi              a11, 255
        and               a9, a3, a11
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        and               a10, a4, a11
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a11, a11
        movi.n            a12, -1
        xor               a11, a11, a12
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a13, a12, 0
        and               a5, a13, a11
        movi.n            a13, 0
        movi.n            a15, 1
0:
        mov.n             a7, a5
        or                a14, a7, a10
        or                a5, a7, a9
        wsr.scompare1     a5
        s32c1i            a14, a12, 0
        mov.n             a6, a15
        beq               a14, a5, 1f
        mov.n             a6, a13
1:
        bnez              a6, 2f
        and               a5, a14, a11
        bne               a7, a5, 0b
2:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
        retw.n

asm_test::compare_exchange::u8::release_relaxed:
        entry             a1, 32
        movi              a11, 255
        and               a9, a3, a11
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        and               a10, a4, a11
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a11, a11
        movi.n            a12, -1
        xor               a11, a11, a12
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a13, a12, 0
        and               a5, a13, a11
        movi.n            a13, 0
        movi.n            a15, 1
0:
        mov.n             a7, a5
        or                a14, a7, a10
        or                a5, a7, a9
        wsr.scompare1     a5
        s32c1i            a14, a12, 0
        mov.n             a6, a15
        beq               a14, a5, 1f
        mov.n             a6, a13
1:
        bnez              a6, 2f
        and               a5, a14, a11
        bne               a7, a5, 0b
2:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        retw.n

.literal.asm_test::compare_exchange::u16::acqrel_seqcst:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::acqrel_seqcst:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::compare_exchange::u16::acqrel_seqcst+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        and               a11, a4, a10
        ssl               a8
        sll               a11, a11
        ssl               a8
        sll               a12, a10
        movi.n            a10, -1
        xor               a12, a12, a10
        movi.n            a13, -4
        and               a13, a2, a13
        memw
        l32i.n            a14, a13, 0
        and               a4, a14, a12
        movi.n            a14, 0
        movi.n            a15, 1
1:
        mov.n             a6, a4
        or                a7, a6, a11
        or                a4, a6, a9
        wsr.scompare1     a4
        s32c1i            a7, a13, 0
        mov.n             a5, a15
        beq               a7, a4, 2f
        mov.n             a5, a14
2:
        bnez              a5, 3f
        and               a4, a7, a12
        bne               a6, a4, 1b
3:
        ssr               a8
        srl               a3, a7
        xor               a8, a5, a10
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n

.literal.asm_test::compare_exchange::u16::seqcst_seqcst:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::seqcst_seqcst:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::compare_exchange::u16::seqcst_seqcst+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        and               a11, a4, a10
        ssl               a8
        sll               a11, a11
        ssl               a8
        sll               a12, a10
        movi.n            a10, -1
        xor               a12, a12, a10
        movi.n            a13, -4
        and               a13, a2, a13
        memw
        l32i.n            a14, a13, 0
        and               a4, a14, a12
        movi.n            a14, 0
        movi.n            a15, 1
1:
        mov.n             a6, a4
        or                a7, a6, a11
        or                a4, a6, a9
        wsr.scompare1     a4
        s32c1i            a7, a13, 0
        mov.n             a5, a15
        beq               a7, a4, 2f
        mov.n             a5, a14
2:
        bnez              a5, 3f
        and               a4, a7, a12
        bne               a6, a4, 1b
3:
        ssr               a8
        srl               a3, a7
        xor               a8, a5, a10
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n

.literal.asm_test::compare_exchange::u16::acqrel_acquire:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::acqrel_acquire:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::compare_exchange::u16::acqrel_acquire+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        and               a11, a4, a10
        ssl               a8
        sll               a11, a11
        ssl               a8
        sll               a12, a10
        movi.n            a10, -1
        xor               a12, a12, a10
        movi.n            a13, -4
        and               a13, a2, a13
        memw
        l32i.n            a14, a13, 0
        and               a4, a14, a12
        movi.n            a14, 0
        movi.n            a15, 1
1:
        mov.n             a6, a4
        or                a7, a6, a11
        or                a4, a6, a9
        wsr.scompare1     a4
        s32c1i            a7, a13, 0
        mov.n             a5, a15
        beq               a7, a4, 2f
        mov.n             a5, a14
2:
        bnez              a5, 3f
        and               a4, a7, a12
        bne               a6, a4, 1b
3:
        ssr               a8
        srl               a3, a7
        xor               a8, a5, a10
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n

.literal.asm_test::compare_exchange::u16::acqrel_relaxed:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::acqrel_relaxed:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::compare_exchange::u16::acqrel_relaxed+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        and               a11, a4, a10
        ssl               a8
        sll               a11, a11
        ssl               a8
        sll               a12, a10
        movi.n            a10, -1
        xor               a12, a12, a10
        movi.n            a13, -4
        and               a13, a2, a13
        memw
        l32i.n            a14, a13, 0
        and               a4, a14, a12
        movi.n            a14, 0
        movi.n            a15, 1
1:
        mov.n             a6, a4
        or                a7, a6, a11
        or                a4, a6, a9
        wsr.scompare1     a4
        s32c1i            a7, a13, 0
        mov.n             a5, a15
        beq               a7, a4, 2f
        mov.n             a5, a14
2:
        bnez              a5, 3f
        and               a4, a7, a12
        bne               a6, a4, 1b
3:
        ssr               a8
        srl               a3, a7
        xor               a8, a5, a10
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n

.literal.asm_test::compare_exchange::u16::acquire_seqcst:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::acquire_seqcst:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::compare_exchange::u16::acquire_seqcst+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        and               a11, a4, a10
        ssl               a8
        sll               a11, a11
        ssl               a8
        sll               a12, a10
        movi.n            a10, -1
        xor               a12, a12, a10
        movi.n            a13, -4
        and               a13, a2, a13
        memw
        l32i.n            a14, a13, 0
        and               a4, a14, a12
        movi.n            a14, 0
        movi.n            a15, 1
1:
        mov.n             a6, a4
        or                a7, a6, a11
        or                a4, a6, a9
        wsr.scompare1     a4
        s32c1i            a7, a13, 0
        mov.n             a5, a15
        beq               a7, a4, 2f
        mov.n             a5, a14
2:
        bnez              a5, 3f
        and               a4, a7, a12
        bne               a6, a4, 1b
3:
        ssr               a8
        srl               a3, a7
        xor               a8, a5, a10
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n

.literal.asm_test::compare_exchange::u16::relaxed_seqcst:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::relaxed_seqcst:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::compare_exchange::u16::relaxed_seqcst+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        and               a11, a4, a10
        ssl               a8
        sll               a11, a11
        ssl               a8
        sll               a12, a10
        movi.n            a10, -1
        xor               a12, a12, a10
        movi.n            a13, -4
        and               a13, a2, a13
        memw
        l32i.n            a14, a13, 0
        and               a4, a14, a12
        movi.n            a14, 0
        movi.n            a15, 1
1:
        mov.n             a6, a4
        or                a7, a6, a11
        or                a4, a6, a9
        wsr.scompare1     a4
        s32c1i            a7, a13, 0
        mov.n             a5, a15
        beq               a7, a4, 2f
        mov.n             a5, a14
2:
        bnez              a5, 3f
        and               a4, a7, a12
        bne               a6, a4, 1b
3:
        ssr               a8
        srl               a3, a7
        xor               a8, a5, a10
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n

.literal.asm_test::compare_exchange::u16::release_seqcst:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::release_seqcst:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::compare_exchange::u16::release_seqcst+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        and               a11, a4, a10
        ssl               a8
        sll               a11, a11
        ssl               a8
        sll               a12, a10
        movi.n            a10, -1
        xor               a12, a12, a10
        movi.n            a13, -4
        and               a13, a2, a13
        memw
        l32i.n            a14, a13, 0
        and               a4, a14, a12
        movi.n            a14, 0
        movi.n            a15, 1
1:
        mov.n             a6, a4
        or                a7, a6, a11
        or                a4, a6, a9
        wsr.scompare1     a4
        s32c1i            a7, a13, 0
        mov.n             a5, a15
        beq               a7, a4, 2f
        mov.n             a5, a14
2:
        bnez              a5, 3f
        and               a4, a7, a12
        bne               a6, a4, 1b
3:
        ssr               a8
        srl               a3, a7
        xor               a8, a5, a10
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n

.literal.asm_test::compare_exchange::u16::seqcst_acquire:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::seqcst_acquire:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::compare_exchange::u16::seqcst_acquire+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        and               a11, a4, a10
        ssl               a8
        sll               a11, a11
        ssl               a8
        sll               a12, a10
        movi.n            a10, -1
        xor               a12, a12, a10
        movi.n            a13, -4
        and               a13, a2, a13
        memw
        l32i.n            a14, a13, 0
        and               a4, a14, a12
        movi.n            a14, 0
        movi.n            a15, 1
1:
        mov.n             a6, a4
        or                a7, a6, a11
        or                a4, a6, a9
        wsr.scompare1     a4
        s32c1i            a7, a13, 0
        mov.n             a5, a15
        beq               a7, a4, 2f
        mov.n             a5, a14
2:
        bnez              a5, 3f
        and               a4, a7, a12
        bne               a6, a4, 1b
3:
        ssr               a8
        srl               a3, a7
        xor               a8, a5, a10
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n

.literal.asm_test::compare_exchange::u16::seqcst_relaxed:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::seqcst_relaxed:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::compare_exchange::u16::seqcst_relaxed+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        and               a11, a4, a10
        ssl               a8
        sll               a11, a11
        ssl               a8
        sll               a12, a10
        movi.n            a10, -1
        xor               a12, a12, a10
        movi.n            a13, -4
        and               a13, a2, a13
        memw
        l32i.n            a14, a13, 0
        and               a4, a14, a12
        movi.n            a14, 0
        movi.n            a15, 1
1:
        mov.n             a6, a4
        or                a7, a6, a11
        or                a4, a6, a9
        wsr.scompare1     a4
        s32c1i            a7, a13, 0
        mov.n             a5, a15
        beq               a7, a4, 2f
        mov.n             a5, a14
2:
        bnez              a5, 3f
        and               a4, a7, a12
        bne               a6, a4, 1b
3:
        ssr               a8
        srl               a3, a7
        xor               a8, a5, a10
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n

.literal.asm_test::compare_exchange::u16::acquire_acquire:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::acquire_acquire:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::compare_exchange::u16::acquire_acquire+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        and               a11, a4, a10
        ssl               a8
        sll               a11, a11
        ssl               a8
        sll               a12, a10
        movi.n            a10, -1
        xor               a12, a12, a10
        movi.n            a13, -4
        and               a13, a2, a13
        l32i.n            a14, a13, 0
        and               a4, a14, a12
        movi.n            a14, 0
        movi.n            a15, 1
1:
        mov.n             a6, a4
        or                a7, a6, a11
        or                a4, a6, a9
        wsr.scompare1     a4
        s32c1i            a7, a13, 0
        mov.n             a5, a15
        beq               a7, a4, 2f
        mov.n             a5, a14
2:
        bnez              a5, 3f
        and               a4, a7, a12
        bne               a6, a4, 1b
3:
        ssr               a8
        srl               a3, a7
        xor               a8, a5, a10
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n

.literal.asm_test::compare_exchange::u16::acquire_relaxed:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::acquire_relaxed:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::compare_exchange::u16::acquire_relaxed+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        and               a11, a4, a10
        ssl               a8
        sll               a11, a11
        ssl               a8
        sll               a12, a10
        movi.n            a10, -1
        xor               a12, a12, a10
        movi.n            a13, -4
        and               a13, a2, a13
        l32i.n            a14, a13, 0
        and               a4, a14, a12
        movi.n            a14, 0
        movi.n            a15, 1
1:
        mov.n             a6, a4
        or                a7, a6, a11
        or                a4, a6, a9
        wsr.scompare1     a4
        s32c1i            a7, a13, 0
        mov.n             a5, a15
        beq               a7, a4, 2f
        mov.n             a5, a14
2:
        bnez              a5, 3f
        and               a4, a7, a12
        bne               a6, a4, 1b
3:
        ssr               a8
        srl               a3, a7
        xor               a8, a5, a10
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n

.literal.asm_test::compare_exchange::u16::relaxed_acquire:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::relaxed_acquire:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::compare_exchange::u16::relaxed_acquire+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        and               a11, a4, a10
        ssl               a8
        sll               a11, a11
        ssl               a8
        sll               a12, a10
        movi.n            a10, -1
        xor               a12, a12, a10
        movi.n            a13, -4
        and               a13, a2, a13
        l32i.n            a14, a13, 0
        and               a4, a14, a12
        movi.n            a14, 0
        movi.n            a15, 1
1:
        mov.n             a6, a4
        or                a7, a6, a11
        or                a4, a6, a9
        wsr.scompare1     a4
        s32c1i            a7, a13, 0
        mov.n             a5, a15
        beq               a7, a4, 2f
        mov.n             a5, a14
2:
        bnez              a5, 3f
        and               a4, a7, a12
        bne               a6, a4, 1b
3:
        ssr               a8
        srl               a3, a7
        xor               a8, a5, a10
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n

.literal.asm_test::compare_exchange::u16::relaxed_relaxed:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::relaxed_relaxed:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::compare_exchange::u16::relaxed_relaxed+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        and               a11, a4, a10
        ssl               a8
        sll               a11, a11
        ssl               a8
        sll               a12, a10
        movi.n            a10, -1
        xor               a12, a12, a10
        movi.n            a13, -4
        and               a13, a2, a13
        l32i.n            a14, a13, 0
        and               a4, a14, a12
        movi.n            a14, 0
        movi.n            a15, 1
1:
        mov.n             a6, a4
        or                a7, a6, a11
        or                a4, a6, a9
        wsr.scompare1     a4
        s32c1i            a7, a13, 0
        mov.n             a5, a15
        beq               a7, a4, 2f
        mov.n             a5, a14
2:
        bnez              a5, 3f
        and               a4, a7, a12
        bne               a6, a4, 1b
3:
        ssr               a8
        srl               a3, a7
        xor               a8, a5, a10
        movi.n            a9, 1
        and               a2, a8, a9
        retw.n

.literal.asm_test::compare_exchange::u16::release_acquire:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::release_acquire:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::compare_exchange::u16::release_acquire+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        and               a11, a4, a10
        ssl               a8
        sll               a11, a11
        ssl               a8
        sll               a12, a10
        movi.n            a10, -1
        xor               a12, a12, a10
        movi.n            a13, -4
        and               a13, a2, a13
        memw
        l32i.n            a14, a13, 0
        and               a4, a14, a12
        movi.n            a14, 0
        movi.n            a15, 1
1:
        mov.n             a6, a4
        or                a7, a6, a11
        or                a4, a6, a9
        wsr.scompare1     a4
        s32c1i            a7, a13, 0
        mov.n             a5, a15
        beq               a7, a4, 2f
        mov.n             a5, a14
2:
        bnez              a5, 3f
        and               a4, a7, a12
        bne               a6, a4, 1b
3:
        ssr               a8
        srl               a3, a7
        xor               a8, a5, a10
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n

.literal.asm_test::compare_exchange::u16::release_relaxed:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::release_relaxed:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::compare_exchange::u16::release_relaxed+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        and               a11, a4, a10
        ssl               a8
        sll               a11, a11
        ssl               a8
        sll               a12, a10
        movi.n            a10, -1
        xor               a12, a12, a10
        movi.n            a13, -4
        and               a13, a2, a13
        memw
        l32i.n            a14, a13, 0
        and               a4, a14, a12
        movi.n            a14, 0
        movi.n            a15, 1
1:
        mov.n             a6, a4
        or                a7, a6, a11
        or                a4, a6, a9
        wsr.scompare1     a4
        s32c1i            a7, a13, 0
        mov.n             a5, a15
        beq               a7, a4, 2f
        mov.n             a5, a14
2:
        bnez              a5, 3f
        and               a4, a7, a12
        bne               a6, a4, 1b
3:
        ssr               a8
        srl               a3, a7
        xor               a8, a5, a10
        movi.n            a9, 1
        and               a2, a8, a9
        retw.n

asm_test::compare_exchange::u32::acqrel_seqcst:
        entry             a1, 32
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 0f
        movi.n            a9, 0
0:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n

asm_test::compare_exchange::u32::seqcst_seqcst:
        entry             a1, 32
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 0f
        movi.n            a9, 0
0:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n

asm_test::compare_exchange::u32::acqrel_acquire:
        entry             a1, 32
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 0f
        movi.n            a9, 0
0:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n

asm_test::compare_exchange::u32::acqrel_relaxed:
        entry             a1, 32
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 0f
        movi.n            a9, 0
0:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n

asm_test::compare_exchange::u32::acquire_seqcst:
        entry             a1, 32
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 0f
        movi.n            a9, 0
0:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n

asm_test::compare_exchange::u32::relaxed_seqcst:
        entry             a1, 32
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 0f
        movi.n            a9, 0
0:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n

asm_test::compare_exchange::u32::release_seqcst:
        entry             a1, 32
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 0f
        movi.n            a9, 0
0:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n

asm_test::compare_exchange::u32::seqcst_acquire:
        entry             a1, 32
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 0f
        movi.n            a9, 0
0:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n

asm_test::compare_exchange::u32::seqcst_relaxed:
        entry             a1, 32
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 0f
        movi.n            a9, 0
0:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n

asm_test::compare_exchange::u32::acquire_acquire:
        entry             a1, 32
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 0f
        movi.n            a9, 0
0:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n

asm_test::compare_exchange::u32::acquire_relaxed:
        entry             a1, 32
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 0f
        movi.n            a9, 0
0:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n

asm_test::compare_exchange::u32::relaxed_acquire:
        entry             a1, 32
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 0f
        movi.n            a9, 0
0:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n

asm_test::compare_exchange::u32::relaxed_relaxed:
        entry             a1, 32
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 0f
        movi.n            a9, 0
0:
        xor               a2, a9, a8
        mov.n             a3, a4
        retw.n

asm_test::compare_exchange::u32::release_acquire:
        entry             a1, 32
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 0f
        movi.n            a9, 0
0:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n

asm_test::compare_exchange::u32::release_relaxed:
        entry             a1, 32
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 0f
        movi.n            a9, 0
0:
        xor               a2, a9, a8
        mov.n             a3, a4
        retw.n

asm_test::compare_exchange::bool::acqrel_seqcst:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi              a8, 255
        ssl               a9
        sll               a10, a8
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a12, a11, 0
        and               a2, a12, a10
        ssl               a9
        sll               a12, a3
        ssl               a9
        sll               a13, a4
        movi.n            a15, 0
        movi.n            a7, 1
0:
        mov.n             a5, a2
        or                a6, a5, a13
        or                a4, a5, a12
        wsr.scompare1     a4
        s32c1i            a6, a11, 0
        mov.n             a14, a7
        beq               a6, a4, 1f
        mov.n             a14, a15
1:
        bnez              a14, 2f
        and               a2, a6, a10
        bne               a5, a2, 0b
2:
        ssr               a9
        srl               a9, a6
        and               a10, a9, a8
        movi.n            a8, 1
        movi.n            a9, 0
        mov.n             a3, a8
        bne               a10, a9, 3f
        mov.n             a3, a9
3:
        xor               a2, a14, a8
        memw
        retw.n

asm_test::compare_exchange::bool::seqcst_seqcst:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi              a8, 255
        ssl               a9
        sll               a10, a8
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a12, a11, 0
        and               a2, a12, a10
        ssl               a9
        sll               a12, a3
        ssl               a9
        sll               a13, a4
        movi.n            a15, 0
        movi.n            a7, 1
0:
        mov.n             a5, a2
        or                a6, a5, a13
        or                a4, a5, a12
        wsr.scompare1     a4
        s32c1i            a6, a11, 0
        mov.n             a14, a7
        beq               a6, a4, 1f
        mov.n             a14, a15
1:
        bnez              a14, 2f
        and               a2, a6, a10
        bne               a5, a2, 0b
2:
        ssr               a9
        srl               a9, a6
        and               a10, a9, a8
        movi.n            a8, 1
        movi.n            a9, 0
        mov.n             a3, a8
        bne               a10, a9, 3f
        mov.n             a3, a9
3:
        xor               a2, a14, a8
        memw
        retw.n

asm_test::compare_exchange::bool::acqrel_acquire:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi              a8, 255
        ssl               a9
        sll               a10, a8
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a12, a11, 0
        and               a2, a12, a10
        ssl               a9
        sll               a12, a3
        ssl               a9
        sll               a13, a4
        movi.n            a15, 0
        movi.n            a7, 1
0:
        mov.n             a5, a2
        or                a6, a5, a13
        or                a4, a5, a12
        wsr.scompare1     a4
        s32c1i            a6, a11, 0
        mov.n             a14, a7
        beq               a6, a4, 1f
        mov.n             a14, a15
1:
        bnez              a14, 2f
        and               a2, a6, a10
        bne               a5, a2, 0b
2:
        ssr               a9
        srl               a9, a6
        and               a10, a9, a8
        movi.n            a8, 1
        movi.n            a9, 0
        mov.n             a3, a8
        bne               a10, a9, 3f
        mov.n             a3, a9
3:
        xor               a2, a14, a8
        memw
        retw.n

asm_test::compare_exchange::bool::acqrel_relaxed:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi              a8, 255
        ssl               a9
        sll               a10, a8
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a12, a11, 0
        and               a2, a12, a10
        ssl               a9
        sll               a12, a3
        ssl               a9
        sll               a13, a4
        movi.n            a15, 0
        movi.n            a7, 1
0:
        mov.n             a5, a2
        or                a6, a5, a13
        or                a4, a5, a12
        wsr.scompare1     a4
        s32c1i            a6, a11, 0
        mov.n             a14, a7
        beq               a6, a4, 1f
        mov.n             a14, a15
1:
        bnez              a14, 2f
        and               a2, a6, a10
        bne               a5, a2, 0b
2:
        ssr               a9
        srl               a9, a6
        and               a10, a9, a8
        movi.n            a8, 1
        movi.n            a9, 0
        mov.n             a3, a8
        bne               a10, a9, 3f
        mov.n             a3, a9
3:
        xor               a2, a14, a8
        memw
        retw.n

asm_test::compare_exchange::bool::acquire_seqcst:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi              a8, 255
        ssl               a9
        sll               a10, a8
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a12, a11, 0
        and               a2, a12, a10
        ssl               a9
        sll               a12, a3
        ssl               a9
        sll               a13, a4
        movi.n            a15, 0
        movi.n            a7, 1
0:
        mov.n             a5, a2
        or                a6, a5, a13
        or                a4, a5, a12
        wsr.scompare1     a4
        s32c1i            a6, a11, 0
        mov.n             a14, a7
        beq               a6, a4, 1f
        mov.n             a14, a15
1:
        bnez              a14, 2f
        and               a2, a6, a10
        bne               a5, a2, 0b
2:
        ssr               a9
        srl               a9, a6
        and               a10, a9, a8
        movi.n            a8, 1
        movi.n            a9, 0
        mov.n             a3, a8
        bne               a10, a9, 3f
        mov.n             a3, a9
3:
        xor               a2, a14, a8
        memw
        retw.n

asm_test::compare_exchange::bool::relaxed_seqcst:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi              a8, 255
        ssl               a9
        sll               a10, a8
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a12, a11, 0
        and               a2, a12, a10
        ssl               a9
        sll               a12, a3
        ssl               a9
        sll               a13, a4
        movi.n            a15, 0
        movi.n            a7, 1
0:
        mov.n             a5, a2
        or                a6, a5, a13
        or                a4, a5, a12
        wsr.scompare1     a4
        s32c1i            a6, a11, 0
        mov.n             a14, a7
        beq               a6, a4, 1f
        mov.n             a14, a15
1:
        bnez              a14, 2f
        and               a2, a6, a10
        bne               a5, a2, 0b
2:
        ssr               a9
        srl               a9, a6
        and               a10, a9, a8
        movi.n            a8, 1
        movi.n            a9, 0
        mov.n             a3, a8
        bne               a10, a9, 3f
        mov.n             a3, a9
3:
        xor               a2, a14, a8
        memw
        retw.n

asm_test::compare_exchange::bool::release_seqcst:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi              a8, 255
        ssl               a9
        sll               a10, a8
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a12, a11, 0
        and               a2, a12, a10
        ssl               a9
        sll               a12, a3
        ssl               a9
        sll               a13, a4
        movi.n            a15, 0
        movi.n            a7, 1
0:
        mov.n             a5, a2
        or                a6, a5, a13
        or                a4, a5, a12
        wsr.scompare1     a4
        s32c1i            a6, a11, 0
        mov.n             a14, a7
        beq               a6, a4, 1f
        mov.n             a14, a15
1:
        bnez              a14, 2f
        and               a2, a6, a10
        bne               a5, a2, 0b
2:
        ssr               a9
        srl               a9, a6
        and               a10, a9, a8
        movi.n            a8, 1
        movi.n            a9, 0
        mov.n             a3, a8
        bne               a10, a9, 3f
        mov.n             a3, a9
3:
        xor               a2, a14, a8
        memw
        retw.n

asm_test::compare_exchange::bool::seqcst_acquire:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi              a8, 255
        ssl               a9
        sll               a10, a8
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a12, a11, 0
        and               a2, a12, a10
        ssl               a9
        sll               a12, a3
        ssl               a9
        sll               a13, a4
        movi.n            a15, 0
        movi.n            a7, 1
0:
        mov.n             a5, a2
        or                a6, a5, a13
        or                a4, a5, a12
        wsr.scompare1     a4
        s32c1i            a6, a11, 0
        mov.n             a14, a7
        beq               a6, a4, 1f
        mov.n             a14, a15
1:
        bnez              a14, 2f
        and               a2, a6, a10
        bne               a5, a2, 0b
2:
        ssr               a9
        srl               a9, a6
        and               a10, a9, a8
        movi.n            a8, 1
        movi.n            a9, 0
        mov.n             a3, a8
        bne               a10, a9, 3f
        mov.n             a3, a9
3:
        xor               a2, a14, a8
        memw
        retw.n

asm_test::compare_exchange::bool::seqcst_relaxed:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi              a8, 255
        ssl               a9
        sll               a10, a8
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a12, a11, 0
        and               a2, a12, a10
        ssl               a9
        sll               a12, a3
        ssl               a9
        sll               a13, a4
        movi.n            a15, 0
        movi.n            a7, 1
0:
        mov.n             a5, a2
        or                a6, a5, a13
        or                a4, a5, a12
        wsr.scompare1     a4
        s32c1i            a6, a11, 0
        mov.n             a14, a7
        beq               a6, a4, 1f
        mov.n             a14, a15
1:
        bnez              a14, 2f
        and               a2, a6, a10
        bne               a5, a2, 0b
2:
        ssr               a9
        srl               a9, a6
        and               a10, a9, a8
        movi.n            a8, 1
        movi.n            a9, 0
        mov.n             a3, a8
        bne               a10, a9, 3f
        mov.n             a3, a9
3:
        xor               a2, a14, a8
        memw
        retw.n

asm_test::compare_exchange::bool::acquire_acquire:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi              a8, 255
        ssl               a9
        sll               a10, a8
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a12, a11, 0
        and               a2, a12, a10
        ssl               a9
        sll               a12, a3
        ssl               a9
        sll               a13, a4
        movi.n            a15, 0
        movi.n            a7, 1
0:
        mov.n             a5, a2
        or                a6, a5, a13
        or                a4, a5, a12
        wsr.scompare1     a4
        s32c1i            a6, a11, 0
        mov.n             a14, a7
        beq               a6, a4, 1f
        mov.n             a14, a15
1:
        bnez              a14, 2f
        and               a2, a6, a10
        bne               a5, a2, 0b
2:
        ssr               a9
        srl               a9, a6
        and               a10, a9, a8
        movi.n            a8, 1
        movi.n            a9, 0
        mov.n             a3, a8
        bne               a10, a9, 3f
        mov.n             a3, a9
3:
        xor               a2, a14, a8
        memw
        retw.n

asm_test::compare_exchange::bool::acquire_relaxed:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi              a8, 255
        ssl               a9
        sll               a10, a8
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a12, a11, 0
        and               a2, a12, a10
        ssl               a9
        sll               a12, a3
        ssl               a9
        sll               a13, a4
        movi.n            a15, 0
        movi.n            a7, 1
0:
        mov.n             a5, a2
        or                a6, a5, a13
        or                a4, a5, a12
        wsr.scompare1     a4
        s32c1i            a6, a11, 0
        mov.n             a14, a7
        beq               a6, a4, 1f
        mov.n             a14, a15
1:
        bnez              a14, 2f
        and               a2, a6, a10
        bne               a5, a2, 0b
2:
        ssr               a9
        srl               a9, a6
        and               a10, a9, a8
        movi.n            a8, 1
        movi.n            a9, 0
        mov.n             a3, a8
        bne               a10, a9, 3f
        mov.n             a3, a9
3:
        xor               a2, a14, a8
        memw
        retw.n

asm_test::compare_exchange::bool::relaxed_acquire:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi              a8, 255
        ssl               a9
        sll               a10, a8
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a12, a11, 0
        and               a2, a12, a10
        ssl               a9
        sll               a12, a3
        ssl               a9
        sll               a13, a4
        movi.n            a15, 0
        movi.n            a7, 1
0:
        mov.n             a5, a2
        or                a6, a5, a13
        or                a4, a5, a12
        wsr.scompare1     a4
        s32c1i            a6, a11, 0
        mov.n             a14, a7
        beq               a6, a4, 1f
        mov.n             a14, a15
1:
        bnez              a14, 2f
        and               a2, a6, a10
        bne               a5, a2, 0b
2:
        ssr               a9
        srl               a9, a6
        and               a10, a9, a8
        movi.n            a8, 1
        movi.n            a9, 0
        mov.n             a3, a8
        bne               a10, a9, 3f
        mov.n             a3, a9
3:
        xor               a2, a14, a8
        memw
        retw.n

asm_test::compare_exchange::bool::relaxed_relaxed:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi              a8, 255
        ssl               a9
        sll               a10, a8
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a12, a11, 0
        and               a2, a12, a10
        ssl               a9
        sll               a12, a3
        ssl               a9
        sll               a13, a4
        movi.n            a15, 0
        movi.n            a7, 1
0:
        mov.n             a5, a2
        or                a6, a5, a13
        or                a4, a5, a12
        wsr.scompare1     a4
        s32c1i            a6, a11, 0
        mov.n             a14, a7
        beq               a6, a4, 1f
        mov.n             a14, a15
1:
        bnez              a14, 2f
        and               a2, a6, a10
        bne               a5, a2, 0b
2:
        ssr               a9
        srl               a9, a6
        and               a10, a9, a8
        movi.n            a8, 1
        movi.n            a9, 0
        mov.n             a3, a8
        bne               a10, a9, 3f
        mov.n             a3, a9
3:
        xor               a2, a14, a8
        retw.n

asm_test::compare_exchange::bool::release_acquire:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi              a8, 255
        ssl               a9
        sll               a10, a8
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a12, a11, 0
        and               a2, a12, a10
        ssl               a9
        sll               a12, a3
        ssl               a9
        sll               a13, a4
        movi.n            a15, 0
        movi.n            a7, 1
0:
        mov.n             a5, a2
        or                a6, a5, a13
        or                a4, a5, a12
        wsr.scompare1     a4
        s32c1i            a6, a11, 0
        mov.n             a14, a7
        beq               a6, a4, 1f
        mov.n             a14, a15
1:
        bnez              a14, 2f
        and               a2, a6, a10
        bne               a5, a2, 0b
2:
        ssr               a9
        srl               a9, a6
        and               a10, a9, a8
        movi.n            a8, 1
        movi.n            a9, 0
        mov.n             a3, a8
        bne               a10, a9, 3f
        mov.n             a3, a9
3:
        xor               a2, a14, a8
        memw
        retw.n

asm_test::compare_exchange::bool::release_relaxed:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi              a8, 255
        ssl               a9
        sll               a10, a8
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a12, a11, 0
        and               a2, a12, a10
        ssl               a9
        sll               a12, a3
        ssl               a9
        sll               a13, a4
        movi.n            a15, 0
        movi.n            a7, 1
0:
        mov.n             a5, a2
        or                a6, a5, a13
        or                a4, a5, a12
        wsr.scompare1     a4
        s32c1i            a6, a11, 0
        mov.n             a14, a7
        beq               a6, a4, 1f
        mov.n             a14, a15
1:
        bnez              a14, 2f
        and               a2, a6, a10
        bne               a5, a2, 0b
2:
        ssr               a9
        srl               a9, a6
        and               a10, a9, a8
        movi.n            a8, 1
        movi.n            a9, 0
        mov.n             a3, a8
        bne               a10, a9, 3f
        mov.n             a3, a9
3:
        xor               a2, a14, a8
        retw.n

asm_test::compare_exchange_weak::u8::acqrel_seqcst:
        entry             a1, 32
        movi              a11, 255
        and               a9, a3, a11
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a10, a9
        and               a9, a4, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a11, a11
        movi.n            a12, -1
        xor               a12, a11, a12
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a13, a11, 0
        and               a12, a13, a12
        or                a9, a12, a9
        or                a10, a12, a10
        wsr.scompare1     a10
        s32c1i            a9, a11, 0
        beq               a9, a10, 0f
        movi.n            a10, 0
        j                 1f
0:
        movi.n            a10, 1
1:
        movi.n            a11, 1
        xor               a2, a10, a11
        ssr               a8
        srl               a3, a9
        memw
        retw.n

asm_test::compare_exchange_weak::u8::seqcst_seqcst:
        entry             a1, 32
        movi              a11, 255
        and               a9, a3, a11
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a10, a9
        and               a9, a4, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a11, a11
        movi.n            a12, -1
        xor               a12, a11, a12
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a13, a11, 0
        and               a12, a13, a12
        or                a9, a12, a9
        or                a10, a12, a10
        wsr.scompare1     a10
        s32c1i            a9, a11, 0
        beq               a9, a10, 0f
        movi.n            a10, 0
        j                 1f
0:
        movi.n            a10, 1
1:
        movi.n            a11, 1
        xor               a2, a10, a11
        ssr               a8
        srl               a3, a9
        memw
        retw.n

asm_test::compare_exchange_weak::u8::acqrel_acquire:
        entry             a1, 32
        movi              a11, 255
        and               a9, a3, a11
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a10, a9
        and               a9, a4, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a11, a11
        movi.n            a12, -1
        xor               a12, a11, a12
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a13, a11, 0
        and               a12, a13, a12
        or                a9, a12, a9
        or                a10, a12, a10
        wsr.scompare1     a10
        s32c1i            a9, a11, 0
        beq               a9, a10, 0f
        movi.n            a10, 0
        j                 1f
0:
        movi.n            a10, 1
1:
        movi.n            a11, 1
        xor               a2, a10, a11
        ssr               a8
        srl               a3, a9
        memw
        retw.n

asm_test::compare_exchange_weak::u8::acqrel_relaxed:
        entry             a1, 32
        movi              a11, 255
        and               a9, a3, a11
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a10, a9
        and               a9, a4, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a11, a11
        movi.n            a12, -1
        xor               a12, a11, a12
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a13, a11, 0
        and               a12, a13, a12
        or                a9, a12, a9
        or                a10, a12, a10
        wsr.scompare1     a10
        s32c1i            a9, a11, 0
        beq               a9, a10, 0f
        movi.n            a10, 0
        j                 1f
0:
        movi.n            a10, 1
1:
        movi.n            a11, 1
        xor               a2, a10, a11
        ssr               a8
        srl               a3, a9
        memw
        retw.n

asm_test::compare_exchange_weak::u8::acquire_seqcst:
        entry             a1, 32
        movi              a11, 255
        and               a9, a3, a11
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a10, a9
        and               a9, a4, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a11, a11
        movi.n            a12, -1
        xor               a12, a11, a12
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a13, a11, 0
        and               a12, a13, a12
        or                a9, a12, a9
        or                a10, a12, a10
        wsr.scompare1     a10
        s32c1i            a9, a11, 0
        beq               a9, a10, 0f
        movi.n            a10, 0
        j                 1f
0:
        movi.n            a10, 1
1:
        movi.n            a11, 1
        xor               a2, a10, a11
        ssr               a8
        srl               a3, a9
        memw
        retw.n

asm_test::compare_exchange_weak::u8::relaxed_seqcst:
        entry             a1, 32
        movi              a11, 255
        and               a9, a3, a11
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a10, a9
        and               a9, a4, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a11, a11
        movi.n            a12, -1
        xor               a12, a11, a12
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a13, a11, 0
        and               a12, a13, a12
        or                a9, a12, a9
        or                a10, a12, a10
        wsr.scompare1     a10
        s32c1i            a9, a11, 0
        beq               a9, a10, 0f
        movi.n            a10, 0
        j                 1f
0:
        movi.n            a10, 1
1:
        movi.n            a11, 1
        xor               a2, a10, a11
        ssr               a8
        srl               a3, a9
        memw
        retw.n

asm_test::compare_exchange_weak::u8::release_seqcst:
        entry             a1, 32
        movi              a11, 255
        and               a9, a3, a11
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a10, a9
        and               a9, a4, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a11, a11
        movi.n            a12, -1
        xor               a12, a11, a12
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a13, a11, 0
        and               a12, a13, a12
        or                a9, a12, a9
        or                a10, a12, a10
        wsr.scompare1     a10
        s32c1i            a9, a11, 0
        beq               a9, a10, 0f
        movi.n            a10, 0
        j                 1f
0:
        movi.n            a10, 1
1:
        movi.n            a11, 1
        xor               a2, a10, a11
        ssr               a8
        srl               a3, a9
        memw
        retw.n

asm_test::compare_exchange_weak::u8::seqcst_acquire:
        entry             a1, 32
        movi              a11, 255
        and               a9, a3, a11
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a10, a9
        and               a9, a4, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a11, a11
        movi.n            a12, -1
        xor               a12, a11, a12
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a13, a11, 0
        and               a12, a13, a12
        or                a9, a12, a9
        or                a10, a12, a10
        wsr.scompare1     a10
        s32c1i            a9, a11, 0
        beq               a9, a10, 0f
        movi.n            a10, 0
        j                 1f
0:
        movi.n            a10, 1
1:
        movi.n            a11, 1
        xor               a2, a10, a11
        ssr               a8
        srl               a3, a9
        memw
        retw.n

asm_test::compare_exchange_weak::u8::seqcst_relaxed:
        entry             a1, 32
        movi              a11, 255
        and               a9, a3, a11
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a10, a9
        and               a9, a4, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a11, a11
        movi.n            a12, -1
        xor               a12, a11, a12
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a13, a11, 0
        and               a12, a13, a12
        or                a9, a12, a9
        or                a10, a12, a10
        wsr.scompare1     a10
        s32c1i            a9, a11, 0
        beq               a9, a10, 0f
        movi.n            a10, 0
        j                 1f
0:
        movi.n            a10, 1
1:
        movi.n            a11, 1
        xor               a2, a10, a11
        ssr               a8
        srl               a3, a9
        memw
        retw.n

asm_test::compare_exchange_weak::u8::acquire_acquire:
        entry             a1, 32
        movi              a11, 255
        and               a9, a3, a11
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a10, a9
        and               a9, a4, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a11, a11
        movi.n            a12, -1
        xor               a12, a11, a12
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a13, a11, 0
        and               a12, a13, a12
        or                a9, a12, a9
        or                a10, a12, a10
        wsr.scompare1     a10
        s32c1i            a9, a11, 0
        beq               a9, a10, 0f
        movi.n            a10, 0
        j                 1f
0:
        movi.n            a10, 1
1:
        movi.n            a11, 1
        xor               a2, a10, a11
        ssr               a8
        srl               a3, a9
        memw
        retw.n

asm_test::compare_exchange_weak::u8::acquire_relaxed:
        entry             a1, 32
        movi              a11, 255
        and               a9, a3, a11
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a10, a9
        and               a9, a4, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a11, a11
        movi.n            a12, -1
        xor               a12, a11, a12
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a13, a11, 0
        and               a12, a13, a12
        or                a9, a12, a9
        or                a10, a12, a10
        wsr.scompare1     a10
        s32c1i            a9, a11, 0
        beq               a9, a10, 0f
        movi.n            a10, 0
        j                 1f
0:
        movi.n            a10, 1
1:
        movi.n            a11, 1
        xor               a2, a10, a11
        ssr               a8
        srl               a3, a9
        memw
        retw.n

asm_test::compare_exchange_weak::u8::relaxed_acquire:
        entry             a1, 32
        movi              a11, 255
        and               a9, a3, a11
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a10, a9
        and               a9, a4, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a11, a11
        movi.n            a12, -1
        xor               a12, a11, a12
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a13, a11, 0
        and               a12, a13, a12
        or                a9, a12, a9
        or                a10, a12, a10
        wsr.scompare1     a10
        s32c1i            a9, a11, 0
        beq               a9, a10, 0f
        movi.n            a10, 0
        j                 1f
0:
        movi.n            a10, 1
1:
        movi.n            a11, 1
        xor               a2, a10, a11
        ssr               a8
        srl               a3, a9
        memw
        retw.n

asm_test::compare_exchange_weak::u8::relaxed_relaxed:
        entry             a1, 32
        movi              a11, 255
        and               a9, a3, a11
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a10, a9
        and               a9, a4, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a11, a11
        movi.n            a12, -1
        xor               a12, a11, a12
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a13, a11, 0
        and               a12, a13, a12
        or                a9, a12, a9
        or                a10, a12, a10
        wsr.scompare1     a10
        s32c1i            a9, a11, 0
        beq               a9, a10, 0f
        movi.n            a10, 0
        j                 1f
0:
        movi.n            a10, 1
1:
        movi.n            a11, 1
        xor               a2, a10, a11
        ssr               a8
        srl               a3, a9
        retw.n

asm_test::compare_exchange_weak::u8::release_acquire:
        entry             a1, 32
        movi              a11, 255
        and               a9, a3, a11
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a10, a9
        and               a9, a4, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a11, a11
        movi.n            a12, -1
        xor               a12, a11, a12
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a13, a11, 0
        and               a12, a13, a12
        or                a9, a12, a9
        or                a10, a12, a10
        wsr.scompare1     a10
        s32c1i            a9, a11, 0
        beq               a9, a10, 0f
        movi.n            a10, 0
        j                 1f
0:
        movi.n            a10, 1
1:
        movi.n            a11, 1
        xor               a2, a10, a11
        ssr               a8
        srl               a3, a9
        memw
        retw.n

asm_test::compare_exchange_weak::u8::release_relaxed:
        entry             a1, 32
        movi              a11, 255
        and               a9, a3, a11
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a10, a9
        and               a9, a4, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a11, a11
        movi.n            a12, -1
        xor               a12, a11, a12
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a13, a11, 0
        and               a12, a13, a12
        or                a9, a12, a9
        or                a10, a12, a10
        wsr.scompare1     a10
        s32c1i            a9, a11, 0
        beq               a9, a10, 0f
        movi.n            a10, 0
        j                 1f
0:
        movi.n            a10, 1
1:
        movi.n            a11, 1
        xor               a2, a10, a11
        ssr               a8
        srl               a3, a9
        retw.n

.literal.asm_test::compare_exchange_weak::u16::acqrel_seqcst:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::acqrel_seqcst:
0:
        entry             a1, 32
        l32r              a9, 0b (91004136 <asm_test::compare_exchange_weak::u16::acqrel_seqcst+0x91004136>)
        and               a10, a3, a9
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a11, a10
        and               a10, a4, a9
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a12, a9
        movi.n            a9, -1
        xor               a13, a12, a9
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a14, a12, 0
        and               a13, a14, a13
        or                a10, a13, a10
        or                a11, a13, a11
        wsr.scompare1     a11
        s32c1i            a10, a12, 0
        beq               a10, a11, 1f
        movi.n            a11, 0
        j                 2f
1:
        movi.n            a11, 1
2:
        ssr               a8
        srl               a3, a10
        xor               a8, a11, a9
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n

.literal.asm_test::compare_exchange_weak::u16::seqcst_seqcst:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::seqcst_seqcst:
0:
        entry             a1, 32
        l32r              a9, 0b (91004136 <asm_test::compare_exchange_weak::u16::seqcst_seqcst+0x91004136>)
        and               a10, a3, a9
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a11, a10
        and               a10, a4, a9
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a12, a9
        movi.n            a9, -1
        xor               a13, a12, a9
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a14, a12, 0
        and               a13, a14, a13
        or                a10, a13, a10
        or                a11, a13, a11
        wsr.scompare1     a11
        s32c1i            a10, a12, 0
        beq               a10, a11, 1f
        movi.n            a11, 0
        j                 2f
1:
        movi.n            a11, 1
2:
        ssr               a8
        srl               a3, a10
        xor               a8, a11, a9
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n

.literal.asm_test::compare_exchange_weak::u16::acqrel_acquire:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::acqrel_acquire:
0:
        entry             a1, 32
        l32r              a9, 0b (91004136 <asm_test::compare_exchange_weak::u16::acqrel_acquire+0x91004136>)
        and               a10, a3, a9
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a11, a10
        and               a10, a4, a9
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a12, a9
        movi.n            a9, -1
        xor               a13, a12, a9
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a14, a12, 0
        and               a13, a14, a13
        or                a10, a13, a10
        or                a11, a13, a11
        wsr.scompare1     a11
        s32c1i            a10, a12, 0
        beq               a10, a11, 1f
        movi.n            a11, 0
        j                 2f
1:
        movi.n            a11, 1
2:
        ssr               a8
        srl               a3, a10
        xor               a8, a11, a9
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n

.literal.asm_test::compare_exchange_weak::u16::acqrel_relaxed:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::acqrel_relaxed:
0:
        entry             a1, 32
        l32r              a9, 0b (91004136 <asm_test::compare_exchange_weak::u16::acqrel_relaxed+0x91004136>)
        and               a10, a3, a9
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a11, a10
        and               a10, a4, a9
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a12, a9
        movi.n            a9, -1
        xor               a13, a12, a9
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a14, a12, 0
        and               a13, a14, a13
        or                a10, a13, a10
        or                a11, a13, a11
        wsr.scompare1     a11
        s32c1i            a10, a12, 0
        beq               a10, a11, 1f
        movi.n            a11, 0
        j                 2f
1:
        movi.n            a11, 1
2:
        ssr               a8
        srl               a3, a10
        xor               a8, a11, a9
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n

.literal.asm_test::compare_exchange_weak::u16::acquire_seqcst:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::acquire_seqcst:
0:
        entry             a1, 32
        l32r              a9, 0b (91004136 <asm_test::compare_exchange_weak::u16::acquire_seqcst+0x91004136>)
        and               a10, a3, a9
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a11, a10
        and               a10, a4, a9
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a12, a9
        movi.n            a9, -1
        xor               a13, a12, a9
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a14, a12, 0
        and               a13, a14, a13
        or                a10, a13, a10
        or                a11, a13, a11
        wsr.scompare1     a11
        s32c1i            a10, a12, 0
        beq               a10, a11, 1f
        movi.n            a11, 0
        j                 2f
1:
        movi.n            a11, 1
2:
        ssr               a8
        srl               a3, a10
        xor               a8, a11, a9
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n

.literal.asm_test::compare_exchange_weak::u16::relaxed_seqcst:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::relaxed_seqcst:
0:
        entry             a1, 32
        l32r              a9, 0b (91004136 <asm_test::compare_exchange_weak::u16::relaxed_seqcst+0x91004136>)
        and               a10, a3, a9
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a11, a10
        and               a10, a4, a9
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a12, a9
        movi.n            a9, -1
        xor               a13, a12, a9
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a14, a12, 0
        and               a13, a14, a13
        or                a10, a13, a10
        or                a11, a13, a11
        wsr.scompare1     a11
        s32c1i            a10, a12, 0
        beq               a10, a11, 1f
        movi.n            a11, 0
        j                 2f
1:
        movi.n            a11, 1
2:
        ssr               a8
        srl               a3, a10
        xor               a8, a11, a9
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n

.literal.asm_test::compare_exchange_weak::u16::release_seqcst:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::release_seqcst:
0:
        entry             a1, 32
        l32r              a9, 0b (91004136 <asm_test::compare_exchange_weak::u16::release_seqcst+0x91004136>)
        and               a10, a3, a9
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a11, a10
        and               a10, a4, a9
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a12, a9
        movi.n            a9, -1
        xor               a13, a12, a9
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a14, a12, 0
        and               a13, a14, a13
        or                a10, a13, a10
        or                a11, a13, a11
        wsr.scompare1     a11
        s32c1i            a10, a12, 0
        beq               a10, a11, 1f
        movi.n            a11, 0
        j                 2f
1:
        movi.n            a11, 1
2:
        ssr               a8
        srl               a3, a10
        xor               a8, a11, a9
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n

.literal.asm_test::compare_exchange_weak::u16::seqcst_acquire:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::seqcst_acquire:
0:
        entry             a1, 32
        l32r              a9, 0b (91004136 <asm_test::compare_exchange_weak::u16::seqcst_acquire+0x91004136>)
        and               a10, a3, a9
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a11, a10
        and               a10, a4, a9
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a12, a9
        movi.n            a9, -1
        xor               a13, a12, a9
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a14, a12, 0
        and               a13, a14, a13
        or                a10, a13, a10
        or                a11, a13, a11
        wsr.scompare1     a11
        s32c1i            a10, a12, 0
        beq               a10, a11, 1f
        movi.n            a11, 0
        j                 2f
1:
        movi.n            a11, 1
2:
        ssr               a8
        srl               a3, a10
        xor               a8, a11, a9
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n

.literal.asm_test::compare_exchange_weak::u16::seqcst_relaxed:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::seqcst_relaxed:
0:
        entry             a1, 32
        l32r              a9, 0b (91004136 <asm_test::compare_exchange_weak::u16::seqcst_relaxed+0x91004136>)
        and               a10, a3, a9
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a11, a10
        and               a10, a4, a9
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a12, a9
        movi.n            a9, -1
        xor               a13, a12, a9
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a14, a12, 0
        and               a13, a14, a13
        or                a10, a13, a10
        or                a11, a13, a11
        wsr.scompare1     a11
        s32c1i            a10, a12, 0
        beq               a10, a11, 1f
        movi.n            a11, 0
        j                 2f
1:
        movi.n            a11, 1
2:
        ssr               a8
        srl               a3, a10
        xor               a8, a11, a9
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n

.literal.asm_test::compare_exchange_weak::u16::acquire_acquire:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::acquire_acquire:
0:
        entry             a1, 32
        l32r              a9, 0b (91004136 <asm_test::compare_exchange_weak::u16::acquire_acquire+0x91004136>)
        and               a10, a3, a9
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a11, a10
        and               a10, a4, a9
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a12, a9
        movi.n            a9, -1
        xor               a13, a12, a9
        movi.n            a12, -4
        and               a12, a2, a12
        l32i.n            a14, a12, 0
        and               a13, a14, a13
        or                a10, a13, a10
        or                a11, a13, a11
        wsr.scompare1     a11
        s32c1i            a10, a12, 0
        beq               a10, a11, 1f
        movi.n            a11, 0
        j                 2f
1:
        movi.n            a11, 1
2:
        ssr               a8
        srl               a3, a10
        xor               a8, a11, a9
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n

.literal.asm_test::compare_exchange_weak::u16::acquire_relaxed:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::acquire_relaxed:
0:
        entry             a1, 32
        l32r              a9, 0b (91004136 <asm_test::compare_exchange_weak::u16::acquire_relaxed+0x91004136>)
        and               a10, a3, a9
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a11, a10
        and               a10, a4, a9
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a12, a9
        movi.n            a9, -1
        xor               a13, a12, a9
        movi.n            a12, -4
        and               a12, a2, a12
        l32i.n            a14, a12, 0
        and               a13, a14, a13
        or                a10, a13, a10
        or                a11, a13, a11
        wsr.scompare1     a11
        s32c1i            a10, a12, 0
        beq               a10, a11, 1f
        movi.n            a11, 0
        j                 2f
1:
        movi.n            a11, 1
2:
        ssr               a8
        srl               a3, a10
        xor               a8, a11, a9
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n

.literal.asm_test::compare_exchange_weak::u16::relaxed_acquire:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::relaxed_acquire:
0:
        entry             a1, 32
        l32r              a9, 0b (91004136 <asm_test::compare_exchange_weak::u16::relaxed_acquire+0x91004136>)
        and               a10, a3, a9
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a11, a10
        and               a10, a4, a9
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a12, a9
        movi.n            a9, -1
        xor               a13, a12, a9
        movi.n            a12, -4
        and               a12, a2, a12
        l32i.n            a14, a12, 0
        and               a13, a14, a13
        or                a10, a13, a10
        or                a11, a13, a11
        wsr.scompare1     a11
        s32c1i            a10, a12, 0
        beq               a10, a11, 1f
        movi.n            a11, 0
        j                 2f
1:
        movi.n            a11, 1
2:
        ssr               a8
        srl               a3, a10
        xor               a8, a11, a9
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n

.literal.asm_test::compare_exchange_weak::u16::relaxed_relaxed:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::relaxed_relaxed:
0:
        entry             a1, 32
        l32r              a9, 0b (91004136 <asm_test::compare_exchange_weak::u16::relaxed_relaxed+0x91004136>)
        and               a10, a3, a9
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a11, a10
        and               a10, a4, a9
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a12, a9
        movi.n            a9, -1
        xor               a13, a12, a9
        movi.n            a12, -4
        and               a12, a2, a12
        l32i.n            a14, a12, 0
        and               a13, a14, a13
        or                a10, a13, a10
        or                a11, a13, a11
        wsr.scompare1     a11
        s32c1i            a10, a12, 0
        beq               a10, a11, 1f
        movi.n            a11, 0
        j                 2f
1:
        movi.n            a11, 1
2:
        ssr               a8
        srl               a3, a10
        xor               a8, a11, a9
        movi.n            a9, 1
        and               a2, a8, a9
        retw.n

.literal.asm_test::compare_exchange_weak::u16::release_acquire:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::release_acquire:
0:
        entry             a1, 32
        l32r              a9, 0b (91004136 <asm_test::compare_exchange_weak::u16::release_acquire+0x91004136>)
        and               a10, a3, a9
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a11, a10
        and               a10, a4, a9
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a12, a9
        movi.n            a9, -1
        xor               a13, a12, a9
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a14, a12, 0
        and               a13, a14, a13
        or                a10, a13, a10
        or                a11, a13, a11
        wsr.scompare1     a11
        s32c1i            a10, a12, 0
        beq               a10, a11, 1f
        movi.n            a11, 0
        j                 2f
1:
        movi.n            a11, 1
2:
        ssr               a8
        srl               a3, a10
        xor               a8, a11, a9
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n

.literal.asm_test::compare_exchange_weak::u16::release_relaxed:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::release_relaxed:
0:
        entry             a1, 32
        l32r              a9, 0b (91004136 <asm_test::compare_exchange_weak::u16::release_relaxed+0x91004136>)
        and               a10, a3, a9
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a11, a10
        and               a10, a4, a9
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a12, a9
        movi.n            a9, -1
        xor               a13, a12, a9
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a14, a12, 0
        and               a13, a14, a13
        or                a10, a13, a10
        or                a11, a13, a11
        wsr.scompare1     a11
        s32c1i            a10, a12, 0
        beq               a10, a11, 1f
        movi.n            a11, 0
        j                 2f
1:
        movi.n            a11, 1
2:
        ssr               a8
        srl               a3, a10
        xor               a8, a11, a9
        movi.n            a9, 1
        and               a2, a8, a9
        retw.n

asm_test::compare_exchange_weak::u32::acqrel_seqcst:
        entry             a1, 32
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 0f
        movi.n            a9, 0
0:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n

asm_test::compare_exchange_weak::u32::seqcst_seqcst:
        entry             a1, 32
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 0f
        movi.n            a9, 0
0:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n

asm_test::compare_exchange_weak::u32::acqrel_acquire:
        entry             a1, 32
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 0f
        movi.n            a9, 0
0:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n

asm_test::compare_exchange_weak::u32::acqrel_relaxed:
        entry             a1, 32
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 0f
        movi.n            a9, 0
0:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n

asm_test::compare_exchange_weak::u32::acquire_seqcst:
        entry             a1, 32
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 0f
        movi.n            a9, 0
0:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n

asm_test::compare_exchange_weak::u32::relaxed_seqcst:
        entry             a1, 32
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 0f
        movi.n            a9, 0
0:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n

asm_test::compare_exchange_weak::u32::release_seqcst:
        entry             a1, 32
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 0f
        movi.n            a9, 0
0:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n

asm_test::compare_exchange_weak::u32::seqcst_acquire:
        entry             a1, 32
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 0f
        movi.n            a9, 0
0:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n

asm_test::compare_exchange_weak::u32::seqcst_relaxed:
        entry             a1, 32
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 0f
        movi.n            a9, 0
0:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n

asm_test::compare_exchange_weak::u32::acquire_acquire:
        entry             a1, 32
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 0f
        movi.n            a9, 0
0:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n

asm_test::compare_exchange_weak::u32::acquire_relaxed:
        entry             a1, 32
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 0f
        movi.n            a9, 0
0:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n

asm_test::compare_exchange_weak::u32::relaxed_acquire:
        entry             a1, 32
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 0f
        movi.n            a9, 0
0:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n

asm_test::compare_exchange_weak::u32::relaxed_relaxed:
        entry             a1, 32
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 0f
        movi.n            a9, 0
0:
        xor               a2, a9, a8
        mov.n             a3, a4
        retw.n

asm_test::compare_exchange_weak::u32::release_acquire:
        entry             a1, 32
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 0f
        movi.n            a9, 0
0:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n

asm_test::compare_exchange_weak::u32::release_relaxed:
        entry             a1, 32
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 0f
        movi.n            a9, 0
0:
        xor               a2, a9, a8
        mov.n             a3, a4
        retw.n

asm_test::compare_exchange_weak::bool::acqrel_seqcst:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi              a8, 255
        ssl               a9
        sll               a10, a8
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a12, a10, 0
        and               a12, a12, a11
        ssl               a9
        sll               a13, a3
        ssl               a9
        sll               a11, a4
        or                a11, a12, a11
        or                a12, a12, a13
        wsr.scompare1     a12
        s32c1i            a11, a10, 0
        beq               a11, a12, 0f
        movi.n            a10, 0
        j                 1f
0:
        movi.n            a10, 1
1:
        ssr               a9
        srl               a9, a11
        and               a11, a9, a8
        movi.n            a8, 1
        movi.n            a9, 0
        mov.n             a3, a8
        bne               a11, a9, 2f
        mov.n             a3, a9
2:
        xor               a2, a10, a8
        memw
        retw.n

asm_test::compare_exchange_weak::bool::seqcst_seqcst:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi              a8, 255
        ssl               a9
        sll               a10, a8
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a12, a10, 0
        and               a12, a12, a11
        ssl               a9
        sll               a13, a3
        ssl               a9
        sll               a11, a4
        or                a11, a12, a11
        or                a12, a12, a13
        wsr.scompare1     a12
        s32c1i            a11, a10, 0
        beq               a11, a12, 0f
        movi.n            a10, 0
        j                 1f
0:
        movi.n            a10, 1
1:
        ssr               a9
        srl               a9, a11
        and               a11, a9, a8
        movi.n            a8, 1
        movi.n            a9, 0
        mov.n             a3, a8
        bne               a11, a9, 2f
        mov.n             a3, a9
2:
        xor               a2, a10, a8
        memw
        retw.n

asm_test::compare_exchange_weak::bool::acqrel_acquire:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi              a8, 255
        ssl               a9
        sll               a10, a8
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a12, a10, 0
        and               a12, a12, a11
        ssl               a9
        sll               a13, a3
        ssl               a9
        sll               a11, a4
        or                a11, a12, a11
        or                a12, a12, a13
        wsr.scompare1     a12
        s32c1i            a11, a10, 0
        beq               a11, a12, 0f
        movi.n            a10, 0
        j                 1f
0:
        movi.n            a10, 1
1:
        ssr               a9
        srl               a9, a11
        and               a11, a9, a8
        movi.n            a8, 1
        movi.n            a9, 0
        mov.n             a3, a8
        bne               a11, a9, 2f
        mov.n             a3, a9
2:
        xor               a2, a10, a8
        memw
        retw.n

asm_test::compare_exchange_weak::bool::acqrel_relaxed:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi              a8, 255
        ssl               a9
        sll               a10, a8
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a12, a10, 0
        and               a12, a12, a11
        ssl               a9
        sll               a13, a3
        ssl               a9
        sll               a11, a4
        or                a11, a12, a11
        or                a12, a12, a13
        wsr.scompare1     a12
        s32c1i            a11, a10, 0
        beq               a11, a12, 0f
        movi.n            a10, 0
        j                 1f
0:
        movi.n            a10, 1
1:
        ssr               a9
        srl               a9, a11
        and               a11, a9, a8
        movi.n            a8, 1
        movi.n            a9, 0
        mov.n             a3, a8
        bne               a11, a9, 2f
        mov.n             a3, a9
2:
        xor               a2, a10, a8
        memw
        retw.n

asm_test::compare_exchange_weak::bool::acquire_seqcst:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi              a8, 255
        ssl               a9
        sll               a10, a8
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a12, a10, 0
        and               a12, a12, a11
        ssl               a9
        sll               a13, a3
        ssl               a9
        sll               a11, a4
        or                a11, a12, a11
        or                a12, a12, a13
        wsr.scompare1     a12
        s32c1i            a11, a10, 0
        beq               a11, a12, 0f
        movi.n            a10, 0
        j                 1f
0:
        movi.n            a10, 1
1:
        ssr               a9
        srl               a9, a11
        and               a11, a9, a8
        movi.n            a8, 1
        movi.n            a9, 0
        mov.n             a3, a8
        bne               a11, a9, 2f
        mov.n             a3, a9
2:
        xor               a2, a10, a8
        memw
        retw.n

asm_test::compare_exchange_weak::bool::relaxed_seqcst:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi              a8, 255
        ssl               a9
        sll               a10, a8
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a12, a10, 0
        and               a12, a12, a11
        ssl               a9
        sll               a13, a3
        ssl               a9
        sll               a11, a4
        or                a11, a12, a11
        or                a12, a12, a13
        wsr.scompare1     a12
        s32c1i            a11, a10, 0
        beq               a11, a12, 0f
        movi.n            a10, 0
        j                 1f
0:
        movi.n            a10, 1
1:
        ssr               a9
        srl               a9, a11
        and               a11, a9, a8
        movi.n            a8, 1
        movi.n            a9, 0
        mov.n             a3, a8
        bne               a11, a9, 2f
        mov.n             a3, a9
2:
        xor               a2, a10, a8
        memw
        retw.n

asm_test::compare_exchange_weak::bool::release_seqcst:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi              a8, 255
        ssl               a9
        sll               a10, a8
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a12, a10, 0
        and               a12, a12, a11
        ssl               a9
        sll               a13, a3
        ssl               a9
        sll               a11, a4
        or                a11, a12, a11
        or                a12, a12, a13
        wsr.scompare1     a12
        s32c1i            a11, a10, 0
        beq               a11, a12, 0f
        movi.n            a10, 0
        j                 1f
0:
        movi.n            a10, 1
1:
        ssr               a9
        srl               a9, a11
        and               a11, a9, a8
        movi.n            a8, 1
        movi.n            a9, 0
        mov.n             a3, a8
        bne               a11, a9, 2f
        mov.n             a3, a9
2:
        xor               a2, a10, a8
        memw
        retw.n

asm_test::compare_exchange_weak::bool::seqcst_acquire:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi              a8, 255
        ssl               a9
        sll               a10, a8
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a12, a10, 0
        and               a12, a12, a11
        ssl               a9
        sll               a13, a3
        ssl               a9
        sll               a11, a4
        or                a11, a12, a11
        or                a12, a12, a13
        wsr.scompare1     a12
        s32c1i            a11, a10, 0
        beq               a11, a12, 0f
        movi.n            a10, 0
        j                 1f
0:
        movi.n            a10, 1
1:
        ssr               a9
        srl               a9, a11
        and               a11, a9, a8
        movi.n            a8, 1
        movi.n            a9, 0
        mov.n             a3, a8
        bne               a11, a9, 2f
        mov.n             a3, a9
2:
        xor               a2, a10, a8
        memw
        retw.n

asm_test::compare_exchange_weak::bool::seqcst_relaxed:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi              a8, 255
        ssl               a9
        sll               a10, a8
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a12, a10, 0
        and               a12, a12, a11
        ssl               a9
        sll               a13, a3
        ssl               a9
        sll               a11, a4
        or                a11, a12, a11
        or                a12, a12, a13
        wsr.scompare1     a12
        s32c1i            a11, a10, 0
        beq               a11, a12, 0f
        movi.n            a10, 0
        j                 1f
0:
        movi.n            a10, 1
1:
        ssr               a9
        srl               a9, a11
        and               a11, a9, a8
        movi.n            a8, 1
        movi.n            a9, 0
        mov.n             a3, a8
        bne               a11, a9, 2f
        mov.n             a3, a9
2:
        xor               a2, a10, a8
        memw
        retw.n

asm_test::compare_exchange_weak::bool::acquire_acquire:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi              a8, 255
        ssl               a9
        sll               a10, a8
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a12, a10, 0
        and               a12, a12, a11
        ssl               a9
        sll               a13, a3
        ssl               a9
        sll               a11, a4
        or                a11, a12, a11
        or                a12, a12, a13
        wsr.scompare1     a12
        s32c1i            a11, a10, 0
        beq               a11, a12, 0f
        movi.n            a10, 0
        j                 1f
0:
        movi.n            a10, 1
1:
        ssr               a9
        srl               a9, a11
        and               a11, a9, a8
        movi.n            a8, 1
        movi.n            a9, 0
        mov.n             a3, a8
        bne               a11, a9, 2f
        mov.n             a3, a9
2:
        xor               a2, a10, a8
        memw
        retw.n

asm_test::compare_exchange_weak::bool::acquire_relaxed:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi              a8, 255
        ssl               a9
        sll               a10, a8
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a12, a10, 0
        and               a12, a12, a11
        ssl               a9
        sll               a13, a3
        ssl               a9
        sll               a11, a4
        or                a11, a12, a11
        or                a12, a12, a13
        wsr.scompare1     a12
        s32c1i            a11, a10, 0
        beq               a11, a12, 0f
        movi.n            a10, 0
        j                 1f
0:
        movi.n            a10, 1
1:
        ssr               a9
        srl               a9, a11
        and               a11, a9, a8
        movi.n            a8, 1
        movi.n            a9, 0
        mov.n             a3, a8
        bne               a11, a9, 2f
        mov.n             a3, a9
2:
        xor               a2, a10, a8
        memw
        retw.n

asm_test::compare_exchange_weak::bool::relaxed_acquire:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi              a8, 255
        ssl               a9
        sll               a10, a8
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a12, a10, 0
        and               a12, a12, a11
        ssl               a9
        sll               a13, a3
        ssl               a9
        sll               a11, a4
        or                a11, a12, a11
        or                a12, a12, a13
        wsr.scompare1     a12
        s32c1i            a11, a10, 0
        beq               a11, a12, 0f
        movi.n            a10, 0
        j                 1f
0:
        movi.n            a10, 1
1:
        ssr               a9
        srl               a9, a11
        and               a11, a9, a8
        movi.n            a8, 1
        movi.n            a9, 0
        mov.n             a3, a8
        bne               a11, a9, 2f
        mov.n             a3, a9
2:
        xor               a2, a10, a8
        memw
        retw.n

asm_test::compare_exchange_weak::bool::relaxed_relaxed:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi              a8, 255
        ssl               a9
        sll               a10, a8
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a12, a10, 0
        and               a12, a12, a11
        ssl               a9
        sll               a13, a3
        ssl               a9
        sll               a11, a4
        or                a11, a12, a11
        or                a12, a12, a13
        wsr.scompare1     a12
        s32c1i            a11, a10, 0
        beq               a11, a12, 0f
        movi.n            a10, 0
        j                 1f
0:
        movi.n            a10, 1
1:
        ssr               a9
        srl               a9, a11
        and               a11, a9, a8
        movi.n            a8, 1
        movi.n            a9, 0
        mov.n             a3, a8
        bne               a11, a9, 2f
        mov.n             a3, a9
2:
        xor               a2, a10, a8
        retw.n

asm_test::compare_exchange_weak::bool::release_acquire:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi              a8, 255
        ssl               a9
        sll               a10, a8
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a12, a10, 0
        and               a12, a12, a11
        ssl               a9
        sll               a13, a3
        ssl               a9
        sll               a11, a4
        or                a11, a12, a11
        or                a12, a12, a13
        wsr.scompare1     a12
        s32c1i            a11, a10, 0
        beq               a11, a12, 0f
        movi.n            a10, 0
        j                 1f
0:
        movi.n            a10, 1
1:
        ssr               a9
        srl               a9, a11
        and               a11, a9, a8
        movi.n            a8, 1
        movi.n            a9, 0
        mov.n             a3, a8
        bne               a11, a9, 2f
        mov.n             a3, a9
2:
        xor               a2, a10, a8
        memw
        retw.n

asm_test::compare_exchange_weak::bool::release_relaxed:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi              a8, 255
        ssl               a9
        sll               a10, a8
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a12, a10, 0
        and               a12, a12, a11
        ssl               a9
        sll               a13, a3
        ssl               a9
        sll               a11, a4
        or                a11, a12, a11
        or                a12, a12, a13
        wsr.scompare1     a12
        s32c1i            a11, a10, 0
        beq               a11, a12, 0f
        movi.n            a10, 0
        j                 1f
0:
        movi.n            a10, 1
1:
        ssr               a9
        srl               a9, a11
        and               a11, a9, a8
        movi.n            a8, 1
        movi.n            a9, 0
        mov.n             a3, a8
        bne               a11, a9, 2f
        mov.n             a3, a9
2:
        xor               a2, a10, a8
        retw.n

asm_test::or::u8::acqrel:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        ssl               a9
        sll               a8, a8
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 1f
0:
        mov.n             a12, a13
        beqi              a14, 1, 2f
1:
        or                a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 0b
        mov.n             a14, a10
        j                 0b
2:
        memw
        retw.n

asm_test::or::u8::seqcst:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        ssl               a9
        sll               a8, a8
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 1f
0:
        mov.n             a12, a13
        beqi              a14, 1, 2f
1:
        or                a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 0b
        mov.n             a14, a10
        j                 0b
2:
        memw
        retw.n

asm_test::or::u8::acquire:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        ssl               a9
        sll               a8, a8
        movi.n            a9, -4
        and               a9, a2, a9
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 1f
0:
        mov.n             a12, a13
        beqi              a14, 1, 2f
1:
        or                a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 0b
        mov.n             a14, a10
        j                 0b
2:
        memw
        retw.n

asm_test::or::u8::relaxed:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        ssl               a9
        sll               a8, a8
        movi.n            a9, -4
        and               a9, a2, a9
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 1f
0:
        mov.n             a12, a13
        beqi              a14, 1, 2f
1:
        or                a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 0b
        mov.n             a14, a10
        j                 0b
2:
        retw.n

asm_test::or::u8::release:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        ssl               a9
        sll               a8, a8
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 1f
0:
        mov.n             a12, a13
        beqi              a14, 1, 2f
1:
        or                a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 0b
        mov.n             a14, a10
        j                 0b
2:
        retw.n

.literal.asm_test::or::u16::acqrel:
        .byte             0xff
        .byte             0xff

asm_test::or::u16::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::or::u16::acqrel+0x81004136>)
        and               a8, a3, a8
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        ssl               a9
        sll               a8, a8
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 2f
1:
        mov.n             a12, a13
        beqi              a14, 1, 3f
2:
        or                a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 1b
        mov.n             a14, a10
        j                 1b
3:
        memw
        retw.n

.literal.asm_test::or::u16::seqcst:
        .byte             0xff
        .byte             0xff

asm_test::or::u16::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::or::u16::seqcst+0x81004136>)
        and               a8, a3, a8
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        ssl               a9
        sll               a8, a8
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 2f
1:
        mov.n             a12, a13
        beqi              a14, 1, 3f
2:
        or                a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 1b
        mov.n             a14, a10
        j                 1b
3:
        memw
        retw.n

.literal.asm_test::or::u16::acquire:
        .byte             0xff
        .byte             0xff

asm_test::or::u16::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::or::u16::acquire+0x81004136>)
        and               a8, a3, a8
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        ssl               a9
        sll               a8, a8
        movi.n            a9, -4
        and               a9, a2, a9
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 2f
1:
        mov.n             a12, a13
        beqi              a14, 1, 3f
2:
        or                a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 1b
        mov.n             a14, a10
        j                 1b
3:
        memw
        retw.n

.literal.asm_test::or::u16::relaxed:
        .byte             0xff
        .byte             0xff

asm_test::or::u16::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::or::u16::relaxed+0x81004136>)
        and               a8, a3, a8
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        ssl               a9
        sll               a8, a8
        movi.n            a9, -4
        and               a9, a2, a9
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 2f
1:
        mov.n             a12, a13
        beqi              a14, 1, 3f
2:
        or                a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 1b
        mov.n             a14, a10
        j                 1b
3:
        retw.n

.literal.asm_test::or::u16::release:
        .byte             0xff
        .byte             0xff

asm_test::or::u16::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::or::u16::release+0x81004136>)
        and               a8, a3, a8
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        ssl               a9
        sll               a8, a8
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 2f
1:
        mov.n             a12, a13
        beqi              a14, 1, 3f
2:
        or                a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 1b
        mov.n             a14, a10
        j                 1b
3:
        retw.n

asm_test::or::u32::acqrel:
        entry             a1, 32
        memw
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 1f
0:
        mov.n             a10, a11
        beqi              a12, 1, 2f
1:
        or                a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 0b
        mov.n             a12, a8
        j                 0b
2:
        memw
        retw.n

asm_test::or::u32::seqcst:
        entry             a1, 32
        memw
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 1f
0:
        mov.n             a10, a11
        beqi              a12, 1, 2f
1:
        or                a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 0b
        mov.n             a12, a8
        j                 0b
2:
        memw
        retw.n

asm_test::or::u32::acquire:
        entry             a1, 32
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 1f
0:
        mov.n             a10, a11
        beqi              a12, 1, 2f
1:
        or                a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 0b
        mov.n             a12, a8
        j                 0b
2:
        memw
        retw.n

asm_test::or::u32::relaxed:
        entry             a1, 32
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 1f
0:
        mov.n             a10, a11
        beqi              a12, 1, 2f
1:
        or                a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 0b
        mov.n             a12, a8
        j                 0b
2:
        retw.n

asm_test::or::u32::release:
        entry             a1, 32
        memw
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 1f
0:
        mov.n             a10, a11
        beqi              a12, 1, 2f
1:
        or                a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 0b
        mov.n             a12, a8
        j                 0b
2:
        retw.n

asm_test::add::u8::acqrel:
        entry             a1, 32
        movi              a9, 255
        and               a8, a3, a9
        slli              a10, a2, 3
        movi.n            a11, 24
        and               a10, a10, a11
        ssl               a10
        sll               a8, a8
        ssl               a10
        sll               a9, a9
        movi.n            a10, -1
        xor               a10, a9, a10
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 1f
0:
        mov.n             a14, a15
        beqi              a7, 1, 2f
1:
        and               a15, a14, a10
        add.n             a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 0b
        mov.n             a7, a12
        j                 0b
2:
        memw
        retw.n

asm_test::add::u8::seqcst:
        entry             a1, 32
        movi              a9, 255
        and               a8, a3, a9
        slli              a10, a2, 3
        movi.n            a11, 24
        and               a10, a10, a11
        ssl               a10
        sll               a8, a8
        ssl               a10
        sll               a9, a9
        movi.n            a10, -1
        xor               a10, a9, a10
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 1f
0:
        mov.n             a14, a15
        beqi              a7, 1, 2f
1:
        and               a15, a14, a10
        add.n             a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 0b
        mov.n             a7, a12
        j                 0b
2:
        memw
        retw.n

asm_test::add::u8::acquire:
        entry             a1, 32
        movi              a9, 255
        and               a8, a3, a9
        slli              a10, a2, 3
        movi.n            a11, 24
        and               a10, a10, a11
        ssl               a10
        sll               a8, a8
        ssl               a10
        sll               a9, a9
        movi.n            a10, -1
        xor               a10, a9, a10
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 1f
0:
        mov.n             a14, a15
        beqi              a7, 1, 2f
1:
        and               a15, a14, a10
        add.n             a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 0b
        mov.n             a7, a12
        j                 0b
2:
        memw
        retw.n

asm_test::add::u8::relaxed:
        entry             a1, 32
        movi              a9, 255
        and               a8, a3, a9
        slli              a10, a2, 3
        movi.n            a11, 24
        and               a10, a10, a11
        ssl               a10
        sll               a8, a8
        ssl               a10
        sll               a9, a9
        movi.n            a10, -1
        xor               a10, a9, a10
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 1f
0:
        mov.n             a14, a15
        beqi              a7, 1, 2f
1:
        and               a15, a14, a10
        add.n             a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 0b
        mov.n             a7, a12
        j                 0b
2:
        retw.n

asm_test::add::u8::release:
        entry             a1, 32
        movi              a9, 255
        and               a8, a3, a9
        slli              a10, a2, 3
        movi.n            a11, 24
        and               a10, a10, a11
        ssl               a10
        sll               a8, a8
        ssl               a10
        sll               a9, a9
        movi.n            a10, -1
        xor               a10, a9, a10
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 1f
0:
        mov.n             a14, a15
        beqi              a7, 1, 2f
1:
        and               a15, a14, a10
        add.n             a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 0b
        mov.n             a7, a12
        j                 0b
2:
        retw.n

.literal.asm_test::add::u16::acqrel:
        .byte             0xff
        .byte             0xff

asm_test::add::u16::acqrel:
0:
        entry             a1, 32
        l32r              a9, 0b (91004136 <asm_test::add::u16::acqrel+0x91004136>)
        and               a8, a3, a9
        slli              a10, a2, 3
        movi.n            a11, 24
        and               a10, a10, a11
        ssl               a10
        sll               a8, a8
        ssl               a10
        sll               a9, a9
        movi.n            a10, -1
        xor               a10, a9, a10
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 2f
1:
        mov.n             a14, a15
        beqi              a7, 1, 3f
2:
        and               a15, a14, a10
        add.n             a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 1b
        mov.n             a7, a12
        j                 1b
3:
        memw
        retw.n

.literal.asm_test::add::u16::seqcst:
        .byte             0xff
        .byte             0xff

asm_test::add::u16::seqcst:
0:
        entry             a1, 32
        l32r              a9, 0b (91004136 <asm_test::add::u16::seqcst+0x91004136>)
        and               a8, a3, a9
        slli              a10, a2, 3
        movi.n            a11, 24
        and               a10, a10, a11
        ssl               a10
        sll               a8, a8
        ssl               a10
        sll               a9, a9
        movi.n            a10, -1
        xor               a10, a9, a10
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 2f
1:
        mov.n             a14, a15
        beqi              a7, 1, 3f
2:
        and               a15, a14, a10
        add.n             a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 1b
        mov.n             a7, a12
        j                 1b
3:
        memw
        retw.n

.literal.asm_test::add::u16::acquire:
        .byte             0xff
        .byte             0xff

asm_test::add::u16::acquire:
0:
        entry             a1, 32
        l32r              a9, 0b (91004136 <asm_test::add::u16::acquire+0x91004136>)
        and               a8, a3, a9
        slli              a10, a2, 3
        movi.n            a11, 24
        and               a10, a10, a11
        ssl               a10
        sll               a8, a8
        ssl               a10
        sll               a9, a9
        movi.n            a10, -1
        xor               a10, a9, a10
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 2f
1:
        mov.n             a14, a15
        beqi              a7, 1, 3f
2:
        and               a15, a14, a10
        add.n             a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 1b
        mov.n             a7, a12
        j                 1b
3:
        memw
        retw.n

.literal.asm_test::add::u16::relaxed:
        .byte             0xff
        .byte             0xff

asm_test::add::u16::relaxed:
0:
        entry             a1, 32
        l32r              a9, 0b (91004136 <asm_test::add::u16::relaxed+0x91004136>)
        and               a8, a3, a9
        slli              a10, a2, 3
        movi.n            a11, 24
        and               a10, a10, a11
        ssl               a10
        sll               a8, a8
        ssl               a10
        sll               a9, a9
        movi.n            a10, -1
        xor               a10, a9, a10
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 2f
1:
        mov.n             a14, a15
        beqi              a7, 1, 3f
2:
        and               a15, a14, a10
        add.n             a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 1b
        mov.n             a7, a12
        j                 1b
3:
        retw.n

.literal.asm_test::add::u16::release:
        .byte             0xff
        .byte             0xff

asm_test::add::u16::release:
0:
        entry             a1, 32
        l32r              a9, 0b (91004136 <asm_test::add::u16::release+0x91004136>)
        and               a8, a3, a9
        slli              a10, a2, 3
        movi.n            a11, 24
        and               a10, a10, a11
        ssl               a10
        sll               a8, a8
        ssl               a10
        sll               a9, a9
        movi.n            a10, -1
        xor               a10, a9, a10
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 2f
1:
        mov.n             a14, a15
        beqi              a7, 1, 3f
2:
        and               a15, a14, a10
        add.n             a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 1b
        mov.n             a7, a12
        j                 1b
3:
        retw.n

asm_test::add::u32::acqrel:
        entry             a1, 32
        memw
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 1f
0:
        mov.n             a10, a11
        beqi              a12, 1, 2f
1:
        add.n             a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 0b
        mov.n             a12, a8
        j                 0b
2:
        memw
        retw.n

asm_test::add::u32::seqcst:
        entry             a1, 32
        memw
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 1f
0:
        mov.n             a10, a11
        beqi              a12, 1, 2f
1:
        add.n             a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 0b
        mov.n             a12, a8
        j                 0b
2:
        memw
        retw.n

asm_test::add::u32::acquire:
        entry             a1, 32
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 1f
0:
        mov.n             a10, a11
        beqi              a12, 1, 2f
1:
        add.n             a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 0b
        mov.n             a12, a8
        j                 0b
2:
        memw
        retw.n

asm_test::add::u32::relaxed:
        entry             a1, 32
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 1f
0:
        mov.n             a10, a11
        beqi              a12, 1, 2f
1:
        add.n             a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 0b
        mov.n             a12, a8
        j                 0b
2:
        retw.n

asm_test::add::u32::release:
        entry             a1, 32
        memw
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 1f
0:
        mov.n             a10, a11
        beqi              a12, 1, 2f
1:
        add.n             a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 0b
        mov.n             a12, a8
        j                 0b
2:
        retw.n

asm_test::and::u8::acqrel:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        slli              a10, a2, 3
        movi.n            a11, 24
        and               a10, a10, a11
        ssl               a10
        sll               a9, a9
        ssl               a10
        sll               a8, a8
        movi.n            a10, -1
        xor               a8, a8, a10
        or                a8, a9, a8
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 1f
0:
        mov.n             a12, a13
        beqi              a14, 1, 2f
1:
        and               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 0b
        mov.n             a14, a10
        j                 0b
2:
        memw
        retw.n

asm_test::and::u8::seqcst:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        slli              a10, a2, 3
        movi.n            a11, 24
        and               a10, a10, a11
        ssl               a10
        sll               a9, a9
        ssl               a10
        sll               a8, a8
        movi.n            a10, -1
        xor               a8, a8, a10
        or                a8, a9, a8
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 1f
0:
        mov.n             a12, a13
        beqi              a14, 1, 2f
1:
        and               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 0b
        mov.n             a14, a10
        j                 0b
2:
        memw
        retw.n

asm_test::and::u8::acquire:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        slli              a10, a2, 3
        movi.n            a11, 24
        and               a10, a10, a11
        ssl               a10
        sll               a9, a9
        ssl               a10
        sll               a8, a8
        movi.n            a10, -1
        xor               a8, a8, a10
        or                a8, a9, a8
        movi.n            a9, -4
        and               a9, a2, a9
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 1f
0:
        mov.n             a12, a13
        beqi              a14, 1, 2f
1:
        and               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 0b
        mov.n             a14, a10
        j                 0b
2:
        memw
        retw.n

asm_test::and::u8::relaxed:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        slli              a10, a2, 3
        movi.n            a11, 24
        and               a10, a10, a11
        ssl               a10
        sll               a9, a9
        ssl               a10
        sll               a8, a8
        movi.n            a10, -1
        xor               a8, a8, a10
        or                a8, a9, a8
        movi.n            a9, -4
        and               a9, a2, a9
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 1f
0:
        mov.n             a12, a13
        beqi              a14, 1, 2f
1:
        and               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 0b
        mov.n             a14, a10
        j                 0b
2:
        retw.n

asm_test::and::u8::release:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        slli              a10, a2, 3
        movi.n            a11, 24
        and               a10, a10, a11
        ssl               a10
        sll               a9, a9
        ssl               a10
        sll               a8, a8
        movi.n            a10, -1
        xor               a8, a8, a10
        or                a8, a9, a8
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 1f
0:
        mov.n             a12, a13
        beqi              a14, 1, 2f
1:
        and               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 0b
        mov.n             a14, a10
        j                 0b
2:
        retw.n

.literal.asm_test::and::u16::acqrel:
        .byte             0xff
        .byte             0xff

asm_test::and::u16::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::and::u16::acqrel+0x81004136>)
        and               a9, a3, a8
        slli              a10, a2, 3
        movi.n            a11, 24
        and               a10, a10, a11
        ssl               a10
        sll               a9, a9
        ssl               a10
        sll               a8, a8
        movi.n            a10, -1
        xor               a8, a8, a10
        or                a8, a9, a8
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 2f
1:
        mov.n             a12, a13
        beqi              a14, 1, 3f
2:
        and               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 1b
        mov.n             a14, a10
        j                 1b
3:
        memw
        retw.n

.literal.asm_test::and::u16::seqcst:
        .byte             0xff
        .byte             0xff

asm_test::and::u16::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::and::u16::seqcst+0x81004136>)
        and               a9, a3, a8
        slli              a10, a2, 3
        movi.n            a11, 24
        and               a10, a10, a11
        ssl               a10
        sll               a9, a9
        ssl               a10
        sll               a8, a8
        movi.n            a10, -1
        xor               a8, a8, a10
        or                a8, a9, a8
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 2f
1:
        mov.n             a12, a13
        beqi              a14, 1, 3f
2:
        and               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 1b
        mov.n             a14, a10
        j                 1b
3:
        memw
        retw.n

.literal.asm_test::and::u16::acquire:
        .byte             0xff
        .byte             0xff

asm_test::and::u16::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::and::u16::acquire+0x81004136>)
        and               a9, a3, a8
        slli              a10, a2, 3
        movi.n            a11, 24
        and               a10, a10, a11
        ssl               a10
        sll               a9, a9
        ssl               a10
        sll               a8, a8
        movi.n            a10, -1
        xor               a8, a8, a10
        or                a8, a9, a8
        movi.n            a9, -4
        and               a9, a2, a9
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 2f
1:
        mov.n             a12, a13
        beqi              a14, 1, 3f
2:
        and               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 1b
        mov.n             a14, a10
        j                 1b
3:
        memw
        retw.n

.literal.asm_test::and::u16::relaxed:
        .byte             0xff
        .byte             0xff

asm_test::and::u16::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::and::u16::relaxed+0x81004136>)
        and               a9, a3, a8
        slli              a10, a2, 3
        movi.n            a11, 24
        and               a10, a10, a11
        ssl               a10
        sll               a9, a9
        ssl               a10
        sll               a8, a8
        movi.n            a10, -1
        xor               a8, a8, a10
        or                a8, a9, a8
        movi.n            a9, -4
        and               a9, a2, a9
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 2f
1:
        mov.n             a12, a13
        beqi              a14, 1, 3f
2:
        and               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 1b
        mov.n             a14, a10
        j                 1b
3:
        retw.n

.literal.asm_test::and::u16::release:
        .byte             0xff
        .byte             0xff

asm_test::and::u16::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::and::u16::release+0x81004136>)
        and               a9, a3, a8
        slli              a10, a2, 3
        movi.n            a11, 24
        and               a10, a10, a11
        ssl               a10
        sll               a9, a9
        ssl               a10
        sll               a8, a8
        movi.n            a10, -1
        xor               a8, a8, a10
        or                a8, a9, a8
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 2f
1:
        mov.n             a12, a13
        beqi              a14, 1, 3f
2:
        and               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 1b
        mov.n             a14, a10
        j                 1b
3:
        retw.n

asm_test::and::u32::acqrel:
        entry             a1, 32
        memw
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 1f
0:
        mov.n             a10, a11
        beqi              a12, 1, 2f
1:
        and               a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 0b
        mov.n             a12, a8
        j                 0b
2:
        memw
        retw.n

asm_test::and::u32::seqcst:
        entry             a1, 32
        memw
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 1f
0:
        mov.n             a10, a11
        beqi              a12, 1, 2f
1:
        and               a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 0b
        mov.n             a12, a8
        j                 0b
2:
        memw
        retw.n

asm_test::and::u32::acquire:
        entry             a1, 32
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 1f
0:
        mov.n             a10, a11
        beqi              a12, 1, 2f
1:
        and               a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 0b
        mov.n             a12, a8
        j                 0b
2:
        memw
        retw.n

asm_test::and::u32::relaxed:
        entry             a1, 32
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 1f
0:
        mov.n             a10, a11
        beqi              a12, 1, 2f
1:
        and               a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 0b
        mov.n             a12, a8
        j                 0b
2:
        retw.n

asm_test::and::u32::release:
        entry             a1, 32
        memw
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 1f
0:
        mov.n             a10, a11
        beqi              a12, 1, 2f
1:
        and               a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 0b
        mov.n             a12, a8
        j                 0b
2:
        retw.n

asm_test::neg::u8::acqrel:
        entry             a1, 32
        l8ui              a14, a2, 0
        movi              a8, 255
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        movi.n            a10, -1
        movi.n            a11, -4
        and               a11, a2, a11
        movi.n            a12, 0
        movi.n            a13, 1
        j                 1f
0:
        ssr               a9
        srl               a14, a14
        and               a15, a15, a13
        memw
        bnez              a15, 2f
1:
        and               a15, a14, a8
        ssl               a9
        sll               a15, a15
        neg               a14, a14
        and               a14, a14, a8
        ssl               a9
        sll               a14, a14
        ssl               a9
        sll               a7, a8
        xor               a7, a7, a10
        memw
        l32i.n            a6, a11, 0
        and               a7, a6, a7
        or                a14, a7, a14
        or                a7, a7, a15
        wsr.scompare1     a7
        s32c1i            a14, a11, 0
        mov.n             a15, a13
        beq               a14, a7, 0b
        mov.n             a15, a12
        j                 0b
2:
        retw.n

asm_test::neg::u8::seqcst:
        entry             a1, 32
        l8ui              a14, a2, 0
        movi              a8, 255
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        movi.n            a10, -1
        movi.n            a11, -4
        and               a11, a2, a11
        movi.n            a12, 0
        movi.n            a13, 1
        j                 1f
0:
        ssr               a9
        srl               a14, a14
        and               a15, a15, a13
        memw
        bnez              a15, 2f
1:
        and               a15, a14, a8
        ssl               a9
        sll               a15, a15
        neg               a14, a14
        and               a14, a14, a8
        ssl               a9
        sll               a14, a14
        ssl               a9
        sll               a7, a8
        xor               a7, a7, a10
        memw
        l32i.n            a6, a11, 0
        and               a7, a6, a7
        or                a14, a7, a14
        or                a7, a7, a15
        wsr.scompare1     a7
        s32c1i            a14, a11, 0
        mov.n             a15, a13
        beq               a14, a7, 0b
        mov.n             a15, a12
        j                 0b
2:
        retw.n

asm_test::neg::u8::acquire:
        entry             a1, 32
        l8ui              a14, a2, 0
        movi              a8, 255
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        movi.n            a10, -1
        movi.n            a11, -4
        and               a11, a2, a11
        movi.n            a12, 0
        movi.n            a13, 1
        j                 1f
0:
        ssr               a9
        srl               a14, a14
        and               a15, a15, a13
        memw
        bnez              a15, 2f
1:
        and               a15, a14, a8
        ssl               a9
        sll               a15, a15
        neg               a14, a14
        and               a14, a14, a8
        ssl               a9
        sll               a14, a14
        ssl               a9
        sll               a7, a8
        xor               a7, a7, a10
        l32i.n            a6, a11, 0
        and               a7, a6, a7
        or                a14, a7, a14
        or                a7, a7, a15
        wsr.scompare1     a7
        s32c1i            a14, a11, 0
        mov.n             a15, a13
        beq               a14, a7, 0b
        mov.n             a15, a12
        j                 0b
2:
        retw.n

asm_test::neg::u8::relaxed:
        entry             a1, 32
        l8ui              a14, a2, 0
        movi              a8, 255
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        movi.n            a10, -1
        movi.n            a11, -4
        and               a11, a2, a11
        movi.n            a12, 0
        movi.n            a13, 1
        j                 1f
0:
        ssr               a9
        srl               a14, a14
        and               a15, a15, a13
        bnez              a15, 2f
1:
        and               a15, a14, a8
        ssl               a9
        sll               a15, a15
        neg               a14, a14
        and               a14, a14, a8
        ssl               a9
        sll               a14, a14
        ssl               a9
        sll               a7, a8
        xor               a7, a7, a10
        l32i.n            a6, a11, 0
        and               a7, a6, a7
        or                a14, a7, a14
        or                a7, a7, a15
        wsr.scompare1     a7
        s32c1i            a14, a11, 0
        mov.n             a15, a13
        beq               a14, a7, 0b
        mov.n             a15, a12
        j                 0b
2:
        retw.n

asm_test::neg::u8::release:
        entry             a1, 32
        l8ui              a14, a2, 0
        movi              a8, 255
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        movi.n            a10, -1
        movi.n            a11, -4
        and               a11, a2, a11
        movi.n            a12, 0
        movi.n            a13, 1
        j                 1f
0:
        ssr               a9
        srl               a14, a14
        and               a15, a15, a13
        bnez              a15, 2f
1:
        and               a15, a14, a8
        ssl               a9
        sll               a15, a15
        neg               a14, a14
        and               a14, a14, a8
        ssl               a9
        sll               a14, a14
        ssl               a9
        sll               a7, a8
        xor               a7, a7, a10
        memw
        l32i.n            a6, a11, 0
        and               a7, a6, a7
        or                a14, a7, a14
        or                a7, a7, a15
        wsr.scompare1     a7
        s32c1i            a14, a11, 0
        mov.n             a15, a13
        beq               a14, a7, 0b
        mov.n             a15, a12
        j                 0b
2:
        retw.n

.literal.asm_test::neg::u16::acqrel:
        .byte             0xff
        .byte             0xff

asm_test::neg::u16::acqrel:
        entry             a1, 32
        l16ui             a13, a2, 0
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, -1
        movi.n            a10, -4
        and               a10, a2, a10
        movi.n            a11, 0
        movi.n            a12, 1
        j                 2f
0:
        ssr               a8
        srl               a13, a13
        and               a14, a14, a12
        memw
1:
        bnez              a14, 3f
2:
        l32r              a15, 1b (f103ee56 <asm_test::neg::u16::acqrel+0xf103ee56>)
        and               a14, a13, a15
        ssl               a8
        sll               a14, a14
        neg               a13, a13
        and               a13, a13, a15
        ssl               a8
        sll               a13, a13
        ssl               a8
        sll               a15, a15
        xor               a15, a15, a9
        memw
        l32i.n            a7, a10, 0
        and               a15, a7, a15
        or                a13, a15, a13
        or                a15, a15, a14
        wsr.scompare1     a15
        s32c1i            a13, a10, 0
        mov.n             a14, a12
        beq               a13, a15, 0b
        mov.n             a14, a11
        j                 0b
3:
        retw.n

.literal.asm_test::neg::u16::seqcst:
        .byte             0xff
        .byte             0xff

asm_test::neg::u16::seqcst:
        entry             a1, 32
        l16ui             a13, a2, 0
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, -1
        movi.n            a10, -4
        and               a10, a2, a10
        movi.n            a11, 0
        movi.n            a12, 1
        j                 2f
0:
        ssr               a8
        srl               a13, a13
        and               a14, a14, a12
        memw
1:
        bnez              a14, 3f
2:
        l32r              a15, 1b (f103ee56 <asm_test::neg::u16::seqcst+0xf103ee56>)
        and               a14, a13, a15
        ssl               a8
        sll               a14, a14
        neg               a13, a13
        and               a13, a13, a15
        ssl               a8
        sll               a13, a13
        ssl               a8
        sll               a15, a15
        xor               a15, a15, a9
        memw
        l32i.n            a7, a10, 0
        and               a15, a7, a15
        or                a13, a15, a13
        or                a15, a15, a14
        wsr.scompare1     a15
        s32c1i            a13, a10, 0
        mov.n             a14, a12
        beq               a13, a15, 0b
        mov.n             a14, a11
        j                 0b
3:
        retw.n

.literal.asm_test::neg::u16::acquire:
        .byte             0xff
        .byte             0xff

asm_test::neg::u16::acquire:
        entry             a1, 32
        l16ui             a13, a2, 0
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, -1
        movi.n            a10, -4
        and               a10, a2, a10
        movi.n            a11, 0
        movi.n            a12, 1
        j                 2f
0:
        ssr               a8
        srl               a13, a13
        and               a14, a14, a12
        memw
1:
        bnez              a14, 3f
2:
        l32r              a15, 1b (f103be56 <asm_test::neg::u16::acquire+0xf103be56>)
        and               a14, a13, a15
        ssl               a8
        sll               a14, a14
        neg               a13, a13
        and               a13, a13, a15
        ssl               a8
        sll               a13, a13
        ssl               a8
        sll               a15, a15
        xor               a15, a15, a9
        l32i.n            a7, a10, 0
        and               a15, a7, a15
        or                a13, a15, a13
        or                a15, a15, a14
        wsr.scompare1     a15
        s32c1i            a13, a10, 0
        mov.n             a14, a12
        beq               a13, a15, 0b
        mov.n             a14, a11
        j                 0b
3:
        retw.n

.literal.asm_test::neg::u16::relaxed:
        .byte             0xff
        .byte             0xff

asm_test::neg::u16::relaxed:
        entry             a1, 32
        l16ui             a13, a2, 0
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, -1
        movi.n            a10, -4
        and               a10, a2, a10
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        ssr               a8
        srl               a13, a13
        and               a14, a14, a12
        bnez              a14, 2f
1:
        l32r              a15, fffc0028 <asm_test::neg::u16::relaxed+0xfffc0028>
        and               a14, a13, a15
        ssl               a8
        sll               a14, a14
        neg               a13, a13
        and               a13, a13, a15
        ssl               a8
        sll               a13, a13
        ssl               a8
        sll               a15, a15
        xor               a15, a15, a9
        l32i.n            a7, a10, 0
        and               a15, a7, a15
        or                a13, a15, a13
        or                a15, a15, a14
        wsr.scompare1     a15
        s32c1i            a13, a10, 0
        mov.n             a14, a12
        beq               a13, a15, 0b
        mov.n             a14, a11
        j                 0b
2:
        retw.n

.literal.asm_test::neg::u16::release:
        .byte             0xff
        .byte             0xff

asm_test::neg::u16::release:
        entry             a1, 32
        l16ui             a13, a2, 0
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, -1
        movi.n            a10, -4
        and               a10, a2, a10
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        ssr               a8
        srl               a13, a13
        and               a14, a14, a12
        bnez              a14, 2f
1:
        l32r              a15, fffc0028 <asm_test::neg::u16::release+0xfffc0028>
        and               a14, a13, a15
        ssl               a8
        sll               a14, a14
        neg               a13, a13
        and               a13, a13, a15
        ssl               a8
        sll               a13, a13
        ssl               a8
        sll               a15, a15
        xor               a15, a15, a9
        memw
        l32i.n            a7, a10, 0
        and               a15, a7, a15
        or                a13, a15, a13
        or                a15, a15, a14
        wsr.scompare1     a15
        s32c1i            a13, a10, 0
        mov.n             a14, a12
        beq               a13, a15, 0b
        mov.n             a14, a11
        j                 0b
2:
        retw.n

asm_test::neg::u32::acqrel:
        entry             a1, 32
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 1f
0:
        memw
        mov.n             a10, a11
        beqi              a12, 1, 2f
1:
        memw
        neg               a11, a10
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 0b
        mov.n             a12, a8
        j                 0b
2:
        retw.n

asm_test::neg::u32::seqcst:
        entry             a1, 32
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 1f
0:
        memw
        mov.n             a10, a11
        beqi              a12, 1, 2f
1:
        memw
        neg               a11, a10
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 0b
        mov.n             a12, a8
        j                 0b
2:
        retw.n

asm_test::neg::u32::acquire:
        entry             a1, 32
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 1f
0:
        memw
        mov.n             a10, a11
        beqi              a12, 1, 2f
1:
        neg               a11, a10
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 0b
        mov.n             a12, a8
        j                 0b
2:
        retw.n

asm_test::neg::u32::relaxed:
        entry             a1, 32
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 1f
0:
        mov.n             a10, a11
        beqi              a12, 1, 2f
1:
        neg               a11, a10
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 0b
        mov.n             a12, a8
        j                 0b
2:
        retw.n

asm_test::neg::u32::release:
        entry             a1, 32
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 1f
0:
        mov.n             a10, a11
        beqi              a12, 1, 2f
1:
        memw
        neg               a11, a10
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 0b
        mov.n             a12, a8
        j                 0b
2:
        retw.n

asm_test::not::u8::acqrel:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a8, a9
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 1f
0:
        mov.n             a12, a13
        beqi              a14, 1, 2f
1:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 0b
        mov.n             a14, a10
        j                 0b
2:
        memw
        retw.n

asm_test::not::u8::seqcst:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a8, a9
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 1f
0:
        mov.n             a12, a13
        beqi              a14, 1, 2f
1:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 0b
        mov.n             a14, a10
        j                 0b
2:
        memw
        retw.n

asm_test::not::u8::acquire:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a8, a9
        movi.n            a9, -4
        and               a9, a2, a9
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 1f
0:
        mov.n             a12, a13
        beqi              a14, 1, 2f
1:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 0b
        mov.n             a14, a10
        j                 0b
2:
        memw
        retw.n

asm_test::not::u8::relaxed:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a8, a9
        movi.n            a9, -4
        and               a9, a2, a9
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 1f
0:
        mov.n             a12, a13
        beqi              a14, 1, 2f
1:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 0b
        mov.n             a14, a10
        j                 0b
2:
        retw.n

asm_test::not::u8::release:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a8, a9
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 1f
0:
        mov.n             a12, a13
        beqi              a14, 1, 2f
1:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 0b
        mov.n             a14, a10
        j                 0b
2:
        retw.n

.literal.asm_test::not::u16::acqrel:
        .byte             0xff
        .byte             0xff

asm_test::not::u16::acqrel:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
0:
        and               a8, a8, a9
        l32r              a9, 0b (91108890 <asm_test::not::u16::acqrel+0x91108890>)
        ssl               a8
        sll               a8, a9
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 2f
1:
        mov.n             a12, a13
        beqi              a14, 1, 3f
2:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 1b
        mov.n             a14, a10
        j                 1b
3:
        memw
        retw.n

.literal.asm_test::not::u16::seqcst:
        .byte             0xff
        .byte             0xff

asm_test::not::u16::seqcst:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
0:
        and               a8, a8, a9
        l32r              a9, 0b (91108890 <asm_test::not::u16::seqcst+0x91108890>)
        ssl               a8
        sll               a8, a9
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 2f
1:
        mov.n             a12, a13
        beqi              a14, 1, 3f
2:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 1b
        mov.n             a14, a10
        j                 1b
3:
        memw
        retw.n

.literal.asm_test::not::u16::acquire:
        .byte             0xff
        .byte             0xff

asm_test::not::u16::acquire:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
0:
        and               a8, a8, a9
        l32r              a9, 0b (91108890 <asm_test::not::u16::acquire+0x91108890>)
        ssl               a8
        sll               a8, a9
        movi.n            a9, -4
        and               a9, a2, a9
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 2f
1:
        mov.n             a12, a13
        beqi              a14, 1, 3f
2:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 1b
        mov.n             a14, a10
        j                 1b
3:
        memw
        retw.n

.literal.asm_test::not::u16::relaxed:
        .byte             0xff
        .byte             0xff

asm_test::not::u16::relaxed:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
0:
        and               a8, a8, a9
        l32r              a9, 0b (91108890 <asm_test::not::u16::relaxed+0x91108890>)
        ssl               a8
        sll               a8, a9
        movi.n            a9, -4
        and               a9, a2, a9
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 2f
1:
        mov.n             a12, a13
        beqi              a14, 1, 3f
2:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 1b
        mov.n             a14, a10
        j                 1b
3:
        retw.n

.literal.asm_test::not::u16::release:
        .byte             0xff
        .byte             0xff

asm_test::not::u16::release:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
0:
        and               a8, a8, a9
        l32r              a9, 0b (91108890 <asm_test::not::u16::release+0x91108890>)
        ssl               a8
        sll               a8, a9
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 2f
1:
        mov.n             a12, a13
        beqi              a14, 1, 3f
2:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 1b
        mov.n             a14, a10
        j                 1b
3:
        retw.n

asm_test::not::u32::acqrel:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a8, -1
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a12
        beqi              a13, 1, 2f
1:
        xor               a12, a11, a8
        wsr.scompare1     a11
        s32c1i            a12, a2, 0
        mov.n             a13, a10
        beq               a12, a11, 0b
        mov.n             a13, a9
        j                 0b
2:
        memw
        retw.n

asm_test::not::u32::seqcst:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a8, -1
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a12
        beqi              a13, 1, 2f
1:
        xor               a12, a11, a8
        wsr.scompare1     a11
        s32c1i            a12, a2, 0
        mov.n             a13, a10
        beq               a12, a11, 0b
        mov.n             a13, a9
        j                 0b
2:
        memw
        retw.n

asm_test::not::u32::acquire:
        entry             a1, 32
        l32i.n            a11, a2, 0
        movi.n            a8, -1
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a12
        beqi              a13, 1, 2f
1:
        xor               a12, a11, a8
        wsr.scompare1     a11
        s32c1i            a12, a2, 0
        mov.n             a13, a10
        beq               a12, a11, 0b
        mov.n             a13, a9
        j                 0b
2:
        memw
        retw.n

asm_test::not::u32::relaxed:
        entry             a1, 32
        l32i.n            a11, a2, 0
        movi.n            a8, -1
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a12
        beqi              a13, 1, 2f
1:
        xor               a12, a11, a8
        wsr.scompare1     a11
        s32c1i            a12, a2, 0
        mov.n             a13, a10
        beq               a12, a11, 0b
        mov.n             a13, a9
        j                 0b
2:
        retw.n

asm_test::not::u32::release:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a8, -1
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a12
        beqi              a13, 1, 2f
1:
        xor               a12, a11, a8
        wsr.scompare1     a11
        s32c1i            a12, a2, 0
        mov.n             a13, a10
        beq               a12, a11, 0b
        mov.n             a13, a9
        j                 0b
2:
        retw.n

asm_test::sub::u8::acqrel:
        entry             a1, 32
        movi              a9, 255
        and               a8, a3, a9
        slli              a10, a2, 3
        movi.n            a11, 24
        and               a10, a10, a11
        ssl               a10
        sll               a8, a8
        ssl               a10
        sll               a9, a9
        movi.n            a10, -1
        xor               a10, a9, a10
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 1f
0:
        mov.n             a14, a15
        beqi              a7, 1, 2f
1:
        and               a15, a14, a10
        sub               a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 0b
        mov.n             a7, a12
        j                 0b
2:
        memw
        retw.n

asm_test::sub::u8::seqcst:
        entry             a1, 32
        movi              a9, 255
        and               a8, a3, a9
        slli              a10, a2, 3
        movi.n            a11, 24
        and               a10, a10, a11
        ssl               a10
        sll               a8, a8
        ssl               a10
        sll               a9, a9
        movi.n            a10, -1
        xor               a10, a9, a10
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 1f
0:
        mov.n             a14, a15
        beqi              a7, 1, 2f
1:
        and               a15, a14, a10
        sub               a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 0b
        mov.n             a7, a12
        j                 0b
2:
        memw
        retw.n

asm_test::sub::u8::acquire:
        entry             a1, 32
        movi              a9, 255
        and               a8, a3, a9
        slli              a10, a2, 3
        movi.n            a11, 24
        and               a10, a10, a11
        ssl               a10
        sll               a8, a8
        ssl               a10
        sll               a9, a9
        movi.n            a10, -1
        xor               a10, a9, a10
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 1f
0:
        mov.n             a14, a15
        beqi              a7, 1, 2f
1:
        and               a15, a14, a10
        sub               a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 0b
        mov.n             a7, a12
        j                 0b
2:
        memw
        retw.n

asm_test::sub::u8::relaxed:
        entry             a1, 32
        movi              a9, 255
        and               a8, a3, a9
        slli              a10, a2, 3
        movi.n            a11, 24
        and               a10, a10, a11
        ssl               a10
        sll               a8, a8
        ssl               a10
        sll               a9, a9
        movi.n            a10, -1
        xor               a10, a9, a10
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 1f
0:
        mov.n             a14, a15
        beqi              a7, 1, 2f
1:
        and               a15, a14, a10
        sub               a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 0b
        mov.n             a7, a12
        j                 0b
2:
        retw.n

asm_test::sub::u8::release:
        entry             a1, 32
        movi              a9, 255
        and               a8, a3, a9
        slli              a10, a2, 3
        movi.n            a11, 24
        and               a10, a10, a11
        ssl               a10
        sll               a8, a8
        ssl               a10
        sll               a9, a9
        movi.n            a10, -1
        xor               a10, a9, a10
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 1f
0:
        mov.n             a14, a15
        beqi              a7, 1, 2f
1:
        and               a15, a14, a10
        sub               a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 0b
        mov.n             a7, a12
        j                 0b
2:
        retw.n

.literal.asm_test::sub::u16::acqrel:
        .byte             0xff
        .byte             0xff

asm_test::sub::u16::acqrel:
0:
        entry             a1, 32
        l32r              a9, 0b (91004136 <asm_test::sub::u16::acqrel+0x91004136>)
        and               a8, a3, a9
        slli              a10, a2, 3
        movi.n            a11, 24
        and               a10, a10, a11
        ssl               a10
        sll               a8, a8
        ssl               a10
        sll               a9, a9
        movi.n            a10, -1
        xor               a10, a9, a10
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 2f
1:
        mov.n             a14, a15
        beqi              a7, 1, 3f
2:
        and               a15, a14, a10
        sub               a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 1b
        mov.n             a7, a12
        j                 1b
3:
        memw
        retw.n

.literal.asm_test::sub::u16::seqcst:
        .byte             0xff
        .byte             0xff

asm_test::sub::u16::seqcst:
0:
        entry             a1, 32
        l32r              a9, 0b (91004136 <asm_test::sub::u16::seqcst+0x91004136>)
        and               a8, a3, a9
        slli              a10, a2, 3
        movi.n            a11, 24
        and               a10, a10, a11
        ssl               a10
        sll               a8, a8
        ssl               a10
        sll               a9, a9
        movi.n            a10, -1
        xor               a10, a9, a10
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 2f
1:
        mov.n             a14, a15
        beqi              a7, 1, 3f
2:
        and               a15, a14, a10
        sub               a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 1b
        mov.n             a7, a12
        j                 1b
3:
        memw
        retw.n

.literal.asm_test::sub::u16::acquire:
        .byte             0xff
        .byte             0xff

asm_test::sub::u16::acquire:
0:
        entry             a1, 32
        l32r              a9, 0b (91004136 <asm_test::sub::u16::acquire+0x91004136>)
        and               a8, a3, a9
        slli              a10, a2, 3
        movi.n            a11, 24
        and               a10, a10, a11
        ssl               a10
        sll               a8, a8
        ssl               a10
        sll               a9, a9
        movi.n            a10, -1
        xor               a10, a9, a10
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 2f
1:
        mov.n             a14, a15
        beqi              a7, 1, 3f
2:
        and               a15, a14, a10
        sub               a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 1b
        mov.n             a7, a12
        j                 1b
3:
        memw
        retw.n

.literal.asm_test::sub::u16::relaxed:
        .byte             0xff
        .byte             0xff

asm_test::sub::u16::relaxed:
0:
        entry             a1, 32
        l32r              a9, 0b (91004136 <asm_test::sub::u16::relaxed+0x91004136>)
        and               a8, a3, a9
        slli              a10, a2, 3
        movi.n            a11, 24
        and               a10, a10, a11
        ssl               a10
        sll               a8, a8
        ssl               a10
        sll               a9, a9
        movi.n            a10, -1
        xor               a10, a9, a10
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 2f
1:
        mov.n             a14, a15
        beqi              a7, 1, 3f
2:
        and               a15, a14, a10
        sub               a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 1b
        mov.n             a7, a12
        j                 1b
3:
        retw.n

.literal.asm_test::sub::u16::release:
        .byte             0xff
        .byte             0xff

asm_test::sub::u16::release:
0:
        entry             a1, 32
        l32r              a9, 0b (91004136 <asm_test::sub::u16::release+0x91004136>)
        and               a8, a3, a9
        slli              a10, a2, 3
        movi.n            a11, 24
        and               a10, a10, a11
        ssl               a10
        sll               a8, a8
        ssl               a10
        sll               a9, a9
        movi.n            a10, -1
        xor               a10, a9, a10
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 2f
1:
        mov.n             a14, a15
        beqi              a7, 1, 3f
2:
        and               a15, a14, a10
        sub               a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 1b
        mov.n             a7, a12
        j                 1b
3:
        retw.n

asm_test::sub::u32::acqrel:
        entry             a1, 32
        memw
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 1f
0:
        mov.n             a10, a11
        beqi              a12, 1, 2f
1:
        sub               a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 0b
        mov.n             a12, a8
        j                 0b
2:
        memw
        retw.n

asm_test::sub::u32::seqcst:
        entry             a1, 32
        memw
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 1f
0:
        mov.n             a10, a11
        beqi              a12, 1, 2f
1:
        sub               a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 0b
        mov.n             a12, a8
        j                 0b
2:
        memw
        retw.n

asm_test::sub::u32::acquire:
        entry             a1, 32
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 1f
0:
        mov.n             a10, a11
        beqi              a12, 1, 2f
1:
        sub               a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 0b
        mov.n             a12, a8
        j                 0b
2:
        memw
        retw.n

asm_test::sub::u32::relaxed:
        entry             a1, 32
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 1f
0:
        mov.n             a10, a11
        beqi              a12, 1, 2f
1:
        sub               a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 0b
        mov.n             a12, a8
        j                 0b
2:
        retw.n

asm_test::sub::u32::release:
        entry             a1, 32
        memw
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 1f
0:
        mov.n             a10, a11
        beqi              a12, 1, 2f
1:
        sub               a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 0b
        mov.n             a12, a8
        j                 0b
2:
        retw.n

asm_test::xor::u8::acqrel:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        ssl               a9
        sll               a8, a8
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 1f
0:
        mov.n             a12, a13
        beqi              a14, 1, 2f
1:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 0b
        mov.n             a14, a10
        j                 0b
2:
        memw
        retw.n

asm_test::xor::u8::seqcst:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        ssl               a9
        sll               a8, a8
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 1f
0:
        mov.n             a12, a13
        beqi              a14, 1, 2f
1:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 0b
        mov.n             a14, a10
        j                 0b
2:
        memw
        retw.n

asm_test::xor::u8::acquire:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        ssl               a9
        sll               a8, a8
        movi.n            a9, -4
        and               a9, a2, a9
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 1f
0:
        mov.n             a12, a13
        beqi              a14, 1, 2f
1:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 0b
        mov.n             a14, a10
        j                 0b
2:
        memw
        retw.n

asm_test::xor::u8::relaxed:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        ssl               a9
        sll               a8, a8
        movi.n            a9, -4
        and               a9, a2, a9
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 1f
0:
        mov.n             a12, a13
        beqi              a14, 1, 2f
1:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 0b
        mov.n             a14, a10
        j                 0b
2:
        retw.n

asm_test::xor::u8::release:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        ssl               a9
        sll               a8, a8
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 1f
0:
        mov.n             a12, a13
        beqi              a14, 1, 2f
1:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 0b
        mov.n             a14, a10
        j                 0b
2:
        retw.n

.literal.asm_test::xor::u16::acqrel:
        .byte             0xff
        .byte             0xff

asm_test::xor::u16::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::xor::u16::acqrel+0x81004136>)
        and               a8, a3, a8
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        ssl               a9
        sll               a8, a8
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 2f
1:
        mov.n             a12, a13
        beqi              a14, 1, 3f
2:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 1b
        mov.n             a14, a10
        j                 1b
3:
        memw
        retw.n

.literal.asm_test::xor::u16::seqcst:
        .byte             0xff
        .byte             0xff

asm_test::xor::u16::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::xor::u16::seqcst+0x81004136>)
        and               a8, a3, a8
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        ssl               a9
        sll               a8, a8
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 2f
1:
        mov.n             a12, a13
        beqi              a14, 1, 3f
2:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 1b
        mov.n             a14, a10
        j                 1b
3:
        memw
        retw.n

.literal.asm_test::xor::u16::acquire:
        .byte             0xff
        .byte             0xff

asm_test::xor::u16::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::xor::u16::acquire+0x81004136>)
        and               a8, a3, a8
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        ssl               a9
        sll               a8, a8
        movi.n            a9, -4
        and               a9, a2, a9
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 2f
1:
        mov.n             a12, a13
        beqi              a14, 1, 3f
2:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 1b
        mov.n             a14, a10
        j                 1b
3:
        memw
        retw.n

.literal.asm_test::xor::u16::relaxed:
        .byte             0xff
        .byte             0xff

asm_test::xor::u16::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::xor::u16::relaxed+0x81004136>)
        and               a8, a3, a8
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        ssl               a9
        sll               a8, a8
        movi.n            a9, -4
        and               a9, a2, a9
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 2f
1:
        mov.n             a12, a13
        beqi              a14, 1, 3f
2:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 1b
        mov.n             a14, a10
        j                 1b
3:
        retw.n

.literal.asm_test::xor::u16::release:
        .byte             0xff
        .byte             0xff

asm_test::xor::u16::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::xor::u16::release+0x81004136>)
        and               a8, a3, a8
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        ssl               a9
        sll               a8, a8
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 2f
1:
        mov.n             a12, a13
        beqi              a14, 1, 3f
2:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 1b
        mov.n             a14, a10
        j                 1b
3:
        retw.n

asm_test::xor::u32::acqrel:
        entry             a1, 32
        memw
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 1f
0:
        mov.n             a10, a11
        beqi              a12, 1, 2f
1:
        xor               a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 0b
        mov.n             a12, a8
        j                 0b
2:
        memw
        retw.n

asm_test::xor::u32::seqcst:
        entry             a1, 32
        memw
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 1f
0:
        mov.n             a10, a11
        beqi              a12, 1, 2f
1:
        xor               a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 0b
        mov.n             a12, a8
        j                 0b
2:
        memw
        retw.n

asm_test::xor::u32::acquire:
        entry             a1, 32
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 1f
0:
        mov.n             a10, a11
        beqi              a12, 1, 2f
1:
        xor               a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 0b
        mov.n             a12, a8
        j                 0b
2:
        memw
        retw.n

asm_test::xor::u32::relaxed:
        entry             a1, 32
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 1f
0:
        mov.n             a10, a11
        beqi              a12, 1, 2f
1:
        xor               a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 0b
        mov.n             a12, a8
        j                 0b
2:
        retw.n

asm_test::xor::u32::release:
        entry             a1, 32
        memw
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 1f
0:
        mov.n             a10, a11
        beqi              a12, 1, 2f
1:
        xor               a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 0b
        mov.n             a12, a8
        j                 0b
2:
        retw.n

asm_test::load::u8::seqcst:
        entry             a1, 32
        l8ui              a2, a2, 0
        memw
        retw.n

asm_test::load::u8::acquire:
        entry             a1, 32
        l8ui              a2, a2, 0
        memw
        retw.n

asm_test::load::u8::relaxed:
        entry             a1, 32
        l8ui              a2, a2, 0
        retw.n

asm_test::load::u16::seqcst:
        entry             a1, 32
        l16ui             a2, a2, 0
        memw
        retw.n

asm_test::load::u16::acquire:
        entry             a1, 32
        l16ui             a2, a2, 0
        memw
        retw.n

asm_test::load::u16::relaxed:
        entry             a1, 32
        l16ui             a2, a2, 0
        retw.n

asm_test::load::u32::seqcst:
        entry             a1, 32
        l32i.n            a2, a2, 0
        memw
        retw.n

asm_test::load::u32::acquire:
        entry             a1, 32
        l32i.n            a2, a2, 0
        memw
        retw.n

asm_test::load::u32::relaxed:
        entry             a1, 32
        l32i.n            a2, a2, 0
        retw.n

asm_test::load::bool::seqcst:
        entry             a1, 32
        l8ui              a8, a2, 0
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        memw
        retw.n

asm_test::load::bool::acquire:
        entry             a1, 32
        l8ui              a8, a2, 0
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        memw
        retw.n

asm_test::load::bool::relaxed:
        entry             a1, 32
        l8ui              a8, a2, 0
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::swap::u8::acqrel:
        entry             a1, 32
        movi              a10, 255
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a15, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 1f
0:
        mov.n             a15, a14
        beqi              a7, 1, 2f
1:
        and               a14, a15, a10
        or                a14, a14, a9
        wsr.scompare1     a15
        s32c1i            a14, a11, 0
        mov.n             a7, a13
        beq               a14, a15, 0b
        mov.n             a7, a12
        j                 0b
2:
        ssr               a8
        srl               a2, a14
        memw
        retw.n

asm_test::swap::u8::seqcst:
        entry             a1, 32
        movi              a10, 255
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a15, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 1f
0:
        mov.n             a15, a14
        beqi              a7, 1, 2f
1:
        and               a14, a15, a10
        or                a14, a14, a9
        wsr.scompare1     a15
        s32c1i            a14, a11, 0
        mov.n             a7, a13
        beq               a14, a15, 0b
        mov.n             a7, a12
        j                 0b
2:
        ssr               a8
        srl               a2, a14
        memw
        retw.n

asm_test::swap::u8::acquire:
        entry             a1, 32
        movi              a10, 255
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a15, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 1f
0:
        mov.n             a15, a14
        beqi              a7, 1, 2f
1:
        and               a14, a15, a10
        or                a14, a14, a9
        wsr.scompare1     a15
        s32c1i            a14, a11, 0
        mov.n             a7, a13
        beq               a14, a15, 0b
        mov.n             a7, a12
        j                 0b
2:
        ssr               a8
        srl               a2, a14
        memw
        retw.n

asm_test::swap::u8::relaxed:
        entry             a1, 32
        movi              a10, 255
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a15, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 1f
0:
        mov.n             a15, a14
        beqi              a7, 1, 2f
1:
        and               a14, a15, a10
        or                a14, a14, a9
        wsr.scompare1     a15
        s32c1i            a14, a11, 0
        mov.n             a7, a13
        beq               a14, a15, 0b
        mov.n             a7, a12
        j                 0b
2:
        ssr               a8
        srl               a2, a14
        retw.n

asm_test::swap::u8::release:
        entry             a1, 32
        movi              a10, 255
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a15, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 1f
0:
        mov.n             a15, a14
        beqi              a7, 1, 2f
1:
        and               a14, a15, a10
        or                a14, a14, a9
        wsr.scompare1     a15
        s32c1i            a14, a11, 0
        mov.n             a7, a13
        beq               a14, a15, 0b
        mov.n             a7, a12
        j                 0b
2:
        ssr               a8
        srl               a2, a14
        retw.n

.literal.asm_test::swap::u16::acqrel:
        .byte             0xff
        .byte             0xff

asm_test::swap::u16::acqrel:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::swap::u16::acqrel+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a15, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 2f
1:
        mov.n             a15, a14
        beqi              a7, 1, 3f
2:
        and               a14, a15, a10
        or                a14, a14, a9
        wsr.scompare1     a15
        s32c1i            a14, a11, 0
        mov.n             a7, a13
        beq               a14, a15, 1b
        mov.n             a7, a12
        j                 1b
3:
        ssr               a8
        srl               a2, a14
        memw
        retw.n

.literal.asm_test::swap::u16::seqcst:
        .byte             0xff
        .byte             0xff

asm_test::swap::u16::seqcst:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::swap::u16::seqcst+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a15, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 2f
1:
        mov.n             a15, a14
        beqi              a7, 1, 3f
2:
        and               a14, a15, a10
        or                a14, a14, a9
        wsr.scompare1     a15
        s32c1i            a14, a11, 0
        mov.n             a7, a13
        beq               a14, a15, 1b
        mov.n             a7, a12
        j                 1b
3:
        ssr               a8
        srl               a2, a14
        memw
        retw.n

.literal.asm_test::swap::u16::acquire:
        .byte             0xff
        .byte             0xff

asm_test::swap::u16::acquire:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::swap::u16::acquire+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a15, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 2f
1:
        mov.n             a15, a14
        beqi              a7, 1, 3f
2:
        and               a14, a15, a10
        or                a14, a14, a9
        wsr.scompare1     a15
        s32c1i            a14, a11, 0
        mov.n             a7, a13
        beq               a14, a15, 1b
        mov.n             a7, a12
        j                 1b
3:
        ssr               a8
        srl               a2, a14
        memw
        retw.n

.literal.asm_test::swap::u16::relaxed:
        .byte             0xff
        .byte             0xff

asm_test::swap::u16::relaxed:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::swap::u16::relaxed+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a15, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 2f
1:
        mov.n             a15, a14
        beqi              a7, 1, 3f
2:
        and               a14, a15, a10
        or                a14, a14, a9
        wsr.scompare1     a15
        s32c1i            a14, a11, 0
        mov.n             a7, a13
        beq               a14, a15, 1b
        mov.n             a7, a12
        j                 1b
3:
        ssr               a8
        srl               a2, a14
        retw.n

.literal.asm_test::swap::u16::release:
        .byte             0xff
        .byte             0xff

asm_test::swap::u16::release:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::swap::u16::release+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a15, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 2f
1:
        mov.n             a15, a14
        beqi              a7, 1, 3f
2:
        and               a14, a15, a10
        or                a14, a14, a9
        wsr.scompare1     a15
        s32c1i            a14, a11, 0
        mov.n             a7, a13
        beq               a14, a15, 1b
        mov.n             a7, a12
        j                 1b
3:
        ssr               a8
        srl               a2, a14
        retw.n

asm_test::swap::u32::acqrel:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        wsr.scompare1     a11
        mov.n             a8, a3
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::swap::u32::seqcst:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        wsr.scompare1     a11
        mov.n             a8, a3
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::swap::u32::acquire:
        entry             a1, 32
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        wsr.scompare1     a11
        mov.n             a8, a3
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::swap::u32::relaxed:
        entry             a1, 32
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        wsr.scompare1     a11
        mov.n             a8, a3
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        mov.n             a2, a8
        retw.n

asm_test::swap::u32::release:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        wsr.scompare1     a11
        mov.n             a8, a3
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        mov.n             a2, a8
        retw.n

asm_test::swap::bool::acqrel:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a10, a3
        movi              a9, 255
        ssl               a8
        sll               a11, a9
        movi.n            a12, -1
        xor               a11, a11, a12
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a7, a12, 0
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a7, a15
        beqi              a6, 1, 2f
1:
        and               a15, a7, a11
        or                a15, a15, a10
        wsr.scompare1     a7
        s32c1i            a15, a12, 0
        mov.n             a6, a14
        beq               a15, a7, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a8, a15
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 3f
        movi.n            a2, 1
3:
        memw
        retw.n

asm_test::swap::bool::seqcst:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a10, a3
        movi              a9, 255
        ssl               a8
        sll               a11, a9
        movi.n            a12, -1
        xor               a11, a11, a12
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a7, a12, 0
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a7, a15
        beqi              a6, 1, 2f
1:
        and               a15, a7, a11
        or                a15, a15, a10
        wsr.scompare1     a7
        s32c1i            a15, a12, 0
        mov.n             a6, a14
        beq               a15, a7, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a8, a15
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 3f
        movi.n            a2, 1
3:
        memw
        retw.n

asm_test::swap::bool::acquire:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a10, a3
        movi              a9, 255
        ssl               a8
        sll               a11, a9
        movi.n            a12, -1
        xor               a11, a11, a12
        movi.n            a12, -4
        and               a12, a2, a12
        l32i.n            a7, a12, 0
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a7, a15
        beqi              a6, 1, 2f
1:
        and               a15, a7, a11
        or                a15, a15, a10
        wsr.scompare1     a7
        s32c1i            a15, a12, 0
        mov.n             a6, a14
        beq               a15, a7, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a8, a15
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 3f
        movi.n            a2, 1
3:
        memw
        retw.n

asm_test::swap::bool::relaxed:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a10, a3
        movi              a9, 255
        ssl               a8
        sll               a11, a9
        movi.n            a12, -1
        xor               a11, a11, a12
        movi.n            a12, -4
        and               a12, a2, a12
        l32i.n            a7, a12, 0
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a7, a15
        beqi              a6, 1, 2f
1:
        and               a15, a7, a11
        or                a15, a15, a10
        wsr.scompare1     a7
        s32c1i            a15, a12, 0
        mov.n             a6, a14
        beq               a15, a7, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a8, a15
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 3f
        movi.n            a2, 1
3:
        retw.n

asm_test::swap::bool::release:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a10, a3
        movi              a9, 255
        ssl               a8
        sll               a11, a9
        movi.n            a12, -1
        xor               a11, a11, a12
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a7, a12, 0
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a7, a15
        beqi              a6, 1, 2f
1:
        and               a15, a7, a11
        or                a15, a15, a10
        wsr.scompare1     a7
        s32c1i            a15, a12, 0
        mov.n             a6, a14
        beq               a15, a7, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a8, a15
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 3f
        movi.n            a2, 1
3:
        retw.n

asm_test::store::u8::seqcst:
        entry             a1, 32
        memw
        s8i               a3, a2, 0
        memw
        retw.n

asm_test::store::u8::relaxed:
        entry             a1, 32
        s8i               a3, a2, 0
        retw.n

asm_test::store::u8::release:
        entry             a1, 32
        memw
        s8i               a3, a2, 0
        retw.n

asm_test::store::u16::seqcst:
        entry             a1, 32
        memw
        s16i              a3, a2, 0
        memw
        retw.n

asm_test::store::u16::relaxed:
        entry             a1, 32
        s16i              a3, a2, 0
        retw.n

asm_test::store::u16::release:
        entry             a1, 32
        memw
        s16i              a3, a2, 0
        retw.n

asm_test::store::u32::seqcst:
        entry             a1, 32
        memw
        s32i.n            a3, a2, 0
        memw
        retw.n

asm_test::store::u32::relaxed:
        entry             a1, 32
        s32i.n            a3, a2, 0
        retw.n

asm_test::store::u32::release:
        entry             a1, 32
        memw
        s32i.n            a3, a2, 0
        retw.n

asm_test::store::bool::seqcst:
        entry             a1, 32
        memw
        s8i               a3, a2, 0
        memw
        retw.n

asm_test::store::bool::relaxed:
        entry             a1, 32
        s8i               a3, a2, 0
        retw.n

asm_test::store::bool::release:
        entry             a1, 32
        memw
        s8i               a3, a2, 0
        retw.n

asm_test::fetch_or::u8::acqrel:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        or                a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 0b
        mov.n             a15, a11
        j                 0b
2:
        ssr               a8
        srl               a2, a13
        memw
        retw.n

asm_test::fetch_or::u8::seqcst:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        or                a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 0b
        mov.n             a15, a11
        j                 0b
2:
        ssr               a8
        srl               a2, a13
        memw
        retw.n

asm_test::fetch_or::u8::acquire:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        or                a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 0b
        mov.n             a15, a11
        j                 0b
2:
        ssr               a8
        srl               a2, a13
        memw
        retw.n

asm_test::fetch_or::u8::relaxed:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        or                a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 0b
        mov.n             a15, a11
        j                 0b
2:
        ssr               a8
        srl               a2, a13
        retw.n

asm_test::fetch_or::u8::release:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        or                a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 0b
        mov.n             a15, a11
        j                 0b
2:
        ssr               a8
        srl               a2, a13
        retw.n

.literal.asm_test::fetch_or::u16::acqrel:
        .byte             0xff
        .byte             0xff

asm_test::fetch_or::u16::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_or::u16::acqrel+0x81004136>)
        and               a9, a3, a8
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 2f
1:
        mov.n             a14, a13
        beqi              a15, 1, 3f
2:
        or                a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 1b
        mov.n             a15, a11
        j                 1b
3:
        ssr               a8
        srl               a2, a13
        memw
        retw.n

.literal.asm_test::fetch_or::u16::seqcst:
        .byte             0xff
        .byte             0xff

asm_test::fetch_or::u16::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_or::u16::seqcst+0x81004136>)
        and               a9, a3, a8
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 2f
1:
        mov.n             a14, a13
        beqi              a15, 1, 3f
2:
        or                a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 1b
        mov.n             a15, a11
        j                 1b
3:
        ssr               a8
        srl               a2, a13
        memw
        retw.n

.literal.asm_test::fetch_or::u16::acquire:
        .byte             0xff
        .byte             0xff

asm_test::fetch_or::u16::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_or::u16::acquire+0x81004136>)
        and               a9, a3, a8
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 2f
1:
        mov.n             a14, a13
        beqi              a15, 1, 3f
2:
        or                a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 1b
        mov.n             a15, a11
        j                 1b
3:
        ssr               a8
        srl               a2, a13
        memw
        retw.n

.literal.asm_test::fetch_or::u16::relaxed:
        .byte             0xff
        .byte             0xff

asm_test::fetch_or::u16::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_or::u16::relaxed+0x81004136>)
        and               a9, a3, a8
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 2f
1:
        mov.n             a14, a13
        beqi              a15, 1, 3f
2:
        or                a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 1b
        mov.n             a15, a11
        j                 1b
3:
        ssr               a8
        srl               a2, a13
        retw.n

.literal.asm_test::fetch_or::u16::release:
        .byte             0xff
        .byte             0xff

asm_test::fetch_or::u16::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_or::u16::release+0x81004136>)
        and               a9, a3, a8
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 2f
1:
        mov.n             a14, a13
        beqi              a15, 1, 3f
2:
        or                a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 1b
        mov.n             a15, a11
        j                 1b
3:
        ssr               a8
        srl               a2, a13
        retw.n

asm_test::fetch_or::u32::acqrel:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        or                a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u32::seqcst:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        or                a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u32::acquire:
        entry             a1, 32
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        or                a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u32::relaxed:
        entry             a1, 32
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        or                a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u32::release:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        or                a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::bool::acqrel:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a9, a3
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        or                a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 0b
        mov.n             a15, a11
        j                 0b
2:
        ssr               a8
        srl               a8, a13
        movi              a9, 255
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 3f
        movi.n            a2, 1
3:
        memw
        retw.n

asm_test::fetch_or::bool::seqcst:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a9, a3
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        or                a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 0b
        mov.n             a15, a11
        j                 0b
2:
        ssr               a8
        srl               a8, a13
        movi              a9, 255
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 3f
        movi.n            a2, 1
3:
        memw
        retw.n

asm_test::fetch_or::bool::acquire:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a9, a3
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        or                a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 0b
        mov.n             a15, a11
        j                 0b
2:
        ssr               a8
        srl               a8, a13
        movi              a9, 255
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 3f
        movi.n            a2, 1
3:
        memw
        retw.n

asm_test::fetch_or::bool::relaxed:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a9, a3
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        or                a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 0b
        mov.n             a15, a11
        j                 0b
2:
        ssr               a8
        srl               a8, a13
        movi              a9, 255
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 3f
        movi.n            a2, 1
3:
        retw.n

asm_test::fetch_or::bool::release:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a9, a3
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        or                a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 0b
        mov.n             a15, a11
        j                 0b
2:
        ssr               a8
        srl               a8, a13
        movi              a9, 255
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 3f
        movi.n            a2, 1
3:
        retw.n

asm_test::fetch_add::u8::acqrel:
        entry             a1, 32
        movi              a10, 255
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a15, a7
        beqi              a6, 1, 2f
1:
        and               a7, a15, a11
        add.n             a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a2, a7
        memw
        retw.n

asm_test::fetch_add::u8::seqcst:
        entry             a1, 32
        movi              a10, 255
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a15, a7
        beqi              a6, 1, 2f
1:
        and               a7, a15, a11
        add.n             a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a2, a7
        memw
        retw.n

asm_test::fetch_add::u8::acquire:
        entry             a1, 32
        movi              a10, 255
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a12, -4
        and               a12, a2, a12
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a15, a7
        beqi              a6, 1, 2f
1:
        and               a7, a15, a11
        add.n             a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a2, a7
        memw
        retw.n

asm_test::fetch_add::u8::relaxed:
        entry             a1, 32
        movi              a10, 255
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a12, -4
        and               a12, a2, a12
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a15, a7
        beqi              a6, 1, 2f
1:
        and               a7, a15, a11
        add.n             a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a2, a7
        retw.n

asm_test::fetch_add::u8::release:
        entry             a1, 32
        movi              a10, 255
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a15, a7
        beqi              a6, 1, 2f
1:
        and               a7, a15, a11
        add.n             a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a2, a7
        retw.n

.literal.asm_test::fetch_add::u16::acqrel:
        .byte             0xff
        .byte             0xff

asm_test::fetch_add::u16::acqrel:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::fetch_add::u16::acqrel+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        movi.n            a14, 1
        j                 2f
1:
        mov.n             a15, a7
        beqi              a6, 1, 3f
2:
        and               a7, a15, a11
        add.n             a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 1b
        mov.n             a6, a13
        j                 1b
3:
        ssr               a8
        srl               a2, a7
        memw
        retw.n

.literal.asm_test::fetch_add::u16::seqcst:
        .byte             0xff
        .byte             0xff

asm_test::fetch_add::u16::seqcst:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::fetch_add::u16::seqcst+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        movi.n            a14, 1
        j                 2f
1:
        mov.n             a15, a7
        beqi              a6, 1, 3f
2:
        and               a7, a15, a11
        add.n             a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 1b
        mov.n             a6, a13
        j                 1b
3:
        ssr               a8
        srl               a2, a7
        memw
        retw.n

.literal.asm_test::fetch_add::u16::acquire:
        .byte             0xff
        .byte             0xff

asm_test::fetch_add::u16::acquire:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::fetch_add::u16::acquire+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a12, -4
        and               a12, a2, a12
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        movi.n            a14, 1
        j                 2f
1:
        mov.n             a15, a7
        beqi              a6, 1, 3f
2:
        and               a7, a15, a11
        add.n             a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 1b
        mov.n             a6, a13
        j                 1b
3:
        ssr               a8
        srl               a2, a7
        memw
        retw.n

.literal.asm_test::fetch_add::u16::relaxed:
        .byte             0xff
        .byte             0xff

asm_test::fetch_add::u16::relaxed:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::fetch_add::u16::relaxed+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a12, -4
        and               a12, a2, a12
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        movi.n            a14, 1
        j                 2f
1:
        mov.n             a15, a7
        beqi              a6, 1, 3f
2:
        and               a7, a15, a11
        add.n             a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 1b
        mov.n             a6, a13
        j                 1b
3:
        ssr               a8
        srl               a2, a7
        retw.n

.literal.asm_test::fetch_add::u16::release:
        .byte             0xff
        .byte             0xff

asm_test::fetch_add::u16::release:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::fetch_add::u16::release+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        movi.n            a14, 1
        j                 2f
1:
        mov.n             a15, a7
        beqi              a6, 1, 3f
2:
        and               a7, a15, a11
        add.n             a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 1b
        mov.n             a6, a13
        j                 1b
3:
        ssr               a8
        srl               a2, a7
        retw.n

asm_test::fetch_add::u32::acqrel:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        add.n             a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_add::u32::seqcst:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        add.n             a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_add::u32::acquire:
        entry             a1, 32
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        add.n             a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_add::u32::relaxed:
        entry             a1, 32
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        add.n             a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        mov.n             a2, a8
        retw.n

asm_test::fetch_add::u32::release:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        add.n             a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u8::acqrel:
        entry             a1, 32
        movi              a9, 255
        and               a10, a3, a9
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a9, a9
        movi.n            a11, -1
        xor               a9, a9, a11
        or                a9, a10, a9
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        and               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 0b
        mov.n             a15, a11
        j                 0b
2:
        ssr               a8
        srl               a2, a13
        memw
        retw.n

asm_test::fetch_and::u8::seqcst:
        entry             a1, 32
        movi              a9, 255
        and               a10, a3, a9
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a9, a9
        movi.n            a11, -1
        xor               a9, a9, a11
        or                a9, a10, a9
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        and               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 0b
        mov.n             a15, a11
        j                 0b
2:
        ssr               a8
        srl               a2, a13
        memw
        retw.n

asm_test::fetch_and::u8::acquire:
        entry             a1, 32
        movi              a9, 255
        and               a10, a3, a9
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a9, a9
        movi.n            a11, -1
        xor               a9, a9, a11
        or                a9, a10, a9
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        and               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 0b
        mov.n             a15, a11
        j                 0b
2:
        ssr               a8
        srl               a2, a13
        memw
        retw.n

asm_test::fetch_and::u8::relaxed:
        entry             a1, 32
        movi              a9, 255
        and               a10, a3, a9
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a9, a9
        movi.n            a11, -1
        xor               a9, a9, a11
        or                a9, a10, a9
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        and               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 0b
        mov.n             a15, a11
        j                 0b
2:
        ssr               a8
        srl               a2, a13
        retw.n

asm_test::fetch_and::u8::release:
        entry             a1, 32
        movi              a9, 255
        and               a10, a3, a9
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a9, a9
        movi.n            a11, -1
        xor               a9, a9, a11
        or                a9, a10, a9
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        and               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 0b
        mov.n             a15, a11
        j                 0b
2:
        ssr               a8
        srl               a2, a13
        retw.n

.literal.asm_test::fetch_and::u16::acqrel:
        .byte             0xff
        .byte             0xff

asm_test::fetch_and::u16::acqrel:
0:
        entry             a1, 32
        l32r              a9, 0b (91004136 <asm_test::fetch_and::u16::acqrel+0x91004136>)
        and               a10, a3, a9
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a9, a9
        movi.n            a11, -1
        xor               a9, a9, a11
        or                a9, a10, a9
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 2f
1:
        mov.n             a14, a13
        beqi              a15, 1, 3f
2:
        and               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 1b
        mov.n             a15, a11
        j                 1b
3:
        ssr               a8
        srl               a2, a13
        memw
        retw.n

.literal.asm_test::fetch_and::u16::seqcst:
        .byte             0xff
        .byte             0xff

asm_test::fetch_and::u16::seqcst:
0:
        entry             a1, 32
        l32r              a9, 0b (91004136 <asm_test::fetch_and::u16::seqcst+0x91004136>)
        and               a10, a3, a9
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a9, a9
        movi.n            a11, -1
        xor               a9, a9, a11
        or                a9, a10, a9
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 2f
1:
        mov.n             a14, a13
        beqi              a15, 1, 3f
2:
        and               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 1b
        mov.n             a15, a11
        j                 1b
3:
        ssr               a8
        srl               a2, a13
        memw
        retw.n

.literal.asm_test::fetch_and::u16::acquire:
        .byte             0xff
        .byte             0xff

asm_test::fetch_and::u16::acquire:
0:
        entry             a1, 32
        l32r              a9, 0b (91004136 <asm_test::fetch_and::u16::acquire+0x91004136>)
        and               a10, a3, a9
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a9, a9
        movi.n            a11, -1
        xor               a9, a9, a11
        or                a9, a10, a9
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 2f
1:
        mov.n             a14, a13
        beqi              a15, 1, 3f
2:
        and               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 1b
        mov.n             a15, a11
        j                 1b
3:
        ssr               a8
        srl               a2, a13
        memw
        retw.n

.literal.asm_test::fetch_and::u16::relaxed:
        .byte             0xff
        .byte             0xff

asm_test::fetch_and::u16::relaxed:
0:
        entry             a1, 32
        l32r              a9, 0b (91004136 <asm_test::fetch_and::u16::relaxed+0x91004136>)
        and               a10, a3, a9
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a9, a9
        movi.n            a11, -1
        xor               a9, a9, a11
        or                a9, a10, a9
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 2f
1:
        mov.n             a14, a13
        beqi              a15, 1, 3f
2:
        and               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 1b
        mov.n             a15, a11
        j                 1b
3:
        ssr               a8
        srl               a2, a13
        retw.n

.literal.asm_test::fetch_and::u16::release:
        .byte             0xff
        .byte             0xff

asm_test::fetch_and::u16::release:
0:
        entry             a1, 32
        l32r              a9, 0b (91004136 <asm_test::fetch_and::u16::release+0x91004136>)
        and               a10, a3, a9
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a10, a10
        ssl               a8
        sll               a9, a9
        movi.n            a11, -1
        xor               a9, a9, a11
        or                a9, a10, a9
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 2f
1:
        mov.n             a14, a13
        beqi              a15, 1, 3f
2:
        and               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 1b
        mov.n             a15, a11
        j                 1b
3:
        ssr               a8
        srl               a2, a13
        retw.n

asm_test::fetch_and::u32::acqrel:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        and               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u32::seqcst:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        and               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u32::acquire:
        entry             a1, 32
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        and               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u32::relaxed:
        entry             a1, 32
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        and               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u32::release:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        and               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::bool::acqrel:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a10, a3
        movi              a9, 255
        ssl               a8
        sll               a11, a9
        movi.n            a12, -1
        xor               a11, a11, a12
        or                a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a15, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 1f
0:
        mov.n             a15, a14
        beqi              a7, 1, 2f
1:
        and               a14, a15, a10
        wsr.scompare1     a15
        s32c1i            a14, a11, 0
        mov.n             a7, a13
        beq               a14, a15, 0b
        mov.n             a7, a12
        j                 0b
2:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 3f
        movi.n            a2, 1
3:
        memw
        retw.n

asm_test::fetch_and::bool::seqcst:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a10, a3
        movi              a9, 255
        ssl               a8
        sll               a11, a9
        movi.n            a12, -1
        xor               a11, a11, a12
        or                a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a15, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 1f
0:
        mov.n             a15, a14
        beqi              a7, 1, 2f
1:
        and               a14, a15, a10
        wsr.scompare1     a15
        s32c1i            a14, a11, 0
        mov.n             a7, a13
        beq               a14, a15, 0b
        mov.n             a7, a12
        j                 0b
2:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 3f
        movi.n            a2, 1
3:
        memw
        retw.n

asm_test::fetch_and::bool::acquire:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a10, a3
        movi              a9, 255
        ssl               a8
        sll               a11, a9
        movi.n            a12, -1
        xor               a11, a11, a12
        or                a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a15, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 1f
0:
        mov.n             a15, a14
        beqi              a7, 1, 2f
1:
        and               a14, a15, a10
        wsr.scompare1     a15
        s32c1i            a14, a11, 0
        mov.n             a7, a13
        beq               a14, a15, 0b
        mov.n             a7, a12
        j                 0b
2:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 3f
        movi.n            a2, 1
3:
        memw
        retw.n

asm_test::fetch_and::bool::relaxed:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a10, a3
        movi              a9, 255
        ssl               a8
        sll               a11, a9
        movi.n            a12, -1
        xor               a11, a11, a12
        or                a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a15, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 1f
0:
        mov.n             a15, a14
        beqi              a7, 1, 2f
1:
        and               a14, a15, a10
        wsr.scompare1     a15
        s32c1i            a14, a11, 0
        mov.n             a7, a13
        beq               a14, a15, 0b
        mov.n             a7, a12
        j                 0b
2:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 3f
        movi.n            a2, 1
3:
        retw.n

asm_test::fetch_and::bool::release:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a10, a3
        movi              a9, 255
        ssl               a8
        sll               a11, a9
        movi.n            a12, -1
        xor               a11, a11, a12
        or                a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a15, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 1f
0:
        mov.n             a15, a14
        beqi              a7, 1, 2f
1:
        and               a14, a15, a10
        wsr.scompare1     a15
        s32c1i            a14, a11, 0
        mov.n             a7, a13
        beq               a14, a15, 0b
        mov.n             a7, a12
        j                 0b
2:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 3f
        movi.n            a2, 1
3:
        retw.n

asm_test::fetch_max::i8::acqrel:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a10, a9
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a15, a11, 0
        sext              a12, a3, 7
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a15, a7
        beqi              a6, 1, 2f
1:
        and               a7, a15, a10
        ssr               a8
        srl               a6, a15
        sext              a6, a6, 7
        max               a6, a6, a12
        and               a6, a6, a9
        ssl               a8
        sll               a6, a6
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a11, 0
        mov.n             a6, a14
        beq               a7, a15, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a2, a7
        memw
        retw.n

asm_test::fetch_max::i8::seqcst:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a10, a9
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a15, a11, 0
        sext              a12, a3, 7
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a15, a7
        beqi              a6, 1, 2f
1:
        and               a7, a15, a10
        ssr               a8
        srl               a6, a15
        sext              a6, a6, 7
        max               a6, a6, a12
        and               a6, a6, a9
        ssl               a8
        sll               a6, a6
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a11, 0
        mov.n             a6, a14
        beq               a7, a15, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a2, a7
        memw
        retw.n

asm_test::fetch_max::i8::acquire:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a10, a9
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a15, a11, 0
        sext              a12, a3, 7
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a15, a7
        beqi              a6, 1, 2f
1:
        and               a7, a15, a10
        ssr               a8
        srl               a6, a15
        sext              a6, a6, 7
        max               a6, a6, a12
        and               a6, a6, a9
        ssl               a8
        sll               a6, a6
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a11, 0
        mov.n             a6, a14
        beq               a7, a15, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a2, a7
        memw
        retw.n

asm_test::fetch_max::i8::relaxed:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a10, a9
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a15, a11, 0
        sext              a12, a3, 7
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a15, a7
        beqi              a6, 1, 2f
1:
        and               a7, a15, a10
        ssr               a8
        srl               a6, a15
        sext              a6, a6, 7
        max               a6, a6, a12
        and               a6, a6, a9
        ssl               a8
        sll               a6, a6
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a11, 0
        mov.n             a6, a14
        beq               a7, a15, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a2, a7
        retw.n

asm_test::fetch_max::i8::release:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a10, a9
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a15, a11, 0
        sext              a12, a3, 7
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a15, a7
        beqi              a6, 1, 2f
1:
        and               a7, a15, a10
        ssr               a8
        srl               a6, a15
        sext              a6, a6, 7
        max               a6, a6, a12
        and               a6, a6, a9
        ssl               a8
        sll               a6, a6
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a11, 0
        mov.n             a6, a14
        beq               a7, a15, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a2, a7
        retw.n

.literal.asm_test::fetch_max::i16::acqrel:
        .byte             0xff
        .byte             0xff

asm_test::fetch_max::i16::acqrel:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
0:
        and               a8, a8, a9
        l32r              a9, 0b (91108890 <asm_test::fetch_max::i16::acqrel+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        sext              a11, a3, 15
        movi.n            a12, 0
        movi.n            a13, 1
        j                 2f
1:
        mov.n             a14, a15
        beqi              a7, 1, 3f
2:
        and               a15, a14, a9
        ssr               a8
        srl               a7, a14
        sext              a7, a7, 15
        max               a7, a7, a11
        l32r              a6, 40 <asm_test::fetch_max::i16::acqrel+0x40> (ffff6153 <asm_test::fetch_max::i16::acqrel+0xffff6153>)
        and               a7, a7, a6
        ssl               a8
        sll               a7, a7
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a10, 0
        mov.n             a7, a13
        beq               a15, a14, 1b
        mov.n             a7, a12
        j                 1b
3:
        ssr               a8
        srl               a2, a15
        memw
        retw.n

.literal.asm_test::fetch_max::i16::seqcst:
        .byte             0xff
        .byte             0xff

asm_test::fetch_max::i16::seqcst:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
0:
        and               a8, a8, a9
        l32r              a9, 0b (91108890 <asm_test::fetch_max::i16::seqcst+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        sext              a11, a3, 15
        movi.n            a12, 0
        movi.n            a13, 1
        j                 2f
1:
        mov.n             a14, a15
        beqi              a7, 1, 3f
2:
        and               a15, a14, a9
        ssr               a8
        srl               a7, a14
        sext              a7, a7, 15
        max               a7, a7, a11
        l32r              a6, 40 <asm_test::fetch_max::i16::seqcst+0x40> (ffff6153 <asm_test::fetch_max::i16::seqcst+0xffff6153>)
        and               a7, a7, a6
        ssl               a8
        sll               a7, a7
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a10, 0
        mov.n             a7, a13
        beq               a15, a14, 1b
        mov.n             a7, a12
        j                 1b
3:
        ssr               a8
        srl               a2, a15
        memw
        retw.n

.literal.asm_test::fetch_max::i16::acquire:
        .byte             0xff
        .byte             0xff

asm_test::fetch_max::i16::acquire:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
0:
        and               a8, a8, a9
        l32r              a9, 0b (91108890 <asm_test::fetch_max::i16::acquire+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a14, a10, 0
        sext              a11, a3, 15
        movi.n            a12, 0
        movi.n            a13, 1
        j                 2f
1:
        mov.n             a14, a15
        beqi              a7, 1, 3f
2:
        and               a15, a14, a9
        ssr               a8
        srl               a7, a14
        sext              a7, a7, 15
        max               a7, a7, a11
        l32r              a6, 3c <asm_test::fetch_max::i16::acquire+0x3c> (ff615377 <asm_test::fetch_max::i16::acquire+0xff615377>)
        and               a7, a7, a6
        ssl               a8
        sll               a7, a7
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a10, 0
        mov.n             a7, a13
        beq               a15, a14, 1b
        mov.n             a7, a12
        j                 1b
3:
        ssr               a8
        srl               a2, a15
        memw
        retw.n

.literal.asm_test::fetch_max::i16::relaxed:
        .byte             0xff
        .byte             0xff

asm_test::fetch_max::i16::relaxed:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
0:
        and               a8, a8, a9
        l32r              a9, 0b (91108890 <asm_test::fetch_max::i16::relaxed+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a14, a10, 0
        sext              a11, a3, 15
        movi.n            a12, 0
        movi.n            a13, 1
        j                 2f
1:
        mov.n             a14, a15
        beqi              a7, 1, 3f
2:
        and               a15, a14, a9
        ssr               a8
        srl               a7, a14
        sext              a7, a7, 15
        max               a7, a7, a11
        l32r              a6, 3c <asm_test::fetch_max::i16::relaxed+0x3c> (ff615377 <asm_test::fetch_max::i16::relaxed+0xff615377>)
        and               a7, a7, a6
        ssl               a8
        sll               a7, a7
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a10, 0
        mov.n             a7, a13
        beq               a15, a14, 1b
        mov.n             a7, a12
        j                 1b
3:
        ssr               a8
        srl               a2, a15
        retw.n

.literal.asm_test::fetch_max::i16::release:
        .byte             0xff
        .byte             0xff

asm_test::fetch_max::i16::release:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
0:
        and               a8, a8, a9
        l32r              a9, 0b (91108890 <asm_test::fetch_max::i16::release+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        sext              a11, a3, 15
        movi.n            a12, 0
        movi.n            a13, 1
        j                 2f
1:
        mov.n             a14, a15
        beqi              a7, 1, 3f
2:
        and               a15, a14, a9
        ssr               a8
        srl               a7, a14
        sext              a7, a7, 15
        max               a7, a7, a11
        l32r              a6, 40 <asm_test::fetch_max::i16::release+0x40> (ffff6153 <asm_test::fetch_max::i16::release+0xffff6153>)
        and               a7, a7, a6
        ssl               a8
        sll               a7, a7
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a10, 0
        mov.n             a7, a13
        beq               a15, a14, 1b
        mov.n             a7, a12
        j                 1b
3:
        ssr               a8
        srl               a2, a15
        retw.n

asm_test::fetch_max::i32::acqrel:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        max               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_max::i32::seqcst:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        max               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_max::i32::acquire:
        entry             a1, 32
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        max               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_max::i32::relaxed:
        entry             a1, 32
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        max               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        mov.n             a2, a8
        retw.n

asm_test::fetch_max::i32::release:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        max               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i8::acqrel:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a10, a9
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a15, a11, 0
        sext              a12, a3, 7
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a15, a7
        beqi              a6, 1, 2f
1:
        and               a7, a15, a10
        ssr               a8
        srl               a6, a15
        sext              a6, a6, 7
        min               a6, a6, a12
        and               a6, a6, a9
        ssl               a8
        sll               a6, a6
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a11, 0
        mov.n             a6, a14
        beq               a7, a15, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a2, a7
        memw
        retw.n

asm_test::fetch_min::i8::seqcst:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a10, a9
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a15, a11, 0
        sext              a12, a3, 7
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a15, a7
        beqi              a6, 1, 2f
1:
        and               a7, a15, a10
        ssr               a8
        srl               a6, a15
        sext              a6, a6, 7
        min               a6, a6, a12
        and               a6, a6, a9
        ssl               a8
        sll               a6, a6
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a11, 0
        mov.n             a6, a14
        beq               a7, a15, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a2, a7
        memw
        retw.n

asm_test::fetch_min::i8::acquire:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a10, a9
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a15, a11, 0
        sext              a12, a3, 7
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a15, a7
        beqi              a6, 1, 2f
1:
        and               a7, a15, a10
        ssr               a8
        srl               a6, a15
        sext              a6, a6, 7
        min               a6, a6, a12
        and               a6, a6, a9
        ssl               a8
        sll               a6, a6
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a11, 0
        mov.n             a6, a14
        beq               a7, a15, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a2, a7
        memw
        retw.n

asm_test::fetch_min::i8::relaxed:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a10, a9
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a15, a11, 0
        sext              a12, a3, 7
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a15, a7
        beqi              a6, 1, 2f
1:
        and               a7, a15, a10
        ssr               a8
        srl               a6, a15
        sext              a6, a6, 7
        min               a6, a6, a12
        and               a6, a6, a9
        ssl               a8
        sll               a6, a6
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a11, 0
        mov.n             a6, a14
        beq               a7, a15, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a2, a7
        retw.n

asm_test::fetch_min::i8::release:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a10, a9
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a15, a11, 0
        sext              a12, a3, 7
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a15, a7
        beqi              a6, 1, 2f
1:
        and               a7, a15, a10
        ssr               a8
        srl               a6, a15
        sext              a6, a6, 7
        min               a6, a6, a12
        and               a6, a6, a9
        ssl               a8
        sll               a6, a6
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a11, 0
        mov.n             a6, a14
        beq               a7, a15, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a2, a7
        retw.n

.literal.asm_test::fetch_min::i16::acqrel:
        .byte             0xff
        .byte             0xff

asm_test::fetch_min::i16::acqrel:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
0:
        and               a8, a8, a9
        l32r              a9, 0b (91108890 <asm_test::fetch_min::i16::acqrel+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        sext              a11, a3, 15
        movi.n            a12, 0
        movi.n            a13, 1
        j                 2f
1:
        mov.n             a14, a15
        beqi              a7, 1, 3f
2:
        and               a15, a14, a9
        ssr               a8
        srl               a7, a14
        sext              a7, a7, 15
        min               a7, a7, a11
        l32r              a6, 40 <asm_test::fetch_min::i16::acqrel+0x40> (ffff6143 <asm_test::fetch_min::i16::acqrel+0xffff6143>)
        and               a7, a7, a6
        ssl               a8
        sll               a7, a7
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a10, 0
        mov.n             a7, a13
        beq               a15, a14, 1b
        mov.n             a7, a12
        j                 1b
3:
        ssr               a8
        srl               a2, a15
        memw
        retw.n

.literal.asm_test::fetch_min::i16::seqcst:
        .byte             0xff
        .byte             0xff

asm_test::fetch_min::i16::seqcst:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
0:
        and               a8, a8, a9
        l32r              a9, 0b (91108890 <asm_test::fetch_min::i16::seqcst+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        sext              a11, a3, 15
        movi.n            a12, 0
        movi.n            a13, 1
        j                 2f
1:
        mov.n             a14, a15
        beqi              a7, 1, 3f
2:
        and               a15, a14, a9
        ssr               a8
        srl               a7, a14
        sext              a7, a7, 15
        min               a7, a7, a11
        l32r              a6, 40 <asm_test::fetch_min::i16::seqcst+0x40> (ffff6143 <asm_test::fetch_min::i16::seqcst+0xffff6143>)
        and               a7, a7, a6
        ssl               a8
        sll               a7, a7
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a10, 0
        mov.n             a7, a13
        beq               a15, a14, 1b
        mov.n             a7, a12
        j                 1b
3:
        ssr               a8
        srl               a2, a15
        memw
        retw.n

.literal.asm_test::fetch_min::i16::acquire:
        .byte             0xff
        .byte             0xff

asm_test::fetch_min::i16::acquire:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
0:
        and               a8, a8, a9
        l32r              a9, 0b (91108890 <asm_test::fetch_min::i16::acquire+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a14, a10, 0
        sext              a11, a3, 15
        movi.n            a12, 0
        movi.n            a13, 1
        j                 2f
1:
        mov.n             a14, a15
        beqi              a7, 1, 3f
2:
        and               a15, a14, a9
        ssr               a8
        srl               a7, a14
        sext              a7, a7, 15
        min               a7, a7, a11
        l32r              a6, 3c <asm_test::fetch_min::i16::acquire+0x3c> (ff614377 <asm_test::fetch_min::i16::acquire+0xff614377>)
        and               a7, a7, a6
        ssl               a8
        sll               a7, a7
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a10, 0
        mov.n             a7, a13
        beq               a15, a14, 1b
        mov.n             a7, a12
        j                 1b
3:
        ssr               a8
        srl               a2, a15
        memw
        retw.n

.literal.asm_test::fetch_min::i16::relaxed:
        .byte             0xff
        .byte             0xff

asm_test::fetch_min::i16::relaxed:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
0:
        and               a8, a8, a9
        l32r              a9, 0b (91108890 <asm_test::fetch_min::i16::relaxed+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a14, a10, 0
        sext              a11, a3, 15
        movi.n            a12, 0
        movi.n            a13, 1
        j                 2f
1:
        mov.n             a14, a15
        beqi              a7, 1, 3f
2:
        and               a15, a14, a9
        ssr               a8
        srl               a7, a14
        sext              a7, a7, 15
        min               a7, a7, a11
        l32r              a6, 3c <asm_test::fetch_min::i16::relaxed+0x3c> (ff614377 <asm_test::fetch_min::i16::relaxed+0xff614377>)
        and               a7, a7, a6
        ssl               a8
        sll               a7, a7
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a10, 0
        mov.n             a7, a13
        beq               a15, a14, 1b
        mov.n             a7, a12
        j                 1b
3:
        ssr               a8
        srl               a2, a15
        retw.n

.literal.asm_test::fetch_min::i16::release:
        .byte             0xff
        .byte             0xff

asm_test::fetch_min::i16::release:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
0:
        and               a8, a8, a9
        l32r              a9, 0b (91108890 <asm_test::fetch_min::i16::release+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        sext              a11, a3, 15
        movi.n            a12, 0
        movi.n            a13, 1
        j                 2f
1:
        mov.n             a14, a15
        beqi              a7, 1, 3f
2:
        and               a15, a14, a9
        ssr               a8
        srl               a7, a14
        sext              a7, a7, 15
        min               a7, a7, a11
        l32r              a6, 40 <asm_test::fetch_min::i16::release+0x40> (ffff6143 <asm_test::fetch_min::i16::release+0xffff6143>)
        and               a7, a7, a6
        ssl               a8
        sll               a7, a7
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a10, 0
        mov.n             a7, a13
        beq               a15, a14, 1b
        mov.n             a7, a12
        j                 1b
3:
        ssr               a8
        srl               a2, a15
        retw.n

asm_test::fetch_min::i32::acqrel:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        min               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i32::seqcst:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        min               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i32::acquire:
        entry             a1, 32
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        min               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i32::relaxed:
        entry             a1, 32
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        min               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i32::release:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        min               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u8::acqrel:
        entry             a1, 32
        mov.n             a8, a2
        l8ui              a2, a8, 0
        movi              a9, 255
        slli              a10, a8, 3
        movi.n            a11, 24
        and               a10, a10, a11
        movi.n            a11, -1
        movi.n            a12, -4
        and               a8, a8, a12
        movi.n            a12, 0
        movi.n            a13, 1
        j                 1f
0:
        ssr               a10
        srl               a2, a15
        and               a14, a14, a13
        memw
        bnez              a14, 2f
1:
        and               a14, a2, a9
        ssl               a10
        sll               a14, a14
        neg               a15, a2
        and               a15, a15, a9
        ssl               a10
        sll               a15, a15
        ssl               a10
        sll               a7, a9
        xor               a7, a7, a11
        memw
        l32i.n            a6, a8, 0
        and               a7, a6, a7
        or                a15, a7, a15
        or                a7, a7, a14
        wsr.scompare1     a7
        s32c1i            a15, a8, 0
        mov.n             a14, a13
        beq               a15, a7, 0b
        mov.n             a14, a12
        j                 0b
2:
        retw.n

asm_test::fetch_neg::u8::seqcst:
        entry             a1, 32
        mov.n             a8, a2
        l8ui              a2, a8, 0
        movi              a9, 255
        slli              a10, a8, 3
        movi.n            a11, 24
        and               a10, a10, a11
        movi.n            a11, -1
        movi.n            a12, -4
        and               a8, a8, a12
        movi.n            a12, 0
        movi.n            a13, 1
        j                 1f
0:
        ssr               a10
        srl               a2, a15
        and               a14, a14, a13
        memw
        bnez              a14, 2f
1:
        and               a14, a2, a9
        ssl               a10
        sll               a14, a14
        neg               a15, a2
        and               a15, a15, a9
        ssl               a10
        sll               a15, a15
        ssl               a10
        sll               a7, a9
        xor               a7, a7, a11
        memw
        l32i.n            a6, a8, 0
        and               a7, a6, a7
        or                a15, a7, a15
        or                a7, a7, a14
        wsr.scompare1     a7
        s32c1i            a15, a8, 0
        mov.n             a14, a13
        beq               a15, a7, 0b
        mov.n             a14, a12
        j                 0b
2:
        retw.n

asm_test::fetch_neg::u8::acquire:
        entry             a1, 32
        mov.n             a8, a2
        l8ui              a2, a8, 0
        movi              a9, 255
        slli              a10, a8, 3
        movi.n            a11, 24
        and               a10, a10, a11
        movi.n            a11, -1
        movi.n            a12, -4
        and               a8, a8, a12
        movi.n            a12, 0
        movi.n            a13, 1
        j                 1f
0:
        ssr               a10
        srl               a2, a14
        and               a14, a15, a13
        memw
        bnez              a14, 2f
1:
        and               a14, a2, a9
        ssl               a10
        sll               a15, a14
        neg               a14, a2
        and               a14, a14, a9
        ssl               a10
        sll               a14, a14
        ssl               a10
        sll               a7, a9
        xor               a7, a7, a11
        l32i.n            a6, a8, 0
        and               a7, a6, a7
        or                a14, a7, a14
        or                a7, a7, a15
        wsr.scompare1     a7
        s32c1i            a14, a8, 0
        mov.n             a15, a13
        beq               a14, a7, 0b
        mov.n             a15, a12
        j                 0b
2:
        retw.n

asm_test::fetch_neg::u8::relaxed:
        entry             a1, 32
        mov.n             a8, a2
        l8ui              a2, a8, 0
        movi              a9, 255
        slli              a10, a8, 3
        movi.n            a11, 24
        and               a10, a10, a11
        movi.n            a11, -1
        movi.n            a12, -4
        and               a8, a8, a12
        movi.n            a12, 0
        movi.n            a13, 1
        j                 1f
0:
        ssr               a10
        srl               a2, a14
        and               a14, a15, a13
        bnez              a14, 2f
1:
        and               a14, a2, a9
        ssl               a10
        sll               a15, a14
        neg               a14, a2
        and               a14, a14, a9
        ssl               a10
        sll               a14, a14
        ssl               a10
        sll               a7, a9
        xor               a7, a7, a11
        l32i.n            a6, a8, 0
        and               a7, a6, a7
        or                a14, a7, a14
        or                a7, a7, a15
        wsr.scompare1     a7
        s32c1i            a14, a8, 0
        mov.n             a15, a13
        beq               a14, a7, 0b
        mov.n             a15, a12
        j                 0b
2:
        retw.n

asm_test::fetch_neg::u8::release:
        entry             a1, 32
        mov.n             a8, a2
        l8ui              a2, a8, 0
        movi              a9, 255
        slli              a10, a8, 3
        movi.n            a11, 24
        and               a10, a10, a11
        movi.n            a11, -1
        movi.n            a12, -4
        and               a8, a8, a12
        movi.n            a12, 0
        movi.n            a13, 1
        j                 1f
0:
        ssr               a10
        srl               a2, a15
        and               a14, a14, a13
        bnez              a14, 2f
1:
        and               a14, a2, a9
        ssl               a10
        sll               a14, a14
        neg               a15, a2
        and               a15, a15, a9
        ssl               a10
        sll               a15, a15
        ssl               a10
        sll               a7, a9
        xor               a7, a7, a11
        memw
        l32i.n            a6, a8, 0
        and               a7, a6, a7
        or                a15, a7, a15
        or                a7, a7, a14
        wsr.scompare1     a7
        s32c1i            a15, a8, 0
        mov.n             a14, a13
        beq               a15, a7, 0b
        mov.n             a14, a12
        j                 0b
2:
        retw.n

.literal.asm_test::fetch_neg::u16::acqrel:
        .byte             0xff
        .byte             0xff

asm_test::fetch_neg::u16::acqrel:
        entry             a1, 32
        mov.n             a8, a2
        l16ui             a2, a8, 0
        slli              a9, a8, 3
        movi.n            a10, 24
        and               a9, a9, a10
        movi.n            a10, -1
        movi.n            a11, -4
        and               a8, a8, a11
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        ssr               a9
        srl               a2, a14
        and               a13, a13, a12
        memw
        bnez              a13, 2f
1:
        l32r              a15, 2c <asm_test::fetch_neg::u16::acqrel+0x2c> (fffff103 <asm_test::fetch_neg::u16::acqrel+0xfffff103>)
        and               a13, a2, a15
        ssl               a9
        sll               a13, a13
        neg               a14, a2
        and               a14, a14, a15
        ssl               a9
        sll               a14, a14
        ssl               a9
        sll               a15, a15
        xor               a15, a15, a10
        memw
        l32i.n            a7, a8, 0
        and               a15, a7, a15
        or                a14, a15, a14
        or                a15, a15, a13
        wsr.scompare1     a15
        s32c1i            a14, a8, 0
        mov.n             a13, a12
        beq               a14, a15, 0b
        mov.n             a13, a11
        j                 0b
2:
        retw.n

.literal.asm_test::fetch_neg::u16::seqcst:
        .byte             0xff
        .byte             0xff

asm_test::fetch_neg::u16::seqcst:
        entry             a1, 32
        mov.n             a8, a2
        l16ui             a2, a8, 0
        slli              a9, a8, 3
        movi.n            a10, 24
        and               a9, a9, a10
        movi.n            a10, -1
        movi.n            a11, -4
        and               a8, a8, a11
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        ssr               a9
        srl               a2, a14
        and               a13, a13, a12
        memw
        bnez              a13, 2f
1:
        l32r              a15, 2c <asm_test::fetch_neg::u16::seqcst+0x2c> (fffff103 <asm_test::fetch_neg::u16::seqcst+0xfffff103>)
        and               a13, a2, a15
        ssl               a9
        sll               a13, a13
        neg               a14, a2
        and               a14, a14, a15
        ssl               a9
        sll               a14, a14
        ssl               a9
        sll               a15, a15
        xor               a15, a15, a10
        memw
        l32i.n            a7, a8, 0
        and               a15, a7, a15
        or                a14, a15, a14
        or                a15, a15, a13
        wsr.scompare1     a15
        s32c1i            a14, a8, 0
        mov.n             a13, a12
        beq               a14, a15, 0b
        mov.n             a13, a11
        j                 0b
2:
        retw.n

.literal.asm_test::fetch_neg::u16::acquire:
        .byte             0xff
        .byte             0xff

asm_test::fetch_neg::u16::acquire:
        entry             a1, 32
        mov.n             a8, a2
        l16ui             a2, a8, 0
        slli              a9, a8, 3
        movi.n            a10, 24
        and               a9, a9, a10
        movi.n            a10, -1
        movi.n            a11, -4
        and               a8, a8, a11
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        ssr               a9
        srl               a2, a13
        and               a13, a14, a12
        memw
        bnez              a13, 2f
1:
        l32r              a15, 2c <asm_test::fetch_neg::u16::acquire+0x2c> (fffff103 <asm_test::fetch_neg::u16::acquire+0xfffff103>)
        and               a13, a2, a15
        ssl               a9
        sll               a14, a13
        neg               a13, a2
        and               a13, a13, a15
        ssl               a9
        sll               a13, a13
        ssl               a9
        sll               a15, a15
        xor               a15, a15, a10
        l32i.n            a7, a8, 0
        and               a15, a7, a15
        or                a13, a15, a13
        or                a15, a15, a14
        wsr.scompare1     a15
        s32c1i            a13, a8, 0
        mov.n             a14, a12
        beq               a13, a15, 0b
        mov.n             a14, a11
        j                 0b
2:
        retw.n

.literal.asm_test::fetch_neg::u16::relaxed:
        .byte             0xff
        .byte             0xff

asm_test::fetch_neg::u16::relaxed:
        entry             a1, 32
        mov.n             a8, a2
        l16ui             a2, a8, 0
        slli              a9, a8, 3
        movi.n            a10, 24
        and               a9, a9, a10
        movi.n            a10, -1
        movi.n            a11, -4
        and               a8, a8, a11
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        ssr               a9
        srl               a2, a13
        and               a13, a14, a12
        bnez              a13, 2f
1:
        l32r              a15, 28 <asm_test::fetch_neg::u16::relaxed+0x28> (fff103bd <asm_test::fetch_neg::u16::relaxed+0xfff103bd>)
        and               a13, a2, a15
        ssl               a9
        sll               a14, a13
        neg               a13, a2
        and               a13, a13, a15
        ssl               a9
        sll               a13, a13
        ssl               a9
        sll               a15, a15
        xor               a15, a15, a10
        l32i.n            a7, a8, 0
        and               a15, a7, a15
        or                a13, a15, a13
        or                a15, a15, a14
        wsr.scompare1     a15
        s32c1i            a13, a8, 0
        mov.n             a14, a12
        beq               a13, a15, 0b
        mov.n             a14, a11
        j                 0b
2:
        retw.n

.literal.asm_test::fetch_neg::u16::release:
        .byte             0xff
        .byte             0xff

asm_test::fetch_neg::u16::release:
        entry             a1, 32
        mov.n             a8, a2
        l16ui             a2, a8, 0
        slli              a9, a8, 3
        movi.n            a10, 24
        and               a9, a9, a10
        movi.n            a10, -1
        movi.n            a11, -4
        and               a8, a8, a11
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        ssr               a9
        srl               a2, a14
        and               a13, a13, a12
        bnez              a13, 2f
1:
        l32r              a15, 28 <asm_test::fetch_neg::u16::release+0x28> (fff103ed <asm_test::fetch_neg::u16::release+0xfff103ed>)
        and               a13, a2, a15
        ssl               a9
        sll               a13, a13
        neg               a14, a2
        and               a14, a14, a15
        ssl               a9
        sll               a14, a14
        ssl               a9
        sll               a15, a15
        xor               a15, a15, a10
        memw
        l32i.n            a7, a8, 0
        and               a15, a7, a15
        or                a14, a15, a14
        or                a15, a15, a13
        wsr.scompare1     a15
        s32c1i            a14, a8, 0
        mov.n             a13, a12
        beq               a14, a15, 0b
        mov.n             a13, a11
        j                 0b
2:
        retw.n

asm_test::fetch_neg::u32::acqrel:
        entry             a1, 32
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        memw
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        memw
        neg               a8, a11
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u32::seqcst:
        entry             a1, 32
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        memw
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        memw
        neg               a8, a11
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u32::acquire:
        entry             a1, 32
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        memw
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        neg               a8, a11
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u32::relaxed:
        entry             a1, 32
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        neg               a8, a11
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u32::release:
        entry             a1, 32
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        memw
        neg               a8, a11
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u8::acqrel:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 0b
        mov.n             a15, a11
        j                 0b
2:
        ssr               a8
        srl               a2, a13
        memw
        retw.n

asm_test::fetch_not::u8::seqcst:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 0b
        mov.n             a15, a11
        j                 0b
2:
        ssr               a8
        srl               a2, a13
        memw
        retw.n

asm_test::fetch_not::u8::acquire:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 0b
        mov.n             a15, a11
        j                 0b
2:
        ssr               a8
        srl               a2, a13
        memw
        retw.n

asm_test::fetch_not::u8::relaxed:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 0b
        mov.n             a15, a11
        j                 0b
2:
        ssr               a8
        srl               a2, a13
        retw.n

asm_test::fetch_not::u8::release:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 0b
        mov.n             a15, a11
        j                 0b
2:
        ssr               a8
        srl               a2, a13
        retw.n

.literal.asm_test::fetch_not::u16::acqrel:
        .byte             0xff
        .byte             0xff

asm_test::fetch_not::u16::acqrel:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
0:
        and               a8, a8, a9
        l32r              a9, 0b (91108890 <asm_test::fetch_not::u16::acqrel+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 2f
1:
        mov.n             a14, a13
        beqi              a15, 1, 3f
2:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 1b
        mov.n             a15, a11
        j                 1b
3:
        ssr               a8
        srl               a2, a13
        memw
        retw.n

.literal.asm_test::fetch_not::u16::seqcst:
        .byte             0xff
        .byte             0xff

asm_test::fetch_not::u16::seqcst:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
0:
        and               a8, a8, a9
        l32r              a9, 0b (91108890 <asm_test::fetch_not::u16::seqcst+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 2f
1:
        mov.n             a14, a13
        beqi              a15, 1, 3f
2:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 1b
        mov.n             a15, a11
        j                 1b
3:
        ssr               a8
        srl               a2, a13
        memw
        retw.n

.literal.asm_test::fetch_not::u16::acquire:
        .byte             0xff
        .byte             0xff

asm_test::fetch_not::u16::acquire:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
0:
        and               a8, a8, a9
        l32r              a9, 0b (91108890 <asm_test::fetch_not::u16::acquire+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 2f
1:
        mov.n             a14, a13
        beqi              a15, 1, 3f
2:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 1b
        mov.n             a15, a11
        j                 1b
3:
        ssr               a8
        srl               a2, a13
        memw
        retw.n

.literal.asm_test::fetch_not::u16::relaxed:
        .byte             0xff
        .byte             0xff

asm_test::fetch_not::u16::relaxed:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
0:
        and               a8, a8, a9
        l32r              a9, 0b (91108890 <asm_test::fetch_not::u16::relaxed+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 2f
1:
        mov.n             a14, a13
        beqi              a15, 1, 3f
2:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 1b
        mov.n             a15, a11
        j                 1b
3:
        ssr               a8
        srl               a2, a13
        retw.n

.literal.asm_test::fetch_not::u16::release:
        .byte             0xff
        .byte             0xff

asm_test::fetch_not::u16::release:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
0:
        and               a8, a8, a9
        l32r              a9, 0b (91108890 <asm_test::fetch_not::u16::release+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 2f
1:
        mov.n             a14, a13
        beqi              a15, 1, 3f
2:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 1b
        mov.n             a15, a11
        j                 1b
3:
        ssr               a8
        srl               a2, a13
        retw.n

asm_test::fetch_not::u32::acqrel:
        entry             a1, 32
        memw
        l32i.n            a12, a2, 0
        movi.n            a9, -1
        movi.n            a10, 0
        movi.n            a11, 1
        j                 1f
0:
        mov.n             a12, a8
        beqi              a13, 1, 2f
1:
        xor               a8, a12, a9
        wsr.scompare1     a12
        s32c1i            a8, a2, 0
        mov.n             a13, a11
        beq               a8, a12, 0b
        mov.n             a13, a10
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u32::seqcst:
        entry             a1, 32
        memw
        l32i.n            a12, a2, 0
        movi.n            a9, -1
        movi.n            a10, 0
        movi.n            a11, 1
        j                 1f
0:
        mov.n             a12, a8
        beqi              a13, 1, 2f
1:
        xor               a8, a12, a9
        wsr.scompare1     a12
        s32c1i            a8, a2, 0
        mov.n             a13, a11
        beq               a8, a12, 0b
        mov.n             a13, a10
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u32::acquire:
        entry             a1, 32
        l32i.n            a12, a2, 0
        movi.n            a9, -1
        movi.n            a10, 0
        movi.n            a11, 1
        j                 1f
0:
        mov.n             a12, a8
        beqi              a13, 1, 2f
1:
        xor               a8, a12, a9
        wsr.scompare1     a12
        s32c1i            a8, a2, 0
        mov.n             a13, a11
        beq               a8, a12, 0b
        mov.n             a13, a10
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u32::relaxed:
        entry             a1, 32
        l32i.n            a12, a2, 0
        movi.n            a9, -1
        movi.n            a10, 0
        movi.n            a11, 1
        j                 1f
0:
        mov.n             a12, a8
        beqi              a13, 1, 2f
1:
        xor               a8, a12, a9
        wsr.scompare1     a12
        s32c1i            a8, a2, 0
        mov.n             a13, a11
        beq               a8, a12, 0b
        mov.n             a13, a10
        j                 0b
2:
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u32::release:
        entry             a1, 32
        memw
        l32i.n            a12, a2, 0
        movi.n            a9, -1
        movi.n            a10, 0
        movi.n            a11, 1
        j                 1f
0:
        mov.n             a12, a8
        beqi              a13, 1, 2f
1:
        xor               a8, a12, a9
        wsr.scompare1     a12
        s32c1i            a8, a2, 0
        mov.n             a13, a11
        beq               a8, a12, 0b
        mov.n             a13, a10
        j                 0b
2:
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::bool::acqrel:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 1
        ssl               a8
        sll               a10, a9
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        xor               a13, a14, a10
        wsr.scompare1     a14
        s32c1i            a13, a11, 0
        mov.n             a15, a9
        beq               a13, a14, 0b
        mov.n             a15, a12
        j                 0b
2:
        ssr               a8
        srl               a8, a13
        movi              a9, 255
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 3f
        movi.n            a2, 1
3:
        memw
        retw.n

asm_test::fetch_not::bool::seqcst:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 1
        ssl               a8
        sll               a10, a9
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        xor               a13, a14, a10
        wsr.scompare1     a14
        s32c1i            a13, a11, 0
        mov.n             a15, a9
        beq               a13, a14, 0b
        mov.n             a15, a12
        j                 0b
2:
        ssr               a8
        srl               a8, a13
        movi              a9, 255
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 3f
        movi.n            a2, 1
3:
        memw
        retw.n

asm_test::fetch_not::bool::acquire:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 1
        ssl               a8
        sll               a10, a9
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        xor               a13, a14, a10
        wsr.scompare1     a14
        s32c1i            a13, a11, 0
        mov.n             a15, a9
        beq               a13, a14, 0b
        mov.n             a15, a12
        j                 0b
2:
        ssr               a8
        srl               a8, a13
        movi              a9, 255
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 3f
        movi.n            a2, 1
3:
        memw
        retw.n

asm_test::fetch_not::bool::relaxed:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 1
        ssl               a8
        sll               a10, a9
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        xor               a13, a14, a10
        wsr.scompare1     a14
        s32c1i            a13, a11, 0
        mov.n             a15, a9
        beq               a13, a14, 0b
        mov.n             a15, a12
        j                 0b
2:
        ssr               a8
        srl               a8, a13
        movi              a9, 255
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 3f
        movi.n            a2, 1
3:
        retw.n

asm_test::fetch_not::bool::release:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 1
        ssl               a8
        sll               a10, a9
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        xor               a13, a14, a10
        wsr.scompare1     a14
        s32c1i            a13, a11, 0
        mov.n             a15, a9
        beq               a13, a14, 0b
        mov.n             a15, a12
        j                 0b
2:
        ssr               a8
        srl               a8, a13
        movi              a9, 255
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 3f
        movi.n            a2, 1
3:
        retw.n

asm_test::fetch_sub::u8::acqrel:
        entry             a1, 32
        movi              a10, 255
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a15, a7
        beqi              a6, 1, 2f
1:
        and               a7, a15, a11
        sub               a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a2, a7
        memw
        retw.n

asm_test::fetch_sub::u8::seqcst:
        entry             a1, 32
        movi              a10, 255
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a15, a7
        beqi              a6, 1, 2f
1:
        and               a7, a15, a11
        sub               a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a2, a7
        memw
        retw.n

asm_test::fetch_sub::u8::acquire:
        entry             a1, 32
        movi              a10, 255
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a12, -4
        and               a12, a2, a12
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a15, a7
        beqi              a6, 1, 2f
1:
        and               a7, a15, a11
        sub               a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a2, a7
        memw
        retw.n

asm_test::fetch_sub::u8::relaxed:
        entry             a1, 32
        movi              a10, 255
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a12, -4
        and               a12, a2, a12
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a15, a7
        beqi              a6, 1, 2f
1:
        and               a7, a15, a11
        sub               a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a2, a7
        retw.n

asm_test::fetch_sub::u8::release:
        entry             a1, 32
        movi              a10, 255
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        movi.n            a14, 1
        j                 1f
0:
        mov.n             a15, a7
        beqi              a6, 1, 2f
1:
        and               a7, a15, a11
        sub               a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 0b
        mov.n             a6, a13
        j                 0b
2:
        ssr               a8
        srl               a2, a7
        retw.n

.literal.asm_test::fetch_sub::u16::acqrel:
        .byte             0xff
        .byte             0xff

asm_test::fetch_sub::u16::acqrel:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::fetch_sub::u16::acqrel+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        movi.n            a14, 1
        j                 2f
1:
        mov.n             a15, a7
        beqi              a6, 1, 3f
2:
        and               a7, a15, a11
        sub               a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 1b
        mov.n             a6, a13
        j                 1b
3:
        ssr               a8
        srl               a2, a7
        memw
        retw.n

.literal.asm_test::fetch_sub::u16::seqcst:
        .byte             0xff
        .byte             0xff

asm_test::fetch_sub::u16::seqcst:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::fetch_sub::u16::seqcst+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        movi.n            a14, 1
        j                 2f
1:
        mov.n             a15, a7
        beqi              a6, 1, 3f
2:
        and               a7, a15, a11
        sub               a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 1b
        mov.n             a6, a13
        j                 1b
3:
        ssr               a8
        srl               a2, a7
        memw
        retw.n

.literal.asm_test::fetch_sub::u16::acquire:
        .byte             0xff
        .byte             0xff

asm_test::fetch_sub::u16::acquire:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::fetch_sub::u16::acquire+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a12, -4
        and               a12, a2, a12
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        movi.n            a14, 1
        j                 2f
1:
        mov.n             a15, a7
        beqi              a6, 1, 3f
2:
        and               a7, a15, a11
        sub               a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 1b
        mov.n             a6, a13
        j                 1b
3:
        ssr               a8
        srl               a2, a7
        memw
        retw.n

.literal.asm_test::fetch_sub::u16::relaxed:
        .byte             0xff
        .byte             0xff

asm_test::fetch_sub::u16::relaxed:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::fetch_sub::u16::relaxed+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a12, -4
        and               a12, a2, a12
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        movi.n            a14, 1
        j                 2f
1:
        mov.n             a15, a7
        beqi              a6, 1, 3f
2:
        and               a7, a15, a11
        sub               a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 1b
        mov.n             a6, a13
        j                 1b
3:
        ssr               a8
        srl               a2, a7
        retw.n

.literal.asm_test::fetch_sub::u16::release:
        .byte             0xff
        .byte             0xff

asm_test::fetch_sub::u16::release:
0:
        entry             a1, 32
        l32r              a10, 0b (a1004136 <asm_test::fetch_sub::u16::release+0xa1004136>)
        and               a9, a3, a10
        slli              a8, a2, 3
        movi.n            a11, 24
        and               a8, a8, a11
        ssl               a8
        sll               a9, a9
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a11, a10, a11
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        movi.n            a14, 1
        j                 2f
1:
        mov.n             a15, a7
        beqi              a6, 1, 3f
2:
        and               a7, a15, a11
        sub               a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 1b
        mov.n             a6, a13
        j                 1b
3:
        ssr               a8
        srl               a2, a7
        retw.n

asm_test::fetch_sub::u32::acqrel:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        sub               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::u32::seqcst:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        sub               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::u32::acquire:
        entry             a1, 32
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        sub               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::u32::relaxed:
        entry             a1, 32
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        sub               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::u32::release:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        sub               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u8::acqrel:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 0b
        mov.n             a15, a11
        j                 0b
2:
        ssr               a8
        srl               a2, a13
        memw
        retw.n

asm_test::fetch_xor::u8::seqcst:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 0b
        mov.n             a15, a11
        j                 0b
2:
        ssr               a8
        srl               a2, a13
        memw
        retw.n

asm_test::fetch_xor::u8::acquire:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 0b
        mov.n             a15, a11
        j                 0b
2:
        ssr               a8
        srl               a2, a13
        memw
        retw.n

asm_test::fetch_xor::u8::relaxed:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 0b
        mov.n             a15, a11
        j                 0b
2:
        ssr               a8
        srl               a2, a13
        retw.n

asm_test::fetch_xor::u8::release:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 0b
        mov.n             a15, a11
        j                 0b
2:
        ssr               a8
        srl               a2, a13
        retw.n

.literal.asm_test::fetch_xor::u16::acqrel:
        .byte             0xff
        .byte             0xff

asm_test::fetch_xor::u16::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_xor::u16::acqrel+0x81004136>)
        and               a9, a3, a8
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 2f
1:
        mov.n             a14, a13
        beqi              a15, 1, 3f
2:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 1b
        mov.n             a15, a11
        j                 1b
3:
        ssr               a8
        srl               a2, a13
        memw
        retw.n

.literal.asm_test::fetch_xor::u16::seqcst:
        .byte             0xff
        .byte             0xff

asm_test::fetch_xor::u16::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_xor::u16::seqcst+0x81004136>)
        and               a9, a3, a8
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 2f
1:
        mov.n             a14, a13
        beqi              a15, 1, 3f
2:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 1b
        mov.n             a15, a11
        j                 1b
3:
        ssr               a8
        srl               a2, a13
        memw
        retw.n

.literal.asm_test::fetch_xor::u16::acquire:
        .byte             0xff
        .byte             0xff

asm_test::fetch_xor::u16::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_xor::u16::acquire+0x81004136>)
        and               a9, a3, a8
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 2f
1:
        mov.n             a14, a13
        beqi              a15, 1, 3f
2:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 1b
        mov.n             a15, a11
        j                 1b
3:
        ssr               a8
        srl               a2, a13
        memw
        retw.n

.literal.asm_test::fetch_xor::u16::relaxed:
        .byte             0xff
        .byte             0xff

asm_test::fetch_xor::u16::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_xor::u16::relaxed+0x81004136>)
        and               a9, a3, a8
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 2f
1:
        mov.n             a14, a13
        beqi              a15, 1, 3f
2:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 1b
        mov.n             a15, a11
        j                 1b
3:
        ssr               a8
        srl               a2, a13
        retw.n

.literal.asm_test::fetch_xor::u16::release:
        .byte             0xff
        .byte             0xff

asm_test::fetch_xor::u16::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_xor::u16::release+0x81004136>)
        and               a9, a3, a8
        slli              a8, a2, 3
        movi.n            a10, 24
        and               a8, a8, a10
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 2f
1:
        mov.n             a14, a13
        beqi              a15, 1, 3f
2:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 1b
        mov.n             a15, a11
        j                 1b
3:
        ssr               a8
        srl               a2, a13
        retw.n

asm_test::fetch_xor::u32::acqrel:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        xor               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u32::seqcst:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        xor               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u32::acquire:
        entry             a1, 32
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        xor               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        memw
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u32::relaxed:
        entry             a1, 32
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        xor               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u32::release:
        entry             a1, 32
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 1f
0:
        mov.n             a11, a8
        beqi              a12, 1, 2f
1:
        xor               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 0b
        mov.n             a12, a9
        j                 0b
2:
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::bool::acqrel:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a9, a3
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 0b
        mov.n             a15, a11
        j                 0b
2:
        ssr               a8
        srl               a8, a13
        movi              a9, 255
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 3f
        movi.n            a2, 1
3:
        memw
        retw.n

asm_test::fetch_xor::bool::seqcst:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a9, a3
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 0b
        mov.n             a15, a11
        j                 0b
2:
        ssr               a8
        srl               a8, a13
        movi              a9, 255
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 3f
        movi.n            a2, 1
3:
        memw
        retw.n

asm_test::fetch_xor::bool::acquire:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a9, a3
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 0b
        mov.n             a15, a11
        j                 0b
2:
        ssr               a8
        srl               a8, a13
        movi              a9, 255
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 3f
        movi.n            a2, 1
3:
        memw
        retw.n

asm_test::fetch_xor::bool::relaxed:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a9, a3
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 0b
        mov.n             a15, a11
        j                 0b
2:
        ssr               a8
        srl               a8, a13
        movi              a9, 255
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 3f
        movi.n            a2, 1
3:
        retw.n

asm_test::fetch_xor::bool::release:
        entry             a1, 32
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a9, a3
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 1f
0:
        mov.n             a14, a13
        beqi              a15, 1, 2f
1:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 0b
        mov.n             a15, a11
        j                 0b
2:
        ssr               a8
        srl               a8, a13
        movi              a9, 255
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 3f
        movi.n            a2, 1
3:
        retw.n

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

.literal.asm_test::bit_toggle::u8::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_toggle::u8::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_toggle::u8::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_toggle::u8::acqrel+0x8> (ffff8105 <asm_test::bit_toggle::u8::acqrel+0xffff8105>)
        bgeu              a8, a2, 7f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 7
        and               a9, a3, a9
        movi.n            a10, 1
        ssl               a9
        sll               a9, a10
        ssl               a8
        sll               a11, a9
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        xor               a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 2b
        mov.n             a7, a13
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        memw
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::bit_toggle::u8::acqrel+0xffa1f01d>)
        l32r              a8, 68 <asm_test::bit_toggle::u8::acqrel+0x68> (ffff81ff <asm_test::bit_toggle::u8::acqrel+0xffff81ff>)
        callx8            a8

.literal.asm_test::bit_toggle::u8::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_toggle::u8::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_toggle::u8::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_toggle::u8::seqcst+0x8> (ffff8105 <asm_test::bit_toggle::u8::seqcst+0xffff8105>)
        bgeu              a8, a2, 7f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 7
        and               a9, a3, a9
        movi.n            a10, 1
        ssl               a9
        sll               a9, a10
        ssl               a8
        sll               a11, a9
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        xor               a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 2b
        mov.n             a7, a13
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        memw
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::bit_toggle::u8::seqcst+0xffa1f01d>)
        l32r              a8, 68 <asm_test::bit_toggle::u8::seqcst+0x68> (ffff81ff <asm_test::bit_toggle::u8::seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::bit_toggle::u8::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_toggle::u8::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_toggle::u8::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_toggle::u8::acquire+0x8> (ffff8105 <asm_test::bit_toggle::u8::acquire+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 7
        and               a9, a3, a9
        movi.n            a10, 1
        ssl               a9
        sll               a9, a10
        ssl               a8
        sll               a11, a9
        movi.n            a12, -4
        and               a12, a2, a12
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        xor               a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 2b
        mov.n             a7, a13
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        memw
        retw.n
6:
        l32r              a10, 60 <asm_test::bit_toggle::u8::acquire+0x60> (a1f01d00 <asm_test::bit_toggle::u8::acquire+0xa1f01d00>)
        l32r              a8, 64 <asm_test::bit_toggle::u8::acquire+0x64> (ff81ffff <asm_test::bit_toggle::u8::acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::bit_toggle::u8::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_toggle::u8::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_toggle::u8::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_toggle::u8::relaxed+0x8> (ffff8105 <asm_test::bit_toggle::u8::relaxed+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 7
        and               a9, a3, a9
        movi.n            a10, 1
        ssl               a9
        sll               a9, a10
        ssl               a8
        sll               a11, a9
        movi.n            a12, -4
        and               a12, a2, a12
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        xor               a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 2b
        mov.n             a7, a13
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        retw.n
6:
        l32r              a10, fffc0060 <asm_test::bit_toggle::u8::relaxed+0xfffc0060>
        l32r              a8, 6b (810000a1 <asm_test::bit_toggle::u8::relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::bit_toggle::u8::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_toggle::u8::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_toggle::u8::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_toggle::u8::release+0x8> (ffff8105 <asm_test::bit_toggle::u8::release+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 7
        and               a9, a3, a9
        movi.n            a10, 1
        ssl               a9
        sll               a9, a10
        ssl               a8
        sll               a11, a9
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        xor               a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 2b
        mov.n             a7, a13
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        retw.n
6:
        l32r              a10, 60 <asm_test::bit_toggle::u8::release+0x60> (a1f01d12 <asm_test::bit_toggle::u8::release+0xa1f01d12>)
        l32r              a8, 64 <asm_test::bit_toggle::u8::release+0x64> (ff81ffff <asm_test::bit_toggle::u8::release+0xff81ffff>)
        callx8            a8

.literal.asm_test::bit_toggle::u16::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_toggle::u16::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_toggle::u16::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_toggle::u16::acqrel+0x8> (ffff8105 <asm_test::bit_toggle::u16::acqrel+0xffff8105>)
        bgeu              a8, a2, 7f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 15
        and               a9, a3, a9
        movi.n            a10, 1
        ssl               a9
        sll               a9, a10
        ssl               a8
        sll               a11, a9
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        xor               a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 2b
        mov.n             a7, a13
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        memw
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::bit_toggle::u16::acqrel+0xffa1f01d>)
        l32r              a8, 68 <asm_test::bit_toggle::u16::acqrel+0x68> (ffff81ff <asm_test::bit_toggle::u16::acqrel+0xffff81ff>)
        callx8            a8

.literal.asm_test::bit_toggle::u16::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_toggle::u16::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_toggle::u16::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_toggle::u16::seqcst+0x8> (ffff8105 <asm_test::bit_toggle::u16::seqcst+0xffff8105>)
        bgeu              a8, a2, 7f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 15
        and               a9, a3, a9
        movi.n            a10, 1
        ssl               a9
        sll               a9, a10
        ssl               a8
        sll               a11, a9
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        xor               a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 2b
        mov.n             a7, a13
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        memw
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::bit_toggle::u16::seqcst+0xffa1f01d>)
        l32r              a8, 68 <asm_test::bit_toggle::u16::seqcst+0x68> (ffff81ff <asm_test::bit_toggle::u16::seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::bit_toggle::u16::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_toggle::u16::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_toggle::u16::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_toggle::u16::acquire+0x8> (ffff8105 <asm_test::bit_toggle::u16::acquire+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 15
        and               a9, a3, a9
        movi.n            a10, 1
        ssl               a9
        sll               a9, a10
        ssl               a8
        sll               a11, a9
        movi.n            a12, -4
        and               a12, a2, a12
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        xor               a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 2b
        mov.n             a7, a13
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        memw
        retw.n
6:
        l32r              a10, 60 <asm_test::bit_toggle::u16::acquire+0x60> (a1f01d00 <asm_test::bit_toggle::u16::acquire+0xa1f01d00>)
        l32r              a8, 64 <asm_test::bit_toggle::u16::acquire+0x64> (ff81ffff <asm_test::bit_toggle::u16::acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::bit_toggle::u16::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_toggle::u16::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_toggle::u16::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_toggle::u16::relaxed+0x8> (ffff8105 <asm_test::bit_toggle::u16::relaxed+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 15
        and               a9, a3, a9
        movi.n            a10, 1
        ssl               a9
        sll               a9, a10
        ssl               a8
        sll               a11, a9
        movi.n            a12, -4
        and               a12, a2, a12
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        xor               a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 2b
        mov.n             a7, a13
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        retw.n
6:
        l32r              a10, fffc0060 <asm_test::bit_toggle::u16::relaxed+0xfffc0060>
        l32r              a8, 6b (810000a1 <asm_test::bit_toggle::u16::relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::bit_toggle::u16::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_toggle::u16::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_toggle::u16::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_toggle::u16::release+0x8> (ffff8105 <asm_test::bit_toggle::u16::release+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 15
        and               a9, a3, a9
        movi.n            a10, 1
        ssl               a9
        sll               a9, a10
        ssl               a8
        sll               a11, a9
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        xor               a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 2b
        mov.n             a7, a13
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        retw.n
6:
        l32r              a10, 60 <asm_test::bit_toggle::u16::release+0x60> (a1f01d12 <asm_test::bit_toggle::u16::release+0xa1f01d12>)
        l32r              a8, 64 <asm_test::bit_toggle::u16::release+0x64> (ff81ffff <asm_test::bit_toggle::u16::release+0xff81ffff>)
        callx8            a8

.literal.asm_test::bit_toggle::u32::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_toggle::u32::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_toggle::u32::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_toggle::u32::acqrel+0x8> (ffff8105 <asm_test::bit_toggle::u32::acqrel+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        movi.n            a8, 31
        and               a9, a3, a8
        movi.n            a8, 1
        ssl               a9
        sll               a9, a8
        memw
        l32i.n            a12, a2, 0
        movi.n            a10, 0
        j                 3f
2:
        mov.n             a12, a11
        beqi              a13, 1, 4f
3:
        xor               a11, a12, a9
        wsr.scompare1     a12
        s32c1i            a11, a2, 0
        mov.n             a13, a8
        beq               a11, a12, 2b
        mov.n             a13, a10
        j                 2b
4:
        and               a8, a11, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        memw
        retw.n
6:
        l32r              a10, 4c <asm_test::bit_toggle::u32::acqrel+0x4c> (ffffa1f0 <asm_test::bit_toggle::u32::acqrel+0xffffa1f0>)
        l32r              a8, fffc0050 <asm_test::bit_toggle::u32::acqrel+0xfffc0050>
        callx8            a8

.literal.asm_test::bit_toggle::u32::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_toggle::u32::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_toggle::u32::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_toggle::u32::seqcst+0x8> (ffff8105 <asm_test::bit_toggle::u32::seqcst+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        movi.n            a8, 31
        and               a9, a3, a8
        movi.n            a8, 1
        ssl               a9
        sll               a9, a8
        memw
        l32i.n            a12, a2, 0
        movi.n            a10, 0
        j                 3f
2:
        mov.n             a12, a11
        beqi              a13, 1, 4f
3:
        xor               a11, a12, a9
        wsr.scompare1     a12
        s32c1i            a11, a2, 0
        mov.n             a13, a8
        beq               a11, a12, 2b
        mov.n             a13, a10
        j                 2b
4:
        and               a8, a11, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        memw
        retw.n
6:
        l32r              a10, 4c <asm_test::bit_toggle::u32::seqcst+0x4c> (ffffa1f0 <asm_test::bit_toggle::u32::seqcst+0xffffa1f0>)
        l32r              a8, fffc0050 <asm_test::bit_toggle::u32::seqcst+0xfffc0050>
        callx8            a8

.literal.asm_test::bit_toggle::u32::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_toggle::u32::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_toggle::u32::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_toggle::u32::acquire+0x8> (ffff8105 <asm_test::bit_toggle::u32::acquire+0xffff8105>)
        bgeu              a8, a2, 7f
1:
        movi.n            a8, 31
        and               a9, a3, a8
        movi.n            a8, 1
        ssl               a9
        sll               a9, a8
        l32i.n            a12, a2, 0
        movi.n            a10, 0
        j                 3f
2:
        mov.n             a12, a11
        beqi              a13, 1, 4f
3:
        xor               a11, a12, a9
        wsr.scompare1     a12
        s32c1i            a11, a2, 0
        mov.n             a13, a8
        beq               a11, a12, 2b
        mov.n             a13, a10
        j                 2b
4:
        and               a8, a11, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        memw
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::bit_toggle::u32::acquire+0xffa1f01d>)
        l32r              a8, 4c <asm_test::bit_toggle::u32::acquire+0x4c> (ffff81ff <asm_test::bit_toggle::u32::acquire+0xffff81ff>)
        callx8            a8

.literal.asm_test::bit_toggle::u32::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_toggle::u32::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_toggle::u32::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_toggle::u32::relaxed+0x8> (ffff8105 <asm_test::bit_toggle::u32::relaxed+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        movi.n            a8, 31
        and               a9, a3, a8
        movi.n            a8, 1
        ssl               a9
        sll               a9, a8
        l32i.n            a12, a2, 0
        movi.n            a10, 0
        j                 3f
2:
        mov.n             a12, a11
        beqi              a13, 1, 4f
3:
        xor               a11, a12, a9
        wsr.scompare1     a12
        s32c1i            a11, a2, 0
        mov.n             a13, a8
        beq               a11, a12, 2b
        mov.n             a13, a10
        j                 2b
4:
        and               a8, a11, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        retw.n
6:
        l32r              a10, 44 <asm_test::bit_toggle::u32::relaxed+0x44> (a1f01d12 <asm_test::bit_toggle::u32::relaxed+0xa1f01d12>)
        l32r              a8, 48 <asm_test::bit_toggle::u32::relaxed+0x48> (ff81ffff <asm_test::bit_toggle::u32::relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::bit_toggle::u32::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_toggle::u32::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_toggle::u32::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_toggle::u32::release+0x8> (ffff8105 <asm_test::bit_toggle::u32::release+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        movi.n            a8, 31
        and               a9, a3, a8
        movi.n            a8, 1
        ssl               a9
        sll               a9, a8
        memw
        l32i.n            a12, a2, 0
        movi.n            a10, 0
        j                 3f
2:
        mov.n             a12, a11
        beqi              a13, 1, 4f
3:
        xor               a11, a12, a9
        wsr.scompare1     a12
        s32c1i            a11, a2, 0
        mov.n             a13, a8
        beq               a11, a12, 2b
        mov.n             a13, a10
        j                 2b
4:
        and               a8, a11, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::bit_toggle::u32::release+0xffa1f01d>)
        l32r              a8, 4c <asm_test::bit_toggle::u32::release+0x4c> (ffff81ff <asm_test::bit_toggle::u32::release+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_nand::u8::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_nand::u8::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_nand::u8::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_nand::u8::acqrel+0x8> (ffff8105 <asm_test::fetch_nand::u8::acqrel+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
        j                 3f
2:
        mov.n             a7, a6
        beqi              a5, 1, 4f
3:
        and               a6, a7, a12
        and               a5, a7, a9
        xor               a5, a5, a11
        and               a5, a5, a10
        or                a6, a6, a5
        wsr.scompare1     a7
        s32c1i            a6, a13, 0
        mov.n             a5, a15
        beq               a6, a7, 2b
        mov.n             a5, a14
        j                 2b
4:
        ssr               a8
        srl               a2, a6
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_nand::u8::acqrel+0xffa1f01d>)
        l32r              a8, 70 <asm_test::fetch_nand::u8::acqrel+0x70> (ffff81ff <asm_test::fetch_nand::u8::acqrel+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_nand::u8::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_nand::u8::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_nand::u8::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_nand::u8::seqcst+0x8> (ffff8105 <asm_test::fetch_nand::u8::seqcst+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
        j                 3f
2:
        mov.n             a7, a6
        beqi              a5, 1, 4f
3:
        and               a6, a7, a12
        and               a5, a7, a9
        xor               a5, a5, a11
        and               a5, a5, a10
        or                a6, a6, a5
        wsr.scompare1     a7
        s32c1i            a6, a13, 0
        mov.n             a5, a15
        beq               a6, a7, 2b
        mov.n             a5, a14
        j                 2b
4:
        ssr               a8
        srl               a2, a6
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_nand::u8::seqcst+0xffa1f01d>)
        l32r              a8, 70 <asm_test::fetch_nand::u8::seqcst+0x70> (ffff81ff <asm_test::fetch_nand::u8::seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_nand::u8::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_nand::u8::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_nand::u8::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_nand::u8::acquire+0x8> (ffff8105 <asm_test::fetch_nand::u8::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a7, a6
        beqi              a5, 1, 4f
3:
        and               a6, a7, a12
        and               a5, a7, a9
        xor               a5, a5, a11
        and               a5, a5, a10
        or                a6, a6, a5
        wsr.scompare1     a7
        s32c1i            a6, a13, 0
        mov.n             a5, a15
        beq               a6, a7, 2b
        mov.n             a5, a14
        j                 2b
4:
        ssr               a8
        srl               a2, a6
        memw
        retw.n
5:
        l32r              a10, 68 <asm_test::fetch_nand::u8::acquire+0x68> (a1f01d00 <asm_test::fetch_nand::u8::acquire+0xa1f01d00>)
        l32r              a8, 6c <asm_test::fetch_nand::u8::acquire+0x6c> (ff81ffff <asm_test::fetch_nand::u8::acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_nand::u8::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_nand::u8::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_nand::u8::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_nand::u8::relaxed+0x8> (ffff8105 <asm_test::fetch_nand::u8::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a7, a6
        beqi              a5, 1, 4f
3:
        and               a6, a7, a12
        and               a5, a7, a9
        xor               a5, a5, a11
        and               a5, a5, a10
        or                a6, a6, a5
        wsr.scompare1     a7
        s32c1i            a6, a13, 0
        mov.n             a5, a15
        beq               a6, a7, 2b
        mov.n             a5, a14
        j                 2b
4:
        ssr               a8
        srl               a2, a6
        retw.n
5:
        l32r              a10, fffc0068 <asm_test::fetch_nand::u8::relaxed+0xfffc0068>
        l32r              a8, 5b (810000a1 <asm_test::fetch_nand::u8::relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_nand::u8::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_nand::u8::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_nand::u8::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_nand::u8::release+0x8> (ffff8105 <asm_test::fetch_nand::u8::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a7, a6
        beqi              a5, 1, 4f
3:
        and               a6, a7, a12
        and               a5, a7, a9
        xor               a5, a5, a11
        and               a5, a5, a10
        or                a6, a6, a5
        wsr.scompare1     a7
        s32c1i            a6, a13, 0
        mov.n             a5, a15
        beq               a6, a7, 2b
        mov.n             a5, a14
        j                 2b
4:
        ssr               a8
        srl               a2, a6
        retw.n
5:
        l32r              a10, 68 <asm_test::fetch_nand::u8::release+0x68> (a1f01d91 <asm_test::fetch_nand::u8::release+0xa1f01d91>)
        l32r              a8, 6c <asm_test::fetch_nand::u8::release+0x6c> (ff81ffff <asm_test::fetch_nand::u8::release+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_nand::u16::acqrel:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_nand::u16::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_nand::u16::acqrel+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::fetch_nand::u16::acqrel+0x8> (ffff8105 <asm_test::fetch_nand::u16::acqrel+0xffff8105>)
1:
        bgeu              a8, a2, 7f
2:
        l32r              a10, 1b (a15eb827 <asm_test::fetch_nand::u16::acqrel+0xa15eb827>)
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
        j                 4f
3:
        mov.n             a7, a6
        beqi              a5, 1, 5f
4:
        and               a6, a7, a12
        and               a5, a7, a9
        xor               a5, a5, a11
        and               a5, a5, a10
        or                a6, a6, a5
        wsr.scompare1     a7
        s32c1i            a6, a13, 0
        mov.n             a5, a15
        beq               a6, a7, 3b
        mov.n             a5, a14
        j                 3b
5:
        ssr               a8
        srl               a2, a6
        memw
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::fetch_nand::u16::acqrel+0xffa1f01d>)
        l32r              a8, 70 <asm_test::fetch_nand::u16::acqrel+0x70> (ffff81ff <asm_test::fetch_nand::u16::acqrel+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_nand::u16::seqcst:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_nand::u16::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_nand::u16::seqcst+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::fetch_nand::u16::seqcst+0x8> (ffff8105 <asm_test::fetch_nand::u16::seqcst+0xffff8105>)
1:
        bgeu              a8, a2, 7f
2:
        l32r              a10, 1b (a15eb827 <asm_test::fetch_nand::u16::seqcst+0xa15eb827>)
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
        j                 4f
3:
        mov.n             a7, a6
        beqi              a5, 1, 5f
4:
        and               a6, a7, a12
        and               a5, a7, a9
        xor               a5, a5, a11
        and               a5, a5, a10
        or                a6, a6, a5
        wsr.scompare1     a7
        s32c1i            a6, a13, 0
        mov.n             a5, a15
        beq               a6, a7, 3b
        mov.n             a5, a14
        j                 3b
5:
        ssr               a8
        srl               a2, a6
        memw
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::fetch_nand::u16::seqcst+0xffa1f01d>)
        l32r              a8, 70 <asm_test::fetch_nand::u16::seqcst+0x70> (ffff81ff <asm_test::fetch_nand::u16::seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_nand::u16::acquire:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_nand::u16::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_nand::u16::acquire+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::fetch_nand::u16::acquire+0x8> (ffff8105 <asm_test::fetch_nand::u16::acquire+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a10, 1b (a15bb827 <asm_test::fetch_nand::u16::acquire+0xa15bb827>)
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
        j                 4f
3:
        mov.n             a7, a6
        beqi              a5, 1, 5f
4:
        and               a6, a7, a12
        and               a5, a7, a9
        xor               a5, a5, a11
        and               a5, a5, a10
        or                a6, a6, a5
        wsr.scompare1     a7
        s32c1i            a6, a13, 0
        mov.n             a5, a15
        beq               a6, a7, 3b
        mov.n             a5, a14
        j                 3b
5:
        ssr               a8
        srl               a2, a6
        memw
        retw.n
6:
        l32r              a10, 68 <asm_test::fetch_nand::u16::acquire+0x68> (a1f01d00 <asm_test::fetch_nand::u16::acquire+0xa1f01d00>)
        l32r              a8, 6c <asm_test::fetch_nand::u16::acquire+0x6c> (ff81ffff <asm_test::fetch_nand::u16::acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_nand::u16::relaxed:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_nand::u16::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_nand::u16::relaxed+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::fetch_nand::u16::relaxed+0x8> (ffff8105 <asm_test::fetch_nand::u16::relaxed+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a10, 1b (a158b827 <asm_test::fetch_nand::u16::relaxed+0xa158b827>)
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
        j                 4f
3:
        mov.n             a7, a6
        beqi              a5, 1, 5f
4:
        and               a6, a7, a12
        and               a5, a7, a9
        xor               a5, a5, a11
        and               a5, a5, a10
        or                a6, a6, a5
        wsr.scompare1     a7
        s32c1i            a6, a13, 0
        mov.n             a5, a15
        beq               a6, a7, 3b
        mov.n             a5, a14
        j                 3b
5:
        ssr               a8
        srl               a2, a6
        retw.n
6:
        l32r              a10, fffc0068 <asm_test::fetch_nand::u16::relaxed+0xfffc0068>
        l32r              a8, 6b (810000a1 <asm_test::fetch_nand::u16::relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_nand::u16::release:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_nand::u16::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_nand::u16::release+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::fetch_nand::u16::release+0x8> (ffff8105 <asm_test::fetch_nand::u16::release+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a10, 1b (a15bb827 <asm_test::fetch_nand::u16::release+0xa15bb827>)
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
        j                 4f
3:
        mov.n             a7, a6
        beqi              a5, 1, 5f
4:
        and               a6, a7, a12
        and               a5, a7, a9
        xor               a5, a5, a11
        and               a5, a5, a10
        or                a6, a6, a5
        wsr.scompare1     a7
        s32c1i            a6, a13, 0
        mov.n             a5, a15
        beq               a6, a7, 3b
        mov.n             a5, a14
        j                 3b
5:
        ssr               a8
        srl               a2, a6
        retw.n
6:
        l32r              a10, 68 <asm_test::fetch_nand::u16::release+0x68> (a1f01d91 <asm_test::fetch_nand::u16::release+0xa1f01d91>)
        l32r              a8, 6c <asm_test::fetch_nand::u16::release+0x6c> (ff81ffff <asm_test::fetch_nand::u16::release+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_nand::u32::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_nand::u32::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_nand::u32::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_nand::u32::acqrel+0x8> (ffff8105 <asm_test::fetch_nand::u32::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a12, a2, 0
        movi.n            a9, -1
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a12, a8
        beqi              a13, 1, 4f
3:
        and               a8, a12, a3
        xor               a8, a8, a9
        wsr.scompare1     a12
        s32c1i            a8, a2, 0
        mov.n             a13, a11
        beq               a8, a12, 2b
        mov.n             a13, a10
        j                 2b
4:
        memw
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 3c <asm_test::fetch_nand::u32::acqrel+0x3c> (a1f01d08 <asm_test::fetch_nand::u32::acqrel+0xa1f01d08>)
        l32r              a8, 40 <asm_test::fetch_nand::u32::acqrel+0x40> (ff81ffff <asm_test::fetch_nand::u32::acqrel+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_nand::u32::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_nand::u32::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_nand::u32::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_nand::u32::seqcst+0x8> (ffff8105 <asm_test::fetch_nand::u32::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a12, a2, 0
        movi.n            a9, -1
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a12, a8
        beqi              a13, 1, 4f
3:
        and               a8, a12, a3
        xor               a8, a8, a9
        wsr.scompare1     a12
        s32c1i            a8, a2, 0
        mov.n             a13, a11
        beq               a8, a12, 2b
        mov.n             a13, a10
        j                 2b
4:
        memw
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 3c <asm_test::fetch_nand::u32::seqcst+0x3c> (a1f01d08 <asm_test::fetch_nand::u32::seqcst+0xa1f01d08>)
        l32r              a8, 40 <asm_test::fetch_nand::u32::seqcst+0x40> (ff81ffff <asm_test::fetch_nand::u32::seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_nand::u32::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_nand::u32::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_nand::u32::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_nand::u32::acquire+0x8> (ffff8105 <asm_test::fetch_nand::u32::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a12, a2, 0
        movi.n            a9, -1
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a12, a8
        beqi              a13, 1, 4f
3:
        and               a8, a12, a3
        xor               a8, a8, a9
        wsr.scompare1     a12
        s32c1i            a8, a2, 0
        mov.n             a13, a11
        beq               a8, a12, 2b
        mov.n             a13, a10
        j                 2b
4:
        memw
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, fffc003c <asm_test::fetch_nand::u32::acquire+0xfffc003c>
        l32r              a8, 5b (810000a1 <asm_test::fetch_nand::u32::acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_nand::u32::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_nand::u32::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_nand::u32::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_nand::u32::relaxed+0x8> (ffff8105 <asm_test::fetch_nand::u32::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a12, a2, 0
        movi.n            a9, -1
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a12, a8
        beqi              a13, 1, 4f
3:
        and               a8, a12, a3
        xor               a8, a8, a9
        wsr.scompare1     a12
        s32c1i            a8, a2, 0
        mov.n             a13, a11
        beq               a8, a12, 2b
        mov.n             a13, a10
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 38 <asm_test::fetch_nand::u32::relaxed+0x38> (ffffa1f0 <asm_test::fetch_nand::u32::relaxed+0xffffa1f0>)
        l32r              a8, fffc003c <asm_test::fetch_nand::u32::relaxed+0xfffc003c>
        callx8            a8

.literal.asm_test::fetch_nand::u32::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_nand::u32::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_nand::u32::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_nand::u32::release+0x8> (ffff8105 <asm_test::fetch_nand::u32::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a12, a2, 0
        movi.n            a9, -1
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a12, a8
        beqi              a13, 1, 4f
3:
        and               a8, a12, a3
        xor               a8, a8, a9
        wsr.scompare1     a12
        s32c1i            a8, a2, 0
        mov.n             a13, a11
        beq               a8, a12, 2b
        mov.n             a13, a10
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, fffc003c <asm_test::fetch_nand::u32::release+0xfffc003c>
        l32r              a8, 5b (810000a1 <asm_test::fetch_nand::u32::release+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_nand::bool::acqrel:
        sub               a0, a0, a0
        {                 excw; excw }

asm_test::fetch_nand::bool::acqrel:
        entry             a1, 32
        movi.n            a9, 0
        movi.n            a8, 1
        l32r              a11, 4 <asm_test::fetch_nand::bool::acqrel+0x4> (b1180c09 <asm_test::fetch_nand::bool::acqrel+0xb1180c09>)
        mov.n             a10, a8
0:
        bgeu              a2, a11, 5f
        l32r              a11, 0b (b148b2b7 <asm_test::fetch_nand::bool::acqrel+0xb148b2b7>)
        bgeu              a11, a2, 6f
1:
        and               a9, a8, a10
        movi.n            a8, 1
        and               a9, a9, a8
        beqz              a3, 7f
2:
        bnez              a9, 11f
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        ssl               a9
        sll               a10, a8
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        j                 4f
3:
        mov.n             a14, a13
        beqi              a15, 1, 10f
4:
        xor               a13, a14, a10
        wsr.scompare1     a14
        s32c1i            a13, a11, 0
        mov.n             a15, a8
        beq               a13, a14, 3b
        mov.n             a15, a12
        j                 3b
5:
        mov.n             a10, a9
        l32r              a11, 5b (ffb109ad <asm_test::fetch_nand::bool::acqrel+0xffb109ad>)
        bltu              a11, a2, 1b
6:
        mov.n             a8, a9
        and               a9, a8, a10
        movi.n            a8, 1
        and               a9, a9, a8
        bnez              a3, 2b
7:
        bnez              a9, 12f
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        ssl               a9
        sll               a10, a8
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        j                 9f
8:
        mov.n             a14, a13
        beqi              a15, 1, 10f
9:
        or                a13, a14, a10
        wsr.scompare1     a14
        s32c1i            a13, a11, 0
        mov.n             a15, a8
        beq               a13, a14, 8b
        mov.n             a15, a12
        j                 8b
10:
        ssr               a9
        srl               a8, a13
        memw
        movi.n            a9, 1
        and               a2, a8, a9
        retw.n
11:
        l32r              a10, b4 <asm_test::fetch_nand::bool::acqrel+0xb4> (ffffa1f0 <asm_test::fetch_nand::bool::acqrel+0xffffa1f0>)
        l32r              a8, fffc00b8 <asm_test::fetch_nand::bool::acqrel+0xfffc00b8>
        callx8            a8
12:
        l32r              a10, bc <asm_test::fetch_nand::bool::acqrel+0xbc> (ffa10008 <asm_test::fetch_nand::bool::acqrel+0xffa10008>)
        l32r              a8, c0 <asm_test::fetch_nand::bool::acqrel+0xc0> (ffff81ff <asm_test::fetch_nand::bool::acqrel+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_nand::bool::seqcst:
        sub               a0, a0, a0
        {                 excw; excw }

asm_test::fetch_nand::bool::seqcst:
        entry             a1, 32
        movi.n            a9, 0
        movi.n            a8, 1
        l32r              a11, 4 <asm_test::fetch_nand::bool::seqcst+0x4> (b1180c09 <asm_test::fetch_nand::bool::seqcst+0xb1180c09>)
        mov.n             a10, a8
0:
        bgeu              a2, a11, 5f
        l32r              a11, 0b (b148b2b7 <asm_test::fetch_nand::bool::seqcst+0xb148b2b7>)
        bgeu              a11, a2, 6f
1:
        and               a9, a8, a10
        movi.n            a8, 1
        and               a9, a9, a8
        beqz              a3, 7f
2:
        bnez              a9, 11f
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        ssl               a9
        sll               a10, a8
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        j                 4f
3:
        mov.n             a14, a13
        beqi              a15, 1, 10f
4:
        xor               a13, a14, a10
        wsr.scompare1     a14
        s32c1i            a13, a11, 0
        mov.n             a15, a8
        beq               a13, a14, 3b
        mov.n             a15, a12
        j                 3b
5:
        mov.n             a10, a9
        l32r              a11, 5b (ffb109ad <asm_test::fetch_nand::bool::seqcst+0xffb109ad>)
        bltu              a11, a2, 1b
6:
        mov.n             a8, a9
        and               a9, a8, a10
        movi.n            a8, 1
        and               a9, a9, a8
        bnez              a3, 2b
7:
        bnez              a9, 12f
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        ssl               a9
        sll               a10, a8
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        j                 9f
8:
        mov.n             a14, a13
        beqi              a15, 1, 10f
9:
        or                a13, a14, a10
        wsr.scompare1     a14
        s32c1i            a13, a11, 0
        mov.n             a15, a8
        beq               a13, a14, 8b
        mov.n             a15, a12
        j                 8b
10:
        ssr               a9
        srl               a8, a13
        memw
        movi.n            a9, 1
        and               a2, a8, a9
        retw.n
11:
        l32r              a10, b4 <asm_test::fetch_nand::bool::seqcst+0xb4> (ffffa1f0 <asm_test::fetch_nand::bool::seqcst+0xffffa1f0>)
        l32r              a8, fffc00b8 <asm_test::fetch_nand::bool::seqcst+0xfffc00b8>
        callx8            a8
12:
        l32r              a10, bc <asm_test::fetch_nand::bool::seqcst+0xbc> (ffa10008 <asm_test::fetch_nand::bool::seqcst+0xffa10008>)
        l32r              a8, c0 <asm_test::fetch_nand::bool::seqcst+0xc0> (ffff81ff <asm_test::fetch_nand::bool::seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_nand::bool::acquire:
        sub               a0, a0, a0
        {                 excw; excw }

asm_test::fetch_nand::bool::acquire:
        entry             a1, 32
        movi.n            a9, 0
        movi.n            a8, 1
        l32r              a11, 4 <asm_test::fetch_nand::bool::acquire+0x4> (b1180c09 <asm_test::fetch_nand::bool::acquire+0xb1180c09>)
        mov.n             a10, a8
0:
        bgeu              a2, a11, 5f
        l32r              a11, 0b (b145b2b7 <asm_test::fetch_nand::bool::acquire+0xb145b2b7>)
        bgeu              a11, a2, 6f
1:
        and               a9, a8, a10
        movi.n            a8, 1
        and               a9, a9, a8
        beqz              a3, 7f
2:
        bnez              a9, 11f
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        ssl               a9
        sll               a10, a8
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        j                 4f
3:
        mov.n             a14, a13
        beqi              a15, 1, 10f
4:
        xor               a13, a14, a10
        wsr.scompare1     a14
        s32c1i            a13, a11, 0
        mov.n             a15, a8
        beq               a13, a14, 3b
        mov.n             a15, a12
        j                 3b
5:
        mov.n             a10, a9
        l32r              a11, 54 <asm_test::fetch_nand::bool::acquire+0x54> (b109adff <asm_test::fetch_nand::bool::acquire+0xb109adff>)
        bltu              a11, a2, 1b
6:
        mov.n             a8, a9
        and               a9, a8, a10
        movi.n            a8, 1
        and               a9, a9, a8
        bnez              a3, 2b
7:
        bnez              a9, 12f
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        ssl               a9
        sll               a10, a8
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        j                 9f
8:
        mov.n             a14, a13
        beqi              a15, 1, 10f
9:
        or                a13, a14, a10
        wsr.scompare1     a14
        s32c1i            a13, a11, 0
        mov.n             a15, a8
        beq               a13, a14, 8b
        mov.n             a15, a12
        j                 8b
10:
        ssr               a9
        srl               a8, a13
        memw
        movi.n            a9, 1
        and               a2, a8, a9
        retw.n
11:
        l32r              a10, ac <asm_test::fetch_nand::bool::acquire+0xac> (a1f01d10 <asm_test::fetch_nand::bool::acquire+0xa1f01d10>)
        l32r              a8, b0 <asm_test::fetch_nand::bool::acquire+0xb0> (ff81ffff <asm_test::fetch_nand::bool::acquire+0xff81ffff>)
        callx8            a8
12:
        l32r              a10, fffc00b8 <asm_test::fetch_nand::bool::acquire+0xfffc00b8>
        l32r              a8, 12b (810000a1 <asm_test::fetch_nand::bool::acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_nand::bool::relaxed:
        sub               a0, a0, a0
        {                 excw; excw }

asm_test::fetch_nand::bool::relaxed:
        entry             a1, 32
        movi.n            a9, 0
        movi.n            a8, 1
        l32r              a11, 4 <asm_test::fetch_nand::bool::relaxed+0x4> (b1180c09 <asm_test::fetch_nand::bool::relaxed+0xb1180c09>)
        mov.n             a10, a8
0:
        bgeu              a2, a11, 5f
        l32r              a11, 0b (b145b2b7 <asm_test::fetch_nand::bool::relaxed+0xb145b2b7>)
        bgeu              a11, a2, 6f
1:
        and               a9, a8, a10
        movi.n            a8, 1
        and               a9, a9, a8
        beqz              a3, 7f
2:
        bnez              a9, 11f
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        ssl               a9
        sll               a10, a8
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        j                 4f
3:
        mov.n             a14, a13
        beqi              a15, 1, 10f
4:
        xor               a13, a14, a10
        wsr.scompare1     a14
        s32c1i            a13, a11, 0
        mov.n             a15, a8
        beq               a13, a14, 3b
        mov.n             a15, a12
        j                 3b
5:
        mov.n             a10, a9
        l32r              a11, 54 <asm_test::fetch_nand::bool::relaxed+0x54> (b109adff <asm_test::fetch_nand::bool::relaxed+0xb109adff>)
        bltu              a11, a2, 1b
6:
        mov.n             a8, a9
        and               a9, a8, a10
        movi.n            a8, 1
        and               a9, a9, a8
        bnez              a3, 2b
7:
        bnez              a9, 12f
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        ssl               a9
        sll               a10, a8
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        j                 9f
8:
        mov.n             a14, a13
        beqi              a15, 1, 10f
9:
        or                a13, a14, a10
        wsr.scompare1     a14
        s32c1i            a13, a11, 0
        mov.n             a15, a8
        beq               a13, a14, 8b
        mov.n             a15, a12
        j                 8b
10:
        ssr               a9
        srl               a8, a13
        movi.n            a9, 1
        and               a2, a8, a9
        retw.n
11:
        l32r              a10, fffc00ac <asm_test::fetch_nand::bool::relaxed+0xfffc00ac>
        l32r              a8, 11b (810000a1 <asm_test::fetch_nand::bool::relaxed+0x810000a1>)
        callx8            a8
12:
        l32r              a10, b4 <asm_test::fetch_nand::bool::relaxed+0xb4> (ffffa100 <asm_test::fetch_nand::bool::relaxed+0xffffa100>)
        l32r              a8, fffc00b8 <asm_test::fetch_nand::bool::relaxed+0xfffc00b8>
        callx8            a8

.literal.asm_test::fetch_nand::bool::release:
        sub               a0, a0, a0
        {                 excw; excw }

asm_test::fetch_nand::bool::release:
        entry             a1, 32
        movi.n            a9, 0
        movi.n            a8, 1
        l32r              a11, 4 <asm_test::fetch_nand::bool::release+0x4> (b1180c09 <asm_test::fetch_nand::bool::release+0xb1180c09>)
        mov.n             a10, a8
0:
        bgeu              a2, a11, 5f
        l32r              a11, 0b (b148b2b7 <asm_test::fetch_nand::bool::release+0xb148b2b7>)
        bgeu              a11, a2, 6f
1:
        and               a9, a8, a10
        movi.n            a8, 1
        and               a9, a9, a8
        beqz              a3, 7f
2:
        bnez              a9, 12f
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        ssl               a9
        sll               a10, a8
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        j                 4f
3:
        mov.n             a14, a13
        beqi              a15, 1, 10f
4:
        xor               a13, a14, a10
        wsr.scompare1     a14
        s32c1i            a13, a11, 0
        mov.n             a15, a8
        beq               a13, a14, 3b
        mov.n             a15, a12
        j                 3b
5:
        mov.n             a10, a9
        l32r              a11, 5b (ffb109ad <asm_test::fetch_nand::bool::release+0xffb109ad>)
        bltu              a11, a2, 1b
6:
        mov.n             a8, a9
        and               a9, a8, a10
        movi.n            a8, 1
        and               a9, a9, a8
        bnez              a3, 2b
7:
        bnez              a9, 14f
        slli              a9, a2, 3
        movi.n            a10, 24
        and               a9, a9, a10
        ssl               a9
        sll               a10, a8
        movi.n            a11, -4
        and               a11, a2, a11
        memw
        l32i.n            a14, a11, 0
        movi.n            a12, 0
        j                 9f
8:
        mov.n             a14, a13
        beqi              a15, 1, 10f
9:
        or                a13, a14, a10
        wsr.scompare1     a14
        s32c1i            a13, a11, 0
        mov.n             a15, a8
        beq               a13, a14, 8b
        mov.n             a15, a12
        j                 8b
10:
        ssr               a9
        srl               a8, a13
        movi.n            a9, 1
        and               a2, a8, a9
11:
        retw.n
12:
        l32r              a10, 11b (ffa1f01d <asm_test::fetch_nand::bool::release+0xffa1f01d>)
        l32r              a8, b4 <asm_test::fetch_nand::bool::release+0xb4> (ffff81ff <asm_test::fetch_nand::bool::release+0xffff81ff>)
13:
        callx8            a8
14:
        l32r              a10, 13b (a10008e0 <asm_test::fetch_nand::bool::release+0xa10008e0>)
        l32r              a8, bc <asm_test::fetch_nand::bool::release+0xbc> (ff81ffff <asm_test::fetch_nand::bool::release+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_umax::u8::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_umax::u8::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umax::u8::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_umax::u8::acqrel+0x8> (ffff8105 <asm_test::fetch_umax::u8::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a15, a7
        beqi              a6, 1, 4f
3:
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
        beq               a7, a15, 2b
        mov.n             a6, a13
        j                 2b
4:
        ssr               a8
        srl               a2, a7
        memw
        retw.n
5:
        l32r              a10, 70 <asm_test::fetch_umax::u8::acqrel+0x70> (ffffa1f0 <asm_test::fetch_umax::u8::acqrel+0xffffa1f0>)
        l32r              a8, fffc0074 <asm_test::fetch_umax::u8::acqrel+0xfffc0074>
        callx8            a8

.literal.asm_test::fetch_umax::u8::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_umax::u8::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umax::u8::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_umax::u8::seqcst+0x8> (ffff8105 <asm_test::fetch_umax::u8::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a15, a7
        beqi              a6, 1, 4f
3:
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
        beq               a7, a15, 2b
        mov.n             a6, a13
        j                 2b
4:
        ssr               a8
        srl               a2, a7
        memw
        retw.n
5:
        l32r              a10, 70 <asm_test::fetch_umax::u8::seqcst+0x70> (ffffa1f0 <asm_test::fetch_umax::u8::seqcst+0xffffa1f0>)
        l32r              a8, fffc0074 <asm_test::fetch_umax::u8::seqcst+0xfffc0074>
        callx8            a8

.literal.asm_test::fetch_umax::u8::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_umax::u8::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umax::u8::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_umax::u8::acquire+0x8> (ffff8105 <asm_test::fetch_umax::u8::acquire+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
        j                 3f
2:
        mov.n             a15, a7
        beqi              a6, 1, 4f
3:
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
        beq               a7, a15, 2b
        mov.n             a6, a13
        j                 2b
4:
        ssr               a8
        srl               a2, a7
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_umax::u8::acquire+0xffa1f01d>)
        l32r              a8, 70 <asm_test::fetch_umax::u8::acquire+0x70> (ffff81ff <asm_test::fetch_umax::u8::acquire+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_umax::u8::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_umax::u8::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umax::u8::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_umax::u8::relaxed+0x8> (ffff8105 <asm_test::fetch_umax::u8::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a15, a7
        beqi              a6, 1, 4f
3:
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
        beq               a7, a15, 2b
        mov.n             a6, a13
        j                 2b
4:
        ssr               a8
        srl               a2, a7
        retw.n
5:
        l32r              a10, 68 <asm_test::fetch_umax::u8::relaxed+0x68> (a1f01d91 <asm_test::fetch_umax::u8::relaxed+0xa1f01d91>)
        l32r              a8, 6c <asm_test::fetch_umax::u8::relaxed+0x6c> (ff81ffff <asm_test::fetch_umax::u8::relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_umax::u8::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_umax::u8::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umax::u8::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_umax::u8::release+0x8> (ffff8105 <asm_test::fetch_umax::u8::release+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
        j                 3f
2:
        mov.n             a15, a7
        beqi              a6, 1, 4f
3:
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
        beq               a7, a15, 2b
        mov.n             a6, a13
        j                 2b
4:
        ssr               a8
        srl               a2, a7
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_umax::u8::release+0xffa1f01d>)
        l32r              a8, 70 <asm_test::fetch_umax::u8::release+0x70> (ffff81ff <asm_test::fetch_umax::u8::release+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_umax::u16::acqrel:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_umax::u16::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umax::u16::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_umax::u16::acqrel+0x8> (ffff8105 <asm_test::fetch_umax::u16::acqrel+0xffff8105>)
        bgeu              a8, a2, 7f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
2:
        and               a8, a8, a9
        l32r              a9, 2b (91108890 <asm_test::fetch_umax::u16::acqrel+0x91108890>)
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
        j                 5f
3:
        mov.n             a13, a14
4:
        beqi              a15, 1, 6f
5:
        l32r              a14, 4b (e12d1f26 <asm_test::fetch_umax::u16::acqrel+0xe12d1f26>)
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
        beq               a14, a13, 3b
        mov.n             a15, a11
        j                 3b
6:
        ssr               a8
        srl               a2, a14
        memw
        retw.n
7:
        l32r              a10, fffc0074 <asm_test::fetch_umax::u16::acqrel+0xfffc0074>
        l32r              a8, 7b (810000a1 <asm_test::fetch_umax::u16::acqrel+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_umax::u16::seqcst:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_umax::u16::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umax::u16::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_umax::u16::seqcst+0x8> (ffff8105 <asm_test::fetch_umax::u16::seqcst+0xffff8105>)
        bgeu              a8, a2, 7f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
2:
        and               a8, a8, a9
        l32r              a9, 2b (91108890 <asm_test::fetch_umax::u16::seqcst+0x91108890>)
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
        j                 5f
3:
        mov.n             a13, a14
4:
        beqi              a15, 1, 6f
5:
        l32r              a14, 4b (e12d1f26 <asm_test::fetch_umax::u16::seqcst+0xe12d1f26>)
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
        beq               a14, a13, 3b
        mov.n             a15, a11
        j                 3b
6:
        ssr               a8
        srl               a2, a14
        memw
        retw.n
7:
        l32r              a10, fffc0074 <asm_test::fetch_umax::u16::seqcst+0xfffc0074>
        l32r              a8, 7b (810000a1 <asm_test::fetch_umax::u16::seqcst+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_umax::u16::acquire:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_umax::u16::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umax::u16::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_umax::u16::acquire+0x8> (ffff8105 <asm_test::fetch_umax::u16::acquire+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
2:
        and               a8, a8, a9
        l32r              a9, 2b (91108890 <asm_test::fetch_umax::u16::acquire+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a13, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 4f
3:
        mov.n             a13, a14
        beqi              a15, 1, 5f
4:
        l32r              a14, fffc0038 <asm_test::fetch_umax::u16::acquire+0xfffc0038>
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
        beq               a14, a13, 3b
        mov.n             a15, a11
        j                 3b
5:
        ssr               a8
        srl               a2, a14
        memw
        retw.n
6:
        l32r              a10, 70 <asm_test::fetch_umax::u16::acquire+0x70> (ffffa1f0 <asm_test::fetch_umax::u16::acquire+0xffffa1f0>)
        l32r              a8, fffc0074 <asm_test::fetch_umax::u16::acquire+0xfffc0074>
        callx8            a8

.literal.asm_test::fetch_umax::u16::relaxed:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_umax::u16::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umax::u16::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_umax::u16::relaxed+0x8> (ffff8105 <asm_test::fetch_umax::u16::relaxed+0xffff8105>)
        bgeu              a8, a2, 7f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
2:
        and               a8, a8, a9
        l32r              a9, 2b (91108890 <asm_test::fetch_umax::u16::relaxed+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a13, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 4f
3:
        mov.n             a13, a14
        beqi              a15, 1, 5f
4:
        l32r              a14, fffc0038 <asm_test::fetch_umax::u16::relaxed+0xfffc0038>
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
        beq               a14, a13, 3b
        mov.n             a15, a11
        j                 3b
5:
        ssr               a8
        srl               a2, a14
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::fetch_umax::u16::relaxed+0xffa1f01d>)
        l32r              a8, 70 <asm_test::fetch_umax::u16::relaxed+0x70> (ffff81ff <asm_test::fetch_umax::u16::relaxed+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_umax::u16::release:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_umax::u16::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umax::u16::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_umax::u16::release+0x8> (ffff8105 <asm_test::fetch_umax::u16::release+0xffff8105>)
        bgeu              a8, a2, 7f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
2:
        and               a8, a8, a9
        l32r              a9, 2b (91108890 <asm_test::fetch_umax::u16::release+0x91108890>)
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
        j                 5f
3:
        mov.n             a13, a14
4:
        beqi              a15, 1, 6f
5:
        l32r              a14, 4b (e12d1f26 <asm_test::fetch_umax::u16::release+0xe12d1f26>)
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
        beq               a14, a13, 3b
        mov.n             a15, a11
        j                 3b
6:
        ssr               a8
        srl               a2, a14
        retw.n
7:
        l32r              a10, 70 <asm_test::fetch_umax::u16::release+0x70> (ffffa1f0 <asm_test::fetch_umax::u16::release+0xffffa1f0>)
        l32r              a8, fffc0074 <asm_test::fetch_umax::u16::release+0xfffc0074>
        callx8            a8

.literal.asm_test::fetch_umax::u32::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_umax::u32::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umax::u32::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_umax::u32::acqrel+0x8> (ffff8105 <asm_test::fetch_umax::u32::acqrel+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        maxu              a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_umax::u32::acqrel+0xffa1f01d>)
        l32r              a8, 3c <asm_test::fetch_umax::u32::acqrel+0x3c> (ffff81ff <asm_test::fetch_umax::u32::acqrel+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_umax::u32::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_umax::u32::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umax::u32::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_umax::u32::seqcst+0x8> (ffff8105 <asm_test::fetch_umax::u32::seqcst+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        maxu              a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_umax::u32::seqcst+0xffa1f01d>)
        l32r              a8, 3c <asm_test::fetch_umax::u32::seqcst+0x3c> (ffff81ff <asm_test::fetch_umax::u32::seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_umax::u32::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_umax::u32::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umax::u32::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_umax::u32::acquire+0x8> (ffff8105 <asm_test::fetch_umax::u32::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        maxu              a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 34 <asm_test::fetch_umax::u32::acquire+0x34> (a1f01d08 <asm_test::fetch_umax::u32::acquire+0xa1f01d08>)
        l32r              a8, 38 <asm_test::fetch_umax::u32::acquire+0x38> (ff81ffff <asm_test::fetch_umax::u32::acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_umax::u32::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_umax::u32::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umax::u32::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_umax::u32::relaxed+0x8> (ffff8105 <asm_test::fetch_umax::u32::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        maxu              a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, fffc0034 <asm_test::fetch_umax::u32::relaxed+0xfffc0034>
        l32r              a8, 5b (810000a1 <asm_test::fetch_umax::u32::relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_umax::u32::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_umax::u32::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umax::u32::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_umax::u32::release+0x8> (ffff8105 <asm_test::fetch_umax::u32::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        maxu              a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 34 <asm_test::fetch_umax::u32::release+0x34> (a1f01d08 <asm_test::fetch_umax::u32::release+0xa1f01d08>)
        l32r              a8, 38 <asm_test::fetch_umax::u32::release+0x38> (ff81ffff <asm_test::fetch_umax::u32::release+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_umin::u8::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_umin::u8::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umin::u8::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_umin::u8::acqrel+0x8> (ffff8105 <asm_test::fetch_umin::u8::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a15, a7
        beqi              a6, 1, 4f
3:
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
        beq               a7, a15, 2b
        mov.n             a6, a13
        j                 2b
4:
        ssr               a8
        srl               a2, a7
        memw
        retw.n
5:
        l32r              a10, 70 <asm_test::fetch_umin::u8::acqrel+0x70> (ffffa1f0 <asm_test::fetch_umin::u8::acqrel+0xffffa1f0>)
        l32r              a8, fffc0074 <asm_test::fetch_umin::u8::acqrel+0xfffc0074>
        callx8            a8

.literal.asm_test::fetch_umin::u8::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_umin::u8::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umin::u8::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_umin::u8::seqcst+0x8> (ffff8105 <asm_test::fetch_umin::u8::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a15, a7
        beqi              a6, 1, 4f
3:
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
        beq               a7, a15, 2b
        mov.n             a6, a13
        j                 2b
4:
        ssr               a8
        srl               a2, a7
        memw
        retw.n
5:
        l32r              a10, 70 <asm_test::fetch_umin::u8::seqcst+0x70> (ffffa1f0 <asm_test::fetch_umin::u8::seqcst+0xffffa1f0>)
        l32r              a8, fffc0074 <asm_test::fetch_umin::u8::seqcst+0xfffc0074>
        callx8            a8

.literal.asm_test::fetch_umin::u8::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_umin::u8::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umin::u8::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_umin::u8::acquire+0x8> (ffff8105 <asm_test::fetch_umin::u8::acquire+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
        j                 3f
2:
        mov.n             a15, a7
        beqi              a6, 1, 4f
3:
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
        beq               a7, a15, 2b
        mov.n             a6, a13
        j                 2b
4:
        ssr               a8
        srl               a2, a7
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_umin::u8::acquire+0xffa1f01d>)
        l32r              a8, 70 <asm_test::fetch_umin::u8::acquire+0x70> (ffff81ff <asm_test::fetch_umin::u8::acquire+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_umin::u8::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_umin::u8::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umin::u8::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_umin::u8::relaxed+0x8> (ffff8105 <asm_test::fetch_umin::u8::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a15, a7
        beqi              a6, 1, 4f
3:
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
        beq               a7, a15, 2b
        mov.n             a6, a13
        j                 2b
4:
        ssr               a8
        srl               a2, a7
        retw.n
5:
        l32r              a10, 68 <asm_test::fetch_umin::u8::relaxed+0x68> (a1f01d91 <asm_test::fetch_umin::u8::relaxed+0xa1f01d91>)
        l32r              a8, 6c <asm_test::fetch_umin::u8::relaxed+0x6c> (ff81ffff <asm_test::fetch_umin::u8::relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_umin::u8::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_umin::u8::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umin::u8::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_umin::u8::release+0x8> (ffff8105 <asm_test::fetch_umin::u8::release+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
        j                 3f
2:
        mov.n             a15, a7
        beqi              a6, 1, 4f
3:
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
        beq               a7, a15, 2b
        mov.n             a6, a13
        j                 2b
4:
        ssr               a8
        srl               a2, a7
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_umin::u8::release+0xffa1f01d>)
        l32r              a8, 70 <asm_test::fetch_umin::u8::release+0x70> (ffff81ff <asm_test::fetch_umin::u8::release+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_umin::u16::acqrel:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_umin::u16::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umin::u16::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_umin::u16::acqrel+0x8> (ffff8105 <asm_test::fetch_umin::u16::acqrel+0xffff8105>)
        bgeu              a8, a2, 7f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
2:
        and               a8, a8, a9
        l32r              a9, 2b (91108890 <asm_test::fetch_umin::u16::acqrel+0x91108890>)
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
        j                 5f
3:
        mov.n             a13, a14
4:
        beqi              a15, 1, 6f
5:
        l32r              a14, 4b (e12d1f26 <asm_test::fetch_umin::u16::acqrel+0xe12d1f26>)
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
        beq               a14, a13, 3b
        mov.n             a15, a11
        j                 3b
6:
        ssr               a8
        srl               a2, a14
        memw
        retw.n
7:
        l32r              a10, fffc0074 <asm_test::fetch_umin::u16::acqrel+0xfffc0074>
        l32r              a8, 7b (810000a1 <asm_test::fetch_umin::u16::acqrel+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_umin::u16::seqcst:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_umin::u16::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umin::u16::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_umin::u16::seqcst+0x8> (ffff8105 <asm_test::fetch_umin::u16::seqcst+0xffff8105>)
        bgeu              a8, a2, 7f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
2:
        and               a8, a8, a9
        l32r              a9, 2b (91108890 <asm_test::fetch_umin::u16::seqcst+0x91108890>)
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
        j                 5f
3:
        mov.n             a13, a14
4:
        beqi              a15, 1, 6f
5:
        l32r              a14, 4b (e12d1f26 <asm_test::fetch_umin::u16::seqcst+0xe12d1f26>)
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
        beq               a14, a13, 3b
        mov.n             a15, a11
        j                 3b
6:
        ssr               a8
        srl               a2, a14
        memw
        retw.n
7:
        l32r              a10, fffc0074 <asm_test::fetch_umin::u16::seqcst+0xfffc0074>
        l32r              a8, 7b (810000a1 <asm_test::fetch_umin::u16::seqcst+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_umin::u16::acquire:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_umin::u16::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umin::u16::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_umin::u16::acquire+0x8> (ffff8105 <asm_test::fetch_umin::u16::acquire+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
2:
        and               a8, a8, a9
        l32r              a9, 2b (91108890 <asm_test::fetch_umin::u16::acquire+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a13, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 4f
3:
        mov.n             a13, a14
        beqi              a15, 1, 5f
4:
        l32r              a14, fffc0038 <asm_test::fetch_umin::u16::acquire+0xfffc0038>
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
        beq               a14, a13, 3b
        mov.n             a15, a11
        j                 3b
5:
        ssr               a8
        srl               a2, a14
        memw
        retw.n
6:
        l32r              a10, 70 <asm_test::fetch_umin::u16::acquire+0x70> (ffffa1f0 <asm_test::fetch_umin::u16::acquire+0xffffa1f0>)
        l32r              a8, fffc0074 <asm_test::fetch_umin::u16::acquire+0xfffc0074>
        callx8            a8

.literal.asm_test::fetch_umin::u16::relaxed:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_umin::u16::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umin::u16::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_umin::u16::relaxed+0x8> (ffff8105 <asm_test::fetch_umin::u16::relaxed+0xffff8105>)
        bgeu              a8, a2, 7f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
2:
        and               a8, a8, a9
        l32r              a9, 2b (91108890 <asm_test::fetch_umin::u16::relaxed+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a13, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 4f
3:
        mov.n             a13, a14
        beqi              a15, 1, 5f
4:
        l32r              a14, fffc0038 <asm_test::fetch_umin::u16::relaxed+0xfffc0038>
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
        beq               a14, a13, 3b
        mov.n             a15, a11
        j                 3b
5:
        ssr               a8
        srl               a2, a14
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::fetch_umin::u16::relaxed+0xffa1f01d>)
        l32r              a8, 70 <asm_test::fetch_umin::u16::relaxed+0x70> (ffff81ff <asm_test::fetch_umin::u16::relaxed+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_umin::u16::release:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_umin::u16::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umin::u16::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_umin::u16::release+0x8> (ffff8105 <asm_test::fetch_umin::u16::release+0xffff8105>)
        bgeu              a8, a2, 7f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
2:
        and               a8, a8, a9
        l32r              a9, 2b (91108890 <asm_test::fetch_umin::u16::release+0x91108890>)
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
        j                 5f
3:
        mov.n             a13, a14
4:
        beqi              a15, 1, 6f
5:
        l32r              a14, 4b (e12d1f26 <asm_test::fetch_umin::u16::release+0xe12d1f26>)
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
        beq               a14, a13, 3b
        mov.n             a15, a11
        j                 3b
6:
        ssr               a8
        srl               a2, a14
        retw.n
7:
        l32r              a10, 70 <asm_test::fetch_umin::u16::release+0x70> (ffffa1f0 <asm_test::fetch_umin::u16::release+0xffffa1f0>)
        l32r              a8, fffc0074 <asm_test::fetch_umin::u16::release+0xfffc0074>
        callx8            a8

.literal.asm_test::fetch_umin::u32::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_umin::u32::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umin::u32::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_umin::u32::acqrel+0x8> (ffff8105 <asm_test::fetch_umin::u32::acqrel+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        minu              a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_umin::u32::acqrel+0xffa1f01d>)
        l32r              a8, 3c <asm_test::fetch_umin::u32::acqrel+0x3c> (ffff81ff <asm_test::fetch_umin::u32::acqrel+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_umin::u32::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_umin::u32::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umin::u32::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_umin::u32::seqcst+0x8> (ffff8105 <asm_test::fetch_umin::u32::seqcst+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        minu              a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_umin::u32::seqcst+0xffa1f01d>)
        l32r              a8, 3c <asm_test::fetch_umin::u32::seqcst+0x3c> (ffff81ff <asm_test::fetch_umin::u32::seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_umin::u32::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_umin::u32::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umin::u32::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_umin::u32::acquire+0x8> (ffff8105 <asm_test::fetch_umin::u32::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        minu              a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 34 <asm_test::fetch_umin::u32::acquire+0x34> (a1f01d08 <asm_test::fetch_umin::u32::acquire+0xa1f01d08>)
        l32r              a8, 38 <asm_test::fetch_umin::u32::acquire+0x38> (ff81ffff <asm_test::fetch_umin::u32::acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_umin::u32::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_umin::u32::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umin::u32::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_umin::u32::relaxed+0x8> (ffff8105 <asm_test::fetch_umin::u32::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        minu              a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, fffc0034 <asm_test::fetch_umin::u32::relaxed+0xfffc0034>
        l32r              a8, 5b (810000a1 <asm_test::fetch_umin::u32::relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_umin::u32::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_umin::u32::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umin::u32::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_umin::u32::release+0x8> (ffff8105 <asm_test::fetch_umin::u32::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        minu              a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 34 <asm_test::fetch_umin::u32::release+0x34> (a1f01d08 <asm_test::fetch_umin::u32::release+0xa1f01d08>)
        l32r              a8, 38 <asm_test::fetch_umin::u32::release+0x38> (ff81ffff <asm_test::fetch_umin::u32::release+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange::u8::acqrel_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::u8::acqrel_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u8::acqrel_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::u8::acqrel_seqcst+0x8> (ffff8105 <asm_test::compare_exchange::u8::acqrel_seqcst+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
2:
        mov.n             a7, a5
        or                a14, a7, a10
        or                a5, a7, a9
        wsr.scompare1     a5
        s32c1i            a14, a12, 0
        mov.n             a6, a15
        beq               a14, a5, 3f
        mov.n             a6, a13
3:
        bnez              a6, 4f
        and               a5, a14, a11
        bne               a7, a5, 2b
4:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::compare_exchange::u8::acqrel_seqcst+0xffa1f01d>)
        l32r              a8, 78 <asm_test::compare_exchange::u8::acqrel_seqcst+0x78> (ffff81ff <asm_test::compare_exchange::u8::acqrel_seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::compare_exchange::u8::seqcst_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::u8::seqcst_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u8::seqcst_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::u8::seqcst_seqcst+0x8> (ffff8105 <asm_test::compare_exchange::u8::seqcst_seqcst+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
2:
        mov.n             a7, a5
        or                a14, a7, a10
        or                a5, a7, a9
        wsr.scompare1     a5
        s32c1i            a14, a12, 0
        mov.n             a6, a15
        beq               a14, a5, 3f
        mov.n             a6, a13
3:
        bnez              a6, 4f
        and               a5, a14, a11
        bne               a7, a5, 2b
4:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::compare_exchange::u8::seqcst_seqcst+0xffa1f01d>)
        l32r              a8, 78 <asm_test::compare_exchange::u8::seqcst_seqcst+0x78> (ffff81ff <asm_test::compare_exchange::u8::seqcst_seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::compare_exchange::u8::acqrel_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::u8::acqrel_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u8::acqrel_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::u8::acqrel_acquire+0x8> (ffff8105 <asm_test::compare_exchange::u8::acqrel_acquire+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
2:
        mov.n             a7, a5
        or                a14, a7, a10
        or                a5, a7, a9
        wsr.scompare1     a5
        s32c1i            a14, a12, 0
        mov.n             a6, a15
        beq               a14, a5, 3f
        mov.n             a6, a13
3:
        bnez              a6, 4f
        and               a5, a14, a11
        bne               a7, a5, 2b
4:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::compare_exchange::u8::acqrel_acquire+0xffa1f01d>)
        l32r              a8, 78 <asm_test::compare_exchange::u8::acqrel_acquire+0x78> (ffff81ff <asm_test::compare_exchange::u8::acqrel_acquire+0xffff81ff>)
        callx8            a8

.literal.asm_test::compare_exchange::u8::acqrel_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::u8::acqrel_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u8::acqrel_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::u8::acqrel_relaxed+0x8> (ffff8105 <asm_test::compare_exchange::u8::acqrel_relaxed+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
2:
        mov.n             a7, a5
        or                a14, a7, a10
        or                a5, a7, a9
        wsr.scompare1     a5
        s32c1i            a14, a12, 0
        mov.n             a6, a15
        beq               a14, a5, 3f
        mov.n             a6, a13
3:
        bnez              a6, 4f
        and               a5, a14, a11
        bne               a7, a5, 2b
4:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::compare_exchange::u8::acqrel_relaxed+0xffa1f01d>)
        l32r              a8, 78 <asm_test::compare_exchange::u8::acqrel_relaxed+0x78> (ffff81ff <asm_test::compare_exchange::u8::acqrel_relaxed+0xffff81ff>)
        callx8            a8

.literal.asm_test::compare_exchange::u8::acquire_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::u8::acquire_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u8::acquire_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::u8::acquire_seqcst+0x8> (ffff8105 <asm_test::compare_exchange::u8::acquire_seqcst+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
2:
        mov.n             a7, a5
        or                a14, a7, a10
        or                a5, a7, a9
        wsr.scompare1     a5
        s32c1i            a14, a12, 0
        mov.n             a6, a15
        beq               a14, a5, 3f
        mov.n             a6, a13
3:
        bnez              a6, 4f
        and               a5, a14, a11
        bne               a7, a5, 2b
4:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::compare_exchange::u8::acquire_seqcst+0xffa1f01d>)
        l32r              a8, 78 <asm_test::compare_exchange::u8::acquire_seqcst+0x78> (ffff81ff <asm_test::compare_exchange::u8::acquire_seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::compare_exchange::u8::relaxed_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::u8::relaxed_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u8::relaxed_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::u8::relaxed_seqcst+0x8> (ffff8105 <asm_test::compare_exchange::u8::relaxed_seqcst+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
2:
        mov.n             a7, a5
        or                a14, a7, a10
        or                a5, a7, a9
        wsr.scompare1     a5
        s32c1i            a14, a12, 0
        mov.n             a6, a15
        beq               a14, a5, 3f
        mov.n             a6, a13
3:
        bnez              a6, 4f
        and               a5, a14, a11
        bne               a7, a5, 2b
4:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::compare_exchange::u8::relaxed_seqcst+0xffa1f01d>)
        l32r              a8, 78 <asm_test::compare_exchange::u8::relaxed_seqcst+0x78> (ffff81ff <asm_test::compare_exchange::u8::relaxed_seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::compare_exchange::u8::release_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::u8::release_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u8::release_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::u8::release_seqcst+0x8> (ffff8105 <asm_test::compare_exchange::u8::release_seqcst+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
2:
        mov.n             a7, a5
        or                a14, a7, a10
        or                a5, a7, a9
        wsr.scompare1     a5
        s32c1i            a14, a12, 0
        mov.n             a6, a15
        beq               a14, a5, 3f
        mov.n             a6, a13
3:
        bnez              a6, 4f
        and               a5, a14, a11
        bne               a7, a5, 2b
4:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::compare_exchange::u8::release_seqcst+0xffa1f01d>)
        l32r              a8, 78 <asm_test::compare_exchange::u8::release_seqcst+0x78> (ffff81ff <asm_test::compare_exchange::u8::release_seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::compare_exchange::u8::seqcst_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::u8::seqcst_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u8::seqcst_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::u8::seqcst_acquire+0x8> (ffff8105 <asm_test::compare_exchange::u8::seqcst_acquire+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
2:
        mov.n             a7, a5
        or                a14, a7, a10
        or                a5, a7, a9
        wsr.scompare1     a5
        s32c1i            a14, a12, 0
        mov.n             a6, a15
        beq               a14, a5, 3f
        mov.n             a6, a13
3:
        bnez              a6, 4f
        and               a5, a14, a11
        bne               a7, a5, 2b
4:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::compare_exchange::u8::seqcst_acquire+0xffa1f01d>)
        l32r              a8, 78 <asm_test::compare_exchange::u8::seqcst_acquire+0x78> (ffff81ff <asm_test::compare_exchange::u8::seqcst_acquire+0xffff81ff>)
        callx8            a8

.literal.asm_test::compare_exchange::u8::seqcst_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::u8::seqcst_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u8::seqcst_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::u8::seqcst_relaxed+0x8> (ffff8105 <asm_test::compare_exchange::u8::seqcst_relaxed+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
2:
        mov.n             a7, a5
        or                a14, a7, a10
        or                a5, a7, a9
        wsr.scompare1     a5
        s32c1i            a14, a12, 0
        mov.n             a6, a15
        beq               a14, a5, 3f
        mov.n             a6, a13
3:
        bnez              a6, 4f
        and               a5, a14, a11
        bne               a7, a5, 2b
4:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::compare_exchange::u8::seqcst_relaxed+0xffa1f01d>)
        l32r              a8, 78 <asm_test::compare_exchange::u8::seqcst_relaxed+0x78> (ffff81ff <asm_test::compare_exchange::u8::seqcst_relaxed+0xffff81ff>)
        callx8            a8

.literal.asm_test::compare_exchange::u8::acquire_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::u8::acquire_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u8::acquire_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::u8::acquire_acquire+0x8> (ffff8105 <asm_test::compare_exchange::u8::acquire_acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
2:
        mov.n             a7, a5
        or                a14, a7, a10
        or                a5, a7, a9
        wsr.scompare1     a5
        s32c1i            a14, a12, 0
        mov.n             a6, a15
        beq               a14, a5, 3f
        mov.n             a6, a13
3:
        bnez              a6, 4f
        and               a5, a14, a11
        bne               a7, a5, 2b
4:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
        retw.n
5:
        l32r              a10, 70 <asm_test::compare_exchange::u8::acquire_acquire+0x70> (a1f01d00 <asm_test::compare_exchange::u8::acquire_acquire+0xa1f01d00>)
        l32r              a8, 74 <asm_test::compare_exchange::u8::acquire_acquire+0x74> (ff81ffff <asm_test::compare_exchange::u8::acquire_acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange::u8::acquire_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::u8::acquire_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u8::acquire_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::u8::acquire_relaxed+0x8> (ffff8105 <asm_test::compare_exchange::u8::acquire_relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
2:
        mov.n             a7, a5
        or                a14, a7, a10
        or                a5, a7, a9
        wsr.scompare1     a5
        s32c1i            a14, a12, 0
        mov.n             a6, a15
        beq               a14, a5, 3f
        mov.n             a6, a13
3:
        bnez              a6, 4f
        and               a5, a14, a11
        bne               a7, a5, 2b
4:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
        retw.n
5:
        l32r              a10, 70 <asm_test::compare_exchange::u8::acquire_relaxed+0x70> (a1f01d00 <asm_test::compare_exchange::u8::acquire_relaxed+0xa1f01d00>)
        l32r              a8, 74 <asm_test::compare_exchange::u8::acquire_relaxed+0x74> (ff81ffff <asm_test::compare_exchange::u8::acquire_relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange::u8::relaxed_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::u8::relaxed_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u8::relaxed_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::u8::relaxed_acquire+0x8> (ffff8105 <asm_test::compare_exchange::u8::relaxed_acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
2:
        mov.n             a7, a5
        or                a14, a7, a10
        or                a5, a7, a9
        wsr.scompare1     a5
        s32c1i            a14, a12, 0
        mov.n             a6, a15
        beq               a14, a5, 3f
        mov.n             a6, a13
3:
        bnez              a6, 4f
        and               a5, a14, a11
        bne               a7, a5, 2b
4:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
        retw.n
5:
        l32r              a10, 70 <asm_test::compare_exchange::u8::relaxed_acquire+0x70> (a1f01d00 <asm_test::compare_exchange::u8::relaxed_acquire+0xa1f01d00>)
        l32r              a8, 74 <asm_test::compare_exchange::u8::relaxed_acquire+0x74> (ff81ffff <asm_test::compare_exchange::u8::relaxed_acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange::u8::relaxed_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::u8::relaxed_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u8::relaxed_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::u8::relaxed_relaxed+0x8> (ffff8105 <asm_test::compare_exchange::u8::relaxed_relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
2:
        mov.n             a7, a5
        or                a14, a7, a10
        or                a5, a7, a9
        wsr.scompare1     a5
        s32c1i            a14, a12, 0
        mov.n             a6, a15
        beq               a14, a5, 3f
        mov.n             a6, a13
3:
        bnez              a6, 4f
        and               a5, a14, a11
        bne               a7, a5, 2b
4:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        retw.n
5:
        l32r              a10, fffc0070 <asm_test::compare_exchange::u8::relaxed_relaxed+0xfffc0070>
        l32r              a8, 5b (810000a1 <asm_test::compare_exchange::u8::relaxed_relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::compare_exchange::u8::release_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::u8::release_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u8::release_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::u8::release_acquire+0x8> (ffff8105 <asm_test::compare_exchange::u8::release_acquire+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
2:
        mov.n             a7, a5
        or                a14, a7, a10
        or                a5, a7, a9
        wsr.scompare1     a5
        s32c1i            a14, a12, 0
        mov.n             a6, a15
        beq               a14, a5, 3f
        mov.n             a6, a13
3:
        bnez              a6, 4f
        and               a5, a14, a11
        bne               a7, a5, 2b
4:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::compare_exchange::u8::release_acquire+0xffa1f01d>)
        l32r              a8, 78 <asm_test::compare_exchange::u8::release_acquire+0x78> (ffff81ff <asm_test::compare_exchange::u8::release_acquire+0xffff81ff>)
        callx8            a8

.literal.asm_test::compare_exchange::u8::release_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::u8::release_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u8::release_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::u8::release_relaxed+0x8> (ffff8105 <asm_test::compare_exchange::u8::release_relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
2:
        mov.n             a7, a5
        or                a14, a7, a10
        or                a5, a7, a9
        wsr.scompare1     a5
        s32c1i            a14, a12, 0
        mov.n             a6, a15
        beq               a14, a5, 3f
        mov.n             a6, a13
3:
        bnez              a6, 4f
        and               a5, a14, a11
        bne               a7, a5, 2b
4:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        retw.n
5:
        l32r              a10, 70 <asm_test::compare_exchange::u8::release_relaxed+0x70> (a1f01d91 <asm_test::compare_exchange::u8::release_relaxed+0xa1f01d91>)
        l32r              a8, 74 <asm_test::compare_exchange::u8::release_relaxed+0x74> (ff81ffff <asm_test::compare_exchange::u8::release_relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange::f32::acqrel_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::f32::acqrel_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::f32::acqrel_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::f32::acqrel_seqcst+0x8> (ffff8105 <asm_test::compare_exchange::f32::acqrel_seqcst+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange::f32::acqrel_seqcst+0x28> (a1f01d04 <asm_test::compare_exchange::f32::acqrel_seqcst+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange::f32::acqrel_seqcst+0x2c> (ff81ffff <asm_test::compare_exchange::f32::acqrel_seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange::f32::seqcst_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::f32::seqcst_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::f32::seqcst_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::f32::seqcst_seqcst+0x8> (ffff8105 <asm_test::compare_exchange::f32::seqcst_seqcst+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange::f32::seqcst_seqcst+0x28> (a1f01d04 <asm_test::compare_exchange::f32::seqcst_seqcst+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange::f32::seqcst_seqcst+0x2c> (ff81ffff <asm_test::compare_exchange::f32::seqcst_seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange::f32::acqrel_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::f32::acqrel_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::f32::acqrel_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::f32::acqrel_acquire+0x8> (ffff8105 <asm_test::compare_exchange::f32::acqrel_acquire+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange::f32::acqrel_acquire+0x28> (a1f01d04 <asm_test::compare_exchange::f32::acqrel_acquire+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange::f32::acqrel_acquire+0x2c> (ff81ffff <asm_test::compare_exchange::f32::acqrel_acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange::f32::acqrel_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::f32::acqrel_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::f32::acqrel_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::f32::acqrel_relaxed+0x8> (ffff8105 <asm_test::compare_exchange::f32::acqrel_relaxed+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange::f32::acqrel_relaxed+0x28> (a1f01d04 <asm_test::compare_exchange::f32::acqrel_relaxed+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange::f32::acqrel_relaxed+0x2c> (ff81ffff <asm_test::compare_exchange::f32::acqrel_relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange::f32::acquire_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::f32::acquire_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::f32::acquire_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::f32::acquire_seqcst+0x8> (ffff8105 <asm_test::compare_exchange::f32::acquire_seqcst+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange::f32::acquire_seqcst+0x28> (a1f01d04 <asm_test::compare_exchange::f32::acquire_seqcst+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange::f32::acquire_seqcst+0x2c> (ff81ffff <asm_test::compare_exchange::f32::acquire_seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange::f32::relaxed_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::f32::relaxed_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::f32::relaxed_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::f32::relaxed_seqcst+0x8> (ffff8105 <asm_test::compare_exchange::f32::relaxed_seqcst+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange::f32::relaxed_seqcst+0x28> (a1f01d04 <asm_test::compare_exchange::f32::relaxed_seqcst+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange::f32::relaxed_seqcst+0x2c> (ff81ffff <asm_test::compare_exchange::f32::relaxed_seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange::f32::release_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::f32::release_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::f32::release_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::f32::release_seqcst+0x8> (ffff8105 <asm_test::compare_exchange::f32::release_seqcst+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange::f32::release_seqcst+0x28> (a1f01d04 <asm_test::compare_exchange::f32::release_seqcst+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange::f32::release_seqcst+0x2c> (ff81ffff <asm_test::compare_exchange::f32::release_seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange::f32::seqcst_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::f32::seqcst_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::f32::seqcst_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::f32::seqcst_acquire+0x8> (ffff8105 <asm_test::compare_exchange::f32::seqcst_acquire+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange::f32::seqcst_acquire+0x28> (a1f01d04 <asm_test::compare_exchange::f32::seqcst_acquire+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange::f32::seqcst_acquire+0x2c> (ff81ffff <asm_test::compare_exchange::f32::seqcst_acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange::f32::seqcst_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::f32::seqcst_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::f32::seqcst_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::f32::seqcst_relaxed+0x8> (ffff8105 <asm_test::compare_exchange::f32::seqcst_relaxed+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange::f32::seqcst_relaxed+0x28> (a1f01d04 <asm_test::compare_exchange::f32::seqcst_relaxed+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange::f32::seqcst_relaxed+0x2c> (ff81ffff <asm_test::compare_exchange::f32::seqcst_relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange::f32::acquire_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::f32::acquire_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::f32::acquire_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::f32::acquire_acquire+0x8> (ffff8105 <asm_test::compare_exchange::f32::acquire_acquire+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, fffc0028 <asm_test::compare_exchange::f32::acquire_acquire+0xfffc0028>
        l32r              a8, 3b (810000a1 <asm_test::compare_exchange::f32::acquire_acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::compare_exchange::f32::acquire_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::f32::acquire_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::f32::acquire_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::f32::acquire_relaxed+0x8> (ffff8105 <asm_test::compare_exchange::f32::acquire_relaxed+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, fffc0028 <asm_test::compare_exchange::f32::acquire_relaxed+0xfffc0028>
        l32r              a8, 3b (810000a1 <asm_test::compare_exchange::f32::acquire_relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::compare_exchange::f32::relaxed_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::f32::relaxed_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::f32::relaxed_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::f32::relaxed_acquire+0x8> (ffff8105 <asm_test::compare_exchange::f32::relaxed_acquire+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, fffc0028 <asm_test::compare_exchange::f32::relaxed_acquire+0xfffc0028>
        l32r              a8, 3b (810000a1 <asm_test::compare_exchange::f32::relaxed_acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::compare_exchange::f32::relaxed_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::f32::relaxed_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::f32::relaxed_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::f32::relaxed_relaxed+0x8> (ffff8105 <asm_test::compare_exchange::f32::relaxed_relaxed+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 24 <asm_test::compare_exchange::f32::relaxed_relaxed+0x24> (ffffa1f0 <asm_test::compare_exchange::f32::relaxed_relaxed+0xffffa1f0>)
        l32r              a8, fffc0028 <asm_test::compare_exchange::f32::relaxed_relaxed+0xfffc0028>
        callx8            a8

.literal.asm_test::compare_exchange::f32::release_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::f32::release_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::f32::release_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::f32::release_acquire+0x8> (ffff8105 <asm_test::compare_exchange::f32::release_acquire+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange::f32::release_acquire+0x28> (a1f01d04 <asm_test::compare_exchange::f32::release_acquire+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange::f32::release_acquire+0x2c> (ff81ffff <asm_test::compare_exchange::f32::release_acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange::f32::release_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::f32::release_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::f32::release_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::f32::release_relaxed+0x8> (ffff8105 <asm_test::compare_exchange::f32::release_relaxed+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, fffc0028 <asm_test::compare_exchange::f32::release_relaxed+0xfffc0028>
        l32r              a8, 3b (810000a1 <asm_test::compare_exchange::f32::release_relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::compare_exchange::u16::acqrel_seqcst:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::compare_exchange::u16::acqrel_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::acqrel_seqcst+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::compare_exchange::u16::acqrel_seqcst+0x8> (ffff8105 <asm_test::compare_exchange::u16::acqrel_seqcst+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a10, 1b (a169b827 <asm_test::compare_exchange::u16::acqrel_seqcst+0xa169b827>)
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
3:
        mov.n             a6, a4
        or                a7, a6, a11
        or                a4, a6, a9
        wsr.scompare1     a4
        s32c1i            a7, a13, 0
        mov.n             a5, a15
        beq               a7, a4, 4f
        mov.n             a5, a14
4:
        bnez              a5, 5f
        and               a4, a7, a12
        bne               a6, a4, 3b
5:
        ssr               a8
        srl               a3, a7
        xor               a8, a5, a10
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n
6:
        l32r              a10, 78 <asm_test::compare_exchange::u16::acqrel_seqcst+0x78> (ffffa1f0 <asm_test::compare_exchange::u16::acqrel_seqcst+0xffffa1f0>)
        l32r              a8, fffc007c <asm_test::compare_exchange::u16::acqrel_seqcst+0xfffc007c>
        callx8            a8

.literal.asm_test::compare_exchange::u16::seqcst_seqcst:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::compare_exchange::u16::seqcst_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::seqcst_seqcst+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::compare_exchange::u16::seqcst_seqcst+0x8> (ffff8105 <asm_test::compare_exchange::u16::seqcst_seqcst+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a10, 1b (a169b827 <asm_test::compare_exchange::u16::seqcst_seqcst+0xa169b827>)
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
3:
        mov.n             a6, a4
        or                a7, a6, a11
        or                a4, a6, a9
        wsr.scompare1     a4
        s32c1i            a7, a13, 0
        mov.n             a5, a15
        beq               a7, a4, 4f
        mov.n             a5, a14
4:
        bnez              a5, 5f
        and               a4, a7, a12
        bne               a6, a4, 3b
5:
        ssr               a8
        srl               a3, a7
        xor               a8, a5, a10
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n
6:
        l32r              a10, 78 <asm_test::compare_exchange::u16::seqcst_seqcst+0x78> (ffffa1f0 <asm_test::compare_exchange::u16::seqcst_seqcst+0xffffa1f0>)
        l32r              a8, fffc007c <asm_test::compare_exchange::u16::seqcst_seqcst+0xfffc007c>
        callx8            a8

.literal.asm_test::compare_exchange::u16::acqrel_acquire:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::compare_exchange::u16::acqrel_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::acqrel_acquire+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::compare_exchange::u16::acqrel_acquire+0x8> (ffff8105 <asm_test::compare_exchange::u16::acqrel_acquire+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a10, 1b (a169b827 <asm_test::compare_exchange::u16::acqrel_acquire+0xa169b827>)
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
3:
        mov.n             a6, a4
        or                a7, a6, a11
        or                a4, a6, a9
        wsr.scompare1     a4
        s32c1i            a7, a13, 0
        mov.n             a5, a15
        beq               a7, a4, 4f
        mov.n             a5, a14
4:
        bnez              a5, 5f
        and               a4, a7, a12
        bne               a6, a4, 3b
5:
        ssr               a8
        srl               a3, a7
        xor               a8, a5, a10
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n
6:
        l32r              a10, 78 <asm_test::compare_exchange::u16::acqrel_acquire+0x78> (ffffa1f0 <asm_test::compare_exchange::u16::acqrel_acquire+0xffffa1f0>)
        l32r              a8, fffc007c <asm_test::compare_exchange::u16::acqrel_acquire+0xfffc007c>
        callx8            a8

.literal.asm_test::compare_exchange::u16::acqrel_relaxed:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::compare_exchange::u16::acqrel_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::acqrel_relaxed+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::compare_exchange::u16::acqrel_relaxed+0x8> (ffff8105 <asm_test::compare_exchange::u16::acqrel_relaxed+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a10, 1b (a169b827 <asm_test::compare_exchange::u16::acqrel_relaxed+0xa169b827>)
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
3:
        mov.n             a6, a4
        or                a7, a6, a11
        or                a4, a6, a9
        wsr.scompare1     a4
        s32c1i            a7, a13, 0
        mov.n             a5, a15
        beq               a7, a4, 4f
        mov.n             a5, a14
4:
        bnez              a5, 5f
        and               a4, a7, a12
        bne               a6, a4, 3b
5:
        ssr               a8
        srl               a3, a7
        xor               a8, a5, a10
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n
6:
        l32r              a10, 78 <asm_test::compare_exchange::u16::acqrel_relaxed+0x78> (ffffa1f0 <asm_test::compare_exchange::u16::acqrel_relaxed+0xffffa1f0>)
        l32r              a8, fffc007c <asm_test::compare_exchange::u16::acqrel_relaxed+0xfffc007c>
        callx8            a8

.literal.asm_test::compare_exchange::u16::acquire_seqcst:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::compare_exchange::u16::acquire_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::acquire_seqcst+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::compare_exchange::u16::acquire_seqcst+0x8> (ffff8105 <asm_test::compare_exchange::u16::acquire_seqcst+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a10, 1b (a169b827 <asm_test::compare_exchange::u16::acquire_seqcst+0xa169b827>)
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
3:
        mov.n             a6, a4
        or                a7, a6, a11
        or                a4, a6, a9
        wsr.scompare1     a4
        s32c1i            a7, a13, 0
        mov.n             a5, a15
        beq               a7, a4, 4f
        mov.n             a5, a14
4:
        bnez              a5, 5f
        and               a4, a7, a12
        bne               a6, a4, 3b
5:
        ssr               a8
        srl               a3, a7
        xor               a8, a5, a10
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n
6:
        l32r              a10, 78 <asm_test::compare_exchange::u16::acquire_seqcst+0x78> (ffffa1f0 <asm_test::compare_exchange::u16::acquire_seqcst+0xffffa1f0>)
        l32r              a8, fffc007c <asm_test::compare_exchange::u16::acquire_seqcst+0xfffc007c>
        callx8            a8

.literal.asm_test::compare_exchange::u16::relaxed_seqcst:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::compare_exchange::u16::relaxed_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::relaxed_seqcst+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::compare_exchange::u16::relaxed_seqcst+0x8> (ffff8105 <asm_test::compare_exchange::u16::relaxed_seqcst+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a10, 1b (a169b827 <asm_test::compare_exchange::u16::relaxed_seqcst+0xa169b827>)
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
3:
        mov.n             a6, a4
        or                a7, a6, a11
        or                a4, a6, a9
        wsr.scompare1     a4
        s32c1i            a7, a13, 0
        mov.n             a5, a15
        beq               a7, a4, 4f
        mov.n             a5, a14
4:
        bnez              a5, 5f
        and               a4, a7, a12
        bne               a6, a4, 3b
5:
        ssr               a8
        srl               a3, a7
        xor               a8, a5, a10
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n
6:
        l32r              a10, 78 <asm_test::compare_exchange::u16::relaxed_seqcst+0x78> (ffffa1f0 <asm_test::compare_exchange::u16::relaxed_seqcst+0xffffa1f0>)
        l32r              a8, fffc007c <asm_test::compare_exchange::u16::relaxed_seqcst+0xfffc007c>
        callx8            a8

.literal.asm_test::compare_exchange::u16::release_seqcst:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::compare_exchange::u16::release_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::release_seqcst+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::compare_exchange::u16::release_seqcst+0x8> (ffff8105 <asm_test::compare_exchange::u16::release_seqcst+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a10, 1b (a169b827 <asm_test::compare_exchange::u16::release_seqcst+0xa169b827>)
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
3:
        mov.n             a6, a4
        or                a7, a6, a11
        or                a4, a6, a9
        wsr.scompare1     a4
        s32c1i            a7, a13, 0
        mov.n             a5, a15
        beq               a7, a4, 4f
        mov.n             a5, a14
4:
        bnez              a5, 5f
        and               a4, a7, a12
        bne               a6, a4, 3b
5:
        ssr               a8
        srl               a3, a7
        xor               a8, a5, a10
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n
6:
        l32r              a10, 78 <asm_test::compare_exchange::u16::release_seqcst+0x78> (ffffa1f0 <asm_test::compare_exchange::u16::release_seqcst+0xffffa1f0>)
        l32r              a8, fffc007c <asm_test::compare_exchange::u16::release_seqcst+0xfffc007c>
        callx8            a8

.literal.asm_test::compare_exchange::u16::seqcst_acquire:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::compare_exchange::u16::seqcst_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::seqcst_acquire+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::compare_exchange::u16::seqcst_acquire+0x8> (ffff8105 <asm_test::compare_exchange::u16::seqcst_acquire+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a10, 1b (a169b827 <asm_test::compare_exchange::u16::seqcst_acquire+0xa169b827>)
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
3:
        mov.n             a6, a4
        or                a7, a6, a11
        or                a4, a6, a9
        wsr.scompare1     a4
        s32c1i            a7, a13, 0
        mov.n             a5, a15
        beq               a7, a4, 4f
        mov.n             a5, a14
4:
        bnez              a5, 5f
        and               a4, a7, a12
        bne               a6, a4, 3b
5:
        ssr               a8
        srl               a3, a7
        xor               a8, a5, a10
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n
6:
        l32r              a10, 78 <asm_test::compare_exchange::u16::seqcst_acquire+0x78> (ffffa1f0 <asm_test::compare_exchange::u16::seqcst_acquire+0xffffa1f0>)
        l32r              a8, fffc007c <asm_test::compare_exchange::u16::seqcst_acquire+0xfffc007c>
        callx8            a8

.literal.asm_test::compare_exchange::u16::seqcst_relaxed:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::compare_exchange::u16::seqcst_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::seqcst_relaxed+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::compare_exchange::u16::seqcst_relaxed+0x8> (ffff8105 <asm_test::compare_exchange::u16::seqcst_relaxed+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a10, 1b (a169b827 <asm_test::compare_exchange::u16::seqcst_relaxed+0xa169b827>)
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
3:
        mov.n             a6, a4
        or                a7, a6, a11
        or                a4, a6, a9
        wsr.scompare1     a4
        s32c1i            a7, a13, 0
        mov.n             a5, a15
        beq               a7, a4, 4f
        mov.n             a5, a14
4:
        bnez              a5, 5f
        and               a4, a7, a12
        bne               a6, a4, 3b
5:
        ssr               a8
        srl               a3, a7
        xor               a8, a5, a10
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n
6:
        l32r              a10, 78 <asm_test::compare_exchange::u16::seqcst_relaxed+0x78> (ffffa1f0 <asm_test::compare_exchange::u16::seqcst_relaxed+0xffffa1f0>)
        l32r              a8, fffc007c <asm_test::compare_exchange::u16::seqcst_relaxed+0xfffc007c>
        callx8            a8

.literal.asm_test::compare_exchange::u16::acquire_acquire:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::compare_exchange::u16::acquire_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::acquire_acquire+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::compare_exchange::u16::acquire_acquire+0x8> (ffff8105 <asm_test::compare_exchange::u16::acquire_acquire+0xffff8105>)
1:
        bgeu              a8, a2, 7f
2:
        l32r              a10, 1b (a166b827 <asm_test::compare_exchange::u16::acquire_acquire+0xa166b827>)
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
3:
        mov.n             a6, a4
        or                a7, a6, a11
        or                a4, a6, a9
        wsr.scompare1     a4
        s32c1i            a7, a13, 0
        mov.n             a5, a15
        beq               a7, a4, 4f
        mov.n             a5, a14
4:
        bnez              a5, 5f
        and               a4, a7, a12
        bne               a6, a4, 3b
5:
        ssr               a8
        srl               a3, a7
        xor               a8, a5, a10
        movi.n            a9, 1
        and               a2, a8, a9
        memw
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::compare_exchange::u16::acquire_acquire+0xffa1f01d>)
        l32r              a8, 78 <asm_test::compare_exchange::u16::acquire_acquire+0x78> (ffff81ff <asm_test::compare_exchange::u16::acquire_acquire+0xffff81ff>)
        callx8            a8

.literal.asm_test::compare_exchange::u16::acquire_relaxed:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::compare_exchange::u16::acquire_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::acquire_relaxed+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::compare_exchange::u16::acquire_relaxed+0x8> (ffff8105 <asm_test::compare_exchange::u16::acquire_relaxed+0xffff8105>)
1:
        bgeu              a8, a2, 7f
2:
        l32r              a10, 1b (a166b827 <asm_test::compare_exchange::u16::acquire_relaxed+0xa166b827>)
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
3:
        mov.n             a6, a4
        or                a7, a6, a11
        or                a4, a6, a9
        wsr.scompare1     a4
        s32c1i            a7, a13, 0
        mov.n             a5, a15
        beq               a7, a4, 4f
        mov.n             a5, a14
4:
        bnez              a5, 5f
        and               a4, a7, a12
        bne               a6, a4, 3b
5:
        ssr               a8
        srl               a3, a7
        xor               a8, a5, a10
        movi.n            a9, 1
        and               a2, a8, a9
        memw
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::compare_exchange::u16::acquire_relaxed+0xffa1f01d>)
        l32r              a8, 78 <asm_test::compare_exchange::u16::acquire_relaxed+0x78> (ffff81ff <asm_test::compare_exchange::u16::acquire_relaxed+0xffff81ff>)
        callx8            a8

.literal.asm_test::compare_exchange::u16::relaxed_acquire:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::compare_exchange::u16::relaxed_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::relaxed_acquire+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::compare_exchange::u16::relaxed_acquire+0x8> (ffff8105 <asm_test::compare_exchange::u16::relaxed_acquire+0xffff8105>)
1:
        bgeu              a8, a2, 7f
2:
        l32r              a10, 1b (a166b827 <asm_test::compare_exchange::u16::relaxed_acquire+0xa166b827>)
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
3:
        mov.n             a6, a4
        or                a7, a6, a11
        or                a4, a6, a9
        wsr.scompare1     a4
        s32c1i            a7, a13, 0
        mov.n             a5, a15
        beq               a7, a4, 4f
        mov.n             a5, a14
4:
        bnez              a5, 5f
        and               a4, a7, a12
        bne               a6, a4, 3b
5:
        ssr               a8
        srl               a3, a7
        xor               a8, a5, a10
        movi.n            a9, 1
        and               a2, a8, a9
        memw
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::compare_exchange::u16::relaxed_acquire+0xffa1f01d>)
        l32r              a8, 78 <asm_test::compare_exchange::u16::relaxed_acquire+0x78> (ffff81ff <asm_test::compare_exchange::u16::relaxed_acquire+0xffff81ff>)
        callx8            a8

.literal.asm_test::compare_exchange::u16::relaxed_relaxed:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::compare_exchange::u16::relaxed_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::relaxed_relaxed+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::compare_exchange::u16::relaxed_relaxed+0x8> (ffff8105 <asm_test::compare_exchange::u16::relaxed_relaxed+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a10, 1b (a163b827 <asm_test::compare_exchange::u16::relaxed_relaxed+0xa163b827>)
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
3:
        mov.n             a6, a4
        or                a7, a6, a11
        or                a4, a6, a9
        wsr.scompare1     a4
        s32c1i            a7, a13, 0
        mov.n             a5, a15
        beq               a7, a4, 4f
        mov.n             a5, a14
4:
        bnez              a5, 5f
        and               a4, a7, a12
        bne               a6, a4, 3b
5:
        ssr               a8
        srl               a3, a7
        xor               a8, a5, a10
        movi.n            a9, 1
        and               a2, a8, a9
        retw.n
6:
        l32r              a10, 70 <asm_test::compare_exchange::u16::relaxed_relaxed+0x70> (a1f01d10 <asm_test::compare_exchange::u16::relaxed_relaxed+0xa1f01d10>)
        l32r              a8, 74 <asm_test::compare_exchange::u16::relaxed_relaxed+0x74> (ff81ffff <asm_test::compare_exchange::u16::relaxed_relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange::u16::release_acquire:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::compare_exchange::u16::release_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::release_acquire+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::compare_exchange::u16::release_acquire+0x8> (ffff8105 <asm_test::compare_exchange::u16::release_acquire+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a10, 1b (a169b827 <asm_test::compare_exchange::u16::release_acquire+0xa169b827>)
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
3:
        mov.n             a6, a4
        or                a7, a6, a11
        or                a4, a6, a9
        wsr.scompare1     a4
        s32c1i            a7, a13, 0
        mov.n             a5, a15
        beq               a7, a4, 4f
        mov.n             a5, a14
4:
        bnez              a5, 5f
        and               a4, a7, a12
        bne               a6, a4, 3b
5:
        ssr               a8
        srl               a3, a7
        xor               a8, a5, a10
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n
6:
        l32r              a10, 78 <asm_test::compare_exchange::u16::release_acquire+0x78> (ffffa1f0 <asm_test::compare_exchange::u16::release_acquire+0xffffa1f0>)
        l32r              a8, fffc007c <asm_test::compare_exchange::u16::release_acquire+0xfffc007c>
        callx8            a8

.literal.asm_test::compare_exchange::u16::release_relaxed:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::compare_exchange::u16::release_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::release_relaxed+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::compare_exchange::u16::release_relaxed+0x8> (ffff8105 <asm_test::compare_exchange::u16::release_relaxed+0xffff8105>)
1:
        bgeu              a8, a2, 7f
2:
        l32r              a10, 1b (a166b827 <asm_test::compare_exchange::u16::release_relaxed+0xa166b827>)
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
3:
        mov.n             a6, a4
        or                a7, a6, a11
        or                a4, a6, a9
        wsr.scompare1     a4
        s32c1i            a7, a13, 0
        mov.n             a5, a15
        beq               a7, a4, 4f
        mov.n             a5, a14
4:
        bnez              a5, 5f
        and               a4, a7, a12
        bne               a6, a4, 3b
5:
        ssr               a8
        srl               a3, a7
        xor               a8, a5, a10
        movi.n            a9, 1
        and               a2, a8, a9
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::compare_exchange::u16::release_relaxed+0xffa1f01d>)
        l32r              a8, 78 <asm_test::compare_exchange::u16::release_relaxed+0x78> (ffff81ff <asm_test::compare_exchange::u16::release_relaxed+0xffff81ff>)
        callx8            a8

.literal.asm_test::compare_exchange::u32::acqrel_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::u32::acqrel_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u32::acqrel_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::u32::acqrel_seqcst+0x8> (ffff8105 <asm_test::compare_exchange::u32::acqrel_seqcst+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange::u32::acqrel_seqcst+0x28> (a1f01d04 <asm_test::compare_exchange::u32::acqrel_seqcst+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange::u32::acqrel_seqcst+0x2c> (ff81ffff <asm_test::compare_exchange::u32::acqrel_seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange::u32::seqcst_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::u32::seqcst_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u32::seqcst_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::u32::seqcst_seqcst+0x8> (ffff8105 <asm_test::compare_exchange::u32::seqcst_seqcst+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange::u32::seqcst_seqcst+0x28> (a1f01d04 <asm_test::compare_exchange::u32::seqcst_seqcst+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange::u32::seqcst_seqcst+0x2c> (ff81ffff <asm_test::compare_exchange::u32::seqcst_seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange::u32::acqrel_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::u32::acqrel_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u32::acqrel_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::u32::acqrel_acquire+0x8> (ffff8105 <asm_test::compare_exchange::u32::acqrel_acquire+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange::u32::acqrel_acquire+0x28> (a1f01d04 <asm_test::compare_exchange::u32::acqrel_acquire+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange::u32::acqrel_acquire+0x2c> (ff81ffff <asm_test::compare_exchange::u32::acqrel_acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange::u32::acqrel_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::u32::acqrel_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u32::acqrel_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::u32::acqrel_relaxed+0x8> (ffff8105 <asm_test::compare_exchange::u32::acqrel_relaxed+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange::u32::acqrel_relaxed+0x28> (a1f01d04 <asm_test::compare_exchange::u32::acqrel_relaxed+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange::u32::acqrel_relaxed+0x2c> (ff81ffff <asm_test::compare_exchange::u32::acqrel_relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange::u32::acquire_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::u32::acquire_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u32::acquire_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::u32::acquire_seqcst+0x8> (ffff8105 <asm_test::compare_exchange::u32::acquire_seqcst+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange::u32::acquire_seqcst+0x28> (a1f01d04 <asm_test::compare_exchange::u32::acquire_seqcst+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange::u32::acquire_seqcst+0x2c> (ff81ffff <asm_test::compare_exchange::u32::acquire_seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange::u32::relaxed_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::u32::relaxed_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u32::relaxed_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::u32::relaxed_seqcst+0x8> (ffff8105 <asm_test::compare_exchange::u32::relaxed_seqcst+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange::u32::relaxed_seqcst+0x28> (a1f01d04 <asm_test::compare_exchange::u32::relaxed_seqcst+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange::u32::relaxed_seqcst+0x2c> (ff81ffff <asm_test::compare_exchange::u32::relaxed_seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange::u32::release_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::u32::release_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u32::release_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::u32::release_seqcst+0x8> (ffff8105 <asm_test::compare_exchange::u32::release_seqcst+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange::u32::release_seqcst+0x28> (a1f01d04 <asm_test::compare_exchange::u32::release_seqcst+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange::u32::release_seqcst+0x2c> (ff81ffff <asm_test::compare_exchange::u32::release_seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange::u32::seqcst_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::u32::seqcst_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u32::seqcst_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::u32::seqcst_acquire+0x8> (ffff8105 <asm_test::compare_exchange::u32::seqcst_acquire+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange::u32::seqcst_acquire+0x28> (a1f01d04 <asm_test::compare_exchange::u32::seqcst_acquire+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange::u32::seqcst_acquire+0x2c> (ff81ffff <asm_test::compare_exchange::u32::seqcst_acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange::u32::seqcst_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::u32::seqcst_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u32::seqcst_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::u32::seqcst_relaxed+0x8> (ffff8105 <asm_test::compare_exchange::u32::seqcst_relaxed+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange::u32::seqcst_relaxed+0x28> (a1f01d04 <asm_test::compare_exchange::u32::seqcst_relaxed+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange::u32::seqcst_relaxed+0x2c> (ff81ffff <asm_test::compare_exchange::u32::seqcst_relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange::u32::acquire_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::u32::acquire_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u32::acquire_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::u32::acquire_acquire+0x8> (ffff8105 <asm_test::compare_exchange::u32::acquire_acquire+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, fffc0028 <asm_test::compare_exchange::u32::acquire_acquire+0xfffc0028>
        l32r              a8, 3b (810000a1 <asm_test::compare_exchange::u32::acquire_acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::compare_exchange::u32::acquire_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::u32::acquire_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u32::acquire_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::u32::acquire_relaxed+0x8> (ffff8105 <asm_test::compare_exchange::u32::acquire_relaxed+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, fffc0028 <asm_test::compare_exchange::u32::acquire_relaxed+0xfffc0028>
        l32r              a8, 3b (810000a1 <asm_test::compare_exchange::u32::acquire_relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::compare_exchange::u32::relaxed_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::u32::relaxed_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u32::relaxed_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::u32::relaxed_acquire+0x8> (ffff8105 <asm_test::compare_exchange::u32::relaxed_acquire+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, fffc0028 <asm_test::compare_exchange::u32::relaxed_acquire+0xfffc0028>
        l32r              a8, 3b (810000a1 <asm_test::compare_exchange::u32::relaxed_acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::compare_exchange::u32::relaxed_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::u32::relaxed_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u32::relaxed_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::u32::relaxed_relaxed+0x8> (ffff8105 <asm_test::compare_exchange::u32::relaxed_relaxed+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 24 <asm_test::compare_exchange::u32::relaxed_relaxed+0x24> (ffffa1f0 <asm_test::compare_exchange::u32::relaxed_relaxed+0xffffa1f0>)
        l32r              a8, fffc0028 <asm_test::compare_exchange::u32::relaxed_relaxed+0xfffc0028>
        callx8            a8

.literal.asm_test::compare_exchange::u32::release_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::u32::release_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u32::release_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::u32::release_acquire+0x8> (ffff8105 <asm_test::compare_exchange::u32::release_acquire+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange::u32::release_acquire+0x28> (a1f01d04 <asm_test::compare_exchange::u32::release_acquire+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange::u32::release_acquire+0x2c> (ff81ffff <asm_test::compare_exchange::u32::release_acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange::u32::release_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::u32::release_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u32::release_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::u32::release_relaxed+0x8> (ffff8105 <asm_test::compare_exchange::u32::release_relaxed+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, fffc0028 <asm_test::compare_exchange::u32::release_relaxed+0xfffc0028>
        l32r              a8, 3b (810000a1 <asm_test::compare_exchange::u32::release_relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::compare_exchange::bool::acqrel_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::bool::acqrel_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::bool::acqrel_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::bool::acqrel_seqcst+0x8> (ffff8105 <asm_test::compare_exchange::bool::acqrel_seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a11, a10, 0
        and               a5, a11, a9
        ssl               a8
        sll               a11, a3
        ssl               a8
        sll               a12, a4
        movi.n            a13, 0
        movi.n            a15, 1
2:
        mov.n             a7, a5
        or                a14, a7, a12
        or                a5, a7, a11
        wsr.scompare1     a5
        s32c1i            a14, a10, 0
        mov.n             a6, a15
        beq               a14, a5, 3f
        mov.n             a6, a13
3:
        bnez              a6, 4f
        and               a5, a14, a9
        bne               a7, a5, 2b
4:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
        retw.n
5:
        l32r              a10, fffc0070 <asm_test::compare_exchange::bool::acqrel_seqcst+0xfffc0070>
        l32r              a8, 5b (810000a1 <asm_test::compare_exchange::bool::acqrel_seqcst+0x810000a1>)
        callx8            a8

.literal.asm_test::compare_exchange::bool::seqcst_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::bool::seqcst_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::bool::seqcst_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::bool::seqcst_seqcst+0x8> (ffff8105 <asm_test::compare_exchange::bool::seqcst_seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a11, a10, 0
        and               a5, a11, a9
        ssl               a8
        sll               a11, a3
        ssl               a8
        sll               a12, a4
        movi.n            a13, 0
        movi.n            a15, 1
2:
        mov.n             a7, a5
        or                a14, a7, a12
        or                a5, a7, a11
        wsr.scompare1     a5
        s32c1i            a14, a10, 0
        mov.n             a6, a15
        beq               a14, a5, 3f
        mov.n             a6, a13
3:
        bnez              a6, 4f
        and               a5, a14, a9
        bne               a7, a5, 2b
4:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
        retw.n
5:
        l32r              a10, fffc0070 <asm_test::compare_exchange::bool::seqcst_seqcst+0xfffc0070>
        l32r              a8, 5b (810000a1 <asm_test::compare_exchange::bool::seqcst_seqcst+0x810000a1>)
        callx8            a8

.literal.asm_test::compare_exchange::bool::acqrel_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::bool::acqrel_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::bool::acqrel_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::bool::acqrel_acquire+0x8> (ffff8105 <asm_test::compare_exchange::bool::acqrel_acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a11, a10, 0
        and               a5, a11, a9
        ssl               a8
        sll               a11, a3
        ssl               a8
        sll               a12, a4
        movi.n            a13, 0
        movi.n            a15, 1
2:
        mov.n             a7, a5
        or                a14, a7, a12
        or                a5, a7, a11
        wsr.scompare1     a5
        s32c1i            a14, a10, 0
        mov.n             a6, a15
        beq               a14, a5, 3f
        mov.n             a6, a13
3:
        bnez              a6, 4f
        and               a5, a14, a9
        bne               a7, a5, 2b
4:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
        retw.n
5:
        l32r              a10, fffc0070 <asm_test::compare_exchange::bool::acqrel_acquire+0xfffc0070>
        l32r              a8, 5b (810000a1 <asm_test::compare_exchange::bool::acqrel_acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::compare_exchange::bool::acqrel_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::bool::acqrel_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::bool::acqrel_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::bool::acqrel_relaxed+0x8> (ffff8105 <asm_test::compare_exchange::bool::acqrel_relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a11, a10, 0
        and               a5, a11, a9
        ssl               a8
        sll               a11, a3
        ssl               a8
        sll               a12, a4
        movi.n            a13, 0
        movi.n            a15, 1
2:
        mov.n             a7, a5
        or                a14, a7, a12
        or                a5, a7, a11
        wsr.scompare1     a5
        s32c1i            a14, a10, 0
        mov.n             a6, a15
        beq               a14, a5, 3f
        mov.n             a6, a13
3:
        bnez              a6, 4f
        and               a5, a14, a9
        bne               a7, a5, 2b
4:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
        retw.n
5:
        l32r              a10, fffc0070 <asm_test::compare_exchange::bool::acqrel_relaxed+0xfffc0070>
        l32r              a8, 5b (810000a1 <asm_test::compare_exchange::bool::acqrel_relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::compare_exchange::bool::acquire_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::bool::acquire_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::bool::acquire_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::bool::acquire_seqcst+0x8> (ffff8105 <asm_test::compare_exchange::bool::acquire_seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a11, a10, 0
        and               a5, a11, a9
        ssl               a8
        sll               a11, a3
        ssl               a8
        sll               a12, a4
        movi.n            a13, 0
        movi.n            a15, 1
2:
        mov.n             a7, a5
        or                a14, a7, a12
        or                a5, a7, a11
        wsr.scompare1     a5
        s32c1i            a14, a10, 0
        mov.n             a6, a15
        beq               a14, a5, 3f
        mov.n             a6, a13
3:
        bnez              a6, 4f
        and               a5, a14, a9
        bne               a7, a5, 2b
4:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
        retw.n
5:
        l32r              a10, fffc0070 <asm_test::compare_exchange::bool::acquire_seqcst+0xfffc0070>
        l32r              a8, 5b (810000a1 <asm_test::compare_exchange::bool::acquire_seqcst+0x810000a1>)
        callx8            a8

.literal.asm_test::compare_exchange::bool::relaxed_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::bool::relaxed_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::bool::relaxed_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::bool::relaxed_seqcst+0x8> (ffff8105 <asm_test::compare_exchange::bool::relaxed_seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a11, a10, 0
        and               a5, a11, a9
        ssl               a8
        sll               a11, a3
        ssl               a8
        sll               a12, a4
        movi.n            a13, 0
        movi.n            a15, 1
2:
        mov.n             a7, a5
        or                a14, a7, a12
        or                a5, a7, a11
        wsr.scompare1     a5
        s32c1i            a14, a10, 0
        mov.n             a6, a15
        beq               a14, a5, 3f
        mov.n             a6, a13
3:
        bnez              a6, 4f
        and               a5, a14, a9
        bne               a7, a5, 2b
4:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
        retw.n
5:
        l32r              a10, fffc0070 <asm_test::compare_exchange::bool::relaxed_seqcst+0xfffc0070>
        l32r              a8, 5b (810000a1 <asm_test::compare_exchange::bool::relaxed_seqcst+0x810000a1>)
        callx8            a8

.literal.asm_test::compare_exchange::bool::release_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::bool::release_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::bool::release_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::bool::release_seqcst+0x8> (ffff8105 <asm_test::compare_exchange::bool::release_seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a11, a10, 0
        and               a5, a11, a9
        ssl               a8
        sll               a11, a3
        ssl               a8
        sll               a12, a4
        movi.n            a13, 0
        movi.n            a15, 1
2:
        mov.n             a7, a5
        or                a14, a7, a12
        or                a5, a7, a11
        wsr.scompare1     a5
        s32c1i            a14, a10, 0
        mov.n             a6, a15
        beq               a14, a5, 3f
        mov.n             a6, a13
3:
        bnez              a6, 4f
        and               a5, a14, a9
        bne               a7, a5, 2b
4:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
        retw.n
5:
        l32r              a10, fffc0070 <asm_test::compare_exchange::bool::release_seqcst+0xfffc0070>
        l32r              a8, 5b (810000a1 <asm_test::compare_exchange::bool::release_seqcst+0x810000a1>)
        callx8            a8

.literal.asm_test::compare_exchange::bool::seqcst_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::bool::seqcst_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::bool::seqcst_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::bool::seqcst_acquire+0x8> (ffff8105 <asm_test::compare_exchange::bool::seqcst_acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a11, a10, 0
        and               a5, a11, a9
        ssl               a8
        sll               a11, a3
        ssl               a8
        sll               a12, a4
        movi.n            a13, 0
        movi.n            a15, 1
2:
        mov.n             a7, a5
        or                a14, a7, a12
        or                a5, a7, a11
        wsr.scompare1     a5
        s32c1i            a14, a10, 0
        mov.n             a6, a15
        beq               a14, a5, 3f
        mov.n             a6, a13
3:
        bnez              a6, 4f
        and               a5, a14, a9
        bne               a7, a5, 2b
4:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
        retw.n
5:
        l32r              a10, fffc0070 <asm_test::compare_exchange::bool::seqcst_acquire+0xfffc0070>
        l32r              a8, 5b (810000a1 <asm_test::compare_exchange::bool::seqcst_acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::compare_exchange::bool::seqcst_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::bool::seqcst_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::bool::seqcst_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::bool::seqcst_relaxed+0x8> (ffff8105 <asm_test::compare_exchange::bool::seqcst_relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a11, a10, 0
        and               a5, a11, a9
        ssl               a8
        sll               a11, a3
        ssl               a8
        sll               a12, a4
        movi.n            a13, 0
        movi.n            a15, 1
2:
        mov.n             a7, a5
        or                a14, a7, a12
        or                a5, a7, a11
        wsr.scompare1     a5
        s32c1i            a14, a10, 0
        mov.n             a6, a15
        beq               a14, a5, 3f
        mov.n             a6, a13
3:
        bnez              a6, 4f
        and               a5, a14, a9
        bne               a7, a5, 2b
4:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
        retw.n
5:
        l32r              a10, fffc0070 <asm_test::compare_exchange::bool::seqcst_relaxed+0xfffc0070>
        l32r              a8, 5b (810000a1 <asm_test::compare_exchange::bool::seqcst_relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::compare_exchange::bool::acquire_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::bool::acquire_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::bool::acquire_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::bool::acquire_acquire+0x8> (ffff8105 <asm_test::compare_exchange::bool::acquire_acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a11, a10, 0
        and               a5, a11, a9
        ssl               a8
        sll               a11, a3
        ssl               a8
        sll               a12, a4
        movi.n            a13, 0
        movi.n            a15, 1
2:
        mov.n             a7, a5
        or                a14, a7, a12
        or                a5, a7, a11
        wsr.scompare1     a5
        s32c1i            a14, a10, 0
        mov.n             a6, a15
        beq               a14, a5, 3f
        mov.n             a6, a13
3:
        bnez              a6, 4f
        and               a5, a14, a9
        bne               a7, a5, 2b
4:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
        retw.n
5:
        l32r              a10, 6c <asm_test::compare_exchange::bool::acquire_acquire+0x6c> (ffffa1f0 <asm_test::compare_exchange::bool::acquire_acquire+0xffffa1f0>)
        l32r              a8, fffc0070 <asm_test::compare_exchange::bool::acquire_acquire+0xfffc0070>
        callx8            a8

.literal.asm_test::compare_exchange::bool::acquire_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::bool::acquire_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::bool::acquire_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::bool::acquire_relaxed+0x8> (ffff8105 <asm_test::compare_exchange::bool::acquire_relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a11, a10, 0
        and               a5, a11, a9
        ssl               a8
        sll               a11, a3
        ssl               a8
        sll               a12, a4
        movi.n            a13, 0
        movi.n            a15, 1
2:
        mov.n             a7, a5
        or                a14, a7, a12
        or                a5, a7, a11
        wsr.scompare1     a5
        s32c1i            a14, a10, 0
        mov.n             a6, a15
        beq               a14, a5, 3f
        mov.n             a6, a13
3:
        bnez              a6, 4f
        and               a5, a14, a9
        bne               a7, a5, 2b
4:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
        retw.n
5:
        l32r              a10, 6c <asm_test::compare_exchange::bool::acquire_relaxed+0x6c> (ffffa1f0 <asm_test::compare_exchange::bool::acquire_relaxed+0xffffa1f0>)
        l32r              a8, fffc0070 <asm_test::compare_exchange::bool::acquire_relaxed+0xfffc0070>
        callx8            a8

.literal.asm_test::compare_exchange::bool::relaxed_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::bool::relaxed_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::bool::relaxed_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::bool::relaxed_acquire+0x8> (ffff8105 <asm_test::compare_exchange::bool::relaxed_acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a11, a10, 0
        and               a5, a11, a9
        ssl               a8
        sll               a11, a3
        ssl               a8
        sll               a12, a4
        movi.n            a13, 0
        movi.n            a15, 1
2:
        mov.n             a7, a5
        or                a14, a7, a12
        or                a5, a7, a11
        wsr.scompare1     a5
        s32c1i            a14, a10, 0
        mov.n             a6, a15
        beq               a14, a5, 3f
        mov.n             a6, a13
3:
        bnez              a6, 4f
        and               a5, a14, a9
        bne               a7, a5, 2b
4:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
        retw.n
5:
        l32r              a10, 6c <asm_test::compare_exchange::bool::relaxed_acquire+0x6c> (ffffa1f0 <asm_test::compare_exchange::bool::relaxed_acquire+0xffffa1f0>)
        l32r              a8, fffc0070 <asm_test::compare_exchange::bool::relaxed_acquire+0xfffc0070>
        callx8            a8

.literal.asm_test::compare_exchange::bool::relaxed_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::bool::relaxed_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::bool::relaxed_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::bool::relaxed_relaxed+0x8> (ffff8105 <asm_test::compare_exchange::bool::relaxed_relaxed+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a11, a10, 0
        and               a5, a11, a9
        ssl               a8
        sll               a11, a3
        ssl               a8
        sll               a12, a4
        movi.n            a13, 0
        movi.n            a15, 1
2:
        mov.n             a7, a5
        or                a14, a7, a12
        or                a5, a7, a11
        wsr.scompare1     a5
        s32c1i            a14, a10, 0
        mov.n             a6, a15
        beq               a14, a5, 3f
        mov.n             a6, a13
3:
        bnez              a6, 4f
        and               a5, a14, a9
        bne               a7, a5, 2b
4:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::compare_exchange::bool::relaxed_relaxed+0xffa1f01d>)
        l32r              a8, 6c <asm_test::compare_exchange::bool::relaxed_relaxed+0x6c> (ffff81ff <asm_test::compare_exchange::bool::relaxed_relaxed+0xffff81ff>)
        callx8            a8

.literal.asm_test::compare_exchange::bool::release_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::bool::release_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::bool::release_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::bool::release_acquire+0x8> (ffff8105 <asm_test::compare_exchange::bool::release_acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a11, a10, 0
        and               a5, a11, a9
        ssl               a8
        sll               a11, a3
        ssl               a8
        sll               a12, a4
        movi.n            a13, 0
        movi.n            a15, 1
2:
        mov.n             a7, a5
        or                a14, a7, a12
        or                a5, a7, a11
        wsr.scompare1     a5
        s32c1i            a14, a10, 0
        mov.n             a6, a15
        beq               a14, a5, 3f
        mov.n             a6, a13
3:
        bnez              a6, 4f
        and               a5, a14, a9
        bne               a7, a5, 2b
4:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        memw
        retw.n
5:
        l32r              a10, fffc0070 <asm_test::compare_exchange::bool::release_acquire+0xfffc0070>
        l32r              a8, 5b (810000a1 <asm_test::compare_exchange::bool::release_acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::compare_exchange::bool::release_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange::bool::release_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::bool::release_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange::bool::release_relaxed+0x8> (ffff8105 <asm_test::compare_exchange::bool::release_relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a11, a10, 0
        and               a5, a11, a9
        ssl               a8
        sll               a11, a3
        ssl               a8
        sll               a12, a4
        movi.n            a13, 0
        movi.n            a15, 1
2:
        mov.n             a7, a5
        or                a14, a7, a12
        or                a5, a7, a11
        wsr.scompare1     a5
        s32c1i            a14, a10, 0
        mov.n             a6, a15
        beq               a14, a5, 3f
        mov.n             a6, a13
3:
        bnez              a6, 4f
        and               a5, a14, a9
        bne               a7, a5, 2b
4:
        movi.n            a9, 1
        xor               a2, a6, a9
        ssr               a8
        srl               a3, a14
        retw.n
5:
        l32r              a10, 6c <asm_test::compare_exchange::bool::release_relaxed+0x6c> (ffffa1f0 <asm_test::compare_exchange::bool::release_relaxed+0xffffa1f0>)
        l32r              a8, fffc0070 <asm_test::compare_exchange::bool::release_relaxed+0xfffc0070>
        callx8            a8

.literal.asm_test::compare_exchange_weak::u8::acqrel_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::u8::acqrel_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u8::acqrel_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u8::acqrel_seqcst+0x8> (ffff8105 <asm_test::compare_exchange_weak::u8::acqrel_seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        beq               a9, a10, 2f
        movi.n            a10, 0
        j                 3f
2:
        movi.n            a10, 1
3:
        movi.n            a11, 1
        xor               a2, a10, a11
        ssr               a8
        srl               a3, a9
        memw
4:
        retw.n
5:
        l32r              a10, 4b (ffa1f01d <asm_test::compare_exchange_weak::u8::acqrel_seqcst+0xffa1f01d>)
        l32r              a8, 6c <asm_test::compare_exchange_weak::u8::acqrel_seqcst+0x6c> (ffff81ff <asm_test::compare_exchange_weak::u8::acqrel_seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u8::seqcst_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::u8::seqcst_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u8::seqcst_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u8::seqcst_seqcst+0x8> (ffff8105 <asm_test::compare_exchange_weak::u8::seqcst_seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        beq               a9, a10, 2f
        movi.n            a10, 0
        j                 3f
2:
        movi.n            a10, 1
3:
        movi.n            a11, 1
        xor               a2, a10, a11
        ssr               a8
        srl               a3, a9
        memw
4:
        retw.n
5:
        l32r              a10, 4b (ffa1f01d <asm_test::compare_exchange_weak::u8::seqcst_seqcst+0xffa1f01d>)
        l32r              a8, 6c <asm_test::compare_exchange_weak::u8::seqcst_seqcst+0x6c> (ffff81ff <asm_test::compare_exchange_weak::u8::seqcst_seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u8::acqrel_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::u8::acqrel_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u8::acqrel_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u8::acqrel_acquire+0x8> (ffff8105 <asm_test::compare_exchange_weak::u8::acqrel_acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        beq               a9, a10, 2f
        movi.n            a10, 0
        j                 3f
2:
        movi.n            a10, 1
3:
        movi.n            a11, 1
        xor               a2, a10, a11
        ssr               a8
        srl               a3, a9
        memw
4:
        retw.n
5:
        l32r              a10, 4b (ffa1f01d <asm_test::compare_exchange_weak::u8::acqrel_acquire+0xffa1f01d>)
        l32r              a8, 6c <asm_test::compare_exchange_weak::u8::acqrel_acquire+0x6c> (ffff81ff <asm_test::compare_exchange_weak::u8::acqrel_acquire+0xffff81ff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u8::acqrel_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::u8::acqrel_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u8::acqrel_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u8::acqrel_relaxed+0x8> (ffff8105 <asm_test::compare_exchange_weak::u8::acqrel_relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        beq               a9, a10, 2f
        movi.n            a10, 0
        j                 3f
2:
        movi.n            a10, 1
3:
        movi.n            a11, 1
        xor               a2, a10, a11
        ssr               a8
        srl               a3, a9
        memw
4:
        retw.n
5:
        l32r              a10, 4b (ffa1f01d <asm_test::compare_exchange_weak::u8::acqrel_relaxed+0xffa1f01d>)
        l32r              a8, 6c <asm_test::compare_exchange_weak::u8::acqrel_relaxed+0x6c> (ffff81ff <asm_test::compare_exchange_weak::u8::acqrel_relaxed+0xffff81ff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u8::acquire_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::u8::acquire_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u8::acquire_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u8::acquire_seqcst+0x8> (ffff8105 <asm_test::compare_exchange_weak::u8::acquire_seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        beq               a9, a10, 2f
        movi.n            a10, 0
        j                 3f
2:
        movi.n            a10, 1
3:
        movi.n            a11, 1
        xor               a2, a10, a11
        ssr               a8
        srl               a3, a9
        memw
4:
        retw.n
5:
        l32r              a10, 4b (ffa1f01d <asm_test::compare_exchange_weak::u8::acquire_seqcst+0xffa1f01d>)
        l32r              a8, 6c <asm_test::compare_exchange_weak::u8::acquire_seqcst+0x6c> (ffff81ff <asm_test::compare_exchange_weak::u8::acquire_seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u8::relaxed_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::u8::relaxed_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u8::relaxed_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u8::relaxed_seqcst+0x8> (ffff8105 <asm_test::compare_exchange_weak::u8::relaxed_seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        beq               a9, a10, 2f
        movi.n            a10, 0
        j                 3f
2:
        movi.n            a10, 1
3:
        movi.n            a11, 1
        xor               a2, a10, a11
        ssr               a8
        srl               a3, a9
        memw
4:
        retw.n
5:
        l32r              a10, 4b (ffa1f01d <asm_test::compare_exchange_weak::u8::relaxed_seqcst+0xffa1f01d>)
        l32r              a8, 6c <asm_test::compare_exchange_weak::u8::relaxed_seqcst+0x6c> (ffff81ff <asm_test::compare_exchange_weak::u8::relaxed_seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u8::release_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::u8::release_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u8::release_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u8::release_seqcst+0x8> (ffff8105 <asm_test::compare_exchange_weak::u8::release_seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        beq               a9, a10, 2f
        movi.n            a10, 0
        j                 3f
2:
        movi.n            a10, 1
3:
        movi.n            a11, 1
        xor               a2, a10, a11
        ssr               a8
        srl               a3, a9
        memw
4:
        retw.n
5:
        l32r              a10, 4b (ffa1f01d <asm_test::compare_exchange_weak::u8::release_seqcst+0xffa1f01d>)
        l32r              a8, 6c <asm_test::compare_exchange_weak::u8::release_seqcst+0x6c> (ffff81ff <asm_test::compare_exchange_weak::u8::release_seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u8::seqcst_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::u8::seqcst_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u8::seqcst_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u8::seqcst_acquire+0x8> (ffff8105 <asm_test::compare_exchange_weak::u8::seqcst_acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        beq               a9, a10, 2f
        movi.n            a10, 0
        j                 3f
2:
        movi.n            a10, 1
3:
        movi.n            a11, 1
        xor               a2, a10, a11
        ssr               a8
        srl               a3, a9
        memw
4:
        retw.n
5:
        l32r              a10, 4b (ffa1f01d <asm_test::compare_exchange_weak::u8::seqcst_acquire+0xffa1f01d>)
        l32r              a8, 6c <asm_test::compare_exchange_weak::u8::seqcst_acquire+0x6c> (ffff81ff <asm_test::compare_exchange_weak::u8::seqcst_acquire+0xffff81ff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u8::seqcst_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::u8::seqcst_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u8::seqcst_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u8::seqcst_relaxed+0x8> (ffff8105 <asm_test::compare_exchange_weak::u8::seqcst_relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        beq               a9, a10, 2f
        movi.n            a10, 0
        j                 3f
2:
        movi.n            a10, 1
3:
        movi.n            a11, 1
        xor               a2, a10, a11
        ssr               a8
        srl               a3, a9
        memw
4:
        retw.n
5:
        l32r              a10, 4b (ffa1f01d <asm_test::compare_exchange_weak::u8::seqcst_relaxed+0xffa1f01d>)
        l32r              a8, 6c <asm_test::compare_exchange_weak::u8::seqcst_relaxed+0x6c> (ffff81ff <asm_test::compare_exchange_weak::u8::seqcst_relaxed+0xffff81ff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u8::acquire_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::u8::acquire_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u8::acquire_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u8::acquire_acquire+0x8> (ffff8105 <asm_test::compare_exchange_weak::u8::acquire_acquire+0xffff8105>)
        bgeu              a8, a2, 4f
1:
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
        beq               a9, a10, 2f
        movi.n            a10, 0
        j                 3f
2:
        movi.n            a10, 1
3:
        movi.n            a11, 1
        xor               a2, a10, a11
        ssr               a8
        srl               a3, a9
        memw
        retw.n
4:
        l32r              a10, 64 <asm_test::compare_exchange_weak::u8::acquire_acquire+0x64> (a1f01d00 <asm_test::compare_exchange_weak::u8::acquire_acquire+0xa1f01d00>)
        l32r              a8, 68 <asm_test::compare_exchange_weak::u8::acquire_acquire+0x68> (ff81ffff <asm_test::compare_exchange_weak::u8::acquire_acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u8::acquire_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::u8::acquire_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u8::acquire_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u8::acquire_relaxed+0x8> (ffff8105 <asm_test::compare_exchange_weak::u8::acquire_relaxed+0xffff8105>)
        bgeu              a8, a2, 4f
1:
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
        beq               a9, a10, 2f
        movi.n            a10, 0
        j                 3f
2:
        movi.n            a10, 1
3:
        movi.n            a11, 1
        xor               a2, a10, a11
        ssr               a8
        srl               a3, a9
        memw
        retw.n
4:
        l32r              a10, 64 <asm_test::compare_exchange_weak::u8::acquire_relaxed+0x64> (a1f01d00 <asm_test::compare_exchange_weak::u8::acquire_relaxed+0xa1f01d00>)
        l32r              a8, 68 <asm_test::compare_exchange_weak::u8::acquire_relaxed+0x68> (ff81ffff <asm_test::compare_exchange_weak::u8::acquire_relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u8::relaxed_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::u8::relaxed_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u8::relaxed_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u8::relaxed_acquire+0x8> (ffff8105 <asm_test::compare_exchange_weak::u8::relaxed_acquire+0xffff8105>)
        bgeu              a8, a2, 4f
1:
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
        beq               a9, a10, 2f
        movi.n            a10, 0
        j                 3f
2:
        movi.n            a10, 1
3:
        movi.n            a11, 1
        xor               a2, a10, a11
        ssr               a8
        srl               a3, a9
        memw
        retw.n
4:
        l32r              a10, 64 <asm_test::compare_exchange_weak::u8::relaxed_acquire+0x64> (a1f01d00 <asm_test::compare_exchange_weak::u8::relaxed_acquire+0xa1f01d00>)
        l32r              a8, 68 <asm_test::compare_exchange_weak::u8::relaxed_acquire+0x68> (ff81ffff <asm_test::compare_exchange_weak::u8::relaxed_acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u8::relaxed_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::u8::relaxed_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u8::relaxed_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u8::relaxed_relaxed+0x8> (ffff8105 <asm_test::compare_exchange_weak::u8::relaxed_relaxed+0xffff8105>)
        bgeu              a8, a2, 4f
1:
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
        beq               a9, a10, 2f
        movi.n            a10, 0
        j                 3f
2:
        movi.n            a10, 1
3:
        movi.n            a11, 1
        xor               a2, a10, a11
        ssr               a8
        srl               a3, a9
        retw.n
4:
        l32r              a10, fffc0064 <asm_test::compare_exchange_weak::u8::relaxed_relaxed+0xfffc0064>
        l32r              a8, 4b (810000a1 <asm_test::compare_exchange_weak::u8::relaxed_relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u8::release_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::u8::release_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u8::release_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u8::release_acquire+0x8> (ffff8105 <asm_test::compare_exchange_weak::u8::release_acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        beq               a9, a10, 2f
        movi.n            a10, 0
        j                 3f
2:
        movi.n            a10, 1
3:
        movi.n            a11, 1
        xor               a2, a10, a11
        ssr               a8
        srl               a3, a9
        memw
4:
        retw.n
5:
        l32r              a10, 4b (ffa1f01d <asm_test::compare_exchange_weak::u8::release_acquire+0xffa1f01d>)
        l32r              a8, 6c <asm_test::compare_exchange_weak::u8::release_acquire+0x6c> (ffff81ff <asm_test::compare_exchange_weak::u8::release_acquire+0xffff81ff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u8::release_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::u8::release_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u8::release_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u8::release_relaxed+0x8> (ffff8105 <asm_test::compare_exchange_weak::u8::release_relaxed+0xffff8105>)
        bgeu              a8, a2, 4f
1:
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
        beq               a9, a10, 2f
        movi.n            a10, 0
        j                 3f
2:
        movi.n            a10, 1
3:
        movi.n            a11, 1
        xor               a2, a10, a11
        ssr               a8
        srl               a3, a9
        retw.n
4:
        l32r              a10, 64 <asm_test::compare_exchange_weak::u8::release_relaxed+0x64> (a1f01d91 <asm_test::compare_exchange_weak::u8::release_relaxed+0xa1f01d91>)
        l32r              a8, 68 <asm_test::compare_exchange_weak::u8::release_relaxed+0x68> (ff81ffff <asm_test::compare_exchange_weak::u8::release_relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::f32::acqrel_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::f32::acqrel_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::f32::acqrel_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::f32::acqrel_seqcst+0x8> (ffff8105 <asm_test::compare_exchange_weak::f32::acqrel_seqcst+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange_weak::f32::acqrel_seqcst+0x28> (a1f01d04 <asm_test::compare_exchange_weak::f32::acqrel_seqcst+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange_weak::f32::acqrel_seqcst+0x2c> (ff81ffff <asm_test::compare_exchange_weak::f32::acqrel_seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::f32::seqcst_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::f32::seqcst_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::f32::seqcst_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::f32::seqcst_seqcst+0x8> (ffff8105 <asm_test::compare_exchange_weak::f32::seqcst_seqcst+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange_weak::f32::seqcst_seqcst+0x28> (a1f01d04 <asm_test::compare_exchange_weak::f32::seqcst_seqcst+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange_weak::f32::seqcst_seqcst+0x2c> (ff81ffff <asm_test::compare_exchange_weak::f32::seqcst_seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::f32::acqrel_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::f32::acqrel_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::f32::acqrel_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::f32::acqrel_acquire+0x8> (ffff8105 <asm_test::compare_exchange_weak::f32::acqrel_acquire+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange_weak::f32::acqrel_acquire+0x28> (a1f01d04 <asm_test::compare_exchange_weak::f32::acqrel_acquire+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange_weak::f32::acqrel_acquire+0x2c> (ff81ffff <asm_test::compare_exchange_weak::f32::acqrel_acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::f32::acqrel_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::f32::acqrel_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::f32::acqrel_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::f32::acqrel_relaxed+0x8> (ffff8105 <asm_test::compare_exchange_weak::f32::acqrel_relaxed+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange_weak::f32::acqrel_relaxed+0x28> (a1f01d04 <asm_test::compare_exchange_weak::f32::acqrel_relaxed+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange_weak::f32::acqrel_relaxed+0x2c> (ff81ffff <asm_test::compare_exchange_weak::f32::acqrel_relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::f32::acquire_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::f32::acquire_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::f32::acquire_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::f32::acquire_seqcst+0x8> (ffff8105 <asm_test::compare_exchange_weak::f32::acquire_seqcst+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange_weak::f32::acquire_seqcst+0x28> (a1f01d04 <asm_test::compare_exchange_weak::f32::acquire_seqcst+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange_weak::f32::acquire_seqcst+0x2c> (ff81ffff <asm_test::compare_exchange_weak::f32::acquire_seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::f32::relaxed_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::f32::relaxed_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::f32::relaxed_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::f32::relaxed_seqcst+0x8> (ffff8105 <asm_test::compare_exchange_weak::f32::relaxed_seqcst+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange_weak::f32::relaxed_seqcst+0x28> (a1f01d04 <asm_test::compare_exchange_weak::f32::relaxed_seqcst+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange_weak::f32::relaxed_seqcst+0x2c> (ff81ffff <asm_test::compare_exchange_weak::f32::relaxed_seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::f32::release_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::f32::release_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::f32::release_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::f32::release_seqcst+0x8> (ffff8105 <asm_test::compare_exchange_weak::f32::release_seqcst+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange_weak::f32::release_seqcst+0x28> (a1f01d04 <asm_test::compare_exchange_weak::f32::release_seqcst+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange_weak::f32::release_seqcst+0x2c> (ff81ffff <asm_test::compare_exchange_weak::f32::release_seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::f32::seqcst_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::f32::seqcst_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::f32::seqcst_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::f32::seqcst_acquire+0x8> (ffff8105 <asm_test::compare_exchange_weak::f32::seqcst_acquire+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange_weak::f32::seqcst_acquire+0x28> (a1f01d04 <asm_test::compare_exchange_weak::f32::seqcst_acquire+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange_weak::f32::seqcst_acquire+0x2c> (ff81ffff <asm_test::compare_exchange_weak::f32::seqcst_acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::f32::seqcst_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::f32::seqcst_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::f32::seqcst_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::f32::seqcst_relaxed+0x8> (ffff8105 <asm_test::compare_exchange_weak::f32::seqcst_relaxed+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange_weak::f32::seqcst_relaxed+0x28> (a1f01d04 <asm_test::compare_exchange_weak::f32::seqcst_relaxed+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange_weak::f32::seqcst_relaxed+0x2c> (ff81ffff <asm_test::compare_exchange_weak::f32::seqcst_relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::f32::acquire_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::f32::acquire_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::f32::acquire_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::f32::acquire_acquire+0x8> (ffff8105 <asm_test::compare_exchange_weak::f32::acquire_acquire+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, fffc0028 <asm_test::compare_exchange_weak::f32::acquire_acquire+0xfffc0028>
        l32r              a8, 3b (810000a1 <asm_test::compare_exchange_weak::f32::acquire_acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::f32::acquire_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::f32::acquire_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::f32::acquire_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::f32::acquire_relaxed+0x8> (ffff8105 <asm_test::compare_exchange_weak::f32::acquire_relaxed+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, fffc0028 <asm_test::compare_exchange_weak::f32::acquire_relaxed+0xfffc0028>
        l32r              a8, 3b (810000a1 <asm_test::compare_exchange_weak::f32::acquire_relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::f32::relaxed_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::f32::relaxed_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::f32::relaxed_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::f32::relaxed_acquire+0x8> (ffff8105 <asm_test::compare_exchange_weak::f32::relaxed_acquire+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, fffc0028 <asm_test::compare_exchange_weak::f32::relaxed_acquire+0xfffc0028>
        l32r              a8, 3b (810000a1 <asm_test::compare_exchange_weak::f32::relaxed_acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::f32::relaxed_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::f32::relaxed_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::f32::relaxed_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::f32::relaxed_relaxed+0x8> (ffff8105 <asm_test::compare_exchange_weak::f32::relaxed_relaxed+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 24 <asm_test::compare_exchange_weak::f32::relaxed_relaxed+0x24> (ffffa1f0 <asm_test::compare_exchange_weak::f32::relaxed_relaxed+0xffffa1f0>)
        l32r              a8, fffc0028 <asm_test::compare_exchange_weak::f32::relaxed_relaxed+0xfffc0028>
        callx8            a8

.literal.asm_test::compare_exchange_weak::f32::release_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::f32::release_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::f32::release_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::f32::release_acquire+0x8> (ffff8105 <asm_test::compare_exchange_weak::f32::release_acquire+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange_weak::f32::release_acquire+0x28> (a1f01d04 <asm_test::compare_exchange_weak::f32::release_acquire+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange_weak::f32::release_acquire+0x2c> (ff81ffff <asm_test::compare_exchange_weak::f32::release_acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::f32::release_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::f32::release_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::f32::release_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::f32::release_relaxed+0x8> (ffff8105 <asm_test::compare_exchange_weak::f32::release_relaxed+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, fffc0028 <asm_test::compare_exchange_weak::f32::release_relaxed+0xfffc0028>
        l32r              a8, 3b (810000a1 <asm_test::compare_exchange_weak::f32::release_relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u16::acqrel_seqcst:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::compare_exchange_weak::u16::acqrel_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::acqrel_seqcst+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u16::acqrel_seqcst+0x8> (ffff8105 <asm_test::compare_exchange_weak::u16::acqrel_seqcst+0xffff8105>)
1:
        bgeu              a8, a2, 5f
2:
        l32r              a9, 1b (915db827 <asm_test::compare_exchange_weak::u16::acqrel_seqcst+0x915db827>)
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
        beq               a10, a11, 3f
        movi.n            a11, 0
        j                 4f
3:
        movi.n            a11, 1
4:
        ssr               a8
        srl               a3, a10
        xor               a8, a11, a9
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n
5:
        l32r              a10, 6c <asm_test::compare_exchange_weak::u16::acqrel_seqcst+0x6c> (ffffa1f0 <asm_test::compare_exchange_weak::u16::acqrel_seqcst+0xffffa1f0>)
        l32r              a8, fffc0070 <asm_test::compare_exchange_weak::u16::acqrel_seqcst+0xfffc0070>
        callx8            a8

.literal.asm_test::compare_exchange_weak::u16::seqcst_seqcst:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::compare_exchange_weak::u16::seqcst_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::seqcst_seqcst+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u16::seqcst_seqcst+0x8> (ffff8105 <asm_test::compare_exchange_weak::u16::seqcst_seqcst+0xffff8105>)
1:
        bgeu              a8, a2, 5f
2:
        l32r              a9, 1b (915db827 <asm_test::compare_exchange_weak::u16::seqcst_seqcst+0x915db827>)
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
        beq               a10, a11, 3f
        movi.n            a11, 0
        j                 4f
3:
        movi.n            a11, 1
4:
        ssr               a8
        srl               a3, a10
        xor               a8, a11, a9
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n
5:
        l32r              a10, 6c <asm_test::compare_exchange_weak::u16::seqcst_seqcst+0x6c> (ffffa1f0 <asm_test::compare_exchange_weak::u16::seqcst_seqcst+0xffffa1f0>)
        l32r              a8, fffc0070 <asm_test::compare_exchange_weak::u16::seqcst_seqcst+0xfffc0070>
        callx8            a8

.literal.asm_test::compare_exchange_weak::u16::acqrel_acquire:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::compare_exchange_weak::u16::acqrel_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::acqrel_acquire+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u16::acqrel_acquire+0x8> (ffff8105 <asm_test::compare_exchange_weak::u16::acqrel_acquire+0xffff8105>)
1:
        bgeu              a8, a2, 5f
2:
        l32r              a9, 1b (915db827 <asm_test::compare_exchange_weak::u16::acqrel_acquire+0x915db827>)
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
        beq               a10, a11, 3f
        movi.n            a11, 0
        j                 4f
3:
        movi.n            a11, 1
4:
        ssr               a8
        srl               a3, a10
        xor               a8, a11, a9
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n
5:
        l32r              a10, 6c <asm_test::compare_exchange_weak::u16::acqrel_acquire+0x6c> (ffffa1f0 <asm_test::compare_exchange_weak::u16::acqrel_acquire+0xffffa1f0>)
        l32r              a8, fffc0070 <asm_test::compare_exchange_weak::u16::acqrel_acquire+0xfffc0070>
        callx8            a8

.literal.asm_test::compare_exchange_weak::u16::acqrel_relaxed:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::compare_exchange_weak::u16::acqrel_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::acqrel_relaxed+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u16::acqrel_relaxed+0x8> (ffff8105 <asm_test::compare_exchange_weak::u16::acqrel_relaxed+0xffff8105>)
1:
        bgeu              a8, a2, 5f
2:
        l32r              a9, 1b (915db827 <asm_test::compare_exchange_weak::u16::acqrel_relaxed+0x915db827>)
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
        beq               a10, a11, 3f
        movi.n            a11, 0
        j                 4f
3:
        movi.n            a11, 1
4:
        ssr               a8
        srl               a3, a10
        xor               a8, a11, a9
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n
5:
        l32r              a10, 6c <asm_test::compare_exchange_weak::u16::acqrel_relaxed+0x6c> (ffffa1f0 <asm_test::compare_exchange_weak::u16::acqrel_relaxed+0xffffa1f0>)
        l32r              a8, fffc0070 <asm_test::compare_exchange_weak::u16::acqrel_relaxed+0xfffc0070>
        callx8            a8

.literal.asm_test::compare_exchange_weak::u16::acquire_seqcst:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::compare_exchange_weak::u16::acquire_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::acquire_seqcst+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u16::acquire_seqcst+0x8> (ffff8105 <asm_test::compare_exchange_weak::u16::acquire_seqcst+0xffff8105>)
1:
        bgeu              a8, a2, 5f
2:
        l32r              a9, 1b (915db827 <asm_test::compare_exchange_weak::u16::acquire_seqcst+0x915db827>)
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
        beq               a10, a11, 3f
        movi.n            a11, 0
        j                 4f
3:
        movi.n            a11, 1
4:
        ssr               a8
        srl               a3, a10
        xor               a8, a11, a9
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n
5:
        l32r              a10, 6c <asm_test::compare_exchange_weak::u16::acquire_seqcst+0x6c> (ffffa1f0 <asm_test::compare_exchange_weak::u16::acquire_seqcst+0xffffa1f0>)
        l32r              a8, fffc0070 <asm_test::compare_exchange_weak::u16::acquire_seqcst+0xfffc0070>
        callx8            a8

.literal.asm_test::compare_exchange_weak::u16::relaxed_seqcst:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::compare_exchange_weak::u16::relaxed_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::relaxed_seqcst+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u16::relaxed_seqcst+0x8> (ffff8105 <asm_test::compare_exchange_weak::u16::relaxed_seqcst+0xffff8105>)
1:
        bgeu              a8, a2, 5f
2:
        l32r              a9, 1b (915db827 <asm_test::compare_exchange_weak::u16::relaxed_seqcst+0x915db827>)
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
        beq               a10, a11, 3f
        movi.n            a11, 0
        j                 4f
3:
        movi.n            a11, 1
4:
        ssr               a8
        srl               a3, a10
        xor               a8, a11, a9
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n
5:
        l32r              a10, 6c <asm_test::compare_exchange_weak::u16::relaxed_seqcst+0x6c> (ffffa1f0 <asm_test::compare_exchange_weak::u16::relaxed_seqcst+0xffffa1f0>)
        l32r              a8, fffc0070 <asm_test::compare_exchange_weak::u16::relaxed_seqcst+0xfffc0070>
        callx8            a8

.literal.asm_test::compare_exchange_weak::u16::release_seqcst:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::compare_exchange_weak::u16::release_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::release_seqcst+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u16::release_seqcst+0x8> (ffff8105 <asm_test::compare_exchange_weak::u16::release_seqcst+0xffff8105>)
1:
        bgeu              a8, a2, 5f
2:
        l32r              a9, 1b (915db827 <asm_test::compare_exchange_weak::u16::release_seqcst+0x915db827>)
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
        beq               a10, a11, 3f
        movi.n            a11, 0
        j                 4f
3:
        movi.n            a11, 1
4:
        ssr               a8
        srl               a3, a10
        xor               a8, a11, a9
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n
5:
        l32r              a10, 6c <asm_test::compare_exchange_weak::u16::release_seqcst+0x6c> (ffffa1f0 <asm_test::compare_exchange_weak::u16::release_seqcst+0xffffa1f0>)
        l32r              a8, fffc0070 <asm_test::compare_exchange_weak::u16::release_seqcst+0xfffc0070>
        callx8            a8

.literal.asm_test::compare_exchange_weak::u16::seqcst_acquire:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::compare_exchange_weak::u16::seqcst_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::seqcst_acquire+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u16::seqcst_acquire+0x8> (ffff8105 <asm_test::compare_exchange_weak::u16::seqcst_acquire+0xffff8105>)
1:
        bgeu              a8, a2, 5f
2:
        l32r              a9, 1b (915db827 <asm_test::compare_exchange_weak::u16::seqcst_acquire+0x915db827>)
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
        beq               a10, a11, 3f
        movi.n            a11, 0
        j                 4f
3:
        movi.n            a11, 1
4:
        ssr               a8
        srl               a3, a10
        xor               a8, a11, a9
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n
5:
        l32r              a10, 6c <asm_test::compare_exchange_weak::u16::seqcst_acquire+0x6c> (ffffa1f0 <asm_test::compare_exchange_weak::u16::seqcst_acquire+0xffffa1f0>)
        l32r              a8, fffc0070 <asm_test::compare_exchange_weak::u16::seqcst_acquire+0xfffc0070>
        callx8            a8

.literal.asm_test::compare_exchange_weak::u16::seqcst_relaxed:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::compare_exchange_weak::u16::seqcst_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::seqcst_relaxed+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u16::seqcst_relaxed+0x8> (ffff8105 <asm_test::compare_exchange_weak::u16::seqcst_relaxed+0xffff8105>)
1:
        bgeu              a8, a2, 5f
2:
        l32r              a9, 1b (915db827 <asm_test::compare_exchange_weak::u16::seqcst_relaxed+0x915db827>)
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
        beq               a10, a11, 3f
        movi.n            a11, 0
        j                 4f
3:
        movi.n            a11, 1
4:
        ssr               a8
        srl               a3, a10
        xor               a8, a11, a9
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n
5:
        l32r              a10, 6c <asm_test::compare_exchange_weak::u16::seqcst_relaxed+0x6c> (ffffa1f0 <asm_test::compare_exchange_weak::u16::seqcst_relaxed+0xffffa1f0>)
        l32r              a8, fffc0070 <asm_test::compare_exchange_weak::u16::seqcst_relaxed+0xfffc0070>
        callx8            a8

.literal.asm_test::compare_exchange_weak::u16::acquire_acquire:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::compare_exchange_weak::u16::acquire_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::acquire_acquire+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u16::acquire_acquire+0x8> (ffff8105 <asm_test::compare_exchange_weak::u16::acquire_acquire+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a9, 1b (915ab827 <asm_test::compare_exchange_weak::u16::acquire_acquire+0x915ab827>)
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
        beq               a10, a11, 3f
        movi.n            a11, 0
        j                 4f
3:
        movi.n            a11, 1
4:
        ssr               a8
        srl               a3, a10
        xor               a8, a11, a9
        movi.n            a9, 1
        and               a2, a8, a9
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::compare_exchange_weak::u16::acquire_acquire+0xffa1f01d>)
        l32r              a8, 6c <asm_test::compare_exchange_weak::u16::acquire_acquire+0x6c> (ffff81ff <asm_test::compare_exchange_weak::u16::acquire_acquire+0xffff81ff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u16::acquire_relaxed:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::compare_exchange_weak::u16::acquire_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::acquire_relaxed+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u16::acquire_relaxed+0x8> (ffff8105 <asm_test::compare_exchange_weak::u16::acquire_relaxed+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a9, 1b (915ab827 <asm_test::compare_exchange_weak::u16::acquire_relaxed+0x915ab827>)
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
        beq               a10, a11, 3f
        movi.n            a11, 0
        j                 4f
3:
        movi.n            a11, 1
4:
        ssr               a8
        srl               a3, a10
        xor               a8, a11, a9
        movi.n            a9, 1
        and               a2, a8, a9
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::compare_exchange_weak::u16::acquire_relaxed+0xffa1f01d>)
        l32r              a8, 6c <asm_test::compare_exchange_weak::u16::acquire_relaxed+0x6c> (ffff81ff <asm_test::compare_exchange_weak::u16::acquire_relaxed+0xffff81ff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u16::relaxed_acquire:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::compare_exchange_weak::u16::relaxed_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::relaxed_acquire+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u16::relaxed_acquire+0x8> (ffff8105 <asm_test::compare_exchange_weak::u16::relaxed_acquire+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a9, 1b (915ab827 <asm_test::compare_exchange_weak::u16::relaxed_acquire+0x915ab827>)
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
        beq               a10, a11, 3f
        movi.n            a11, 0
        j                 4f
3:
        movi.n            a11, 1
4:
        ssr               a8
        srl               a3, a10
        xor               a8, a11, a9
        movi.n            a9, 1
        and               a2, a8, a9
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::compare_exchange_weak::u16::relaxed_acquire+0xffa1f01d>)
        l32r              a8, 6c <asm_test::compare_exchange_weak::u16::relaxed_acquire+0x6c> (ffff81ff <asm_test::compare_exchange_weak::u16::relaxed_acquire+0xffff81ff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u16::relaxed_relaxed:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::compare_exchange_weak::u16::relaxed_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::relaxed_relaxed+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u16::relaxed_relaxed+0x8> (ffff8105 <asm_test::compare_exchange_weak::u16::relaxed_relaxed+0xffff8105>)
1:
        bgeu              a8, a2, 5f
2:
        l32r              a9, 1b (9157b827 <asm_test::compare_exchange_weak::u16::relaxed_relaxed+0x9157b827>)
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
        beq               a10, a11, 3f
        movi.n            a11, 0
        j                 4f
3:
        movi.n            a11, 1
4:
        ssr               a8
        srl               a3, a10
        xor               a8, a11, a9
        movi.n            a9, 1
        and               a2, a8, a9
        retw.n
5:
        l32r              a10, 64 <asm_test::compare_exchange_weak::u16::relaxed_relaxed+0x64> (a1f01d10 <asm_test::compare_exchange_weak::u16::relaxed_relaxed+0xa1f01d10>)
        l32r              a8, 68 <asm_test::compare_exchange_weak::u16::relaxed_relaxed+0x68> (ff81ffff <asm_test::compare_exchange_weak::u16::relaxed_relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u16::release_acquire:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::compare_exchange_weak::u16::release_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::release_acquire+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u16::release_acquire+0x8> (ffff8105 <asm_test::compare_exchange_weak::u16::release_acquire+0xffff8105>)
1:
        bgeu              a8, a2, 5f
2:
        l32r              a9, 1b (915db827 <asm_test::compare_exchange_weak::u16::release_acquire+0x915db827>)
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
        beq               a10, a11, 3f
        movi.n            a11, 0
        j                 4f
3:
        movi.n            a11, 1
4:
        ssr               a8
        srl               a3, a10
        xor               a8, a11, a9
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n
5:
        l32r              a10, 6c <asm_test::compare_exchange_weak::u16::release_acquire+0x6c> (ffffa1f0 <asm_test::compare_exchange_weak::u16::release_acquire+0xffffa1f0>)
        l32r              a8, fffc0070 <asm_test::compare_exchange_weak::u16::release_acquire+0xfffc0070>
        callx8            a8

.literal.asm_test::compare_exchange_weak::u16::release_relaxed:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::compare_exchange_weak::u16::release_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::release_relaxed+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u16::release_relaxed+0x8> (ffff8105 <asm_test::compare_exchange_weak::u16::release_relaxed+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a9, 1b (915ab827 <asm_test::compare_exchange_weak::u16::release_relaxed+0x915ab827>)
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
        beq               a10, a11, 3f
        movi.n            a11, 0
        j                 4f
3:
        movi.n            a11, 1
4:
        ssr               a8
        srl               a3, a10
        xor               a8, a11, a9
        movi.n            a9, 1
        and               a2, a8, a9
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::compare_exchange_weak::u16::release_relaxed+0xffa1f01d>)
        l32r              a8, 6c <asm_test::compare_exchange_weak::u16::release_relaxed+0x6c> (ffff81ff <asm_test::compare_exchange_weak::u16::release_relaxed+0xffff81ff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u32::acqrel_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::u32::acqrel_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u32::acqrel_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u32::acqrel_seqcst+0x8> (ffff8105 <asm_test::compare_exchange_weak::u32::acqrel_seqcst+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange_weak::u32::acqrel_seqcst+0x28> (a1f01d04 <asm_test::compare_exchange_weak::u32::acqrel_seqcst+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange_weak::u32::acqrel_seqcst+0x2c> (ff81ffff <asm_test::compare_exchange_weak::u32::acqrel_seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u32::seqcst_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::u32::seqcst_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u32::seqcst_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u32::seqcst_seqcst+0x8> (ffff8105 <asm_test::compare_exchange_weak::u32::seqcst_seqcst+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange_weak::u32::seqcst_seqcst+0x28> (a1f01d04 <asm_test::compare_exchange_weak::u32::seqcst_seqcst+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange_weak::u32::seqcst_seqcst+0x2c> (ff81ffff <asm_test::compare_exchange_weak::u32::seqcst_seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u32::acqrel_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::u32::acqrel_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u32::acqrel_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u32::acqrel_acquire+0x8> (ffff8105 <asm_test::compare_exchange_weak::u32::acqrel_acquire+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange_weak::u32::acqrel_acquire+0x28> (a1f01d04 <asm_test::compare_exchange_weak::u32::acqrel_acquire+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange_weak::u32::acqrel_acquire+0x2c> (ff81ffff <asm_test::compare_exchange_weak::u32::acqrel_acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u32::acqrel_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::u32::acqrel_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u32::acqrel_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u32::acqrel_relaxed+0x8> (ffff8105 <asm_test::compare_exchange_weak::u32::acqrel_relaxed+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange_weak::u32::acqrel_relaxed+0x28> (a1f01d04 <asm_test::compare_exchange_weak::u32::acqrel_relaxed+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange_weak::u32::acqrel_relaxed+0x2c> (ff81ffff <asm_test::compare_exchange_weak::u32::acqrel_relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u32::acquire_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::u32::acquire_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u32::acquire_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u32::acquire_seqcst+0x8> (ffff8105 <asm_test::compare_exchange_weak::u32::acquire_seqcst+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange_weak::u32::acquire_seqcst+0x28> (a1f01d04 <asm_test::compare_exchange_weak::u32::acquire_seqcst+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange_weak::u32::acquire_seqcst+0x2c> (ff81ffff <asm_test::compare_exchange_weak::u32::acquire_seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u32::relaxed_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::u32::relaxed_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u32::relaxed_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u32::relaxed_seqcst+0x8> (ffff8105 <asm_test::compare_exchange_weak::u32::relaxed_seqcst+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange_weak::u32::relaxed_seqcst+0x28> (a1f01d04 <asm_test::compare_exchange_weak::u32::relaxed_seqcst+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange_weak::u32::relaxed_seqcst+0x2c> (ff81ffff <asm_test::compare_exchange_weak::u32::relaxed_seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u32::release_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::u32::release_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u32::release_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u32::release_seqcst+0x8> (ffff8105 <asm_test::compare_exchange_weak::u32::release_seqcst+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange_weak::u32::release_seqcst+0x28> (a1f01d04 <asm_test::compare_exchange_weak::u32::release_seqcst+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange_weak::u32::release_seqcst+0x2c> (ff81ffff <asm_test::compare_exchange_weak::u32::release_seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u32::seqcst_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::u32::seqcst_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u32::seqcst_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u32::seqcst_acquire+0x8> (ffff8105 <asm_test::compare_exchange_weak::u32::seqcst_acquire+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange_weak::u32::seqcst_acquire+0x28> (a1f01d04 <asm_test::compare_exchange_weak::u32::seqcst_acquire+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange_weak::u32::seqcst_acquire+0x2c> (ff81ffff <asm_test::compare_exchange_weak::u32::seqcst_acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u32::seqcst_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::u32::seqcst_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u32::seqcst_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u32::seqcst_relaxed+0x8> (ffff8105 <asm_test::compare_exchange_weak::u32::seqcst_relaxed+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange_weak::u32::seqcst_relaxed+0x28> (a1f01d04 <asm_test::compare_exchange_weak::u32::seqcst_relaxed+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange_weak::u32::seqcst_relaxed+0x2c> (ff81ffff <asm_test::compare_exchange_weak::u32::seqcst_relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u32::acquire_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::u32::acquire_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u32::acquire_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u32::acquire_acquire+0x8> (ffff8105 <asm_test::compare_exchange_weak::u32::acquire_acquire+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, fffc0028 <asm_test::compare_exchange_weak::u32::acquire_acquire+0xfffc0028>
        l32r              a8, 3b (810000a1 <asm_test::compare_exchange_weak::u32::acquire_acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u32::acquire_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::u32::acquire_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u32::acquire_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u32::acquire_relaxed+0x8> (ffff8105 <asm_test::compare_exchange_weak::u32::acquire_relaxed+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, fffc0028 <asm_test::compare_exchange_weak::u32::acquire_relaxed+0xfffc0028>
        l32r              a8, 3b (810000a1 <asm_test::compare_exchange_weak::u32::acquire_relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u32::relaxed_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::u32::relaxed_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u32::relaxed_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u32::relaxed_acquire+0x8> (ffff8105 <asm_test::compare_exchange_weak::u32::relaxed_acquire+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, fffc0028 <asm_test::compare_exchange_weak::u32::relaxed_acquire+0xfffc0028>
        l32r              a8, 3b (810000a1 <asm_test::compare_exchange_weak::u32::relaxed_acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u32::relaxed_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::u32::relaxed_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u32::relaxed_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u32::relaxed_relaxed+0x8> (ffff8105 <asm_test::compare_exchange_weak::u32::relaxed_relaxed+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 24 <asm_test::compare_exchange_weak::u32::relaxed_relaxed+0x24> (ffffa1f0 <asm_test::compare_exchange_weak::u32::relaxed_relaxed+0xffffa1f0>)
        l32r              a8, fffc0028 <asm_test::compare_exchange_weak::u32::relaxed_relaxed+0xfffc0028>
        callx8            a8

.literal.asm_test::compare_exchange_weak::u32::release_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::u32::release_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u32::release_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u32::release_acquire+0x8> (ffff8105 <asm_test::compare_exchange_weak::u32::release_acquire+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, 28 <asm_test::compare_exchange_weak::u32::release_acquire+0x28> (a1f01d04 <asm_test::compare_exchange_weak::u32::release_acquire+0xa1f01d04>)
        l32r              a8, 2c <asm_test::compare_exchange_weak::u32::release_acquire+0x2c> (ff81ffff <asm_test::compare_exchange_weak::u32::release_acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::u32::release_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::u32::release_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u32::release_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::u32::release_relaxed+0x8> (ffff8105 <asm_test::compare_exchange_weak::u32::release_relaxed+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        memw
        wsr.scompare1     a3
        s32c1i            a4, a2, 0
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a4, a3, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        mov.n             a3, a4
        retw.n
3:
        l32r              a10, fffc0028 <asm_test::compare_exchange_weak::u32::release_relaxed+0xfffc0028>
        l32r              a8, 3b (810000a1 <asm_test::compare_exchange_weak::u32::release_relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::bool::acqrel_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::bool::acqrel_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::bool::acqrel_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::bool::acqrel_seqcst+0x8> (ffff8105 <asm_test::compare_exchange_weak::bool::acqrel_seqcst+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a11, a10, 0
        and               a9, a11, a9
        ssl               a8
        sll               a11, a4
        or                a11, a9, a11
        ssl               a8
        sll               a12, a3
        or                a12, a9, a12
        wsr.scompare1     a12
        s32c1i            a11, a10, 0
        ssr               a8
        srl               a3, a11
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a11, a12, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        retw.n
3:
        l32r              a10, 60 <asm_test::compare_exchange_weak::bool::acqrel_seqcst+0x60> (ffffa1f0 <asm_test::compare_exchange_weak::bool::acqrel_seqcst+0xffffa1f0>)
        l32r              a8, fffc0064 <asm_test::compare_exchange_weak::bool::acqrel_seqcst+0xfffc0064>
        callx8            a8

.literal.asm_test::compare_exchange_weak::bool::seqcst_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::bool::seqcst_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::bool::seqcst_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::bool::seqcst_seqcst+0x8> (ffff8105 <asm_test::compare_exchange_weak::bool::seqcst_seqcst+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a11, a10, 0
        and               a9, a11, a9
        ssl               a8
        sll               a11, a4
        or                a11, a9, a11
        ssl               a8
        sll               a12, a3
        or                a12, a9, a12
        wsr.scompare1     a12
        s32c1i            a11, a10, 0
        ssr               a8
        srl               a3, a11
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a11, a12, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        retw.n
3:
        l32r              a10, 60 <asm_test::compare_exchange_weak::bool::seqcst_seqcst+0x60> (ffffa1f0 <asm_test::compare_exchange_weak::bool::seqcst_seqcst+0xffffa1f0>)
        l32r              a8, fffc0064 <asm_test::compare_exchange_weak::bool::seqcst_seqcst+0xfffc0064>
        callx8            a8

.literal.asm_test::compare_exchange_weak::bool::acqrel_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::bool::acqrel_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::bool::acqrel_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::bool::acqrel_acquire+0x8> (ffff8105 <asm_test::compare_exchange_weak::bool::acqrel_acquire+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a11, a10, 0
        and               a9, a11, a9
        ssl               a8
        sll               a11, a4
        or                a11, a9, a11
        ssl               a8
        sll               a12, a3
        or                a12, a9, a12
        wsr.scompare1     a12
        s32c1i            a11, a10, 0
        ssr               a8
        srl               a3, a11
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a11, a12, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        retw.n
3:
        l32r              a10, 60 <asm_test::compare_exchange_weak::bool::acqrel_acquire+0x60> (ffffa1f0 <asm_test::compare_exchange_weak::bool::acqrel_acquire+0xffffa1f0>)
        l32r              a8, fffc0064 <asm_test::compare_exchange_weak::bool::acqrel_acquire+0xfffc0064>
        callx8            a8

.literal.asm_test::compare_exchange_weak::bool::acqrel_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::bool::acqrel_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::bool::acqrel_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::bool::acqrel_relaxed+0x8> (ffff8105 <asm_test::compare_exchange_weak::bool::acqrel_relaxed+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a11, a10, 0
        and               a9, a11, a9
        ssl               a8
        sll               a11, a4
        or                a11, a9, a11
        ssl               a8
        sll               a12, a3
        or                a12, a9, a12
        wsr.scompare1     a12
        s32c1i            a11, a10, 0
        ssr               a8
        srl               a3, a11
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a11, a12, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        retw.n
3:
        l32r              a10, 60 <asm_test::compare_exchange_weak::bool::acqrel_relaxed+0x60> (ffffa1f0 <asm_test::compare_exchange_weak::bool::acqrel_relaxed+0xffffa1f0>)
        l32r              a8, fffc0064 <asm_test::compare_exchange_weak::bool::acqrel_relaxed+0xfffc0064>
        callx8            a8

.literal.asm_test::compare_exchange_weak::bool::acquire_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::bool::acquire_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::bool::acquire_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::bool::acquire_seqcst+0x8> (ffff8105 <asm_test::compare_exchange_weak::bool::acquire_seqcst+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a11, a10, 0
        and               a9, a11, a9
        ssl               a8
        sll               a11, a4
        or                a11, a9, a11
        ssl               a8
        sll               a12, a3
        or                a12, a9, a12
        wsr.scompare1     a12
        s32c1i            a11, a10, 0
        ssr               a8
        srl               a3, a11
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a11, a12, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        retw.n
3:
        l32r              a10, 60 <asm_test::compare_exchange_weak::bool::acquire_seqcst+0x60> (ffffa1f0 <asm_test::compare_exchange_weak::bool::acquire_seqcst+0xffffa1f0>)
        l32r              a8, fffc0064 <asm_test::compare_exchange_weak::bool::acquire_seqcst+0xfffc0064>
        callx8            a8

.literal.asm_test::compare_exchange_weak::bool::relaxed_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::bool::relaxed_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::bool::relaxed_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::bool::relaxed_seqcst+0x8> (ffff8105 <asm_test::compare_exchange_weak::bool::relaxed_seqcst+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a11, a10, 0
        and               a9, a11, a9
        ssl               a8
        sll               a11, a4
        or                a11, a9, a11
        ssl               a8
        sll               a12, a3
        or                a12, a9, a12
        wsr.scompare1     a12
        s32c1i            a11, a10, 0
        ssr               a8
        srl               a3, a11
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a11, a12, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        retw.n
3:
        l32r              a10, 60 <asm_test::compare_exchange_weak::bool::relaxed_seqcst+0x60> (ffffa1f0 <asm_test::compare_exchange_weak::bool::relaxed_seqcst+0xffffa1f0>)
        l32r              a8, fffc0064 <asm_test::compare_exchange_weak::bool::relaxed_seqcst+0xfffc0064>
        callx8            a8

.literal.asm_test::compare_exchange_weak::bool::release_seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::bool::release_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::bool::release_seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::bool::release_seqcst+0x8> (ffff8105 <asm_test::compare_exchange_weak::bool::release_seqcst+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a11, a10, 0
        and               a9, a11, a9
        ssl               a8
        sll               a11, a4
        or                a11, a9, a11
        ssl               a8
        sll               a12, a3
        or                a12, a9, a12
        wsr.scompare1     a12
        s32c1i            a11, a10, 0
        ssr               a8
        srl               a3, a11
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a11, a12, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        retw.n
3:
        l32r              a10, 60 <asm_test::compare_exchange_weak::bool::release_seqcst+0x60> (ffffa1f0 <asm_test::compare_exchange_weak::bool::release_seqcst+0xffffa1f0>)
        l32r              a8, fffc0064 <asm_test::compare_exchange_weak::bool::release_seqcst+0xfffc0064>
        callx8            a8

.literal.asm_test::compare_exchange_weak::bool::seqcst_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::bool::seqcst_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::bool::seqcst_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::bool::seqcst_acquire+0x8> (ffff8105 <asm_test::compare_exchange_weak::bool::seqcst_acquire+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a11, a10, 0
        and               a9, a11, a9
        ssl               a8
        sll               a11, a4
        or                a11, a9, a11
        ssl               a8
        sll               a12, a3
        or                a12, a9, a12
        wsr.scompare1     a12
        s32c1i            a11, a10, 0
        ssr               a8
        srl               a3, a11
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a11, a12, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        retw.n
3:
        l32r              a10, 60 <asm_test::compare_exchange_weak::bool::seqcst_acquire+0x60> (ffffa1f0 <asm_test::compare_exchange_weak::bool::seqcst_acquire+0xffffa1f0>)
        l32r              a8, fffc0064 <asm_test::compare_exchange_weak::bool::seqcst_acquire+0xfffc0064>
        callx8            a8

.literal.asm_test::compare_exchange_weak::bool::seqcst_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::bool::seqcst_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::bool::seqcst_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::bool::seqcst_relaxed+0x8> (ffff8105 <asm_test::compare_exchange_weak::bool::seqcst_relaxed+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a11, a10, 0
        and               a9, a11, a9
        ssl               a8
        sll               a11, a4
        or                a11, a9, a11
        ssl               a8
        sll               a12, a3
        or                a12, a9, a12
        wsr.scompare1     a12
        s32c1i            a11, a10, 0
        ssr               a8
        srl               a3, a11
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a11, a12, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        retw.n
3:
        l32r              a10, 60 <asm_test::compare_exchange_weak::bool::seqcst_relaxed+0x60> (ffffa1f0 <asm_test::compare_exchange_weak::bool::seqcst_relaxed+0xffffa1f0>)
        l32r              a8, fffc0064 <asm_test::compare_exchange_weak::bool::seqcst_relaxed+0xfffc0064>
        callx8            a8

.literal.asm_test::compare_exchange_weak::bool::acquire_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::bool::acquire_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::bool::acquire_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::bool::acquire_acquire+0x8> (ffff8105 <asm_test::compare_exchange_weak::bool::acquire_acquire+0xffff8105>)
        bgeu              a8, a2, 4f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a11, a10, 0
        and               a9, a11, a9
        ssl               a8
        sll               a11, a4
        or                a11, a9, a11
        ssl               a8
        sll               a12, a3
        or                a12, a9, a12
        wsr.scompare1     a12
        s32c1i            a11, a10, 0
        ssr               a8
        srl               a3, a11
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a11, a12, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
3:
        retw.n
4:
        l32r              a10, 3b (ffa1f01d <asm_test::compare_exchange_weak::bool::acquire_acquire+0xffa1f01d>)
        l32r              a8, 60 <asm_test::compare_exchange_weak::bool::acquire_acquire+0x60> (ffff81ff <asm_test::compare_exchange_weak::bool::acquire_acquire+0xffff81ff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::bool::acquire_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::bool::acquire_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::bool::acquire_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::bool::acquire_relaxed+0x8> (ffff8105 <asm_test::compare_exchange_weak::bool::acquire_relaxed+0xffff8105>)
        bgeu              a8, a2, 4f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a11, a10, 0
        and               a9, a11, a9
        ssl               a8
        sll               a11, a4
        or                a11, a9, a11
        ssl               a8
        sll               a12, a3
        or                a12, a9, a12
        wsr.scompare1     a12
        s32c1i            a11, a10, 0
        ssr               a8
        srl               a3, a11
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a11, a12, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
3:
        retw.n
4:
        l32r              a10, 3b (ffa1f01d <asm_test::compare_exchange_weak::bool::acquire_relaxed+0xffa1f01d>)
        l32r              a8, 60 <asm_test::compare_exchange_weak::bool::acquire_relaxed+0x60> (ffff81ff <asm_test::compare_exchange_weak::bool::acquire_relaxed+0xffff81ff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::bool::relaxed_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::bool::relaxed_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::bool::relaxed_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::bool::relaxed_acquire+0x8> (ffff8105 <asm_test::compare_exchange_weak::bool::relaxed_acquire+0xffff8105>)
        bgeu              a8, a2, 4f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a11, a10, 0
        and               a9, a11, a9
        ssl               a8
        sll               a11, a4
        or                a11, a9, a11
        ssl               a8
        sll               a12, a3
        or                a12, a9, a12
        wsr.scompare1     a12
        s32c1i            a11, a10, 0
        ssr               a8
        srl               a3, a11
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a11, a12, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
3:
        retw.n
4:
        l32r              a10, 3b (ffa1f01d <asm_test::compare_exchange_weak::bool::relaxed_acquire+0xffa1f01d>)
        l32r              a8, 60 <asm_test::compare_exchange_weak::bool::relaxed_acquire+0x60> (ffff81ff <asm_test::compare_exchange_weak::bool::relaxed_acquire+0xffff81ff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::bool::relaxed_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::bool::relaxed_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::bool::relaxed_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::bool::relaxed_relaxed+0x8> (ffff8105 <asm_test::compare_exchange_weak::bool::relaxed_relaxed+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a11, a10, 0
        and               a9, a11, a9
        ssl               a8
        sll               a11, a4
        or                a11, a9, a11
        ssl               a8
        sll               a12, a3
        or                a12, a9, a12
        wsr.scompare1     a12
        s32c1i            a11, a10, 0
        ssr               a8
        srl               a3, a11
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a11, a12, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        retw.n
3:
        l32r              a10, 58 <asm_test::compare_exchange_weak::bool::relaxed_relaxed+0x58> (a1f01d30 <asm_test::compare_exchange_weak::bool::relaxed_relaxed+0xa1f01d30>)
        l32r              a8, 5c <asm_test::compare_exchange_weak::bool::relaxed_relaxed+0x5c> (ff81ffff <asm_test::compare_exchange_weak::bool::relaxed_relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::compare_exchange_weak::bool::release_acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::bool::release_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::bool::release_acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::bool::release_acquire+0x8> (ffff8105 <asm_test::compare_exchange_weak::bool::release_acquire+0xffff8105>)
        bgeu              a8, a2, 3f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a11, a10, 0
        and               a9, a11, a9
        ssl               a8
        sll               a11, a4
        or                a11, a9, a11
        ssl               a8
        sll               a12, a3
        or                a12, a9, a12
        wsr.scompare1     a12
        s32c1i            a11, a10, 0
        ssr               a8
        srl               a3, a11
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a11, a12, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
        memw
        retw.n
3:
        l32r              a10, 60 <asm_test::compare_exchange_weak::bool::release_acquire+0x60> (ffffa1f0 <asm_test::compare_exchange_weak::bool::release_acquire+0xffffa1f0>)
        l32r              a8, fffc0064 <asm_test::compare_exchange_weak::bool::release_acquire+0xfffc0064>
        callx8            a8

.literal.asm_test::compare_exchange_weak::bool::release_relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::compare_exchange_weak::bool::release_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::bool::release_relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::compare_exchange_weak::bool::release_relaxed+0x8> (ffff8105 <asm_test::compare_exchange_weak::bool::release_relaxed+0xffff8105>)
        bgeu              a8, a2, 4f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi              a9, 255
        ssl               a8
        sll               a9, a9
        movi.n            a10, -1
        xor               a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a11, a10, 0
        and               a9, a11, a9
        ssl               a8
        sll               a11, a4
        or                a11, a9, a11
        ssl               a8
        sll               a12, a3
        or                a12, a9, a12
        wsr.scompare1     a12
        s32c1i            a11, a10, 0
        ssr               a8
        srl               a3, a11
        movi.n            a8, 1
        mov.n             a9, a8
        beq               a11, a12, 2f
        movi.n            a9, 0
2:
        xor               a2, a9, a8
3:
        retw.n
4:
        l32r              a10, 3b (ffa1f01d <asm_test::compare_exchange_weak::bool::release_relaxed+0xffa1f01d>)
        l32r              a8, 60 <asm_test::compare_exchange_weak::bool::release_relaxed+0x60> (ffff81ff <asm_test::compare_exchange_weak::bool::release_relaxed+0xffff81ff>)
        callx8            a8

.literal.asm_test::or::u8::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::or::u8::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::or::u8::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::or::u8::acqrel+0x8> (ffff8105 <asm_test::or::u8::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        or                a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, 50 <asm_test::or::u8::acqrel+0x50> (ffffa1f0 <asm_test::or::u8::acqrel+0xffffa1f0>)
        l32r              a8, fffc0054 <asm_test::or::u8::acqrel+0xfffc0054>
        callx8            a8

.literal.asm_test::or::u8::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::or::u8::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::or::u8::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::or::u8::seqcst+0x8> (ffff8105 <asm_test::or::u8::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        or                a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, 50 <asm_test::or::u8::seqcst+0x50> (ffffa1f0 <asm_test::or::u8::seqcst+0xffffa1f0>)
        l32r              a8, fffc0054 <asm_test::or::u8::seqcst+0xfffc0054>
        callx8            a8

.literal.asm_test::or::u8::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::or::u8::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::or::u8::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::or::u8::acquire+0x8> (ffff8105 <asm_test::or::u8::acquire+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        or                a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::or::u8::acquire+0xffa1f01d>)
        l32r              a8, 50 <asm_test::or::u8::acquire+0x50> (ffff81ff <asm_test::or::u8::acquire+0xffff81ff>)
        callx8            a8

.literal.asm_test::or::u8::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::or::u8::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::or::u8::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::or::u8::relaxed+0x8> (ffff8105 <asm_test::or::u8::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        or                a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        retw.n
5:
        l32r              a10, 48 <asm_test::or::u8::relaxed+0x48> (a1f01dff <asm_test::or::u8::relaxed+0xa1f01dff>)
        l32r              a8, 4c <asm_test::or::u8::relaxed+0x4c> (ff81ffff <asm_test::or::u8::relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::or::u8::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::or::u8::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::or::u8::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::or::u8::release+0x8> (ffff8105 <asm_test::or::u8::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        or                a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        retw.n
5:
        l32r              a10, 4b (ffa1f01d <asm_test::or::u8::release+0xffa1f01d>)
        l32r              a8, 50 <asm_test::or::u8::release+0x50> (ffff81ff <asm_test::or::u8::release+0xffff81ff>)
        callx8            a8

.literal.asm_test::or::u16::acqrel:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::or::u16::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::or::u16::acqrel+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::or::u16::acqrel+0x8> (ffff8105 <asm_test::or::u16::acqrel+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a8, 1b (8141b827 <asm_test::or::u16::acqrel+0x8141b827>)
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
        j                 4f
3:
        mov.n             a12, a13
        beqi              a14, 1, 5f
4:
        or                a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 3b
        mov.n             a14, a10
        j                 3b
5:
        memw
        retw.n
6:
        l32r              a10, 50 <asm_test::or::u16::acqrel+0x50> (ffffa1f0 <asm_test::or::u16::acqrel+0xffffa1f0>)
        l32r              a8, fffc0054 <asm_test::or::u16::acqrel+0xfffc0054>
        callx8            a8

.literal.asm_test::or::u16::seqcst:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::or::u16::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::or::u16::seqcst+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::or::u16::seqcst+0x8> (ffff8105 <asm_test::or::u16::seqcst+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a8, 1b (8141b827 <asm_test::or::u16::seqcst+0x8141b827>)
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
        j                 4f
3:
        mov.n             a12, a13
        beqi              a14, 1, 5f
4:
        or                a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 3b
        mov.n             a14, a10
        j                 3b
5:
        memw
        retw.n
6:
        l32r              a10, 50 <asm_test::or::u16::seqcst+0x50> (ffffa1f0 <asm_test::or::u16::seqcst+0xffffa1f0>)
        l32r              a8, fffc0054 <asm_test::or::u16::seqcst+0xfffc0054>
        callx8            a8

.literal.asm_test::or::u16::acquire:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::or::u16::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::or::u16::acquire+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::or::u16::acquire+0x8> (ffff8105 <asm_test::or::u16::acquire+0xffff8105>)
1:
        bgeu              a8, a2, 7f
2:
        l32r              a8, 1b (813eb827 <asm_test::or::u16::acquire+0x813eb827>)
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
        j                 4f
3:
        mov.n             a12, a13
        beqi              a14, 1, 5f
4:
        or                a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 3b
        mov.n             a14, a10
        j                 3b
5:
        memw
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::or::u16::acquire+0xffa1f01d>)
        l32r              a8, 50 <asm_test::or::u16::acquire+0x50> (ffff81ff <asm_test::or::u16::acquire+0xffff81ff>)
        callx8            a8

.literal.asm_test::or::u16::relaxed:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::or::u16::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::or::u16::relaxed+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::or::u16::relaxed+0x8> (ffff8105 <asm_test::or::u16::relaxed+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a8, 1b (813bb827 <asm_test::or::u16::relaxed+0x813bb827>)
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
        j                 4f
3:
        mov.n             a12, a13
        beqi              a14, 1, 5f
4:
        or                a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 3b
        mov.n             a14, a10
        j                 3b
5:
        retw.n
6:
        l32r              a10, 48 <asm_test::or::u16::relaxed+0x48> (a1f01dff <asm_test::or::u16::relaxed+0xa1f01dff>)
        l32r              a8, 4c <asm_test::or::u16::relaxed+0x4c> (ff81ffff <asm_test::or::u16::relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::or::u16::release:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::or::u16::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::or::u16::release+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::or::u16::release+0x8> (ffff8105 <asm_test::or::u16::release+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a8, 1b (813eb827 <asm_test::or::u16::release+0x813eb827>)
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
        j                 4f
3:
        mov.n             a12, a13
        beqi              a14, 1, 5f
4:
        or                a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 3b
        mov.n             a14, a10
        j                 3b
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::or::u16::release+0xffa1f01d>)
        l32r              a8, 50 <asm_test::or::u16::release+0x50> (ffff81ff <asm_test::or::u16::release+0xffff81ff>)
        callx8            a8

.literal.asm_test::or::u32::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::or::u32::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::or::u32::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::or::u32::acqrel+0x8> (ffff8105 <asm_test::or::u32::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 3f
2:
        mov.n             a10, a11
        beqi              a12, 1, 4f
3:
        or                a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 2b
        mov.n             a12, a8
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, fffc0038 <asm_test::or::u32::acqrel+0xfffc0038>
        l32r              a8, 5b (810000a1 <asm_test::or::u32::acqrel+0x810000a1>)
        callx8            a8

.literal.asm_test::or::u32::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::or::u32::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::or::u32::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::or::u32::seqcst+0x8> (ffff8105 <asm_test::or::u32::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 3f
2:
        mov.n             a10, a11
        beqi              a12, 1, 4f
3:
        or                a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 2b
        mov.n             a12, a8
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, fffc0038 <asm_test::or::u32::seqcst+0xfffc0038>
        l32r              a8, 5b (810000a1 <asm_test::or::u32::seqcst+0x810000a1>)
        callx8            a8

.literal.asm_test::or::u32::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::or::u32::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::or::u32::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::or::u32::acquire+0x8> (ffff8105 <asm_test::or::u32::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 3f
2:
        mov.n             a10, a11
        beqi              a12, 1, 4f
3:
        or                a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 2b
        mov.n             a12, a8
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, 34 <asm_test::or::u32::acquire+0x34> (ffffa1f0 <asm_test::or::u32::acquire+0xffffa1f0>)
        l32r              a8, fffc0038 <asm_test::or::u32::acquire+0xfffc0038>
        callx8            a8

.literal.asm_test::or::u32::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::or::u32::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::or::u32::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::or::u32::relaxed+0x8> (ffff8105 <asm_test::or::u32::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 3f
2:
        mov.n             a10, a11
        beqi              a12, 1, 4f
3:
        or                a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 2b
        mov.n             a12, a8
        j                 2b
4:
        retw.n
5:
        l32r              a10, 4b (ffa1f01d <asm_test::or::u32::relaxed+0xffa1f01d>)
        l32r              a8, 34 <asm_test::or::u32::relaxed+0x34> (ffff81ff <asm_test::or::u32::relaxed+0xffff81ff>)
        callx8            a8

.literal.asm_test::or::u32::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::or::u32::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::or::u32::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::or::u32::release+0x8> (ffff8105 <asm_test::or::u32::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 3f
2:
        mov.n             a10, a11
        beqi              a12, 1, 4f
3:
        or                a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 2b
        mov.n             a12, a8
        j                 2b
4:
        retw.n
5:
        l32r              a10, 34 <asm_test::or::u32::release+0x34> (ffffa1f0 <asm_test::or::u32::release+0xffffa1f0>)
        l32r              a8, fffc0038 <asm_test::or::u32::release+0xfffc0038>
        callx8            a8

.literal.asm_test::or::bool::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::or::bool::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::or::bool::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::or::bool::acqrel+0x8> (ffff8105 <asm_test::or::bool::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a8, a3
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        or                a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, 48 <asm_test::or::bool::acqrel+0x48> (a1f01d00 <asm_test::or::bool::acqrel+0xa1f01d00>)
        l32r              a8, 4c <asm_test::or::bool::acqrel+0x4c> (ff81ffff <asm_test::or::bool::acqrel+0xff81ffff>)
        callx8            a8

.literal.asm_test::or::bool::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::or::bool::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::or::bool::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::or::bool::seqcst+0x8> (ffff8105 <asm_test::or::bool::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a8, a3
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        or                a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, 48 <asm_test::or::bool::seqcst+0x48> (a1f01d00 <asm_test::or::bool::seqcst+0xa1f01d00>)
        l32r              a8, 4c <asm_test::or::bool::seqcst+0x4c> (ff81ffff <asm_test::or::bool::seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::or::bool::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::or::bool::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::or::bool::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::or::bool::acquire+0x8> (ffff8105 <asm_test::or::bool::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a8, a3
        movi.n            a9, -4
        and               a9, a2, a9
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        or                a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, fffc0048 <asm_test::or::bool::acquire+0xfffc0048>
        l32r              a8, 5b (810000a1 <asm_test::or::bool::acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::or::bool::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::or::bool::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::or::bool::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::or::bool::relaxed+0x8> (ffff8105 <asm_test::or::bool::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a8, a3
        movi.n            a9, -4
        and               a9, a2, a9
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        or                a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        retw.n
5:
        l32r              a10, 44 <asm_test::or::bool::relaxed+0x44> (ffffa1f0 <asm_test::or::bool::relaxed+0xffffa1f0>)
        l32r              a8, fffc0048 <asm_test::or::bool::relaxed+0xfffc0048>
        callx8            a8

.literal.asm_test::or::bool::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::or::bool::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::or::bool::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::or::bool::release+0x8> (ffff8105 <asm_test::or::bool::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a8, a3
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        or                a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        retw.n
5:
        l32r              a10, fffc0048 <asm_test::or::bool::release+0xfffc0048>
        l32r              a8, 5b (810000a1 <asm_test::or::bool::release+0x810000a1>)
        callx8            a8

.literal.asm_test::add::u8::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::add::u8::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::add::u8::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::add::u8::acqrel+0x8> (ffff8105 <asm_test::add::u8::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a15
        beqi              a7, 1, 4f
3:
        and               a15, a14, a10
        add.n             a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 2b
        mov.n             a7, a12
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, fffc0064 <asm_test::add::u8::acqrel+0xfffc0064>
        l32r              a8, 5b (810000a1 <asm_test::add::u8::acqrel+0x810000a1>)
        callx8            a8

.literal.asm_test::add::u8::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::add::u8::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::add::u8::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::add::u8::seqcst+0x8> (ffff8105 <asm_test::add::u8::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a15
        beqi              a7, 1, 4f
3:
        and               a15, a14, a10
        add.n             a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 2b
        mov.n             a7, a12
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, fffc0064 <asm_test::add::u8::seqcst+0xfffc0064>
        l32r              a8, 5b (810000a1 <asm_test::add::u8::seqcst+0x810000a1>)
        callx8            a8

.literal.asm_test::add::u8::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::add::u8::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::add::u8::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::add::u8::acquire+0x8> (ffff8105 <asm_test::add::u8::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a15
        beqi              a7, 1, 4f
3:
        and               a15, a14, a10
        add.n             a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 2b
        mov.n             a7, a12
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, 60 <asm_test::add::u8::acquire+0x60> (ffffa1f0 <asm_test::add::u8::acquire+0xffffa1f0>)
        l32r              a8, fffc0064 <asm_test::add::u8::acquire+0xfffc0064>
        callx8            a8

.literal.asm_test::add::u8::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::add::u8::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::add::u8::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::add::u8::relaxed+0x8> (ffff8105 <asm_test::add::u8::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a15
        beqi              a7, 1, 4f
3:
        and               a15, a14, a10
        add.n             a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 2b
        mov.n             a7, a12
        j                 2b
4:
        retw.n
5:
        l32r              a10, 4b (ffa1f01d <asm_test::add::u8::relaxed+0xffa1f01d>)
        l32r              a8, 60 <asm_test::add::u8::relaxed+0x60> (ffff81ff <asm_test::add::u8::relaxed+0xffff81ff>)
        callx8            a8

.literal.asm_test::add::u8::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::add::u8::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::add::u8::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::add::u8::release+0x8> (ffff8105 <asm_test::add::u8::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a15
        beqi              a7, 1, 4f
3:
        and               a15, a14, a10
        add.n             a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 2b
        mov.n             a7, a12
        j                 2b
4:
        retw.n
5:
        l32r              a10, 60 <asm_test::add::u8::release+0x60> (ffffa1f0 <asm_test::add::u8::release+0xffffa1f0>)
        l32r              a8, fffc0064 <asm_test::add::u8::release+0xfffc0064>
        callx8            a8

.literal.asm_test::add::u16::acqrel:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::add::u16::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::add::u16::acqrel+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::add::u16::acqrel+0x8> (ffff8105 <asm_test::add::u16::acqrel+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a9, 1b (9154b827 <asm_test::add::u16::acqrel+0x9154b827>)
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
        j                 4f
3:
        mov.n             a14, a15
        beqi              a7, 1, 5f
4:
        and               a15, a14, a10
        add.n             a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 3b
        mov.n             a7, a12
        j                 3b
5:
        memw
        retw.n
6:
        l32r              a10, fffc0064 <asm_test::add::u16::acqrel+0xfffc0064>
        l32r              a8, 6b (810000a1 <asm_test::add::u16::acqrel+0x810000a1>)
        callx8            a8

.literal.asm_test::add::u16::seqcst:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::add::u16::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::add::u16::seqcst+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::add::u16::seqcst+0x8> (ffff8105 <asm_test::add::u16::seqcst+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a9, 1b (9154b827 <asm_test::add::u16::seqcst+0x9154b827>)
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
        j                 4f
3:
        mov.n             a14, a15
        beqi              a7, 1, 5f
4:
        and               a15, a14, a10
        add.n             a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 3b
        mov.n             a7, a12
        j                 3b
5:
        memw
        retw.n
6:
        l32r              a10, fffc0064 <asm_test::add::u16::seqcst+0xfffc0064>
        l32r              a8, 6b (810000a1 <asm_test::add::u16::seqcst+0x810000a1>)
        callx8            a8

.literal.asm_test::add::u16::acquire:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::add::u16::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::add::u16::acquire+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::add::u16::acquire+0x8> (ffff8105 <asm_test::add::u16::acquire+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a9, 1b (9151b827 <asm_test::add::u16::acquire+0x9151b827>)
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
        j                 4f
3:
        mov.n             a14, a15
        beqi              a7, 1, 5f
4:
        and               a15, a14, a10
        add.n             a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 3b
        mov.n             a7, a12
        j                 3b
5:
        memw
        retw.n
6:
        l32r              a10, 60 <asm_test::add::u16::acquire+0x60> (ffffa1f0 <asm_test::add::u16::acquire+0xffffa1f0>)
        l32r              a8, fffc0064 <asm_test::add::u16::acquire+0xfffc0064>
        callx8            a8

.literal.asm_test::add::u16::relaxed:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::add::u16::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::add::u16::relaxed+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::add::u16::relaxed+0x8> (ffff8105 <asm_test::add::u16::relaxed+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a9, 1b (914eb827 <asm_test::add::u16::relaxed+0x914eb827>)
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
        j                 4f
3:
        mov.n             a14, a15
        beqi              a7, 1, 5f
4:
        and               a15, a14, a10
        add.n             a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 3b
        mov.n             a7, a12
        j                 3b
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::add::u16::relaxed+0xffa1f01d>)
        l32r              a8, 60 <asm_test::add::u16::relaxed+0x60> (ffff81ff <asm_test::add::u16::relaxed+0xffff81ff>)
        callx8            a8

.literal.asm_test::add::u16::release:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::add::u16::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::add::u16::release+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::add::u16::release+0x8> (ffff8105 <asm_test::add::u16::release+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a9, 1b (9151b827 <asm_test::add::u16::release+0x9151b827>)
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
        j                 4f
3:
        mov.n             a14, a15
        beqi              a7, 1, 5f
4:
        and               a15, a14, a10
        add.n             a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 3b
        mov.n             a7, a12
        j                 3b
5:
        retw.n
6:
        l32r              a10, 60 <asm_test::add::u16::release+0x60> (ffffa1f0 <asm_test::add::u16::release+0xffffa1f0>)
        l32r              a8, fffc0064 <asm_test::add::u16::release+0xfffc0064>
        callx8            a8

.literal.asm_test::add::u32::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::add::u32::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::add::u32::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::add::u32::acqrel+0x8> (ffff8105 <asm_test::add::u32::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 3f
2:
        mov.n             a10, a11
        beqi              a12, 1, 4f
3:
        add.n             a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 2b
        mov.n             a12, a8
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, 34 <asm_test::add::u32::acqrel+0x34> (a1f01d00 <asm_test::add::u32::acqrel+0xa1f01d00>)
        l32r              a8, 38 <asm_test::add::u32::acqrel+0x38> (ff81ffff <asm_test::add::u32::acqrel+0xff81ffff>)
        callx8            a8

.literal.asm_test::add::u32::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::add::u32::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::add::u32::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::add::u32::seqcst+0x8> (ffff8105 <asm_test::add::u32::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 3f
2:
        mov.n             a10, a11
        beqi              a12, 1, 4f
3:
        add.n             a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 2b
        mov.n             a12, a8
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, 34 <asm_test::add::u32::seqcst+0x34> (a1f01d00 <asm_test::add::u32::seqcst+0xa1f01d00>)
        l32r              a8, 38 <asm_test::add::u32::seqcst+0x38> (ff81ffff <asm_test::add::u32::seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::add::u32::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::add::u32::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::add::u32::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::add::u32::acquire+0x8> (ffff8105 <asm_test::add::u32::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 3f
2:
        mov.n             a10, a11
        beqi              a12, 1, 4f
3:
        add.n             a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 2b
        mov.n             a12, a8
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, fffc0034 <asm_test::add::u32::acquire+0xfffc0034>
        l32r              a8, 5b (810000a1 <asm_test::add::u32::acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::add::u32::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::add::u32::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::add::u32::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::add::u32::relaxed+0x8> (ffff8105 <asm_test::add::u32::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 3f
2:
        mov.n             a10, a11
        beqi              a12, 1, 4f
3:
        add.n             a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 2b
        mov.n             a12, a8
        j                 2b
4:
        retw.n
5:
        l32r              a10, 30 <asm_test::add::u32::relaxed+0x30> (ffffa1f0 <asm_test::add::u32::relaxed+0xffffa1f0>)
        l32r              a8, fffc0034 <asm_test::add::u32::relaxed+0xfffc0034>
        callx8            a8

.literal.asm_test::add::u32::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::add::u32::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::add::u32::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::add::u32::release+0x8> (ffff8105 <asm_test::add::u32::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 3f
2:
        mov.n             a10, a11
        beqi              a12, 1, 4f
3:
        add.n             a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 2b
        mov.n             a12, a8
        j                 2b
4:
        retw.n
5:
        l32r              a10, fffc0034 <asm_test::add::u32::release+0xfffc0034>
        l32r              a8, 5b (810000a1 <asm_test::add::u32::release+0x810000a1>)
        callx8            a8

.literal.asm_test::and::u8::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::and::u8::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::and::u8::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::and::u8::acqrel+0x8> (ffff8105 <asm_test::and::u8::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        and               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, 5c <asm_test::and::u8::acqrel+0x5c> (a1f01d00 <asm_test::and::u8::acqrel+0xa1f01d00>)
        l32r              a8, 60 <asm_test::and::u8::acqrel+0x60> (ff81ffff <asm_test::and::u8::acqrel+0xff81ffff>)
        callx8            a8

.literal.asm_test::and::u8::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::and::u8::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::and::u8::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::and::u8::seqcst+0x8> (ffff8105 <asm_test::and::u8::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        and               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, 5c <asm_test::and::u8::seqcst+0x5c> (a1f01d00 <asm_test::and::u8::seqcst+0xa1f01d00>)
        l32r              a8, 60 <asm_test::and::u8::seqcst+0x60> (ff81ffff <asm_test::and::u8::seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::and::u8::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::and::u8::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::and::u8::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::and::u8::acquire+0x8> (ffff8105 <asm_test::and::u8::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        and               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, fffc005c <asm_test::and::u8::acquire+0xfffc005c>
        l32r              a8, 5b (810000a1 <asm_test::and::u8::acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::and::u8::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::and::u8::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::and::u8::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::and::u8::relaxed+0x8> (ffff8105 <asm_test::and::u8::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        and               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        retw.n
5:
        l32r              a10, 58 <asm_test::and::u8::relaxed+0x58> (ffffa1f0 <asm_test::and::u8::relaxed+0xffffa1f0>)
        l32r              a8, fffc005c <asm_test::and::u8::relaxed+0xfffc005c>
        callx8            a8

.literal.asm_test::and::u8::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::and::u8::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::and::u8::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::and::u8::release+0x8> (ffff8105 <asm_test::and::u8::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        and               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        retw.n
5:
        l32r              a10, fffc005c <asm_test::and::u8::release+0xfffc005c>
        l32r              a8, 5b (810000a1 <asm_test::and::u8::release+0x810000a1>)
        callx8            a8

.literal.asm_test::and::u16::acqrel:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::and::u16::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::and::u16::acqrel+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::and::u16::acqrel+0x8> (ffff8105 <asm_test::and::u16::acqrel+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a8, 1b (814fb827 <asm_test::and::u16::acqrel+0x814fb827>)
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
        j                 4f
3:
        mov.n             a12, a13
        beqi              a14, 1, 5f
4:
        and               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 3b
        mov.n             a14, a10
        j                 3b
5:
        memw
        retw.n
6:
        l32r              a10, 5c <asm_test::and::u16::acqrel+0x5c> (a1f01d00 <asm_test::and::u16::acqrel+0xa1f01d00>)
        l32r              a8, 60 <asm_test::and::u16::acqrel+0x60> (ff81ffff <asm_test::and::u16::acqrel+0xff81ffff>)
        callx8            a8

.literal.asm_test::and::u16::seqcst:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::and::u16::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::and::u16::seqcst+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::and::u16::seqcst+0x8> (ffff8105 <asm_test::and::u16::seqcst+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a8, 1b (814fb827 <asm_test::and::u16::seqcst+0x814fb827>)
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
        j                 4f
3:
        mov.n             a12, a13
        beqi              a14, 1, 5f
4:
        and               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 3b
        mov.n             a14, a10
        j                 3b
5:
        memw
        retw.n
6:
        l32r              a10, 5c <asm_test::and::u16::seqcst+0x5c> (a1f01d00 <asm_test::and::u16::seqcst+0xa1f01d00>)
        l32r              a8, 60 <asm_test::and::u16::seqcst+0x60> (ff81ffff <asm_test::and::u16::seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::and::u16::acquire:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::and::u16::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::and::u16::acquire+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::and::u16::acquire+0x8> (ffff8105 <asm_test::and::u16::acquire+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a8, 1b (814cb827 <asm_test::and::u16::acquire+0x814cb827>)
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
        j                 4f
3:
        mov.n             a12, a13
        beqi              a14, 1, 5f
4:
        and               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 3b
        mov.n             a14, a10
        j                 3b
5:
        memw
        retw.n
6:
        l32r              a10, fffc005c <asm_test::and::u16::acquire+0xfffc005c>
        l32r              a8, 6b (810000a1 <asm_test::and::u16::acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::and::u16::relaxed:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::and::u16::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::and::u16::relaxed+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::and::u16::relaxed+0x8> (ffff8105 <asm_test::and::u16::relaxed+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a8, 1b (8149b827 <asm_test::and::u16::relaxed+0x8149b827>)
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
        j                 4f
3:
        mov.n             a12, a13
        beqi              a14, 1, 5f
4:
        and               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 3b
        mov.n             a14, a10
        j                 3b
5:
        retw.n
6:
        l32r              a10, 58 <asm_test::and::u16::relaxed+0x58> (ffffa1f0 <asm_test::and::u16::relaxed+0xffffa1f0>)
        l32r              a8, fffc005c <asm_test::and::u16::relaxed+0xfffc005c>
        callx8            a8

.literal.asm_test::and::u16::release:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::and::u16::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::and::u16::release+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::and::u16::release+0x8> (ffff8105 <asm_test::and::u16::release+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a8, 1b (814cb827 <asm_test::and::u16::release+0x814cb827>)
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
        j                 4f
3:
        mov.n             a12, a13
        beqi              a14, 1, 5f
4:
        and               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 3b
        mov.n             a14, a10
        j                 3b
5:
        retw.n
6:
        l32r              a10, fffc005c <asm_test::and::u16::release+0xfffc005c>
        l32r              a8, 6b (810000a1 <asm_test::and::u16::release+0x810000a1>)
        callx8            a8

.literal.asm_test::and::u32::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::and::u32::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::and::u32::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::and::u32::acqrel+0x8> (ffff8105 <asm_test::and::u32::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 3f
2:
        mov.n             a10, a11
        beqi              a12, 1, 4f
3:
        and               a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 2b
        mov.n             a12, a8
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, fffc0038 <asm_test::and::u32::acqrel+0xfffc0038>
        l32r              a8, 5b (810000a1 <asm_test::and::u32::acqrel+0x810000a1>)
        callx8            a8

.literal.asm_test::and::u32::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::and::u32::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::and::u32::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::and::u32::seqcst+0x8> (ffff8105 <asm_test::and::u32::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 3f
2:
        mov.n             a10, a11
        beqi              a12, 1, 4f
3:
        and               a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 2b
        mov.n             a12, a8
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, fffc0038 <asm_test::and::u32::seqcst+0xfffc0038>
        l32r              a8, 5b (810000a1 <asm_test::and::u32::seqcst+0x810000a1>)
        callx8            a8

.literal.asm_test::and::u32::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::and::u32::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::and::u32::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::and::u32::acquire+0x8> (ffff8105 <asm_test::and::u32::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 3f
2:
        mov.n             a10, a11
        beqi              a12, 1, 4f
3:
        and               a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 2b
        mov.n             a12, a8
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, 34 <asm_test::and::u32::acquire+0x34> (ffffa1f0 <asm_test::and::u32::acquire+0xffffa1f0>)
        l32r              a8, fffc0038 <asm_test::and::u32::acquire+0xfffc0038>
        callx8            a8

.literal.asm_test::and::u32::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::and::u32::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::and::u32::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::and::u32::relaxed+0x8> (ffff8105 <asm_test::and::u32::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 3f
2:
        mov.n             a10, a11
        beqi              a12, 1, 4f
3:
        and               a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 2b
        mov.n             a12, a8
        j                 2b
4:
        retw.n
5:
        l32r              a10, 4b (ffa1f01d <asm_test::and::u32::relaxed+0xffa1f01d>)
        l32r              a8, 34 <asm_test::and::u32::relaxed+0x34> (ffff81ff <asm_test::and::u32::relaxed+0xffff81ff>)
        callx8            a8

.literal.asm_test::and::u32::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::and::u32::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::and::u32::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::and::u32::release+0x8> (ffff8105 <asm_test::and::u32::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 3f
2:
        mov.n             a10, a11
        beqi              a12, 1, 4f
3:
        and               a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 2b
        mov.n             a12, a8
        j                 2b
4:
        retw.n
5:
        l32r              a10, 34 <asm_test::and::u32::release+0x34> (ffffa1f0 <asm_test::and::u32::release+0xffffa1f0>)
        l32r              a8, fffc0038 <asm_test::and::u32::release+0xfffc0038>
        callx8            a8

.literal.asm_test::and::bool::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::and::bool::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::and::bool::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::and::bool::acqrel+0x8> (ffff8105 <asm_test::and::bool::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a9, a3
        movi              a10, 255
        ssl               a8
        sll               a8, a10
        movi.n            a10, -1
        xor               a8, a8, a10
        or                a8, a9, a8
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        and               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, fffc005c <asm_test::and::bool::acqrel+0xfffc005c>
        l32r              a8, 5b (810000a1 <asm_test::and::bool::acqrel+0x810000a1>)
        callx8            a8

.literal.asm_test::and::bool::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::and::bool::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::and::bool::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::and::bool::seqcst+0x8> (ffff8105 <asm_test::and::bool::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a9, a3
        movi              a10, 255
        ssl               a8
        sll               a8, a10
        movi.n            a10, -1
        xor               a8, a8, a10
        or                a8, a9, a8
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        and               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, fffc005c <asm_test::and::bool::seqcst+0xfffc005c>
        l32r              a8, 5b (810000a1 <asm_test::and::bool::seqcst+0x810000a1>)
        callx8            a8

.literal.asm_test::and::bool::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::and::bool::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::and::bool::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::and::bool::acquire+0x8> (ffff8105 <asm_test::and::bool::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a9, a3
        movi              a10, 255
        ssl               a8
        sll               a8, a10
        movi.n            a10, -1
        xor               a8, a8, a10
        or                a8, a9, a8
        movi.n            a9, -4
        and               a9, a2, a9
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        and               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, 58 <asm_test::and::bool::acquire+0x58> (ffffa1f0 <asm_test::and::bool::acquire+0xffffa1f0>)
        l32r              a8, fffc005c <asm_test::and::bool::acquire+0xfffc005c>
        callx8            a8

.literal.asm_test::and::bool::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::and::bool::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::and::bool::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::and::bool::relaxed+0x8> (ffff8105 <asm_test::and::bool::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a9, a3
        movi              a10, 255
        ssl               a8
        sll               a8, a10
        movi.n            a10, -1
        xor               a8, a8, a10
        or                a8, a9, a8
        movi.n            a9, -4
        and               a9, a2, a9
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        and               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        retw.n
5:
        l32r              a10, 4b (ffa1f01d <asm_test::and::bool::relaxed+0xffa1f01d>)
        l32r              a8, 58 <asm_test::and::bool::relaxed+0x58> (ffff81ff <asm_test::and::bool::relaxed+0xffff81ff>)
        callx8            a8

.literal.asm_test::and::bool::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::and::bool::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::and::bool::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::and::bool::release+0x8> (ffff8105 <asm_test::and::bool::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a9, a3
        movi              a10, 255
        ssl               a8
        sll               a8, a10
        movi.n            a10, -1
        xor               a8, a8, a10
        or                a8, a9, a8
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        and               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        retw.n
5:
        l32r              a10, 58 <asm_test::and::bool::release+0x58> (ffffa1f0 <asm_test::and::bool::release+0xffffa1f0>)
        l32r              a8, fffc005c <asm_test::and::bool::release+0xfffc005c>
        callx8            a8

.literal.asm_test::neg::u8::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::neg::u8::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::neg::u8::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::neg::u8::acqrel+0x8> (ffff8105 <asm_test::neg::u8::acqrel+0xffff8105>)
        bltu              a2, a8, 5f
1:
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
        j                 3f
2:
        ssr               a9
        srl               a14, a14
        and               a15, a15, a13
        memw
        bnez              a15, 4f
3:
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
        beq               a14, a7, 2b
        mov.n             a15, a12
        j                 2b
4:
        retw.n
5:
        l32r              a10, fffc0078 <asm_test::neg::u8::acqrel+0xfffc0078>
        l32r              a8, 5b (810000a1 <asm_test::neg::u8::acqrel+0x810000a1>)
        callx8            a8

.literal.asm_test::neg::u8::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::neg::u8::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::neg::u8::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::neg::u8::seqcst+0x8> (ffff8105 <asm_test::neg::u8::seqcst+0xffff8105>)
        bltu              a2, a8, 5f
1:
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
        j                 3f
2:
        ssr               a9
        srl               a14, a14
        and               a15, a15, a13
        memw
        bnez              a15, 4f
3:
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
        beq               a14, a7, 2b
        mov.n             a15, a12
        j                 2b
4:
        retw.n
5:
        l32r              a10, fffc0078 <asm_test::neg::u8::seqcst+0xfffc0078>
        l32r              a8, 5b (810000a1 <asm_test::neg::u8::seqcst+0x810000a1>)
        callx8            a8

.literal.asm_test::neg::u8::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::neg::u8::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::neg::u8::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::neg::u8::acquire+0x8> (ffff8105 <asm_test::neg::u8::acquire+0xffff8105>)
        bltu              a2, a8, 5f
1:
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
        j                 3f
2:
        ssr               a9
        srl               a14, a14
        and               a15, a15, a13
        memw
        bnez              a15, 4f
3:
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
        beq               a14, a7, 2b
        mov.n             a15, a12
        j                 2b
4:
        retw.n
5:
        l32r              a10, 74 <asm_test::neg::u8::acquire+0x74> (ffffa1f0 <asm_test::neg::u8::acquire+0xffffa1f0>)
        l32r              a8, fffc0078 <asm_test::neg::u8::acquire+0xfffc0078>
        callx8            a8

.literal.asm_test::neg::u8::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::neg::u8::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::neg::u8::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::neg::u8::relaxed+0x8> (ffff8105 <asm_test::neg::u8::relaxed+0xffff8105>)
        bltu              a2, a8, 5f
1:
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
        j                 3f
2:
        ssr               a9
        srl               a14, a14
        and               a15, a15, a13
        bnez              a15, 4f
3:
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
        beq               a14, a7, 2b
        mov.n             a15, a12
        j                 2b
4:
        retw.n
5:
        l32r              a10, 4b (ffa1f01d <asm_test::neg::u8::relaxed+0xffa1f01d>)
        l32r              a8, 74 <asm_test::neg::u8::relaxed+0x74> (ffff81ff <asm_test::neg::u8::relaxed+0xffff81ff>)
        callx8            a8

.literal.asm_test::neg::u8::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::neg::u8::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::neg::u8::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::neg::u8::release+0x8> (ffff8105 <asm_test::neg::u8::release+0xffff8105>)
        bltu              a2, a8, 5f
1:
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
        j                 3f
2:
        ssr               a9
        srl               a14, a14
        and               a15, a15, a13
        bnez              a15, 4f
3:
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
        beq               a14, a7, 2b
        mov.n             a15, a12
        j                 2b
4:
        retw.n
5:
        l32r              a10, 74 <asm_test::neg::u8::release+0x74> (ffffa1f0 <asm_test::neg::u8::release+0xffffa1f0>)
        l32r              a8, fffc0078 <asm_test::neg::u8::release+0xfffc0078>
        callx8            a8

.literal.asm_test::neg::u16::acqrel:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 28, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::neg::u16::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::neg::u16::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::neg::u16::acqrel+0x8> (ffff8105 <asm_test::neg::u16::acqrel+0xffff8105>)
        bltu              a2, a8, 6f
1:
        l16ui             a13, a2, 0
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, -1
        movi.n            a10, -4
        and               a10, a2, a10
        movi.n            a11, 0
        movi.n            a12, 1
        j                 4f
2:
        ssr               a8
        srl               a13, a13
        and               a14, a14, a12
        memw
3:
        bnez              a14, 5f
4:
        l32r              a15, 3b (f103ee56 <asm_test::neg::u16::acqrel+0xf103ee56>)
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
        beq               a13, a15, 2b
        mov.n             a14, a11
        j                 2b
5:
        retw.n
6:
        l32r              a10, fffc0078 <asm_test::neg::u16::acqrel+0xfffc0078>
        l32r              a8, 6b (810000a1 <asm_test::neg::u16::acqrel+0x810000a1>)
        callx8            a8

.literal.asm_test::neg::u16::seqcst:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 28, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::neg::u16::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::neg::u16::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::neg::u16::seqcst+0x8> (ffff8105 <asm_test::neg::u16::seqcst+0xffff8105>)
        bltu              a2, a8, 6f
1:
        l16ui             a13, a2, 0
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, -1
        movi.n            a10, -4
        and               a10, a2, a10
        movi.n            a11, 0
        movi.n            a12, 1
        j                 4f
2:
        ssr               a8
        srl               a13, a13
        and               a14, a14, a12
        memw
3:
        bnez              a14, 5f
4:
        l32r              a15, 3b (f103ee56 <asm_test::neg::u16::seqcst+0xf103ee56>)
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
        beq               a13, a15, 2b
        mov.n             a14, a11
        j                 2b
5:
        retw.n
6:
        l32r              a10, fffc0078 <asm_test::neg::u16::seqcst+0xfffc0078>
        l32r              a8, 6b (810000a1 <asm_test::neg::u16::seqcst+0x810000a1>)
        callx8            a8

.literal.asm_test::neg::u16::acquire:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 28, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::neg::u16::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::neg::u16::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::neg::u16::acquire+0x8> (ffff8105 <asm_test::neg::u16::acquire+0xffff8105>)
        bltu              a2, a8, 6f
1:
        l16ui             a13, a2, 0
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, -1
        movi.n            a10, -4
        and               a10, a2, a10
        movi.n            a11, 0
        movi.n            a12, 1
        j                 4f
2:
        ssr               a8
        srl               a13, a13
        and               a14, a14, a12
        memw
3:
        bnez              a14, 5f
4:
        l32r              a15, 3b (f103be56 <asm_test::neg::u16::acquire+0xf103be56>)
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
        beq               a13, a15, 2b
        mov.n             a14, a11
        j                 2b
5:
        retw.n
6:
        l32r              a10, 74 <asm_test::neg::u16::acquire+0x74> (ffffa1f0 <asm_test::neg::u16::acquire+0xffffa1f0>)
        l32r              a8, fffc0078 <asm_test::neg::u16::acquire+0xfffc0078>
        callx8            a8

.literal.asm_test::neg::u16::relaxed:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 28, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::neg::u16::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::neg::u16::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::neg::u16::relaxed+0x8> (ffff8105 <asm_test::neg::u16::relaxed+0xffff8105>)
        bltu              a2, a8, 5f
1:
        l16ui             a13, a2, 0
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, -1
        movi.n            a10, -4
        and               a10, a2, a10
        movi.n            a11, 0
        movi.n            a12, 1
        j                 3f
2:
        ssr               a8
        srl               a13, a13
        and               a14, a14, a12
        bnez              a14, 4f
3:
        l32r              a15, fffc0034 <asm_test::neg::u16::relaxed+0xfffc0034>
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
        beq               a13, a15, 2b
        mov.n             a14, a11
        j                 2b
4:
        retw.n
5:
        l32r              a10, 4b (ffa1f01d <asm_test::neg::u16::relaxed+0xffa1f01d>)
        l32r              a8, 74 <asm_test::neg::u16::relaxed+0x74> (ffff81ff <asm_test::neg::u16::relaxed+0xffff81ff>)
        callx8            a8

.literal.asm_test::neg::u16::release:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 28, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::neg::u16::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::neg::u16::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::neg::u16::release+0x8> (ffff8105 <asm_test::neg::u16::release+0xffff8105>)
        bltu              a2, a8, 5f
1:
        l16ui             a13, a2, 0
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, -1
        movi.n            a10, -4
        and               a10, a2, a10
        movi.n            a11, 0
        movi.n            a12, 1
        j                 3f
2:
        ssr               a8
        srl               a13, a13
        and               a14, a14, a12
        bnez              a14, 4f
3:
        l32r              a15, fffc0034 <asm_test::neg::u16::release+0xfffc0034>
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
        beq               a13, a15, 2b
        mov.n             a14, a11
        j                 2b
4:
        retw.n
5:
        l32r              a10, 74 <asm_test::neg::u16::release+0x74> (ffffa1f0 <asm_test::neg::u16::release+0xffffa1f0>)
        l32r              a8, fffc0078 <asm_test::neg::u16::release+0xfffc0078>
        callx8            a8

.literal.asm_test::neg::u32::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::neg::u32::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::neg::u32::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::neg::u32::acqrel+0x8> (ffff8105 <asm_test::neg::u32::acqrel+0xffff8105>)
        bltu              a2, a8, 5f
1:
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 3f
2:
        memw
        mov.n             a10, a11
        beqi              a12, 1, 4f
3:
        memw
        neg               a11, a10
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 2b
        mov.n             a12, a8
        j                 2b
4:
        retw.n
5:
        l32r              a10, fffc0038 <asm_test::neg::u32::acqrel+0xfffc0038>
        l32r              a8, 5b (810000a1 <asm_test::neg::u32::acqrel+0x810000a1>)
        callx8            a8

.literal.asm_test::neg::u32::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::neg::u32::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::neg::u32::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::neg::u32::seqcst+0x8> (ffff8105 <asm_test::neg::u32::seqcst+0xffff8105>)
        bltu              a2, a8, 5f
1:
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 3f
2:
        memw
        mov.n             a10, a11
        beqi              a12, 1, 4f
3:
        memw
        neg               a11, a10
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 2b
        mov.n             a12, a8
        j                 2b
4:
        retw.n
5:
        l32r              a10, fffc0038 <asm_test::neg::u32::seqcst+0xfffc0038>
        l32r              a8, 5b (810000a1 <asm_test::neg::u32::seqcst+0x810000a1>)
        callx8            a8

.literal.asm_test::neg::u32::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::neg::u32::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::neg::u32::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::neg::u32::acquire+0x8> (ffff8105 <asm_test::neg::u32::acquire+0xffff8105>)
        bltu              a2, a8, 5f
1:
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 3f
2:
        memw
        mov.n             a10, a11
        beqi              a12, 1, 4f
3:
        neg               a11, a10
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 2b
        mov.n             a12, a8
        j                 2b
4:
        retw.n
5:
        l32r              a10, 34 <asm_test::neg::u32::acquire+0x34> (ffffa1f0 <asm_test::neg::u32::acquire+0xffffa1f0>)
        l32r              a8, fffc0038 <asm_test::neg::u32::acquire+0xfffc0038>
        callx8            a8

.literal.asm_test::neg::u32::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::neg::u32::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::neg::u32::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::neg::u32::relaxed+0x8> (ffff8105 <asm_test::neg::u32::relaxed+0xffff8105>)
        bltu              a2, a8, 5f
1:
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 3f
2:
        mov.n             a10, a11
        beqi              a12, 1, 4f
3:
        neg               a11, a10
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 2b
        mov.n             a12, a8
        j                 2b
4:
        retw.n
5:
        l32r              a10, 4b (ffa1f01d <asm_test::neg::u32::relaxed+0xffa1f01d>)
        l32r              a8, 34 <asm_test::neg::u32::relaxed+0x34> (ffff81ff <asm_test::neg::u32::relaxed+0xffff81ff>)
        callx8            a8

.literal.asm_test::neg::u32::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::neg::u32::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::neg::u32::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::neg::u32::release+0x8> (ffff8105 <asm_test::neg::u32::release+0xffff8105>)
        bltu              a2, a8, 5f
1:
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 3f
2:
        mov.n             a10, a11
        beqi              a12, 1, 4f
3:
        memw
        neg               a11, a10
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 2b
        mov.n             a12, a8
        j                 2b
4:
        retw.n
5:
        l32r              a10, 34 <asm_test::neg::u32::release+0x34> (ffffa1f0 <asm_test::neg::u32::release+0xffffa1f0>)
        l32r              a8, fffc0038 <asm_test::neg::u32::release+0xfffc0038>
        callx8            a8

.literal.asm_test::not::u8::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::not::u8::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::not::u8::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::not::u8::acqrel+0x8> (ffff8105 <asm_test::not::u8::acqrel+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::not::u8::acqrel+0xffa1f01d>)
        l32r              a8, 50 <asm_test::not::u8::acqrel+0x50> (ffff81ff <asm_test::not::u8::acqrel+0xffff81ff>)
        callx8            a8

.literal.asm_test::not::u8::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::not::u8::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::not::u8::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::not::u8::seqcst+0x8> (ffff8105 <asm_test::not::u8::seqcst+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::not::u8::seqcst+0xffa1f01d>)
        l32r              a8, 50 <asm_test::not::u8::seqcst+0x50> (ffff81ff <asm_test::not::u8::seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::not::u8::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::not::u8::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::not::u8::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::not::u8::acquire+0x8> (ffff8105 <asm_test::not::u8::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, 48 <asm_test::not::u8::acquire+0x48> (a1f01d00 <asm_test::not::u8::acquire+0xa1f01d00>)
        l32r              a8, 4c <asm_test::not::u8::acquire+0x4c> (ff81ffff <asm_test::not::u8::acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::not::u8::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::not::u8::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::not::u8::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::not::u8::relaxed+0x8> (ffff8105 <asm_test::not::u8::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        retw.n
5:
        l32r              a10, fffc0048 <asm_test::not::u8::relaxed+0xfffc0048>
        l32r              a8, 5b (810000a1 <asm_test::not::u8::relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::not::u8::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::not::u8::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::not::u8::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::not::u8::release+0x8> (ffff8105 <asm_test::not::u8::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        retw.n
5:
        l32r              a10, 48 <asm_test::not::u8::release+0x48> (a1f01dff <asm_test::not::u8::release+0xa1f01dff>)
        l32r              a8, 4c <asm_test::not::u8::release+0x4c> (ff81ffff <asm_test::not::u8::release+0xff81ffff>)
        callx8            a8

.literal.asm_test::not::u16::acqrel:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::not::u16::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::not::u16::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::not::u16::acqrel+0x8> (ffff8105 <asm_test::not::u16::acqrel+0xffff8105>)
        bgeu              a8, a2, 7f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
2:
        and               a8, a8, a9
        l32r              a9, 2b (91108890 <asm_test::not::u16::acqrel+0x91108890>)
        ssl               a8
        sll               a8, a9
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 4f
3:
        mov.n             a12, a13
        beqi              a14, 1, 5f
4:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 3b
        mov.n             a14, a10
        j                 3b
5:
        memw
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::not::u16::acqrel+0xffa1f01d>)
        l32r              a8, 50 <asm_test::not::u16::acqrel+0x50> (ffff81ff <asm_test::not::u16::acqrel+0xffff81ff>)
        callx8            a8

.literal.asm_test::not::u16::seqcst:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::not::u16::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::not::u16::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::not::u16::seqcst+0x8> (ffff8105 <asm_test::not::u16::seqcst+0xffff8105>)
        bgeu              a8, a2, 7f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
2:
        and               a8, a8, a9
        l32r              a9, 2b (91108890 <asm_test::not::u16::seqcst+0x91108890>)
        ssl               a8
        sll               a8, a9
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 4f
3:
        mov.n             a12, a13
        beqi              a14, 1, 5f
4:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 3b
        mov.n             a14, a10
        j                 3b
5:
        memw
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::not::u16::seqcst+0xffa1f01d>)
        l32r              a8, 50 <asm_test::not::u16::seqcst+0x50> (ffff81ff <asm_test::not::u16::seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::not::u16::acquire:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::not::u16::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::not::u16::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::not::u16::acquire+0x8> (ffff8105 <asm_test::not::u16::acquire+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
2:
        and               a8, a8, a9
        l32r              a9, 2b (91108890 <asm_test::not::u16::acquire+0x91108890>)
        ssl               a8
        sll               a8, a9
        movi.n            a9, -4
        and               a9, a2, a9
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 4f
3:
        mov.n             a12, a13
        beqi              a14, 1, 5f
4:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 3b
        mov.n             a14, a10
        j                 3b
5:
        memw
        retw.n
6:
        l32r              a10, 48 <asm_test::not::u16::acquire+0x48> (a1f01d00 <asm_test::not::u16::acquire+0xa1f01d00>)
        l32r              a8, 4c <asm_test::not::u16::acquire+0x4c> (ff81ffff <asm_test::not::u16::acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::not::u16::relaxed:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::not::u16::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::not::u16::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::not::u16::relaxed+0x8> (ffff8105 <asm_test::not::u16::relaxed+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
2:
        and               a8, a8, a9
        l32r              a9, 2b (91108890 <asm_test::not::u16::relaxed+0x91108890>)
        ssl               a8
        sll               a8, a9
        movi.n            a9, -4
        and               a9, a2, a9
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 4f
3:
        mov.n             a12, a13
        beqi              a14, 1, 5f
4:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 3b
        mov.n             a14, a10
        j                 3b
5:
        retw.n
6:
        l32r              a10, fffc0048 <asm_test::not::u16::relaxed+0xfffc0048>
        l32r              a8, 6b (810000a1 <asm_test::not::u16::relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::not::u16::release:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::not::u16::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::not::u16::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::not::u16::release+0x8> (ffff8105 <asm_test::not::u16::release+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
2:
        and               a8, a8, a9
        l32r              a9, 2b (91108890 <asm_test::not::u16::release+0x91108890>)
        ssl               a8
        sll               a8, a9
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 4f
3:
        mov.n             a12, a13
        beqi              a14, 1, 5f
4:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 3b
        mov.n             a14, a10
        j                 3b
5:
        retw.n
6:
        l32r              a10, 48 <asm_test::not::u16::release+0x48> (a1f01dff <asm_test::not::u16::release+0xa1f01dff>)
        l32r              a8, 4c <asm_test::not::u16::release+0x4c> (ff81ffff <asm_test::not::u16::release+0xff81ffff>)
        callx8            a8

.literal.asm_test::not::u32::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::not::u32::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::not::u32::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::not::u32::acqrel+0x8> (ffff8105 <asm_test::not::u32::acqrel+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a8, -1
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a12
        beqi              a13, 1, 4f
3:
        xor               a12, a11, a8
        wsr.scompare1     a11
        s32c1i            a12, a2, 0
        mov.n             a13, a10
        beq               a12, a11, 2b
        mov.n             a13, a9
        j                 2b
4:
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::not::u32::acqrel+0xffa1f01d>)
        l32r              a8, 3c <asm_test::not::u32::acqrel+0x3c> (ffff81ff <asm_test::not::u32::acqrel+0xffff81ff>)
        callx8            a8

.literal.asm_test::not::u32::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::not::u32::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::not::u32::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::not::u32::seqcst+0x8> (ffff8105 <asm_test::not::u32::seqcst+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a8, -1
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a12
        beqi              a13, 1, 4f
3:
        xor               a12, a11, a8
        wsr.scompare1     a11
        s32c1i            a12, a2, 0
        mov.n             a13, a10
        beq               a12, a11, 2b
        mov.n             a13, a9
        j                 2b
4:
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::not::u32::seqcst+0xffa1f01d>)
        l32r              a8, 3c <asm_test::not::u32::seqcst+0x3c> (ffff81ff <asm_test::not::u32::seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::not::u32::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::not::u32::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::not::u32::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::not::u32::acquire+0x8> (ffff8105 <asm_test::not::u32::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a11, a2, 0
        movi.n            a8, -1
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a12
        beqi              a13, 1, 4f
3:
        xor               a12, a11, a8
        wsr.scompare1     a11
        s32c1i            a12, a2, 0
        mov.n             a13, a10
        beq               a12, a11, 2b
        mov.n             a13, a9
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, 34 <asm_test::not::u32::acquire+0x34> (a1f01d00 <asm_test::not::u32::acquire+0xa1f01d00>)
        l32r              a8, 38 <asm_test::not::u32::acquire+0x38> (ff81ffff <asm_test::not::u32::acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::not::u32::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::not::u32::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::not::u32::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::not::u32::relaxed+0x8> (ffff8105 <asm_test::not::u32::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a11, a2, 0
        movi.n            a8, -1
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a12
        beqi              a13, 1, 4f
3:
        xor               a12, a11, a8
        wsr.scompare1     a11
        s32c1i            a12, a2, 0
        mov.n             a13, a10
        beq               a12, a11, 2b
        mov.n             a13, a9
        j                 2b
4:
        retw.n
5:
        l32r              a10, fffc0034 <asm_test::not::u32::relaxed+0xfffc0034>
        l32r              a8, 5b (810000a1 <asm_test::not::u32::relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::not::u32::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::not::u32::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::not::u32::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::not::u32::release+0x8> (ffff8105 <asm_test::not::u32::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a8, -1
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a12
        beqi              a13, 1, 4f
3:
        xor               a12, a11, a8
        wsr.scompare1     a11
        s32c1i            a12, a2, 0
        mov.n             a13, a10
        beq               a12, a11, 2b
        mov.n             a13, a9
        j                 2b
4:
        retw.n
5:
        l32r              a10, 34 <asm_test::not::u32::release+0x34> (a1f01dff <asm_test::not::u32::release+0xa1f01dff>)
        l32r              a8, 38 <asm_test::not::u32::release+0x38> (ff81ffff <asm_test::not::u32::release+0xff81ffff>)
        callx8            a8

.literal.asm_test::not::bool::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::not::bool::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::not::bool::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::not::bool::acqrel+0x8> (ffff8105 <asm_test::not::bool::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi.n            a8, 1
        ssl               a9
        sll               a9, a8
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a12, a10, 0
        movi.n            a11, 0
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        xor               a13, a12, a9
        wsr.scompare1     a12
        s32c1i            a13, a10, 0
        mov.n             a14, a8
        beq               a13, a12, 2b
        mov.n             a14, a11
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, 48 <asm_test::not::bool::acqrel+0x48> (a1f01d00 <asm_test::not::bool::acqrel+0xa1f01d00>)
        l32r              a8, 4c <asm_test::not::bool::acqrel+0x4c> (ff81ffff <asm_test::not::bool::acqrel+0xff81ffff>)
        callx8            a8

.literal.asm_test::not::bool::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::not::bool::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::not::bool::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::not::bool::seqcst+0x8> (ffff8105 <asm_test::not::bool::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi.n            a8, 1
        ssl               a9
        sll               a9, a8
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a12, a10, 0
        movi.n            a11, 0
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        xor               a13, a12, a9
        wsr.scompare1     a12
        s32c1i            a13, a10, 0
        mov.n             a14, a8
        beq               a13, a12, 2b
        mov.n             a14, a11
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, 48 <asm_test::not::bool::seqcst+0x48> (a1f01d00 <asm_test::not::bool::seqcst+0xa1f01d00>)
        l32r              a8, 4c <asm_test::not::bool::seqcst+0x4c> (ff81ffff <asm_test::not::bool::seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::not::bool::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::not::bool::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::not::bool::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::not::bool::acquire+0x8> (ffff8105 <asm_test::not::bool::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi.n            a8, 1
        ssl               a9
        sll               a9, a8
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a12, a10, 0
        movi.n            a11, 0
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        xor               a13, a12, a9
        wsr.scompare1     a12
        s32c1i            a13, a10, 0
        mov.n             a14, a8
        beq               a13, a12, 2b
        mov.n             a14, a11
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, fffc0048 <asm_test::not::bool::acquire+0xfffc0048>
        l32r              a8, 5b (810000a1 <asm_test::not::bool::acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::not::bool::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::not::bool::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::not::bool::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::not::bool::relaxed+0x8> (ffff8105 <asm_test::not::bool::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi.n            a8, 1
        ssl               a9
        sll               a9, a8
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a12, a10, 0
        movi.n            a11, 0
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        xor               a13, a12, a9
        wsr.scompare1     a12
        s32c1i            a13, a10, 0
        mov.n             a14, a8
        beq               a13, a12, 2b
        mov.n             a14, a11
        j                 2b
4:
        retw.n
5:
        l32r              a10, 44 <asm_test::not::bool::relaxed+0x44> (ffffa1f0 <asm_test::not::bool::relaxed+0xffffa1f0>)
        l32r              a8, fffc0048 <asm_test::not::bool::relaxed+0xfffc0048>
        callx8            a8

.literal.asm_test::not::bool::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::not::bool::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::not::bool::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::not::bool::release+0x8> (ffff8105 <asm_test::not::bool::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a9, a8, a9
        movi.n            a8, 1
        ssl               a9
        sll               a9, a8
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a12, a10, 0
        movi.n            a11, 0
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        xor               a13, a12, a9
        wsr.scompare1     a12
        s32c1i            a13, a10, 0
        mov.n             a14, a8
        beq               a13, a12, 2b
        mov.n             a14, a11
        j                 2b
4:
        retw.n
5:
        l32r              a10, fffc0048 <asm_test::not::bool::release+0xfffc0048>
        l32r              a8, 5b (810000a1 <asm_test::not::bool::release+0x810000a1>)
        callx8            a8

.literal.asm_test::sub::u8::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::sub::u8::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::sub::u8::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::sub::u8::acqrel+0x8> (ffff8105 <asm_test::sub::u8::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a15
        beqi              a7, 1, 4f
3:
        and               a15, a14, a10
        sub               a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 2b
        mov.n             a7, a12
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, 64 <asm_test::sub::u8::acqrel+0x64> (ffffa1f0 <asm_test::sub::u8::acqrel+0xffffa1f0>)
        l32r              a8, fffc0068 <asm_test::sub::u8::acqrel+0xfffc0068>
        callx8            a8

.literal.asm_test::sub::u8::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::sub::u8::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::sub::u8::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::sub::u8::seqcst+0x8> (ffff8105 <asm_test::sub::u8::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a15
        beqi              a7, 1, 4f
3:
        and               a15, a14, a10
        sub               a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 2b
        mov.n             a7, a12
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, 64 <asm_test::sub::u8::seqcst+0x64> (ffffa1f0 <asm_test::sub::u8::seqcst+0xffffa1f0>)
        l32r              a8, fffc0068 <asm_test::sub::u8::seqcst+0xfffc0068>
        callx8            a8

.literal.asm_test::sub::u8::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::sub::u8::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::sub::u8::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::sub::u8::acquire+0x8> (ffff8105 <asm_test::sub::u8::acquire+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
        j                 3f
2:
        mov.n             a14, a15
        beqi              a7, 1, 4f
3:
        and               a15, a14, a10
        sub               a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 2b
        mov.n             a7, a12
        j                 2b
4:
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::sub::u8::acquire+0xffa1f01d>)
        l32r              a8, 64 <asm_test::sub::u8::acquire+0x64> (ffff81ff <asm_test::sub::u8::acquire+0xffff81ff>)
        callx8            a8

.literal.asm_test::sub::u8::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::sub::u8::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::sub::u8::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::sub::u8::relaxed+0x8> (ffff8105 <asm_test::sub::u8::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a15
        beqi              a7, 1, 4f
3:
        and               a15, a14, a10
        sub               a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 2b
        mov.n             a7, a12
        j                 2b
4:
        retw.n
5:
        l32r              a10, 5c <asm_test::sub::u8::relaxed+0x5c> (a1f01dff <asm_test::sub::u8::relaxed+0xa1f01dff>)
        l32r              a8, 60 <asm_test::sub::u8::relaxed+0x60> (ff81ffff <asm_test::sub::u8::relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::sub::u8::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::sub::u8::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::sub::u8::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::sub::u8::release+0x8> (ffff8105 <asm_test::sub::u8::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a15
        beqi              a7, 1, 4f
3:
        and               a15, a14, a10
        sub               a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 2b
        mov.n             a7, a12
        j                 2b
4:
        retw.n
5:
        l32r              a10, 4b (ffa1f01d <asm_test::sub::u8::release+0xffa1f01d>)
        l32r              a8, 64 <asm_test::sub::u8::release+0x64> (ffff81ff <asm_test::sub::u8::release+0xffff81ff>)
        callx8            a8

.literal.asm_test::sub::u16::acqrel:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::sub::u16::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::sub::u16::acqrel+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::sub::u16::acqrel+0x8> (ffff8105 <asm_test::sub::u16::acqrel+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a9, 1b (9155b827 <asm_test::sub::u16::acqrel+0x9155b827>)
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
        j                 4f
3:
        mov.n             a14, a15
        beqi              a7, 1, 5f
4:
        and               a15, a14, a10
        sub               a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 3b
        mov.n             a7, a12
        j                 3b
5:
        memw
        retw.n
6:
        l32r              a10, 64 <asm_test::sub::u16::acqrel+0x64> (ffffa1f0 <asm_test::sub::u16::acqrel+0xffffa1f0>)
        l32r              a8, fffc0068 <asm_test::sub::u16::acqrel+0xfffc0068>
        callx8            a8

.literal.asm_test::sub::u16::seqcst:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::sub::u16::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::sub::u16::seqcst+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::sub::u16::seqcst+0x8> (ffff8105 <asm_test::sub::u16::seqcst+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a9, 1b (9155b827 <asm_test::sub::u16::seqcst+0x9155b827>)
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
        j                 4f
3:
        mov.n             a14, a15
        beqi              a7, 1, 5f
4:
        and               a15, a14, a10
        sub               a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 3b
        mov.n             a7, a12
        j                 3b
5:
        memw
        retw.n
6:
        l32r              a10, 64 <asm_test::sub::u16::seqcst+0x64> (ffffa1f0 <asm_test::sub::u16::seqcst+0xffffa1f0>)
        l32r              a8, fffc0068 <asm_test::sub::u16::seqcst+0xfffc0068>
        callx8            a8

.literal.asm_test::sub::u16::acquire:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::sub::u16::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::sub::u16::acquire+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::sub::u16::acquire+0x8> (ffff8105 <asm_test::sub::u16::acquire+0xffff8105>)
1:
        bgeu              a8, a2, 7f
2:
        l32r              a9, 1b (9152b827 <asm_test::sub::u16::acquire+0x9152b827>)
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
        j                 4f
3:
        mov.n             a14, a15
        beqi              a7, 1, 5f
4:
        and               a15, a14, a10
        sub               a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 3b
        mov.n             a7, a12
        j                 3b
5:
        memw
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::sub::u16::acquire+0xffa1f01d>)
        l32r              a8, 64 <asm_test::sub::u16::acquire+0x64> (ffff81ff <asm_test::sub::u16::acquire+0xffff81ff>)
        callx8            a8

.literal.asm_test::sub::u16::relaxed:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::sub::u16::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::sub::u16::relaxed+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::sub::u16::relaxed+0x8> (ffff8105 <asm_test::sub::u16::relaxed+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a9, 1b (914fb827 <asm_test::sub::u16::relaxed+0x914fb827>)
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
        j                 4f
3:
        mov.n             a14, a15
        beqi              a7, 1, 5f
4:
        and               a15, a14, a10
        sub               a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 3b
        mov.n             a7, a12
        j                 3b
5:
        retw.n
6:
        l32r              a10, 5c <asm_test::sub::u16::relaxed+0x5c> (a1f01dff <asm_test::sub::u16::relaxed+0xa1f01dff>)
        l32r              a8, 60 <asm_test::sub::u16::relaxed+0x60> (ff81ffff <asm_test::sub::u16::relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::sub::u16::release:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::sub::u16::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::sub::u16::release+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::sub::u16::release+0x8> (ffff8105 <asm_test::sub::u16::release+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a9, 1b (9152b827 <asm_test::sub::u16::release+0x9152b827>)
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
        j                 4f
3:
        mov.n             a14, a15
        beqi              a7, 1, 5f
4:
        and               a15, a14, a10
        sub               a7, a14, a8
        and               a7, a7, a9
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a11, 0
        mov.n             a7, a13
        beq               a15, a14, 3b
        mov.n             a7, a12
        j                 3b
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::sub::u16::release+0xffa1f01d>)
        l32r              a8, 64 <asm_test::sub::u16::release+0x64> (ffff81ff <asm_test::sub::u16::release+0xffff81ff>)
        callx8            a8

.literal.asm_test::sub::u32::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::sub::u32::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::sub::u32::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::sub::u32::acqrel+0x8> (ffff8105 <asm_test::sub::u32::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 3f
2:
        mov.n             a10, a11
        beqi              a12, 1, 4f
3:
        sub               a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 2b
        mov.n             a12, a8
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, fffc0038 <asm_test::sub::u32::acqrel+0xfffc0038>
        l32r              a8, 5b (810000a1 <asm_test::sub::u32::acqrel+0x810000a1>)
        callx8            a8

.literal.asm_test::sub::u32::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::sub::u32::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::sub::u32::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::sub::u32::seqcst+0x8> (ffff8105 <asm_test::sub::u32::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 3f
2:
        mov.n             a10, a11
        beqi              a12, 1, 4f
3:
        sub               a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 2b
        mov.n             a12, a8
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, fffc0038 <asm_test::sub::u32::seqcst+0xfffc0038>
        l32r              a8, 5b (810000a1 <asm_test::sub::u32::seqcst+0x810000a1>)
        callx8            a8

.literal.asm_test::sub::u32::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::sub::u32::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::sub::u32::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::sub::u32::acquire+0x8> (ffff8105 <asm_test::sub::u32::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 3f
2:
        mov.n             a10, a11
        beqi              a12, 1, 4f
3:
        sub               a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 2b
        mov.n             a12, a8
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, 34 <asm_test::sub::u32::acquire+0x34> (ffffa1f0 <asm_test::sub::u32::acquire+0xffffa1f0>)
        l32r              a8, fffc0038 <asm_test::sub::u32::acquire+0xfffc0038>
        callx8            a8

.literal.asm_test::sub::u32::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::sub::u32::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::sub::u32::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::sub::u32::relaxed+0x8> (ffff8105 <asm_test::sub::u32::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 3f
2:
        mov.n             a10, a11
        beqi              a12, 1, 4f
3:
        sub               a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 2b
        mov.n             a12, a8
        j                 2b
4:
        retw.n
5:
        l32r              a10, 4b (ffa1f01d <asm_test::sub::u32::relaxed+0xffa1f01d>)
        l32r              a8, 34 <asm_test::sub::u32::relaxed+0x34> (ffff81ff <asm_test::sub::u32::relaxed+0xffff81ff>)
        callx8            a8

.literal.asm_test::sub::u32::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::sub::u32::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::sub::u32::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::sub::u32::release+0x8> (ffff8105 <asm_test::sub::u32::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 3f
2:
        mov.n             a10, a11
        beqi              a12, 1, 4f
3:
        sub               a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 2b
        mov.n             a12, a8
        j                 2b
4:
        retw.n
5:
        l32r              a10, 34 <asm_test::sub::u32::release+0x34> (ffffa1f0 <asm_test::sub::u32::release+0xffffa1f0>)
        l32r              a8, fffc0038 <asm_test::sub::u32::release+0xfffc0038>
        callx8            a8

.literal.asm_test::xor::u8::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::xor::u8::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::xor::u8::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::xor::u8::acqrel+0x8> (ffff8105 <asm_test::xor::u8::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, 50 <asm_test::xor::u8::acqrel+0x50> (ffffa1f0 <asm_test::xor::u8::acqrel+0xffffa1f0>)
        l32r              a8, fffc0054 <asm_test::xor::u8::acqrel+0xfffc0054>
        callx8            a8

.literal.asm_test::xor::u8::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::xor::u8::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::xor::u8::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::xor::u8::seqcst+0x8> (ffff8105 <asm_test::xor::u8::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, 50 <asm_test::xor::u8::seqcst+0x50> (ffffa1f0 <asm_test::xor::u8::seqcst+0xffffa1f0>)
        l32r              a8, fffc0054 <asm_test::xor::u8::seqcst+0xfffc0054>
        callx8            a8

.literal.asm_test::xor::u8::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::xor::u8::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::xor::u8::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::xor::u8::acquire+0x8> (ffff8105 <asm_test::xor::u8::acquire+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::xor::u8::acquire+0xffa1f01d>)
        l32r              a8, 50 <asm_test::xor::u8::acquire+0x50> (ffff81ff <asm_test::xor::u8::acquire+0xffff81ff>)
        callx8            a8

.literal.asm_test::xor::u8::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::xor::u8::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::xor::u8::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::xor::u8::relaxed+0x8> (ffff8105 <asm_test::xor::u8::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        retw.n
5:
        l32r              a10, 48 <asm_test::xor::u8::relaxed+0x48> (a1f01dff <asm_test::xor::u8::relaxed+0xa1f01dff>)
        l32r              a8, 4c <asm_test::xor::u8::relaxed+0x4c> (ff81ffff <asm_test::xor::u8::relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::xor::u8::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::xor::u8::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::xor::u8::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::xor::u8::release+0x8> (ffff8105 <asm_test::xor::u8::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        retw.n
5:
        l32r              a10, 4b (ffa1f01d <asm_test::xor::u8::release+0xffa1f01d>)
        l32r              a8, 50 <asm_test::xor::u8::release+0x50> (ffff81ff <asm_test::xor::u8::release+0xffff81ff>)
        callx8            a8

.literal.asm_test::xor::u16::acqrel:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::xor::u16::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::xor::u16::acqrel+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::xor::u16::acqrel+0x8> (ffff8105 <asm_test::xor::u16::acqrel+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a8, 1b (8141b827 <asm_test::xor::u16::acqrel+0x8141b827>)
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
        j                 4f
3:
        mov.n             a12, a13
        beqi              a14, 1, 5f
4:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 3b
        mov.n             a14, a10
        j                 3b
5:
        memw
        retw.n
6:
        l32r              a10, 50 <asm_test::xor::u16::acqrel+0x50> (ffffa1f0 <asm_test::xor::u16::acqrel+0xffffa1f0>)
        l32r              a8, fffc0054 <asm_test::xor::u16::acqrel+0xfffc0054>
        callx8            a8

.literal.asm_test::xor::u16::seqcst:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::xor::u16::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::xor::u16::seqcst+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::xor::u16::seqcst+0x8> (ffff8105 <asm_test::xor::u16::seqcst+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a8, 1b (8141b827 <asm_test::xor::u16::seqcst+0x8141b827>)
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
        j                 4f
3:
        mov.n             a12, a13
        beqi              a14, 1, 5f
4:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 3b
        mov.n             a14, a10
        j                 3b
5:
        memw
        retw.n
6:
        l32r              a10, 50 <asm_test::xor::u16::seqcst+0x50> (ffffa1f0 <asm_test::xor::u16::seqcst+0xffffa1f0>)
        l32r              a8, fffc0054 <asm_test::xor::u16::seqcst+0xfffc0054>
        callx8            a8

.literal.asm_test::xor::u16::acquire:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::xor::u16::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::xor::u16::acquire+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::xor::u16::acquire+0x8> (ffff8105 <asm_test::xor::u16::acquire+0xffff8105>)
1:
        bgeu              a8, a2, 7f
2:
        l32r              a8, 1b (813eb827 <asm_test::xor::u16::acquire+0x813eb827>)
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
        j                 4f
3:
        mov.n             a12, a13
        beqi              a14, 1, 5f
4:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 3b
        mov.n             a14, a10
        j                 3b
5:
        memw
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::xor::u16::acquire+0xffa1f01d>)
        l32r              a8, 50 <asm_test::xor::u16::acquire+0x50> (ffff81ff <asm_test::xor::u16::acquire+0xffff81ff>)
        callx8            a8

.literal.asm_test::xor::u16::relaxed:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::xor::u16::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::xor::u16::relaxed+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::xor::u16::relaxed+0x8> (ffff8105 <asm_test::xor::u16::relaxed+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a8, 1b (813bb827 <asm_test::xor::u16::relaxed+0x813bb827>)
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
        j                 4f
3:
        mov.n             a12, a13
        beqi              a14, 1, 5f
4:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 3b
        mov.n             a14, a10
        j                 3b
5:
        retw.n
6:
        l32r              a10, 48 <asm_test::xor::u16::relaxed+0x48> (a1f01dff <asm_test::xor::u16::relaxed+0xa1f01dff>)
        l32r              a8, 4c <asm_test::xor::u16::relaxed+0x4c> (ff81ffff <asm_test::xor::u16::relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::xor::u16::release:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::xor::u16::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::xor::u16::release+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::xor::u16::release+0x8> (ffff8105 <asm_test::xor::u16::release+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a8, 1b (813eb827 <asm_test::xor::u16::release+0x813eb827>)
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
        j                 4f
3:
        mov.n             a12, a13
        beqi              a14, 1, 5f
4:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 3b
        mov.n             a14, a10
        j                 3b
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::xor::u16::release+0xffa1f01d>)
        l32r              a8, 50 <asm_test::xor::u16::release+0x50> (ffff81ff <asm_test::xor::u16::release+0xffff81ff>)
        callx8            a8

.literal.asm_test::xor::u32::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::xor::u32::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::xor::u32::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::xor::u32::acqrel+0x8> (ffff8105 <asm_test::xor::u32::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 3f
2:
        mov.n             a10, a11
        beqi              a12, 1, 4f
3:
        xor               a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 2b
        mov.n             a12, a8
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, fffc0038 <asm_test::xor::u32::acqrel+0xfffc0038>
        l32r              a8, 5b (810000a1 <asm_test::xor::u32::acqrel+0x810000a1>)
        callx8            a8

.literal.asm_test::xor::u32::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::xor::u32::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::xor::u32::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::xor::u32::seqcst+0x8> (ffff8105 <asm_test::xor::u32::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 3f
2:
        mov.n             a10, a11
        beqi              a12, 1, 4f
3:
        xor               a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 2b
        mov.n             a12, a8
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, fffc0038 <asm_test::xor::u32::seqcst+0xfffc0038>
        l32r              a8, 5b (810000a1 <asm_test::xor::u32::seqcst+0x810000a1>)
        callx8            a8

.literal.asm_test::xor::u32::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::xor::u32::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::xor::u32::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::xor::u32::acquire+0x8> (ffff8105 <asm_test::xor::u32::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 3f
2:
        mov.n             a10, a11
        beqi              a12, 1, 4f
3:
        xor               a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 2b
        mov.n             a12, a8
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, 34 <asm_test::xor::u32::acquire+0x34> (ffffa1f0 <asm_test::xor::u32::acquire+0xffffa1f0>)
        l32r              a8, fffc0038 <asm_test::xor::u32::acquire+0xfffc0038>
        callx8            a8

.literal.asm_test::xor::u32::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::xor::u32::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::xor::u32::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::xor::u32::relaxed+0x8> (ffff8105 <asm_test::xor::u32::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 3f
2:
        mov.n             a10, a11
        beqi              a12, 1, 4f
3:
        xor               a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 2b
        mov.n             a12, a8
        j                 2b
4:
        retw.n
5:
        l32r              a10, 4b (ffa1f01d <asm_test::xor::u32::relaxed+0xffa1f01d>)
        l32r              a8, 34 <asm_test::xor::u32::relaxed+0x34> (ffff81ff <asm_test::xor::u32::relaxed+0xffff81ff>)
        callx8            a8

.literal.asm_test::xor::u32::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::xor::u32::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::xor::u32::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::xor::u32::release+0x8> (ffff8105 <asm_test::xor::u32::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a10, a2, 0
        movi.n            a8, 0
        movi.n            a9, 1
        j                 3f
2:
        mov.n             a10, a11
        beqi              a12, 1, 4f
3:
        xor               a11, a10, a3
        wsr.scompare1     a10
        s32c1i            a11, a2, 0
        mov.n             a12, a9
        beq               a11, a10, 2b
        mov.n             a12, a8
        j                 2b
4:
        retw.n
5:
        l32r              a10, 34 <asm_test::xor::u32::release+0x34> (ffffa1f0 <asm_test::xor::u32::release+0xffffa1f0>)
        l32r              a8, fffc0038 <asm_test::xor::u32::release+0xfffc0038>
        callx8            a8

.literal.asm_test::xor::bool::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::xor::bool::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::xor::bool::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::xor::bool::acqrel+0x8> (ffff8105 <asm_test::xor::bool::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a8, a3
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, 48 <asm_test::xor::bool::acqrel+0x48> (a1f01d00 <asm_test::xor::bool::acqrel+0xa1f01d00>)
        l32r              a8, 4c <asm_test::xor::bool::acqrel+0x4c> (ff81ffff <asm_test::xor::bool::acqrel+0xff81ffff>)
        callx8            a8

.literal.asm_test::xor::bool::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::xor::bool::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::xor::bool::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::xor::bool::seqcst+0x8> (ffff8105 <asm_test::xor::bool::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a8, a3
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, 48 <asm_test::xor::bool::seqcst+0x48> (a1f01d00 <asm_test::xor::bool::seqcst+0xa1f01d00>)
        l32r              a8, 4c <asm_test::xor::bool::seqcst+0x4c> (ff81ffff <asm_test::xor::bool::seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::xor::bool::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::xor::bool::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::xor::bool::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::xor::bool::acquire+0x8> (ffff8105 <asm_test::xor::bool::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a8, a3
        movi.n            a9, -4
        and               a9, a2, a9
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        memw
        retw.n
5:
        l32r              a10, fffc0048 <asm_test::xor::bool::acquire+0xfffc0048>
        l32r              a8, 5b (810000a1 <asm_test::xor::bool::acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::xor::bool::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::xor::bool::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::xor::bool::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::xor::bool::relaxed+0x8> (ffff8105 <asm_test::xor::bool::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a8, a3
        movi.n            a9, -4
        and               a9, a2, a9
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        retw.n
5:
        l32r              a10, 44 <asm_test::xor::bool::relaxed+0x44> (ffffa1f0 <asm_test::xor::bool::relaxed+0xffffa1f0>)
        l32r              a8, fffc0048 <asm_test::xor::bool::relaxed+0xfffc0048>
        callx8            a8

.literal.asm_test::xor::bool::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::xor::bool::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::xor::bool::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::xor::bool::release+0x8> (ffff8105 <asm_test::xor::bool::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a8, a3
        movi.n            a9, -4
        and               a9, a2, a9
        memw
        l32i.n            a12, a9, 0
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a12, a13
        beqi              a14, 1, 4f
3:
        xor               a13, a12, a8
        wsr.scompare1     a12
        s32c1i            a13, a9, 0
        mov.n             a14, a11
        beq               a13, a12, 2b
        mov.n             a14, a10
        j                 2b
4:
        retw.n
5:
        l32r              a10, fffc0048 <asm_test::xor::bool::release+0xfffc0048>
        l32r              a8, 5b (810000a1 <asm_test::xor::bool::release+0x810000a1>)
        callx8            a8

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

asm_test::load::f32::seqcst:
        entry             a1, 32
        l32i.n            a2, a2, 0
        memw
        retw.n

asm_test::load::f32::acquire:
        entry             a1, 32
        l32i.n            a2, a2, 0
        memw
        retw.n

asm_test::load::f32::relaxed:
        entry             a1, 32
        l32i.n            a2, a2, 0
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
        l8ui              a2, a2, 0
        memw
        retw.n

asm_test::load::bool::acquire:
        entry             a1, 32
        l8ui              a2, a2, 0
        memw
        retw.n

asm_test::load::bool::relaxed:
        entry             a1, 32
        l8ui              a2, a2, 0
        retw.n

.literal.asm_test::swap::u8::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::swap::u8::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::swap::u8::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::swap::u8::acqrel+0x8> (ffff8105 <asm_test::swap::u8::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        and               a14, a15, a10
        or                a14, a14, a9
        wsr.scompare1     a15
        s32c1i            a14, a11, 0
        mov.n             a7, a13
        beq               a14, a15, 2b
        mov.n             a7, a12
        j                 2b
4:
        ssr               a8
        srl               a2, a14
        memw
        retw.n
5:
        l32r              a10, 64 <asm_test::swap::u8::acqrel+0x64> (ffffa1f0 <asm_test::swap::u8::acqrel+0xffffa1f0>)
        l32r              a8, fffc0068 <asm_test::swap::u8::acqrel+0xfffc0068>
        callx8            a8

.literal.asm_test::swap::u8::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::swap::u8::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::swap::u8::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::swap::u8::seqcst+0x8> (ffff8105 <asm_test::swap::u8::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        and               a14, a15, a10
        or                a14, a14, a9
        wsr.scompare1     a15
        s32c1i            a14, a11, 0
        mov.n             a7, a13
        beq               a14, a15, 2b
        mov.n             a7, a12
        j                 2b
4:
        ssr               a8
        srl               a2, a14
        memw
        retw.n
5:
        l32r              a10, 64 <asm_test::swap::u8::seqcst+0x64> (ffffa1f0 <asm_test::swap::u8::seqcst+0xffffa1f0>)
        l32r              a8, fffc0068 <asm_test::swap::u8::seqcst+0xfffc0068>
        callx8            a8

.literal.asm_test::swap::u8::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::swap::u8::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::swap::u8::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::swap::u8::acquire+0x8> (ffff8105 <asm_test::swap::u8::acquire+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        and               a14, a15, a10
        or                a14, a14, a9
        wsr.scompare1     a15
        s32c1i            a14, a11, 0
        mov.n             a7, a13
        beq               a14, a15, 2b
        mov.n             a7, a12
        j                 2b
4:
        ssr               a8
        srl               a2, a14
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::swap::u8::acquire+0xffa1f01d>)
        l32r              a8, 64 <asm_test::swap::u8::acquire+0x64> (ffff81ff <asm_test::swap::u8::acquire+0xffff81ff>)
        callx8            a8

.literal.asm_test::swap::u8::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::swap::u8::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::swap::u8::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::swap::u8::relaxed+0x8> (ffff8105 <asm_test::swap::u8::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        and               a14, a15, a10
        or                a14, a14, a9
        wsr.scompare1     a15
        s32c1i            a14, a11, 0
        mov.n             a7, a13
        beq               a14, a15, 2b
        mov.n             a7, a12
        j                 2b
4:
        ssr               a8
        srl               a2, a14
        retw.n
5:
        l32r              a10, 5c <asm_test::swap::u8::relaxed+0x5c> (a1f01d91 <asm_test::swap::u8::relaxed+0xa1f01d91>)
        l32r              a8, 60 <asm_test::swap::u8::relaxed+0x60> (ff81ffff <asm_test::swap::u8::relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::swap::u8::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::swap::u8::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::swap::u8::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::swap::u8::release+0x8> (ffff8105 <asm_test::swap::u8::release+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        and               a14, a15, a10
        or                a14, a14, a9
        wsr.scompare1     a15
        s32c1i            a14, a11, 0
        mov.n             a7, a13
        beq               a14, a15, 2b
        mov.n             a7, a12
        j                 2b
4:
        ssr               a8
        srl               a2, a14
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::swap::u8::release+0xffa1f01d>)
        l32r              a8, 64 <asm_test::swap::u8::release+0x64> (ffff81ff <asm_test::swap::u8::release+0xffff81ff>)
        callx8            a8

.literal.asm_test::swap::f32::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::swap::f32::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::swap::f32::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::swap::f32::acqrel+0x8> (ffff8105 <asm_test::swap::f32::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        wsr.scompare1     a11
        mov.n             a8, a3
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 38 <asm_test::swap::f32::acqrel+0x38> (ffffa1f0 <asm_test::swap::f32::acqrel+0xffffa1f0>)
        l32r              a8, fffc003c <asm_test::swap::f32::acqrel+0xfffc003c>
        callx8            a8

.literal.asm_test::swap::f32::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::swap::f32::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::swap::f32::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::swap::f32::seqcst+0x8> (ffff8105 <asm_test::swap::f32::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        wsr.scompare1     a11
        mov.n             a8, a3
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 38 <asm_test::swap::f32::seqcst+0x38> (ffffa1f0 <asm_test::swap::f32::seqcst+0xffffa1f0>)
        l32r              a8, fffc003c <asm_test::swap::f32::seqcst+0xfffc003c>
        callx8            a8

.literal.asm_test::swap::f32::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::swap::f32::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::swap::f32::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::swap::f32::acquire+0x8> (ffff8105 <asm_test::swap::f32::acquire+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        wsr.scompare1     a11
        mov.n             a8, a3
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::swap::f32::acquire+0xffa1f01d>)
        l32r              a8, 38 <asm_test::swap::f32::acquire+0x38> (ffff81ff <asm_test::swap::f32::acquire+0xffff81ff>)
        callx8            a8

.literal.asm_test::swap::f32::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::swap::f32::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::swap::f32::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::swap::f32::relaxed+0x8> (ffff8105 <asm_test::swap::f32::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        wsr.scompare1     a11
        mov.n             a8, a3
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 30 <asm_test::swap::f32::relaxed+0x30> (a1f01d08 <asm_test::swap::f32::relaxed+0xa1f01d08>)
        l32r              a8, 34 <asm_test::swap::f32::relaxed+0x34> (ff81ffff <asm_test::swap::f32::relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::swap::f32::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::swap::f32::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::swap::f32::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::swap::f32::release+0x8> (ffff8105 <asm_test::swap::f32::release+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        wsr.scompare1     a11
        mov.n             a8, a3
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        mov.n             a2, a8
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::swap::f32::release+0xffa1f01d>)
        l32r              a8, 38 <asm_test::swap::f32::release+0x38> (ffff81ff <asm_test::swap::f32::release+0xffff81ff>)
        callx8            a8

.literal.asm_test::swap::u16::acqrel:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::swap::u16::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::swap::u16::acqrel+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::swap::u16::acqrel+0x8> (ffff8105 <asm_test::swap::u16::acqrel+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a10, 1b (a155b827 <asm_test::swap::u16::acqrel+0xa155b827>)
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
        j                 4f
3:
        mov.n             a15, a14
        beqi              a7, 1, 5f
4:
        and               a14, a15, a10
        or                a14, a14, a9
        wsr.scompare1     a15
        s32c1i            a14, a11, 0
        mov.n             a7, a13
        beq               a14, a15, 3b
        mov.n             a7, a12
        j                 3b
5:
        ssr               a8
        srl               a2, a14
        memw
        retw.n
6:
        l32r              a10, 64 <asm_test::swap::u16::acqrel+0x64> (ffffa1f0 <asm_test::swap::u16::acqrel+0xffffa1f0>)
        l32r              a8, fffc0068 <asm_test::swap::u16::acqrel+0xfffc0068>
        callx8            a8

.literal.asm_test::swap::u16::seqcst:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::swap::u16::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::swap::u16::seqcst+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::swap::u16::seqcst+0x8> (ffff8105 <asm_test::swap::u16::seqcst+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a10, 1b (a155b827 <asm_test::swap::u16::seqcst+0xa155b827>)
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
        j                 4f
3:
        mov.n             a15, a14
        beqi              a7, 1, 5f
4:
        and               a14, a15, a10
        or                a14, a14, a9
        wsr.scompare1     a15
        s32c1i            a14, a11, 0
        mov.n             a7, a13
        beq               a14, a15, 3b
        mov.n             a7, a12
        j                 3b
5:
        ssr               a8
        srl               a2, a14
        memw
        retw.n
6:
        l32r              a10, 64 <asm_test::swap::u16::seqcst+0x64> (ffffa1f0 <asm_test::swap::u16::seqcst+0xffffa1f0>)
        l32r              a8, fffc0068 <asm_test::swap::u16::seqcst+0xfffc0068>
        callx8            a8

.literal.asm_test::swap::u16::acquire:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::swap::u16::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::swap::u16::acquire+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::swap::u16::acquire+0x8> (ffff8105 <asm_test::swap::u16::acquire+0xffff8105>)
1:
        bgeu              a8, a2, 7f
2:
        l32r              a10, 1b (a152b827 <asm_test::swap::u16::acquire+0xa152b827>)
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
        j                 4f
3:
        mov.n             a15, a14
        beqi              a7, 1, 5f
4:
        and               a14, a15, a10
        or                a14, a14, a9
        wsr.scompare1     a15
        s32c1i            a14, a11, 0
        mov.n             a7, a13
        beq               a14, a15, 3b
        mov.n             a7, a12
        j                 3b
5:
        ssr               a8
        srl               a2, a14
        memw
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::swap::u16::acquire+0xffa1f01d>)
        l32r              a8, 64 <asm_test::swap::u16::acquire+0x64> (ffff81ff <asm_test::swap::u16::acquire+0xffff81ff>)
        callx8            a8

.literal.asm_test::swap::u16::relaxed:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::swap::u16::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::swap::u16::relaxed+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::swap::u16::relaxed+0x8> (ffff8105 <asm_test::swap::u16::relaxed+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a10, 1b (a14fb827 <asm_test::swap::u16::relaxed+0xa14fb827>)
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
        j                 4f
3:
        mov.n             a15, a14
        beqi              a7, 1, 5f
4:
        and               a14, a15, a10
        or                a14, a14, a9
        wsr.scompare1     a15
        s32c1i            a14, a11, 0
        mov.n             a7, a13
        beq               a14, a15, 3b
        mov.n             a7, a12
        j                 3b
5:
        ssr               a8
        srl               a2, a14
        retw.n
6:
        l32r              a10, 5c <asm_test::swap::u16::relaxed+0x5c> (a1f01d91 <asm_test::swap::u16::relaxed+0xa1f01d91>)
        l32r              a8, 60 <asm_test::swap::u16::relaxed+0x60> (ff81ffff <asm_test::swap::u16::relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::swap::u16::release:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::swap::u16::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::swap::u16::release+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::swap::u16::release+0x8> (ffff8105 <asm_test::swap::u16::release+0xffff8105>)
1:
        bgeu              a8, a2, 7f
2:
        l32r              a10, 1b (a152b827 <asm_test::swap::u16::release+0xa152b827>)
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
        j                 4f
3:
        mov.n             a15, a14
        beqi              a7, 1, 5f
4:
        and               a14, a15, a10
        or                a14, a14, a9
        wsr.scompare1     a15
        s32c1i            a14, a11, 0
        mov.n             a7, a13
        beq               a14, a15, 3b
        mov.n             a7, a12
        j                 3b
5:
        ssr               a8
        srl               a2, a14
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::swap::u16::release+0xffa1f01d>)
        l32r              a8, 64 <asm_test::swap::u16::release+0x64> (ffff81ff <asm_test::swap::u16::release+0xffff81ff>)
        callx8            a8

.literal.asm_test::swap::u32::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::swap::u32::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::swap::u32::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::swap::u32::acqrel+0x8> (ffff8105 <asm_test::swap::u32::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        wsr.scompare1     a11
        mov.n             a8, a3
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 38 <asm_test::swap::u32::acqrel+0x38> (ffffa1f0 <asm_test::swap::u32::acqrel+0xffffa1f0>)
        l32r              a8, fffc003c <asm_test::swap::u32::acqrel+0xfffc003c>
        callx8            a8

.literal.asm_test::swap::u32::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::swap::u32::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::swap::u32::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::swap::u32::seqcst+0x8> (ffff8105 <asm_test::swap::u32::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        wsr.scompare1     a11
        mov.n             a8, a3
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 38 <asm_test::swap::u32::seqcst+0x38> (ffffa1f0 <asm_test::swap::u32::seqcst+0xffffa1f0>)
        l32r              a8, fffc003c <asm_test::swap::u32::seqcst+0xfffc003c>
        callx8            a8

.literal.asm_test::swap::u32::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::swap::u32::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::swap::u32::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::swap::u32::acquire+0x8> (ffff8105 <asm_test::swap::u32::acquire+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        wsr.scompare1     a11
        mov.n             a8, a3
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::swap::u32::acquire+0xffa1f01d>)
        l32r              a8, 38 <asm_test::swap::u32::acquire+0x38> (ffff81ff <asm_test::swap::u32::acquire+0xffff81ff>)
        callx8            a8

.literal.asm_test::swap::u32::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::swap::u32::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::swap::u32::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::swap::u32::relaxed+0x8> (ffff8105 <asm_test::swap::u32::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        wsr.scompare1     a11
        mov.n             a8, a3
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 30 <asm_test::swap::u32::relaxed+0x30> (a1f01d08 <asm_test::swap::u32::relaxed+0xa1f01d08>)
        l32r              a8, 34 <asm_test::swap::u32::relaxed+0x34> (ff81ffff <asm_test::swap::u32::relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::swap::u32::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::swap::u32::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::swap::u32::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::swap::u32::release+0x8> (ffff8105 <asm_test::swap::u32::release+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        wsr.scompare1     a11
        mov.n             a8, a3
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        mov.n             a2, a8
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::swap::u32::release+0xffa1f01d>)
        l32r              a8, 38 <asm_test::swap::u32::release+0x38> (ffff81ff <asm_test::swap::u32::release+0xffff81ff>)
        callx8            a8

.literal.asm_test::swap::bool::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::swap::bool::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::swap::bool::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::swap::bool::acqrel+0x8> (ffff8105 <asm_test::swap::bool::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a9, a3
        movi              a10, 255
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
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        and               a14, a15, a10
        or                a14, a14, a9
        wsr.scompare1     a15
        s32c1i            a14, a11, 0
        mov.n             a7, a13
        beq               a14, a15, 2b
        mov.n             a7, a12
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n
5:
        l32r              a10, 64 <asm_test::swap::bool::acqrel+0x64> (a1f01d00 <asm_test::swap::bool::acqrel+0xa1f01d00>)
        l32r              a8, 68 <asm_test::swap::bool::acqrel+0x68> (ff81ffff <asm_test::swap::bool::acqrel+0xff81ffff>)
        callx8            a8

.literal.asm_test::swap::bool::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::swap::bool::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::swap::bool::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::swap::bool::seqcst+0x8> (ffff8105 <asm_test::swap::bool::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a9, a3
        movi              a10, 255
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
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        and               a14, a15, a10
        or                a14, a14, a9
        wsr.scompare1     a15
        s32c1i            a14, a11, 0
        mov.n             a7, a13
        beq               a14, a15, 2b
        mov.n             a7, a12
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n
5:
        l32r              a10, 64 <asm_test::swap::bool::seqcst+0x64> (a1f01d00 <asm_test::swap::bool::seqcst+0xa1f01d00>)
        l32r              a8, 68 <asm_test::swap::bool::seqcst+0x68> (ff81ffff <asm_test::swap::bool::seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::swap::bool::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::swap::bool::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::swap::bool::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::swap::bool::acquire+0x8> (ffff8105 <asm_test::swap::bool::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a9, a3
        movi              a10, 255
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a15, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        and               a14, a15, a10
        or                a14, a14, a9
        wsr.scompare1     a15
        s32c1i            a14, a11, 0
        mov.n             a7, a13
        beq               a14, a15, 2b
        mov.n             a7, a12
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n
5:
        l32r              a10, fffc0064 <asm_test::swap::bool::acquire+0xfffc0064>
        l32r              a8, 5b (810000a1 <asm_test::swap::bool::acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::swap::bool::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::swap::bool::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::swap::bool::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::swap::bool::relaxed+0x8> (ffff8105 <asm_test::swap::bool::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a9, a3
        movi              a10, 255
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a10, a10, a11
        movi.n            a11, -4
        and               a11, a2, a11
        l32i.n            a15, a11, 0
        movi.n            a12, 0
        movi.n            a13, 1
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        and               a14, a15, a10
        or                a14, a14, a9
        wsr.scompare1     a15
        s32c1i            a14, a11, 0
        mov.n             a7, a13
        beq               a14, a15, 2b
        mov.n             a7, a12
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        movi.n            a9, 1
        and               a2, a8, a9
        retw.n
5:
        l32r              a10, 60 <asm_test::swap::bool::relaxed+0x60> (ffffa1f0 <asm_test::swap::bool::relaxed+0xffffa1f0>)
        l32r              a8, fffc0064 <asm_test::swap::bool::relaxed+0xfffc0064>
        callx8            a8

.literal.asm_test::swap::bool::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::swap::bool::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::swap::bool::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::swap::bool::release+0x8> (ffff8105 <asm_test::swap::bool::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a9, a3
        movi              a10, 255
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
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        and               a14, a15, a10
        or                a14, a14, a9
        wsr.scompare1     a15
        s32c1i            a14, a11, 0
        mov.n             a7, a13
        beq               a14, a15, 2b
        mov.n             a7, a12
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        movi.n            a9, 1
        and               a2, a8, a9
        retw.n
5:
        l32r              a10, fffc0064 <asm_test::swap::bool::release+0xfffc0064>
        l32r              a8, 5b (810000a1 <asm_test::swap::bool::release+0x810000a1>)
        callx8            a8

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

asm_test::store::f32::seqcst:
        entry             a1, 32
        memw
        s32i.n            a3, a2, 0
        memw
        retw.n

asm_test::store::f32::relaxed:
        entry             a1, 32
        s32i.n            a3, a2, 0
        retw.n

asm_test::store::f32::release:
        entry             a1, 32
        memw
        s32i.n            a3, a2, 0
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

.literal.asm_test::bit_set::u8::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_set::u8::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_set::u8::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_set::u8::acqrel+0x8> (ffff8105 <asm_test::bit_set::u8::acqrel+0xffff8105>)
        bgeu              a8, a2, 7f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 7
        and               a9, a3, a9
        movi.n            a10, 1
        ssl               a9
        sll               a9, a10
        ssl               a8
        sll               a11, a9
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        or                a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 2b
        mov.n             a7, a13
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        memw
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::bit_set::u8::acqrel+0xffa1f01d>)
        l32r              a8, 68 <asm_test::bit_set::u8::acqrel+0x68> (ffff81ff <asm_test::bit_set::u8::acqrel+0xffff81ff>)
        callx8            a8

.literal.asm_test::bit_set::u8::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_set::u8::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_set::u8::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_set::u8::seqcst+0x8> (ffff8105 <asm_test::bit_set::u8::seqcst+0xffff8105>)
        bgeu              a8, a2, 7f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 7
        and               a9, a3, a9
        movi.n            a10, 1
        ssl               a9
        sll               a9, a10
        ssl               a8
        sll               a11, a9
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        or                a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 2b
        mov.n             a7, a13
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        memw
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::bit_set::u8::seqcst+0xffa1f01d>)
        l32r              a8, 68 <asm_test::bit_set::u8::seqcst+0x68> (ffff81ff <asm_test::bit_set::u8::seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::bit_set::u8::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_set::u8::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_set::u8::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_set::u8::acquire+0x8> (ffff8105 <asm_test::bit_set::u8::acquire+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 7
        and               a9, a3, a9
        movi.n            a10, 1
        ssl               a9
        sll               a9, a10
        ssl               a8
        sll               a11, a9
        movi.n            a12, -4
        and               a12, a2, a12
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        or                a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 2b
        mov.n             a7, a13
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        memw
        retw.n
6:
        l32r              a10, 60 <asm_test::bit_set::u8::acquire+0x60> (a1f01d00 <asm_test::bit_set::u8::acquire+0xa1f01d00>)
        l32r              a8, 64 <asm_test::bit_set::u8::acquire+0x64> (ff81ffff <asm_test::bit_set::u8::acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::bit_set::u8::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_set::u8::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_set::u8::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_set::u8::relaxed+0x8> (ffff8105 <asm_test::bit_set::u8::relaxed+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 7
        and               a9, a3, a9
        movi.n            a10, 1
        ssl               a9
        sll               a9, a10
        ssl               a8
        sll               a11, a9
        movi.n            a12, -4
        and               a12, a2, a12
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        or                a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 2b
        mov.n             a7, a13
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        retw.n
6:
        l32r              a10, fffc0060 <asm_test::bit_set::u8::relaxed+0xfffc0060>
        l32r              a8, 6b (810000a1 <asm_test::bit_set::u8::relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::bit_set::u8::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_set::u8::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_set::u8::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_set::u8::release+0x8> (ffff8105 <asm_test::bit_set::u8::release+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 7
        and               a9, a3, a9
        movi.n            a10, 1
        ssl               a9
        sll               a9, a10
        ssl               a8
        sll               a11, a9
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        or                a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 2b
        mov.n             a7, a13
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        retw.n
6:
        l32r              a10, 60 <asm_test::bit_set::u8::release+0x60> (a1f01d12 <asm_test::bit_set::u8::release+0xa1f01d12>)
        l32r              a8, 64 <asm_test::bit_set::u8::release+0x64> (ff81ffff <asm_test::bit_set::u8::release+0xff81ffff>)
        callx8            a8

.literal.asm_test::bit_set::u16::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_set::u16::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_set::u16::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_set::u16::acqrel+0x8> (ffff8105 <asm_test::bit_set::u16::acqrel+0xffff8105>)
        bgeu              a8, a2, 7f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 15
        and               a9, a3, a9
        movi.n            a10, 1
        ssl               a9
        sll               a9, a10
        ssl               a8
        sll               a11, a9
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        or                a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 2b
        mov.n             a7, a13
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        memw
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::bit_set::u16::acqrel+0xffa1f01d>)
        l32r              a8, 68 <asm_test::bit_set::u16::acqrel+0x68> (ffff81ff <asm_test::bit_set::u16::acqrel+0xffff81ff>)
        callx8            a8

.literal.asm_test::bit_set::u16::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_set::u16::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_set::u16::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_set::u16::seqcst+0x8> (ffff8105 <asm_test::bit_set::u16::seqcst+0xffff8105>)
        bgeu              a8, a2, 7f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 15
        and               a9, a3, a9
        movi.n            a10, 1
        ssl               a9
        sll               a9, a10
        ssl               a8
        sll               a11, a9
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        or                a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 2b
        mov.n             a7, a13
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        memw
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::bit_set::u16::seqcst+0xffa1f01d>)
        l32r              a8, 68 <asm_test::bit_set::u16::seqcst+0x68> (ffff81ff <asm_test::bit_set::u16::seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::bit_set::u16::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_set::u16::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_set::u16::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_set::u16::acquire+0x8> (ffff8105 <asm_test::bit_set::u16::acquire+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 15
        and               a9, a3, a9
        movi.n            a10, 1
        ssl               a9
        sll               a9, a10
        ssl               a8
        sll               a11, a9
        movi.n            a12, -4
        and               a12, a2, a12
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        or                a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 2b
        mov.n             a7, a13
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        memw
        retw.n
6:
        l32r              a10, 60 <asm_test::bit_set::u16::acquire+0x60> (a1f01d00 <asm_test::bit_set::u16::acquire+0xa1f01d00>)
        l32r              a8, 64 <asm_test::bit_set::u16::acquire+0x64> (ff81ffff <asm_test::bit_set::u16::acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::bit_set::u16::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_set::u16::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_set::u16::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_set::u16::relaxed+0x8> (ffff8105 <asm_test::bit_set::u16::relaxed+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 15
        and               a9, a3, a9
        movi.n            a10, 1
        ssl               a9
        sll               a9, a10
        ssl               a8
        sll               a11, a9
        movi.n            a12, -4
        and               a12, a2, a12
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        or                a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 2b
        mov.n             a7, a13
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        retw.n
6:
        l32r              a10, fffc0060 <asm_test::bit_set::u16::relaxed+0xfffc0060>
        l32r              a8, 6b (810000a1 <asm_test::bit_set::u16::relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::bit_set::u16::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_set::u16::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_set::u16::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_set::u16::release+0x8> (ffff8105 <asm_test::bit_set::u16::release+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 15
        and               a9, a3, a9
        movi.n            a10, 1
        ssl               a9
        sll               a9, a10
        ssl               a8
        sll               a11, a9
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        or                a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 2b
        mov.n             a7, a13
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        retw.n
6:
        l32r              a10, 60 <asm_test::bit_set::u16::release+0x60> (a1f01d12 <asm_test::bit_set::u16::release+0xa1f01d12>)
        l32r              a8, 64 <asm_test::bit_set::u16::release+0x64> (ff81ffff <asm_test::bit_set::u16::release+0xff81ffff>)
        callx8            a8

.literal.asm_test::bit_set::u32::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_set::u32::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_set::u32::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_set::u32::acqrel+0x8> (ffff8105 <asm_test::bit_set::u32::acqrel+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        movi.n            a8, 31
        and               a9, a3, a8
        movi.n            a8, 1
        ssl               a9
        sll               a9, a8
        memw
        l32i.n            a12, a2, 0
        movi.n            a10, 0
        j                 3f
2:
        mov.n             a12, a11
        beqi              a13, 1, 4f
3:
        or                a11, a12, a9
        wsr.scompare1     a12
        s32c1i            a11, a2, 0
        mov.n             a13, a8
        beq               a11, a12, 2b
        mov.n             a13, a10
        j                 2b
4:
        and               a8, a11, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        memw
        retw.n
6:
        l32r              a10, 4c <asm_test::bit_set::u32::acqrel+0x4c> (ffffa1f0 <asm_test::bit_set::u32::acqrel+0xffffa1f0>)
        l32r              a8, fffc0050 <asm_test::bit_set::u32::acqrel+0xfffc0050>
        callx8            a8

.literal.asm_test::bit_set::u32::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_set::u32::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_set::u32::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_set::u32::seqcst+0x8> (ffff8105 <asm_test::bit_set::u32::seqcst+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        movi.n            a8, 31
        and               a9, a3, a8
        movi.n            a8, 1
        ssl               a9
        sll               a9, a8
        memw
        l32i.n            a12, a2, 0
        movi.n            a10, 0
        j                 3f
2:
        mov.n             a12, a11
        beqi              a13, 1, 4f
3:
        or                a11, a12, a9
        wsr.scompare1     a12
        s32c1i            a11, a2, 0
        mov.n             a13, a8
        beq               a11, a12, 2b
        mov.n             a13, a10
        j                 2b
4:
        and               a8, a11, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        memw
        retw.n
6:
        l32r              a10, 4c <asm_test::bit_set::u32::seqcst+0x4c> (ffffa1f0 <asm_test::bit_set::u32::seqcst+0xffffa1f0>)
        l32r              a8, fffc0050 <asm_test::bit_set::u32::seqcst+0xfffc0050>
        callx8            a8

.literal.asm_test::bit_set::u32::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_set::u32::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_set::u32::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_set::u32::acquire+0x8> (ffff8105 <asm_test::bit_set::u32::acquire+0xffff8105>)
        bgeu              a8, a2, 7f
1:
        movi.n            a8, 31
        and               a9, a3, a8
        movi.n            a8, 1
        ssl               a9
        sll               a9, a8
        l32i.n            a12, a2, 0
        movi.n            a10, 0
        j                 3f
2:
        mov.n             a12, a11
        beqi              a13, 1, 4f
3:
        or                a11, a12, a9
        wsr.scompare1     a12
        s32c1i            a11, a2, 0
        mov.n             a13, a8
        beq               a11, a12, 2b
        mov.n             a13, a10
        j                 2b
4:
        and               a8, a11, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        memw
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::bit_set::u32::acquire+0xffa1f01d>)
        l32r              a8, 4c <asm_test::bit_set::u32::acquire+0x4c> (ffff81ff <asm_test::bit_set::u32::acquire+0xffff81ff>)
        callx8            a8

.literal.asm_test::bit_set::u32::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_set::u32::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_set::u32::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_set::u32::relaxed+0x8> (ffff8105 <asm_test::bit_set::u32::relaxed+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        movi.n            a8, 31
        and               a9, a3, a8
        movi.n            a8, 1
        ssl               a9
        sll               a9, a8
        l32i.n            a12, a2, 0
        movi.n            a10, 0
        j                 3f
2:
        mov.n             a12, a11
        beqi              a13, 1, 4f
3:
        or                a11, a12, a9
        wsr.scompare1     a12
        s32c1i            a11, a2, 0
        mov.n             a13, a8
        beq               a11, a12, 2b
        mov.n             a13, a10
        j                 2b
4:
        and               a8, a11, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        retw.n
6:
        l32r              a10, 44 <asm_test::bit_set::u32::relaxed+0x44> (a1f01d12 <asm_test::bit_set::u32::relaxed+0xa1f01d12>)
        l32r              a8, 48 <asm_test::bit_set::u32::relaxed+0x48> (ff81ffff <asm_test::bit_set::u32::relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::bit_set::u32::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_set::u32::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_set::u32::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_set::u32::release+0x8> (ffff8105 <asm_test::bit_set::u32::release+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        movi.n            a8, 31
        and               a9, a3, a8
        movi.n            a8, 1
        ssl               a9
        sll               a9, a8
        memw
        l32i.n            a12, a2, 0
        movi.n            a10, 0
        j                 3f
2:
        mov.n             a12, a11
        beqi              a13, 1, 4f
3:
        or                a11, a12, a9
        wsr.scompare1     a12
        s32c1i            a11, a2, 0
        mov.n             a13, a8
        beq               a11, a12, 2b
        mov.n             a13, a10
        j                 2b
4:
        and               a8, a11, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::bit_set::u32::release+0xffa1f01d>)
        l32r              a8, 4c <asm_test::bit_set::u32::release+0x4c> (ffff81ff <asm_test::bit_set::u32::release+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_or::u8::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_or::u8::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_or::u8::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_or::u8::acqrel+0x8> (ffff8105 <asm_test::fetch_or::u8::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        or                a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a2, a13
        memw
        retw.n
5:
        l32r              a10, 54 <asm_test::fetch_or::u8::acqrel+0x54> (a1f01d00 <asm_test::fetch_or::u8::acqrel+0xa1f01d00>)
        l32r              a8, 58 <asm_test::fetch_or::u8::acqrel+0x58> (ff81ffff <asm_test::fetch_or::u8::acqrel+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_or::u8::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_or::u8::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_or::u8::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_or::u8::seqcst+0x8> (ffff8105 <asm_test::fetch_or::u8::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        or                a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a2, a13
        memw
        retw.n
5:
        l32r              a10, 54 <asm_test::fetch_or::u8::seqcst+0x54> (a1f01d00 <asm_test::fetch_or::u8::seqcst+0xa1f01d00>)
        l32r              a8, 58 <asm_test::fetch_or::u8::seqcst+0x58> (ff81ffff <asm_test::fetch_or::u8::seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_or::u8::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_or::u8::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_or::u8::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_or::u8::acquire+0x8> (ffff8105 <asm_test::fetch_or::u8::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        or                a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a2, a13
        memw
        retw.n
5:
        l32r              a10, fffc0054 <asm_test::fetch_or::u8::acquire+0xfffc0054>
        l32r              a8, 5b (810000a1 <asm_test::fetch_or::u8::acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_or::u8::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_or::u8::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_or::u8::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_or::u8::relaxed+0x8> (ffff8105 <asm_test::fetch_or::u8::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        or                a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a2, a13
        retw.n
5:
        l32r              a10, 50 <asm_test::fetch_or::u8::relaxed+0x50> (ffffa1f0 <asm_test::fetch_or::u8::relaxed+0xffffa1f0>)
        l32r              a8, fffc0054 <asm_test::fetch_or::u8::relaxed+0xfffc0054>
        callx8            a8

.literal.asm_test::fetch_or::u8::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_or::u8::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_or::u8::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_or::u8::release+0x8> (ffff8105 <asm_test::fetch_or::u8::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        or                a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a2, a13
        retw.n
5:
        l32r              a10, fffc0054 <asm_test::fetch_or::u8::release+0xfffc0054>
        l32r              a8, 5b (810000a1 <asm_test::fetch_or::u8::release+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_or::u16::acqrel:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_or::u16::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_or::u16::acqrel+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::fetch_or::u16::acqrel+0x8> (ffff8105 <asm_test::fetch_or::u16::acqrel+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a8, 1b (8147b827 <asm_test::fetch_or::u16::acqrel+0x8147b827>)
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
        j                 4f
3:
        mov.n             a14, a13
        beqi              a15, 1, 5f
4:
        or                a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 3b
        mov.n             a15, a11
        j                 3b
5:
        ssr               a8
        srl               a2, a13
        memw
        retw.n
6:
        l32r              a10, 54 <asm_test::fetch_or::u16::acqrel+0x54> (a1f01d00 <asm_test::fetch_or::u16::acqrel+0xa1f01d00>)
        l32r              a8, 58 <asm_test::fetch_or::u16::acqrel+0x58> (ff81ffff <asm_test::fetch_or::u16::acqrel+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_or::u16::seqcst:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_or::u16::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_or::u16::seqcst+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::fetch_or::u16::seqcst+0x8> (ffff8105 <asm_test::fetch_or::u16::seqcst+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a8, 1b (8147b827 <asm_test::fetch_or::u16::seqcst+0x8147b827>)
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
        j                 4f
3:
        mov.n             a14, a13
        beqi              a15, 1, 5f
4:
        or                a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 3b
        mov.n             a15, a11
        j                 3b
5:
        ssr               a8
        srl               a2, a13
        memw
        retw.n
6:
        l32r              a10, 54 <asm_test::fetch_or::u16::seqcst+0x54> (a1f01d00 <asm_test::fetch_or::u16::seqcst+0xa1f01d00>)
        l32r              a8, 58 <asm_test::fetch_or::u16::seqcst+0x58> (ff81ffff <asm_test::fetch_or::u16::seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_or::u16::acquire:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_or::u16::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_or::u16::acquire+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::fetch_or::u16::acquire+0x8> (ffff8105 <asm_test::fetch_or::u16::acquire+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a8, 1b (8144b827 <asm_test::fetch_or::u16::acquire+0x8144b827>)
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
        j                 4f
3:
        mov.n             a14, a13
        beqi              a15, 1, 5f
4:
        or                a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 3b
        mov.n             a15, a11
        j                 3b
5:
        ssr               a8
        srl               a2, a13
        memw
        retw.n
6:
        l32r              a10, fffc0054 <asm_test::fetch_or::u16::acquire+0xfffc0054>
        l32r              a8, 6b (810000a1 <asm_test::fetch_or::u16::acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_or::u16::relaxed:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_or::u16::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_or::u16::relaxed+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::fetch_or::u16::relaxed+0x8> (ffff8105 <asm_test::fetch_or::u16::relaxed+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a8, 1b (8141b827 <asm_test::fetch_or::u16::relaxed+0x8141b827>)
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
        j                 4f
3:
        mov.n             a14, a13
        beqi              a15, 1, 5f
4:
        or                a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 3b
        mov.n             a15, a11
        j                 3b
5:
        ssr               a8
        srl               a2, a13
        retw.n
6:
        l32r              a10, 50 <asm_test::fetch_or::u16::relaxed+0x50> (ffffa1f0 <asm_test::fetch_or::u16::relaxed+0xffffa1f0>)
        l32r              a8, fffc0054 <asm_test::fetch_or::u16::relaxed+0xfffc0054>
        callx8            a8

.literal.asm_test::fetch_or::u16::release:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_or::u16::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_or::u16::release+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::fetch_or::u16::release+0x8> (ffff8105 <asm_test::fetch_or::u16::release+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a8, 1b (8144b827 <asm_test::fetch_or::u16::release+0x8144b827>)
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
        j                 4f
3:
        mov.n             a14, a13
        beqi              a15, 1, 5f
4:
        or                a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 3b
        mov.n             a15, a11
        j                 3b
5:
        ssr               a8
        srl               a2, a13
        retw.n
6:
        l32r              a10, fffc0054 <asm_test::fetch_or::u16::release+0xfffc0054>
        l32r              a8, 6b (810000a1 <asm_test::fetch_or::u16::release+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_or::u32::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_or::u32::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_or::u32::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_or::u32::acqrel+0x8> (ffff8105 <asm_test::fetch_or::u32::acqrel+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        or                a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_or::u32::acqrel+0xffa1f01d>)
        l32r              a8, 3c <asm_test::fetch_or::u32::acqrel+0x3c> (ffff81ff <asm_test::fetch_or::u32::acqrel+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_or::u32::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_or::u32::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_or::u32::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_or::u32::seqcst+0x8> (ffff8105 <asm_test::fetch_or::u32::seqcst+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        or                a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_or::u32::seqcst+0xffa1f01d>)
        l32r              a8, 3c <asm_test::fetch_or::u32::seqcst+0x3c> (ffff81ff <asm_test::fetch_or::u32::seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_or::u32::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_or::u32::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_or::u32::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_or::u32::acquire+0x8> (ffff8105 <asm_test::fetch_or::u32::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        or                a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 34 <asm_test::fetch_or::u32::acquire+0x34> (a1f01d08 <asm_test::fetch_or::u32::acquire+0xa1f01d08>)
        l32r              a8, 38 <asm_test::fetch_or::u32::acquire+0x38> (ff81ffff <asm_test::fetch_or::u32::acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_or::u32::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_or::u32::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_or::u32::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_or::u32::relaxed+0x8> (ffff8105 <asm_test::fetch_or::u32::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        or                a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, fffc0034 <asm_test::fetch_or::u32::relaxed+0xfffc0034>
        l32r              a8, 5b (810000a1 <asm_test::fetch_or::u32::relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_or::u32::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_or::u32::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_or::u32::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_or::u32::release+0x8> (ffff8105 <asm_test::fetch_or::u32::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        or                a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 34 <asm_test::fetch_or::u32::release+0x34> (a1f01d08 <asm_test::fetch_or::u32::release+0xa1f01d08>)
        l32r              a8, 38 <asm_test::fetch_or::u32::release+0x38> (ff81ffff <asm_test::fetch_or::u32::release+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_or::bool::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_or::bool::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_or::bool::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_or::bool::acqrel+0x8> (ffff8105 <asm_test::fetch_or::bool::acqrel+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        or                a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a8, a13
        movi.n            a9, 1
        and               a2, a8, a9
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_or::bool::acqrel+0xffa1f01d>)
        l32r              a8, 58 <asm_test::fetch_or::bool::acqrel+0x58> (ffff81ff <asm_test::fetch_or::bool::acqrel+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_or::bool::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_or::bool::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_or::bool::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_or::bool::seqcst+0x8> (ffff8105 <asm_test::fetch_or::bool::seqcst+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        or                a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a8, a13
        movi.n            a9, 1
        and               a2, a8, a9
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_or::bool::seqcst+0xffa1f01d>)
        l32r              a8, 58 <asm_test::fetch_or::bool::seqcst+0x58> (ffff81ff <asm_test::fetch_or::bool::seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_or::bool::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_or::bool::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_or::bool::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_or::bool::acquire+0x8> (ffff8105 <asm_test::fetch_or::bool::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        or                a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a8, a13
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n
5:
        l32r              a10, 50 <asm_test::fetch_or::bool::acquire+0x50> (a1f01d00 <asm_test::fetch_or::bool::acquire+0xa1f01d00>)
        l32r              a8, 54 <asm_test::fetch_or::bool::acquire+0x54> (ff81ffff <asm_test::fetch_or::bool::acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_or::bool::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_or::bool::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_or::bool::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_or::bool::relaxed+0x8> (ffff8105 <asm_test::fetch_or::bool::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        or                a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a8, a13
        movi.n            a9, 1
        and               a2, a8, a9
        retw.n
5:
        l32r              a10, fffc0050 <asm_test::fetch_or::bool::relaxed+0xfffc0050>
        l32r              a8, 5b (810000a1 <asm_test::fetch_or::bool::relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_or::bool::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_or::bool::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_or::bool::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_or::bool::release+0x8> (ffff8105 <asm_test::fetch_or::bool::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        or                a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a8, a13
        movi.n            a9, 1
        and               a2, a8, a9
        retw.n
5:
        l32r              a10, 50 <asm_test::fetch_or::bool::release+0x50> (a1f01d10 <asm_test::fetch_or::bool::release+0xa1f01d10>)
        l32r              a8, 54 <asm_test::fetch_or::bool::release+0x54> (ff81ffff <asm_test::fetch_or::bool::release+0xff81ffff>)
        callx8            a8

.literal.asm_test::bit_clear::u8::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_clear::u8::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_clear::u8::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_clear::u8::acqrel+0x8> (ffff8105 <asm_test::bit_clear::u8::acqrel+0xffff8105>)
        bgeu              a8, a2, 7f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 7
        and               a9, a3, a9
        movi.n            a10, 1
        ssl               a9
        sll               a9, a10
        movi              a11, 255
        xor               a12, a9, a11
        ssl               a8
        sll               a12, a12
        ssl               a8
        sll               a11, a11
        movi.n            a13, -1
        xor               a11, a11, a13
        or                a11, a12, a11
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        and               a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 2b
        mov.n             a7, a13
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        memw
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::bit_clear::u8::acqrel+0xffa1f01d>)
        l32r              a8, 7c <asm_test::bit_clear::u8::acqrel+0x7c> (ffff81ff <asm_test::bit_clear::u8::acqrel+0xffff81ff>)
        callx8            a8

.literal.asm_test::bit_clear::u8::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_clear::u8::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_clear::u8::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_clear::u8::seqcst+0x8> (ffff8105 <asm_test::bit_clear::u8::seqcst+0xffff8105>)
        bgeu              a8, a2, 7f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 7
        and               a9, a3, a9
        movi.n            a10, 1
        ssl               a9
        sll               a9, a10
        movi              a11, 255
        xor               a12, a9, a11
        ssl               a8
        sll               a12, a12
        ssl               a8
        sll               a11, a11
        movi.n            a13, -1
        xor               a11, a11, a13
        or                a11, a12, a11
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        and               a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 2b
        mov.n             a7, a13
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        memw
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::bit_clear::u8::seqcst+0xffa1f01d>)
        l32r              a8, 7c <asm_test::bit_clear::u8::seqcst+0x7c> (ffff81ff <asm_test::bit_clear::u8::seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::bit_clear::u8::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_clear::u8::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_clear::u8::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_clear::u8::acquire+0x8> (ffff8105 <asm_test::bit_clear::u8::acquire+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 7
        and               a9, a3, a9
        movi.n            a10, 1
        ssl               a9
        sll               a9, a10
        movi              a11, 255
        xor               a12, a9, a11
        ssl               a8
        sll               a12, a12
        ssl               a8
        sll               a11, a11
        movi.n            a13, -1
        xor               a11, a11, a13
        or                a11, a12, a11
        movi.n            a12, -4
        and               a12, a2, a12
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        and               a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 2b
        mov.n             a7, a13
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        memw
        retw.n
6:
        l32r              a10, 74 <asm_test::bit_clear::u8::acquire+0x74> (a1f01d00 <asm_test::bit_clear::u8::acquire+0xa1f01d00>)
        l32r              a8, 78 <asm_test::bit_clear::u8::acquire+0x78> (ff81ffff <asm_test::bit_clear::u8::acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::bit_clear::u8::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_clear::u8::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_clear::u8::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_clear::u8::relaxed+0x8> (ffff8105 <asm_test::bit_clear::u8::relaxed+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 7
        and               a9, a3, a9
        movi.n            a10, 1
        ssl               a9
        sll               a9, a10
        movi              a11, 255
        xor               a12, a9, a11
        ssl               a8
        sll               a12, a12
        ssl               a8
        sll               a11, a11
        movi.n            a13, -1
        xor               a11, a11, a13
        or                a11, a12, a11
        movi.n            a12, -4
        and               a12, a2, a12
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        and               a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 2b
        mov.n             a7, a13
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        retw.n
6:
        l32r              a10, fffc0074 <asm_test::bit_clear::u8::relaxed+0xfffc0074>
        l32r              a8, 6b (810000a1 <asm_test::bit_clear::u8::relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::bit_clear::u8::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_clear::u8::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_clear::u8::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_clear::u8::release+0x8> (ffff8105 <asm_test::bit_clear::u8::release+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 7
        and               a9, a3, a9
        movi.n            a10, 1
        ssl               a9
        sll               a9, a10
        movi              a11, 255
        xor               a12, a9, a11
        ssl               a8
        sll               a12, a12
        ssl               a8
        sll               a11, a11
        movi.n            a13, -1
        xor               a11, a11, a13
        or                a11, a12, a11
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        and               a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 2b
        mov.n             a7, a13
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        retw.n
6:
        l32r              a10, 74 <asm_test::bit_clear::u8::release+0x74> (a1f01d12 <asm_test::bit_clear::u8::release+0xa1f01d12>)
        l32r              a8, 78 <asm_test::bit_clear::u8::release+0x78> (ff81ffff <asm_test::bit_clear::u8::release+0xff81ffff>)
        callx8            a8

.literal.asm_test::bit_clear::u16::acqrel:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::bit_clear::u16::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_clear::u16::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_clear::u16::acqrel+0x8> (ffff8105 <asm_test::bit_clear::u16::acqrel+0xffff8105>)
        bgeu              a8, a2, 7f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 15
        and               a9, a3, a9
        movi.n            a10, 1
        ssl               a9
        sll               a9, a10
        l32r              a11, fffc0024 <asm_test::bit_clear::u16::acqrel+0xfffc0024>
        xor               a12, a9, a11
        ssl               a8
        sll               a12, a12
        ssl               a8
        sll               a11, a11
        movi.n            a13, -1
        xor               a11, a11, a13
        or                a11, a12, a11
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        and               a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 2b
        mov.n             a7, a13
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        memw
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::bit_clear::u16::acqrel+0xffa1f01d>)
        l32r              a8, 7c <asm_test::bit_clear::u16::acqrel+0x7c> (ffff81ff <asm_test::bit_clear::u16::acqrel+0xffff81ff>)
        callx8            a8

.literal.asm_test::bit_clear::u16::seqcst:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::bit_clear::u16::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_clear::u16::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_clear::u16::seqcst+0x8> (ffff8105 <asm_test::bit_clear::u16::seqcst+0xffff8105>)
        bgeu              a8, a2, 7f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 15
        and               a9, a3, a9
        movi.n            a10, 1
        ssl               a9
        sll               a9, a10
        l32r              a11, fffc0024 <asm_test::bit_clear::u16::seqcst+0xfffc0024>
        xor               a12, a9, a11
        ssl               a8
        sll               a12, a12
        ssl               a8
        sll               a11, a11
        movi.n            a13, -1
        xor               a11, a11, a13
        or                a11, a12, a11
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        and               a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 2b
        mov.n             a7, a13
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        memw
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::bit_clear::u16::seqcst+0xffa1f01d>)
        l32r              a8, 7c <asm_test::bit_clear::u16::seqcst+0x7c> (ffff81ff <asm_test::bit_clear::u16::seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::bit_clear::u16::acquire:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::bit_clear::u16::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_clear::u16::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_clear::u16::acquire+0x8> (ffff8105 <asm_test::bit_clear::u16::acquire+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 15
        and               a9, a3, a9
        movi.n            a10, 1
        ssl               a9
        sll               a9, a10
        l32r              a11, fffc0024 <asm_test::bit_clear::u16::acquire+0xfffc0024>
        xor               a12, a9, a11
        ssl               a8
        sll               a12, a12
        ssl               a8
        sll               a11, a11
        movi.n            a13, -1
        xor               a11, a11, a13
        or                a11, a12, a11
        movi.n            a12, -4
        and               a12, a2, a12
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        and               a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 2b
        mov.n             a7, a13
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        memw
        retw.n
6:
        l32r              a10, 74 <asm_test::bit_clear::u16::acquire+0x74> (a1f01d00 <asm_test::bit_clear::u16::acquire+0xa1f01d00>)
        l32r              a8, 78 <asm_test::bit_clear::u16::acquire+0x78> (ff81ffff <asm_test::bit_clear::u16::acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::bit_clear::u16::relaxed:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::bit_clear::u16::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_clear::u16::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_clear::u16::relaxed+0x8> (ffff8105 <asm_test::bit_clear::u16::relaxed+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 15
        and               a9, a3, a9
        movi.n            a10, 1
        ssl               a9
        sll               a9, a10
        l32r              a11, fffc0024 <asm_test::bit_clear::u16::relaxed+0xfffc0024>
        xor               a12, a9, a11
        ssl               a8
        sll               a12, a12
        ssl               a8
        sll               a11, a11
        movi.n            a13, -1
        xor               a11, a11, a13
        or                a11, a12, a11
        movi.n            a12, -4
        and               a12, a2, a12
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        and               a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 2b
        mov.n             a7, a13
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        retw.n
6:
        l32r              a10, fffc0074 <asm_test::bit_clear::u16::relaxed+0xfffc0074>
        l32r              a8, 6b (810000a1 <asm_test::bit_clear::u16::relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::bit_clear::u16::release:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::bit_clear::u16::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_clear::u16::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_clear::u16::release+0x8> (ffff8105 <asm_test::bit_clear::u16::release+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        movi.n            a9, 15
        and               a9, a3, a9
        movi.n            a10, 1
        ssl               a9
        sll               a9, a10
        l32r              a11, fffc0024 <asm_test::bit_clear::u16::release+0xfffc0024>
        xor               a12, a9, a11
        ssl               a8
        sll               a12, a12
        ssl               a8
        sll               a11, a11
        movi.n            a13, -1
        xor               a11, a11, a13
        or                a11, a12, a11
        movi.n            a12, -4
        and               a12, a2, a12
        memw
        l32i.n            a15, a12, 0
        movi.n            a13, 0
        j                 3f
2:
        mov.n             a15, a14
        beqi              a7, 1, 4f
3:
        and               a14, a15, a11
        wsr.scompare1     a15
        s32c1i            a14, a12, 0
        mov.n             a7, a10
        beq               a14, a15, 2b
        mov.n             a7, a13
        j                 2b
4:
        ssr               a8
        srl               a8, a14
        and               a8, a8, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        retw.n
6:
        l32r              a10, 74 <asm_test::bit_clear::u16::release+0x74> (a1f01d12 <asm_test::bit_clear::u16::release+0xa1f01d12>)
        l32r              a8, 78 <asm_test::bit_clear::u16::release+0x78> (ff81ffff <asm_test::bit_clear::u16::release+0xff81ffff>)
        callx8            a8

.literal.asm_test::bit_clear::u32::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_clear::u32::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_clear::u32::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_clear::u32::acqrel+0x8> (ffff8105 <asm_test::bit_clear::u32::acqrel+0xffff8105>)
        bgeu              a8, a2, 7f
1:
        movi.n            a8, 31
        and               a9, a3, a8
        movi.n            a8, 1
        ssl               a9
        sll               a9, a8
        movi.n            a10, -1
        xor               a10, a9, a10
        memw
        l32i.n            a13, a2, 0
        movi.n            a11, 0
        j                 3f
2:
        mov.n             a13, a12
        beqi              a14, 1, 4f
3:
        and               a12, a13, a10
        wsr.scompare1     a13
        s32c1i            a12, a2, 0
        mov.n             a14, a8
        beq               a12, a13, 2b
        mov.n             a14, a11
        j                 2b
4:
        and               a8, a12, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        memw
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::bit_clear::u32::acqrel+0xffa1f01d>)
        l32r              a8, 54 <asm_test::bit_clear::u32::acqrel+0x54> (ffff81ff <asm_test::bit_clear::u32::acqrel+0xffff81ff>)
        callx8            a8

.literal.asm_test::bit_clear::u32::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_clear::u32::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_clear::u32::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_clear::u32::seqcst+0x8> (ffff8105 <asm_test::bit_clear::u32::seqcst+0xffff8105>)
        bgeu              a8, a2, 7f
1:
        movi.n            a8, 31
        and               a9, a3, a8
        movi.n            a8, 1
        ssl               a9
        sll               a9, a8
        movi.n            a10, -1
        xor               a10, a9, a10
        memw
        l32i.n            a13, a2, 0
        movi.n            a11, 0
        j                 3f
2:
        mov.n             a13, a12
        beqi              a14, 1, 4f
3:
        and               a12, a13, a10
        wsr.scompare1     a13
        s32c1i            a12, a2, 0
        mov.n             a14, a8
        beq               a12, a13, 2b
        mov.n             a14, a11
        j                 2b
4:
        and               a8, a12, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        memw
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::bit_clear::u32::seqcst+0xffa1f01d>)
        l32r              a8, 54 <asm_test::bit_clear::u32::seqcst+0x54> (ffff81ff <asm_test::bit_clear::u32::seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::bit_clear::u32::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_clear::u32::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_clear::u32::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_clear::u32::acquire+0x8> (ffff8105 <asm_test::bit_clear::u32::acquire+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        movi.n            a8, 31
        and               a9, a3, a8
        movi.n            a8, 1
        ssl               a9
        sll               a9, a8
        movi.n            a10, -1
        xor               a10, a9, a10
        l32i.n            a13, a2, 0
        movi.n            a11, 0
        j                 3f
2:
        mov.n             a13, a12
        beqi              a14, 1, 4f
3:
        and               a12, a13, a10
        wsr.scompare1     a13
        s32c1i            a12, a2, 0
        mov.n             a14, a8
        beq               a12, a13, 2b
        mov.n             a14, a11
        j                 2b
4:
        and               a8, a12, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        memw
        retw.n
6:
        l32r              a10, 4c <asm_test::bit_clear::u32::acquire+0x4c> (a1f01d00 <asm_test::bit_clear::u32::acquire+0xa1f01d00>)
        l32r              a8, 50 <asm_test::bit_clear::u32::acquire+0x50> (ff81ffff <asm_test::bit_clear::u32::acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::bit_clear::u32::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_clear::u32::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_clear::u32::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_clear::u32::relaxed+0x8> (ffff8105 <asm_test::bit_clear::u32::relaxed+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        movi.n            a8, 31
        and               a9, a3, a8
        movi.n            a8, 1
        ssl               a9
        sll               a9, a8
        movi.n            a10, -1
        xor               a10, a9, a10
        l32i.n            a13, a2, 0
        movi.n            a11, 0
        j                 3f
2:
        mov.n             a13, a12
        beqi              a14, 1, 4f
3:
        and               a12, a13, a10
        wsr.scompare1     a13
        s32c1i            a12, a2, 0
        mov.n             a14, a8
        beq               a12, a13, 2b
        mov.n             a14, a11
        j                 2b
4:
        and               a8, a12, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        retw.n
6:
        l32r              a10, fffc004c <asm_test::bit_clear::u32::relaxed+0xfffc004c>
        l32r              a8, 6b (810000a1 <asm_test::bit_clear::u32::relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::bit_clear::u32::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::bit_clear::u32::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::bit_clear::u32::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::bit_clear::u32::release+0x8> (ffff8105 <asm_test::bit_clear::u32::release+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        movi.n            a8, 31
        and               a9, a3, a8
        movi.n            a8, 1
        ssl               a9
        sll               a9, a8
        movi.n            a10, -1
        xor               a10, a9, a10
        memw
        l32i.n            a13, a2, 0
        movi.n            a11, 0
        j                 3f
2:
        mov.n             a13, a12
        beqi              a14, 1, 4f
3:
        and               a12, a13, a10
        wsr.scompare1     a13
        s32c1i            a12, a2, 0
        mov.n             a14, a8
        beq               a12, a13, 2b
        mov.n             a14, a11
        j                 2b
4:
        and               a8, a12, a9
        movi.n            a2, 0
        beq               a8, a2, 5f
        movi.n            a2, 1
5:
        retw.n
6:
        l32r              a10, 4c <asm_test::bit_clear::u32::release+0x4c> (a1f01d12 <asm_test::bit_clear::u32::release+0xa1f01d12>)
        l32r              a8, 50 <asm_test::bit_clear::u32::release+0x50> (ff81ffff <asm_test::bit_clear::u32::release+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_abs::f32::acqrel:
        add               a0, a0, a0
        .byte             0x3f
        {                 excw; excw }

asm_test::fetch_abs::f32::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_abs::f32::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_abs::f32::acqrel+0x8> (ffff8105 <asm_test::fetch_abs::f32::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        l32r              a8, fffc0020 <asm_test::fetch_abs::f32::acqrel+0xfffc0020>
        and               a8, a11, a8
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 3c <asm_test::fetch_abs::f32::acqrel+0x3c> (ffffa1f0 <asm_test::fetch_abs::f32::acqrel+0xffffa1f0>)
        l32r              a8, fffc0040 <asm_test::fetch_abs::f32::acqrel+0xfffc0040>
        callx8            a8

.literal.asm_test::fetch_abs::f32::seqcst:
        add               a0, a0, a0
        .byte             0x3f
        {                 excw; excw }

asm_test::fetch_abs::f32::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_abs::f32::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_abs::f32::seqcst+0x8> (ffff8105 <asm_test::fetch_abs::f32::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        l32r              a8, fffc0020 <asm_test::fetch_abs::f32::seqcst+0xfffc0020>
        and               a8, a11, a8
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 3c <asm_test::fetch_abs::f32::seqcst+0x3c> (ffffa1f0 <asm_test::fetch_abs::f32::seqcst+0xffffa1f0>)
        l32r              a8, fffc0040 <asm_test::fetch_abs::f32::seqcst+0xfffc0040>
        callx8            a8

.literal.asm_test::fetch_abs::f32::acquire:
        add               a0, a0, a0
        .byte             0x3f
        {                 excw; excw }

asm_test::fetch_abs::f32::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_abs::f32::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_abs::f32::acquire+0x8> (ffff8105 <asm_test::fetch_abs::f32::acquire+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        l32r              a8, 1c <asm_test::fetch_abs::f32::acquire+0x1c> (ffff8115 <asm_test::fetch_abs::f32::acquire+0xffff8115>)
        and               a8, a11, a8
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_abs::f32::acquire+0xffa1f01d>)
        l32r              a8, 3c <asm_test::fetch_abs::f32::acquire+0x3c> (ffff81ff <asm_test::fetch_abs::f32::acquire+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_abs::f32::relaxed:
        add               a0, a0, a0
        .byte             0x3f
        {                 excw; excw }

asm_test::fetch_abs::f32::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_abs::f32::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_abs::f32::relaxed+0x8> (ffff8105 <asm_test::fetch_abs::f32::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        l32r              a8, 1c <asm_test::fetch_abs::f32::relaxed+0x1c> (ffff8115 <asm_test::fetch_abs::f32::relaxed+0xffff8115>)
        and               a8, a11, a8
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 34 <asm_test::fetch_abs::f32::relaxed+0x34> (a1f01d08 <asm_test::fetch_abs::f32::relaxed+0xa1f01d08>)
        l32r              a8, 38 <asm_test::fetch_abs::f32::relaxed+0x38> (ff81ffff <asm_test::fetch_abs::f32::relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_abs::f32::release:
        add               a0, a0, a0
        .byte             0x3f
        {                 excw; excw }

asm_test::fetch_abs::f32::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_abs::f32::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_abs::f32::release+0x8> (ffff8105 <asm_test::fetch_abs::f32::release+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        l32r              a8, fffc0020 <asm_test::fetch_abs::f32::release+0xfffc0020>
        and               a8, a11, a8
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        mov.n             a2, a8
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_abs::f32::release+0xffa1f01d>)
        l32r              a8, 3c <asm_test::fetch_abs::f32::release+0x3c> (ffff81ff <asm_test::fetch_abs::f32::release+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_add::u8::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_add::u8::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_add::u8::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_add::u8::acqrel+0x8> (ffff8105 <asm_test::fetch_add::u8::acqrel+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
        j                 3f
2:
        mov.n             a15, a7
        beqi              a6, 1, 4f
3:
        and               a7, a15, a11
        add.n             a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 2b
        mov.n             a6, a13
        j                 2b
4:
        ssr               a8
        srl               a2, a7
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_add::u8::acqrel+0xffa1f01d>)
        l32r              a8, 6c <asm_test::fetch_add::u8::acqrel+0x6c> (ffff81ff <asm_test::fetch_add::u8::acqrel+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_add::u8::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_add::u8::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_add::u8::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_add::u8::seqcst+0x8> (ffff8105 <asm_test::fetch_add::u8::seqcst+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
        j                 3f
2:
        mov.n             a15, a7
        beqi              a6, 1, 4f
3:
        and               a7, a15, a11
        add.n             a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 2b
        mov.n             a6, a13
        j                 2b
4:
        ssr               a8
        srl               a2, a7
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_add::u8::seqcst+0xffa1f01d>)
        l32r              a8, 6c <asm_test::fetch_add::u8::seqcst+0x6c> (ffff81ff <asm_test::fetch_add::u8::seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_add::u8::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_add::u8::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_add::u8::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_add::u8::acquire+0x8> (ffff8105 <asm_test::fetch_add::u8::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a15, a7
        beqi              a6, 1, 4f
3:
        and               a7, a15, a11
        add.n             a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 2b
        mov.n             a6, a13
        j                 2b
4:
        ssr               a8
        srl               a2, a7
        memw
        retw.n
5:
        l32r              a10, 64 <asm_test::fetch_add::u8::acquire+0x64> (a1f01d00 <asm_test::fetch_add::u8::acquire+0xa1f01d00>)
        l32r              a8, 68 <asm_test::fetch_add::u8::acquire+0x68> (ff81ffff <asm_test::fetch_add::u8::acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_add::u8::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_add::u8::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_add::u8::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_add::u8::relaxed+0x8> (ffff8105 <asm_test::fetch_add::u8::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a15, a7
        beqi              a6, 1, 4f
3:
        and               a7, a15, a11
        add.n             a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 2b
        mov.n             a6, a13
        j                 2b
4:
        ssr               a8
        srl               a2, a7
        retw.n
5:
        l32r              a10, fffc0064 <asm_test::fetch_add::u8::relaxed+0xfffc0064>
        l32r              a8, 5b (810000a1 <asm_test::fetch_add::u8::relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_add::u8::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_add::u8::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_add::u8::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_add::u8::release+0x8> (ffff8105 <asm_test::fetch_add::u8::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a15, a7
        beqi              a6, 1, 4f
3:
        and               a7, a15, a11
        add.n             a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 2b
        mov.n             a6, a13
        j                 2b
4:
        ssr               a8
        srl               a2, a7
        retw.n
5:
        l32r              a10, 64 <asm_test::fetch_add::u8::release+0x64> (a1f01d91 <asm_test::fetch_add::u8::release+0xa1f01d91>)
        l32r              a8, 68 <asm_test::fetch_add::u8::release+0x68> (ff81ffff <asm_test::fetch_add::u8::release+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_add::f32::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_add::f32::acqrel:
        entry             a1, 32
        l32i.n            a9, a2, 0
        l32r              a8, 4 <asm_test::fetch_add::f32::acqrel+0x4> (ffff8102 <asm_test::fetch_add::f32::acqrel+0xffff8102>)
0:
        bltu              a2, a8, 1f
        l32r              a8, 0b (81053287 <asm_test::fetch_add::f32::acqrel+0x81053287>)
        bltu              a2, a8, 5f
1:
        wfr               f8, a3
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        memw
        mov.n             a9, a8
        bnez              a12, 4f
3:
        wfr               f9, a9
        add.s             f9, f8, f9
        rfr               a8, f9
        memw
        wsr.scompare1     a9
        s32c1i            a8, a2, 0
        mov.n             a12, a11
        beq               a8, a9, 2b
        mov.n             a12, a10
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 40 <asm_test::fetch_add::f32::acqrel+0x40> (a1f01d08 <asm_test::fetch_add::f32::acqrel+0xa1f01d08>)
        l32r              a8, 44 <asm_test::fetch_add::f32::acqrel+0x44> (ff81ffff <asm_test::fetch_add::f32::acqrel+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_add::f32::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_add::f32::seqcst:
        entry             a1, 32
        l32i.n            a9, a2, 0
        l32r              a8, 4 <asm_test::fetch_add::f32::seqcst+0x4> (ffff8102 <asm_test::fetch_add::f32::seqcst+0xffff8102>)
0:
        bltu              a2, a8, 1f
        l32r              a8, 0b (81053287 <asm_test::fetch_add::f32::seqcst+0x81053287>)
        bltu              a2, a8, 5f
1:
        wfr               f8, a3
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        memw
        mov.n             a9, a8
        bnez              a12, 4f
3:
        wfr               f9, a9
        add.s             f9, f8, f9
        rfr               a8, f9
        memw
        wsr.scompare1     a9
        s32c1i            a8, a2, 0
        mov.n             a12, a11
        beq               a8, a9, 2b
        mov.n             a12, a10
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 40 <asm_test::fetch_add::f32::seqcst+0x40> (a1f01d08 <asm_test::fetch_add::f32::seqcst+0xa1f01d08>)
        l32r              a8, 44 <asm_test::fetch_add::f32::seqcst+0x44> (ff81ffff <asm_test::fetch_add::f32::seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_add::f32::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_add::f32::acquire:
        entry             a1, 32
        l32i.n            a9, a2, 0
        l32r              a8, 4 <asm_test::fetch_add::f32::acquire+0x4> (ffff8102 <asm_test::fetch_add::f32::acquire+0xffff8102>)
0:
        bltu              a2, a8, 1f
        l32r              a8, 0b (81053287 <asm_test::fetch_add::f32::acquire+0x81053287>)
        bltu              a2, a8, 5f
1:
        wfr               f8, a3
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        memw
        mov.n             a9, a8
        bnez              a12, 4f
3:
        wfr               f9, a9
        add.s             f9, f8, f9
        rfr               a8, f9
        wsr.scompare1     a9
        s32c1i            a8, a2, 0
        mov.n             a12, a11
        beq               a8, a9, 2b
        mov.n             a12, a10
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, fffc0040 <asm_test::fetch_add::f32::acquire+0xfffc0040>
        l32r              a8, 5b (810000a1 <asm_test::fetch_add::f32::acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_add::f32::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_add::f32::relaxed:
        entry             a1, 32
        l32i.n            a9, a2, 0
        l32r              a8, 4 <asm_test::fetch_add::f32::relaxed+0x4> (ffff8102 <asm_test::fetch_add::f32::relaxed+0xffff8102>)
0:
        bltu              a2, a8, 1f
        l32r              a8, 0b (81053287 <asm_test::fetch_add::f32::relaxed+0x81053287>)
        bltu              a2, a8, 5f
1:
        wfr               f8, a3
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a9, a8
        bnez              a12, 4f
3:
        wfr               f9, a9
        add.s             f9, f8, f9
        rfr               a8, f9
        wsr.scompare1     a9
        s32c1i            a8, a2, 0
        mov.n             a12, a11
        beq               a8, a9, 2b
        mov.n             a12, a10
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 3c <asm_test::fetch_add::f32::relaxed+0x3c> (ffffa1f0 <asm_test::fetch_add::f32::relaxed+0xffffa1f0>)
        l32r              a8, fffc0040 <asm_test::fetch_add::f32::relaxed+0xfffc0040>
        callx8            a8

.literal.asm_test::fetch_add::f32::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_add::f32::release:
        entry             a1, 32
        l32i.n            a9, a2, 0
        l32r              a8, 4 <asm_test::fetch_add::f32::release+0x4> (ffff8102 <asm_test::fetch_add::f32::release+0xffff8102>)
0:
        bltu              a2, a8, 1f
        l32r              a8, 0b (81053287 <asm_test::fetch_add::f32::release+0x81053287>)
        bltu              a2, a8, 5f
1:
        wfr               f8, a3
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a9, a8
        bnez              a12, 4f
3:
        wfr               f9, a9
        add.s             f9, f8, f9
        rfr               a8, f9
        memw
        wsr.scompare1     a9
        s32c1i            a8, a2, 0
        mov.n             a12, a11
        beq               a8, a9, 2b
        mov.n             a12, a10
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, fffc0040 <asm_test::fetch_add::f32::release+0xfffc0040>
        l32r              a8, 5b (810000a1 <asm_test::fetch_add::f32::release+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_add::u16::acqrel:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_add::u16::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_add::u16::acqrel+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::fetch_add::u16::acqrel+0x8> (ffff8105 <asm_test::fetch_add::u16::acqrel+0xffff8105>)
1:
        bgeu              a8, a2, 7f
2:
        l32r              a10, 1b (a15ab827 <asm_test::fetch_add::u16::acqrel+0xa15ab827>)
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
        j                 4f
3:
        mov.n             a15, a7
        beqi              a6, 1, 5f
4:
        and               a7, a15, a11
        add.n             a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 3b
        mov.n             a6, a13
        j                 3b
5:
        ssr               a8
        srl               a2, a7
        memw
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::fetch_add::u16::acqrel+0xffa1f01d>)
        l32r              a8, 6c <asm_test::fetch_add::u16::acqrel+0x6c> (ffff81ff <asm_test::fetch_add::u16::acqrel+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_add::u16::seqcst:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_add::u16::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_add::u16::seqcst+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::fetch_add::u16::seqcst+0x8> (ffff8105 <asm_test::fetch_add::u16::seqcst+0xffff8105>)
1:
        bgeu              a8, a2, 7f
2:
        l32r              a10, 1b (a15ab827 <asm_test::fetch_add::u16::seqcst+0xa15ab827>)
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
        j                 4f
3:
        mov.n             a15, a7
        beqi              a6, 1, 5f
4:
        and               a7, a15, a11
        add.n             a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 3b
        mov.n             a6, a13
        j                 3b
5:
        ssr               a8
        srl               a2, a7
        memw
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::fetch_add::u16::seqcst+0xffa1f01d>)
        l32r              a8, 6c <asm_test::fetch_add::u16::seqcst+0x6c> (ffff81ff <asm_test::fetch_add::u16::seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_add::u16::acquire:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_add::u16::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_add::u16::acquire+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::fetch_add::u16::acquire+0x8> (ffff8105 <asm_test::fetch_add::u16::acquire+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a10, 1b (a157b827 <asm_test::fetch_add::u16::acquire+0xa157b827>)
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
        j                 4f
3:
        mov.n             a15, a7
        beqi              a6, 1, 5f
4:
        and               a7, a15, a11
        add.n             a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 3b
        mov.n             a6, a13
        j                 3b
5:
        ssr               a8
        srl               a2, a7
        memw
        retw.n
6:
        l32r              a10, 64 <asm_test::fetch_add::u16::acquire+0x64> (a1f01d00 <asm_test::fetch_add::u16::acquire+0xa1f01d00>)
        l32r              a8, 68 <asm_test::fetch_add::u16::acquire+0x68> (ff81ffff <asm_test::fetch_add::u16::acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_add::u16::relaxed:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_add::u16::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_add::u16::relaxed+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::fetch_add::u16::relaxed+0x8> (ffff8105 <asm_test::fetch_add::u16::relaxed+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a10, 1b (a154b827 <asm_test::fetch_add::u16::relaxed+0xa154b827>)
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
        j                 4f
3:
        mov.n             a15, a7
        beqi              a6, 1, 5f
4:
        and               a7, a15, a11
        add.n             a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 3b
        mov.n             a6, a13
        j                 3b
5:
        ssr               a8
        srl               a2, a7
        retw.n
6:
        l32r              a10, fffc0064 <asm_test::fetch_add::u16::relaxed+0xfffc0064>
        l32r              a8, 6b (810000a1 <asm_test::fetch_add::u16::relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_add::u16::release:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_add::u16::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_add::u16::release+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::fetch_add::u16::release+0x8> (ffff8105 <asm_test::fetch_add::u16::release+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a10, 1b (a157b827 <asm_test::fetch_add::u16::release+0xa157b827>)
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
        j                 4f
3:
        mov.n             a15, a7
        beqi              a6, 1, 5f
4:
        and               a7, a15, a11
        add.n             a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 3b
        mov.n             a6, a13
        j                 3b
5:
        ssr               a8
        srl               a2, a7
        retw.n
6:
        l32r              a10, 64 <asm_test::fetch_add::u16::release+0x64> (a1f01d91 <asm_test::fetch_add::u16::release+0xa1f01d91>)
        l32r              a8, 68 <asm_test::fetch_add::u16::release+0x68> (ff81ffff <asm_test::fetch_add::u16::release+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_add::u32::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_add::u32::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_add::u32::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_add::u32::acqrel+0x8> (ffff8105 <asm_test::fetch_add::u32::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        add.n             a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 38 <asm_test::fetch_add::u32::acqrel+0x38> (ffffa1f0 <asm_test::fetch_add::u32::acqrel+0xffffa1f0>)
        l32r              a8, fffc003c <asm_test::fetch_add::u32::acqrel+0xfffc003c>
        callx8            a8

.literal.asm_test::fetch_add::u32::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_add::u32::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_add::u32::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_add::u32::seqcst+0x8> (ffff8105 <asm_test::fetch_add::u32::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        add.n             a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 38 <asm_test::fetch_add::u32::seqcst+0x38> (ffffa1f0 <asm_test::fetch_add::u32::seqcst+0xffffa1f0>)
        l32r              a8, fffc003c <asm_test::fetch_add::u32::seqcst+0xfffc003c>
        callx8            a8

.literal.asm_test::fetch_add::u32::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_add::u32::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_add::u32::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_add::u32::acquire+0x8> (ffff8105 <asm_test::fetch_add::u32::acquire+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        add.n             a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_add::u32::acquire+0xffa1f01d>)
        l32r              a8, 38 <asm_test::fetch_add::u32::acquire+0x38> (ffff81ff <asm_test::fetch_add::u32::acquire+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_add::u32::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_add::u32::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_add::u32::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_add::u32::relaxed+0x8> (ffff8105 <asm_test::fetch_add::u32::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        add.n             a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 30 <asm_test::fetch_add::u32::relaxed+0x30> (a1f01d08 <asm_test::fetch_add::u32::relaxed+0xa1f01d08>)
        l32r              a8, 34 <asm_test::fetch_add::u32::relaxed+0x34> (ff81ffff <asm_test::fetch_add::u32::relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_add::u32::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_add::u32::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_add::u32::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_add::u32::release+0x8> (ffff8105 <asm_test::fetch_add::u32::release+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        add.n             a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        mov.n             a2, a8
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_add::u32::release+0xffa1f01d>)
        l32r              a8, 38 <asm_test::fetch_add::u32::release+0x38> (ffff81ff <asm_test::fetch_add::u32::release+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_and::u8::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_and::u8::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_and::u8::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_and::u8::acqrel+0x8> (ffff8105 <asm_test::fetch_and::u8::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        and               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a2, a13
        memw
        retw.n
5:
        l32r              a10, 64 <asm_test::fetch_and::u8::acqrel+0x64> (ffffa1f0 <asm_test::fetch_and::u8::acqrel+0xffffa1f0>)
        l32r              a8, fffc0068 <asm_test::fetch_and::u8::acqrel+0xfffc0068>
        callx8            a8

.literal.asm_test::fetch_and::u8::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_and::u8::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_and::u8::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_and::u8::seqcst+0x8> (ffff8105 <asm_test::fetch_and::u8::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        and               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a2, a13
        memw
        retw.n
5:
        l32r              a10, 64 <asm_test::fetch_and::u8::seqcst+0x64> (ffffa1f0 <asm_test::fetch_and::u8::seqcst+0xffffa1f0>)
        l32r              a8, fffc0068 <asm_test::fetch_and::u8::seqcst+0xfffc0068>
        callx8            a8

.literal.asm_test::fetch_and::u8::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_and::u8::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_and::u8::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_and::u8::acquire+0x8> (ffff8105 <asm_test::fetch_and::u8::acquire+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        and               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a2, a13
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_and::u8::acquire+0xffa1f01d>)
        l32r              a8, 64 <asm_test::fetch_and::u8::acquire+0x64> (ffff81ff <asm_test::fetch_and::u8::acquire+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_and::u8::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_and::u8::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_and::u8::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_and::u8::relaxed+0x8> (ffff8105 <asm_test::fetch_and::u8::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        and               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a2, a13
        retw.n
5:
        l32r              a10, 5c <asm_test::fetch_and::u8::relaxed+0x5c> (a1f01d91 <asm_test::fetch_and::u8::relaxed+0xa1f01d91>)
        l32r              a8, 60 <asm_test::fetch_and::u8::relaxed+0x60> (ff81ffff <asm_test::fetch_and::u8::relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_and::u8::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_and::u8::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_and::u8::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_and::u8::release+0x8> (ffff8105 <asm_test::fetch_and::u8::release+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        and               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a2, a13
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_and::u8::release+0xffa1f01d>)
        l32r              a8, 64 <asm_test::fetch_and::u8::release+0x64> (ffff81ff <asm_test::fetch_and::u8::release+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_and::u16::acqrel:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_and::u16::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_and::u16::acqrel+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::fetch_and::u16::acqrel+0x8> (ffff8105 <asm_test::fetch_and::u16::acqrel+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a9, 1b (9155b827 <asm_test::fetch_and::u16::acqrel+0x9155b827>)
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
        j                 4f
3:
        mov.n             a14, a13
        beqi              a15, 1, 5f
4:
        and               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 3b
        mov.n             a15, a11
        j                 3b
5:
        ssr               a8
        srl               a2, a13
        memw
        retw.n
6:
        l32r              a10, 64 <asm_test::fetch_and::u16::acqrel+0x64> (ffffa1f0 <asm_test::fetch_and::u16::acqrel+0xffffa1f0>)
        l32r              a8, fffc0068 <asm_test::fetch_and::u16::acqrel+0xfffc0068>
        callx8            a8

.literal.asm_test::fetch_and::u16::seqcst:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_and::u16::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_and::u16::seqcst+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::fetch_and::u16::seqcst+0x8> (ffff8105 <asm_test::fetch_and::u16::seqcst+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a9, 1b (9155b827 <asm_test::fetch_and::u16::seqcst+0x9155b827>)
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
        j                 4f
3:
        mov.n             a14, a13
        beqi              a15, 1, 5f
4:
        and               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 3b
        mov.n             a15, a11
        j                 3b
5:
        ssr               a8
        srl               a2, a13
        memw
        retw.n
6:
        l32r              a10, 64 <asm_test::fetch_and::u16::seqcst+0x64> (ffffa1f0 <asm_test::fetch_and::u16::seqcst+0xffffa1f0>)
        l32r              a8, fffc0068 <asm_test::fetch_and::u16::seqcst+0xfffc0068>
        callx8            a8

.literal.asm_test::fetch_and::u16::acquire:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_and::u16::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_and::u16::acquire+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::fetch_and::u16::acquire+0x8> (ffff8105 <asm_test::fetch_and::u16::acquire+0xffff8105>)
1:
        bgeu              a8, a2, 7f
2:
        l32r              a9, 1b (9152b827 <asm_test::fetch_and::u16::acquire+0x9152b827>)
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
        j                 4f
3:
        mov.n             a14, a13
        beqi              a15, 1, 5f
4:
        and               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 3b
        mov.n             a15, a11
        j                 3b
5:
        ssr               a8
        srl               a2, a13
        memw
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::fetch_and::u16::acquire+0xffa1f01d>)
        l32r              a8, 64 <asm_test::fetch_and::u16::acquire+0x64> (ffff81ff <asm_test::fetch_and::u16::acquire+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_and::u16::relaxed:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_and::u16::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_and::u16::relaxed+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::fetch_and::u16::relaxed+0x8> (ffff8105 <asm_test::fetch_and::u16::relaxed+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a9, 1b (914fb827 <asm_test::fetch_and::u16::relaxed+0x914fb827>)
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
        j                 4f
3:
        mov.n             a14, a13
        beqi              a15, 1, 5f
4:
        and               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 3b
        mov.n             a15, a11
        j                 3b
5:
        ssr               a8
        srl               a2, a13
        retw.n
6:
        l32r              a10, 5c <asm_test::fetch_and::u16::relaxed+0x5c> (a1f01d91 <asm_test::fetch_and::u16::relaxed+0xa1f01d91>)
        l32r              a8, 60 <asm_test::fetch_and::u16::relaxed+0x60> (ff81ffff <asm_test::fetch_and::u16::relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_and::u16::release:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_and::u16::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_and::u16::release+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::fetch_and::u16::release+0x8> (ffff8105 <asm_test::fetch_and::u16::release+0xffff8105>)
1:
        bgeu              a8, a2, 7f
2:
        l32r              a9, 1b (9152b827 <asm_test::fetch_and::u16::release+0x9152b827>)
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
        j                 4f
3:
        mov.n             a14, a13
        beqi              a15, 1, 5f
4:
        and               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 3b
        mov.n             a15, a11
        j                 3b
5:
        ssr               a8
        srl               a2, a13
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::fetch_and::u16::release+0xffa1f01d>)
        l32r              a8, 64 <asm_test::fetch_and::u16::release+0x64> (ffff81ff <asm_test::fetch_and::u16::release+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_and::u32::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_and::u32::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_and::u32::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_and::u32::acqrel+0x8> (ffff8105 <asm_test::fetch_and::u32::acqrel+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        and               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_and::u32::acqrel+0xffa1f01d>)
        l32r              a8, 3c <asm_test::fetch_and::u32::acqrel+0x3c> (ffff81ff <asm_test::fetch_and::u32::acqrel+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_and::u32::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_and::u32::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_and::u32::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_and::u32::seqcst+0x8> (ffff8105 <asm_test::fetch_and::u32::seqcst+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        and               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_and::u32::seqcst+0xffa1f01d>)
        l32r              a8, 3c <asm_test::fetch_and::u32::seqcst+0x3c> (ffff81ff <asm_test::fetch_and::u32::seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_and::u32::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_and::u32::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_and::u32::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_and::u32::acquire+0x8> (ffff8105 <asm_test::fetch_and::u32::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        and               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 34 <asm_test::fetch_and::u32::acquire+0x34> (a1f01d08 <asm_test::fetch_and::u32::acquire+0xa1f01d08>)
        l32r              a8, 38 <asm_test::fetch_and::u32::acquire+0x38> (ff81ffff <asm_test::fetch_and::u32::acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_and::u32::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_and::u32::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_and::u32::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_and::u32::relaxed+0x8> (ffff8105 <asm_test::fetch_and::u32::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        and               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, fffc0034 <asm_test::fetch_and::u32::relaxed+0xfffc0034>
        l32r              a8, 5b (810000a1 <asm_test::fetch_and::u32::relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_and::u32::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_and::u32::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_and::u32::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_and::u32::release+0x8> (ffff8105 <asm_test::fetch_and::u32::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        and               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 34 <asm_test::fetch_and::u32::release+0x34> (a1f01d08 <asm_test::fetch_and::u32::release+0xa1f01d08>)
        l32r              a8, 38 <asm_test::fetch_and::u32::release+0x38> (ff81ffff <asm_test::fetch_and::u32::release+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_and::bool::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_and::bool::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_and::bool::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_and::bool::acqrel+0x8> (ffff8105 <asm_test::fetch_and::bool::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a9, a3
        movi              a10, 255
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a10, a10, a11
        or                a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        and               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a8, a13
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n
5:
        l32r              a10, 64 <asm_test::fetch_and::bool::acqrel+0x64> (a1f01d00 <asm_test::fetch_and::bool::acqrel+0xa1f01d00>)
        l32r              a8, 68 <asm_test::fetch_and::bool::acqrel+0x68> (ff81ffff <asm_test::fetch_and::bool::acqrel+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_and::bool::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_and::bool::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_and::bool::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_and::bool::seqcst+0x8> (ffff8105 <asm_test::fetch_and::bool::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a9, a3
        movi              a10, 255
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a10, a10, a11
        or                a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        and               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a8, a13
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n
5:
        l32r              a10, 64 <asm_test::fetch_and::bool::seqcst+0x64> (a1f01d00 <asm_test::fetch_and::bool::seqcst+0xa1f01d00>)
        l32r              a8, 68 <asm_test::fetch_and::bool::seqcst+0x68> (ff81ffff <asm_test::fetch_and::bool::seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_and::bool::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_and::bool::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_and::bool::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_and::bool::acquire+0x8> (ffff8105 <asm_test::fetch_and::bool::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a9, a3
        movi              a10, 255
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a10, a10, a11
        or                a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        and               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a8, a13
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n
5:
        l32r              a10, fffc0064 <asm_test::fetch_and::bool::acquire+0xfffc0064>
        l32r              a8, 5b (810000a1 <asm_test::fetch_and::bool::acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_and::bool::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_and::bool::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_and::bool::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_and::bool::relaxed+0x8> (ffff8105 <asm_test::fetch_and::bool::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a9, a3
        movi              a10, 255
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a10, a10, a11
        or                a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        and               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a8, a13
        movi.n            a9, 1
        and               a2, a8, a9
        retw.n
5:
        l32r              a10, 60 <asm_test::fetch_and::bool::relaxed+0x60> (ffffa1f0 <asm_test::fetch_and::bool::relaxed+0xffffa1f0>)
        l32r              a8, fffc0064 <asm_test::fetch_and::bool::relaxed+0xfffc0064>
        callx8            a8

.literal.asm_test::fetch_and::bool::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_and::bool::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_and::bool::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_and::bool::release+0x8> (ffff8105 <asm_test::fetch_and::bool::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
        and               a8, a8, a9
        ssl               a8
        sll               a9, a3
        movi              a10, 255
        ssl               a8
        sll               a10, a10
        movi.n            a11, -1
        xor               a10, a10, a11
        or                a9, a9, a10
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        and               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a8, a13
        movi.n            a9, 1
        and               a2, a8, a9
        retw.n
5:
        l32r              a10, fffc0064 <asm_test::fetch_and::bool::release+0xfffc0064>
        l32r              a8, 5b (810000a1 <asm_test::fetch_and::bool::release+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_max::i8::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_max::i8::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_max::i8::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_max::i8::acqrel+0x8> (ffff8105 <asm_test::fetch_max::i8::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a15, a7
        beqi              a6, 1, 4f
3:
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
        beq               a7, a15, 2b
        mov.n             a6, a13
        j                 2b
4:
        ssr               a8
        srl               a2, a7
        memw
        retw.n
5:
        l32r              a10, fffc0074 <asm_test::fetch_max::i8::acqrel+0xfffc0074>
        l32r              a8, 5b (810000a1 <asm_test::fetch_max::i8::acqrel+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_max::i8::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_max::i8::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_max::i8::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_max::i8::seqcst+0x8> (ffff8105 <asm_test::fetch_max::i8::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a15, a7
        beqi              a6, 1, 4f
3:
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
        beq               a7, a15, 2b
        mov.n             a6, a13
        j                 2b
4:
        ssr               a8
        srl               a2, a7
        memw
        retw.n
5:
        l32r              a10, fffc0074 <asm_test::fetch_max::i8::seqcst+0xfffc0074>
        l32r              a8, 5b (810000a1 <asm_test::fetch_max::i8::seqcst+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_max::i8::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_max::i8::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_max::i8::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_max::i8::acquire+0x8> (ffff8105 <asm_test::fetch_max::i8::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a15, a7
        beqi              a6, 1, 4f
3:
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
        beq               a7, a15, 2b
        mov.n             a6, a13
        j                 2b
4:
        ssr               a8
        srl               a2, a7
        memw
        retw.n
5:
        l32r              a10, 70 <asm_test::fetch_max::i8::acquire+0x70> (ffffa1f0 <asm_test::fetch_max::i8::acquire+0xffffa1f0>)
        l32r              a8, fffc0074 <asm_test::fetch_max::i8::acquire+0xfffc0074>
        callx8            a8

.literal.asm_test::fetch_max::i8::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_max::i8::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_max::i8::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_max::i8::relaxed+0x8> (ffff8105 <asm_test::fetch_max::i8::relaxed+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
        j                 3f
2:
        mov.n             a15, a7
        beqi              a6, 1, 4f
3:
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
        beq               a7, a15, 2b
        mov.n             a6, a13
        j                 2b
4:
        ssr               a8
        srl               a2, a7
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_max::i8::relaxed+0xffa1f01d>)
        l32r              a8, 70 <asm_test::fetch_max::i8::relaxed+0x70> (ffff81ff <asm_test::fetch_max::i8::relaxed+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_max::i8::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_max::i8::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_max::i8::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_max::i8::release+0x8> (ffff8105 <asm_test::fetch_max::i8::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a15, a7
        beqi              a6, 1, 4f
3:
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
        beq               a7, a15, 2b
        mov.n             a6, a13
        j                 2b
4:
        ssr               a8
        srl               a2, a7
        retw.n
5:
        l32r              a10, 70 <asm_test::fetch_max::i8::release+0x70> (ffffa1f0 <asm_test::fetch_max::i8::release+0xffffa1f0>)
        l32r              a8, fffc0074 <asm_test::fetch_max::i8::release+0xfffc0074>
        callx8            a8

.literal.asm_test::fetch_max::f32::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_max::f32::acqrel:
        entry             a1, 32
        l32i.n            a9, a2, 0
        l32r              a8, 4 <asm_test::fetch_max::f32::acqrel+0x4> (ffff8102 <asm_test::fetch_max::f32::acqrel+0xffff8102>)
0:
        bltu              a2, a8, 1f
        l32r              a8, 0b (81053287 <asm_test::fetch_max::f32::acqrel+0x81053287>)
        bltu              a2, a8, 7f
1:
        wfr               f8, a3
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        memw
        mov.n             a9, a8
        bnez              a12, 6f
3:
        wfr               f9, a9
        ult.s             b0, f8, f9
        mov.n             a12, a3
        bf                b0, 4f
        mov.n             a12, a9
4:
        un.s              b0, f9, f9
        mov.n             a8, a3
        bt                b0, 5f
        mov.n             a8, a12
5:
        memw
        wsr.scompare1     a9
        s32c1i            a8, a2, 0
        mov.n             a12, a11
        beq               a8, a9, 2b
        mov.n             a12, a10
        j                 2b
6:
        mov.n             a2, a8
        retw.n
7:
        l32r              a10, 50 <asm_test::fetch_max::f32::acqrel+0x50> (ffffa1f0 <asm_test::fetch_max::f32::acqrel+0xffffa1f0>)
        l32r              a8, fffc0054 <asm_test::fetch_max::f32::acqrel+0xfffc0054>
        callx8            a8

.literal.asm_test::fetch_max::f32::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_max::f32::seqcst:
        entry             a1, 32
        l32i.n            a9, a2, 0
        l32r              a8, 4 <asm_test::fetch_max::f32::seqcst+0x4> (ffff8102 <asm_test::fetch_max::f32::seqcst+0xffff8102>)
0:
        bltu              a2, a8, 1f
        l32r              a8, 0b (81053287 <asm_test::fetch_max::f32::seqcst+0x81053287>)
        bltu              a2, a8, 7f
1:
        wfr               f8, a3
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        memw
        mov.n             a9, a8
        bnez              a12, 6f
3:
        wfr               f9, a9
        ult.s             b0, f8, f9
        mov.n             a12, a3
        bf                b0, 4f
        mov.n             a12, a9
4:
        un.s              b0, f9, f9
        mov.n             a8, a3
        bt                b0, 5f
        mov.n             a8, a12
5:
        memw
        wsr.scompare1     a9
        s32c1i            a8, a2, 0
        mov.n             a12, a11
        beq               a8, a9, 2b
        mov.n             a12, a10
        j                 2b
6:
        mov.n             a2, a8
        retw.n
7:
        l32r              a10, 50 <asm_test::fetch_max::f32::seqcst+0x50> (ffffa1f0 <asm_test::fetch_max::f32::seqcst+0xffffa1f0>)
        l32r              a8, fffc0054 <asm_test::fetch_max::f32::seqcst+0xfffc0054>
        callx8            a8

.literal.asm_test::fetch_max::f32::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_max::f32::acquire:
        entry             a1, 32
        l32i.n            a9, a2, 0
        l32r              a8, 4 <asm_test::fetch_max::f32::acquire+0x4> (ffff8102 <asm_test::fetch_max::f32::acquire+0xffff8102>)
0:
        bltu              a2, a8, 1f
        l32r              a8, 0b (81053287 <asm_test::fetch_max::f32::acquire+0x81053287>)
        bltu              a2, a8, 9f
1:
        wfr               f8, a3
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        memw
        mov.n             a9, a8
        bnez              a12, 8f
3:
        wfr               f9, a9
        ult.s             b0, f8, f9
        mov.n             a12, a3
        bt                b0, 5f
        un.s              b0, f9, f9
        mov.n             a8, a3
        bf                b0, 6f
4:
        wsr.scompare1     a9
        s32c1i            a8, a2, 0
        mov.n             a12, a11
        beq               a8, a9, 2b
        j                 7f
5:
        mov.n             a12, a9
        un.s              b0, f9, f9
        mov.n             a8, a3
        bt                b0, 4b
6:
        mov.n             a8, a12
        wsr.scompare1     a9
        s32c1i            a8, a2, 0
        mov.n             a12, a11
        beq               a8, a9, 2b
7:
        mov.n             a12, a10
        j                 2b
8:
        mov.n             a2, a8
        retw.n
9:
        l32r              a10, fffc0064 <asm_test::fetch_max::f32::acquire+0xfffc0064>
        l32r              a8, 9b (810000a1 <asm_test::fetch_max::f32::acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_max::f32::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_max::f32::relaxed:
        entry             a1, 32
        l32i.n            a9, a2, 0
        l32r              a8, 4 <asm_test::fetch_max::f32::relaxed+0x4> (ffff8102 <asm_test::fetch_max::f32::relaxed+0xffff8102>)
0:
        bltu              a2, a8, 1f
        l32r              a8, 0b (81053287 <asm_test::fetch_max::f32::relaxed+0x81053287>)
        bltu              a2, a8, 9f
1:
        wfr               f8, a3
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a9, a8
        bnez              a12, 8f
3:
        wfr               f9, a9
        ult.s             b0, f8, f9
        mov.n             a12, a3
        bt                b0, 5f
        un.s              b0, f9, f9
        mov.n             a8, a3
        bf                b0, 6f
4:
        wsr.scompare1     a9
        s32c1i            a8, a2, 0
        mov.n             a12, a11
        beq               a8, a9, 2b
        j                 7f
5:
        mov.n             a12, a9
        un.s              b0, f9, f9
        mov.n             a8, a3
        bt                b0, 4b
6:
        mov.n             a8, a12
        wsr.scompare1     a9
        s32c1i            a8, a2, 0
        mov.n             a12, a11
        beq               a8, a9, 2b
7:
        mov.n             a12, a10
        j                 2b
8:
        mov.n             a2, a8
        retw.n
9:
        l32r              a10, 60 <asm_test::fetch_max::f32::relaxed+0x60> (ffffa1f0 <asm_test::fetch_max::f32::relaxed+0xffffa1f0>)
        l32r              a8, fffc0064 <asm_test::fetch_max::f32::relaxed+0xfffc0064>
        callx8            a8

.literal.asm_test::fetch_max::f32::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_max::f32::release:
        entry             a1, 32
        l32i.n            a9, a2, 0
        l32r              a8, 4 <asm_test::fetch_max::f32::release+0x4> (ffff8102 <asm_test::fetch_max::f32::release+0xffff8102>)
0:
        bltu              a2, a8, 1f
        l32r              a8, 0b (81053287 <asm_test::fetch_max::f32::release+0x81053287>)
        bltu              a2, a8, 8f
1:
        wfr               f8, a3
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a9, a8
        bnez              a12, 6f
3:
        wfr               f9, a9
        ult.s             b0, f8, f9
        mov.n             a12, a3
        bf                b0, 4f
        mov.n             a12, a9
4:
        un.s              b0, f9, f9
        mov.n             a8, a3
        bt                b0, 5f
        mov.n             a8, a12
5:
        memw
        wsr.scompare1     a9
        s32c1i            a8, a2, 0
        mov.n             a12, a11
        beq               a8, a9, 2b
        mov.n             a12, a10
        j                 2b
6:
        mov.n             a2, a8
7:
        retw.n
8:
        l32r              a10, 7b (ffa1f01d <asm_test::fetch_max::f32::release+0xffa1f01d>)
        l32r              a8, 50 <asm_test::fetch_max::f32::release+0x50> (ffff81ff <asm_test::fetch_max::f32::release+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_max::i16::acqrel:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_max::i16::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_max::i16::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_max::i16::acqrel+0x8> (ffff8105 <asm_test::fetch_max::i16::acqrel+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
2:
        and               a8, a8, a9
        l32r              a9, 2b (91108890 <asm_test::fetch_max::i16::acqrel+0x91108890>)
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
        j                 4f
3:
        mov.n             a14, a15
        beqi              a7, 1, 5f
4:
        and               a15, a14, a9
        ssr               a8
        srl               a7, a14
        sext              a7, a7, 15
        max               a7, a7, a11
        l32r              a6, 4c <asm_test::fetch_max::i16::acqrel+0x4c> (ffff6153 <asm_test::fetch_max::i16::acqrel+0xffff6153>)
        and               a7, a7, a6
        ssl               a8
        sll               a7, a7
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a10, 0
        mov.n             a7, a13
        beq               a15, a14, 3b
        mov.n             a7, a12
        j                 3b
5:
        ssr               a8
        srl               a2, a15
        memw
        retw.n
6:
        l32r              a10, 74 <asm_test::fetch_max::i16::acqrel+0x74> (a1f01d00 <asm_test::fetch_max::i16::acqrel+0xa1f01d00>)
        l32r              a8, 78 <asm_test::fetch_max::i16::acqrel+0x78> (ff81ffff <asm_test::fetch_max::i16::acqrel+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_max::i16::seqcst:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_max::i16::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_max::i16::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_max::i16::seqcst+0x8> (ffff8105 <asm_test::fetch_max::i16::seqcst+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
2:
        and               a8, a8, a9
        l32r              a9, 2b (91108890 <asm_test::fetch_max::i16::seqcst+0x91108890>)
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
        j                 4f
3:
        mov.n             a14, a15
        beqi              a7, 1, 5f
4:
        and               a15, a14, a9
        ssr               a8
        srl               a7, a14
        sext              a7, a7, 15
        max               a7, a7, a11
        l32r              a6, 4c <asm_test::fetch_max::i16::seqcst+0x4c> (ffff6153 <asm_test::fetch_max::i16::seqcst+0xffff6153>)
        and               a7, a7, a6
        ssl               a8
        sll               a7, a7
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a10, 0
        mov.n             a7, a13
        beq               a15, a14, 3b
        mov.n             a7, a12
        j                 3b
5:
        ssr               a8
        srl               a2, a15
        memw
        retw.n
6:
        l32r              a10, 74 <asm_test::fetch_max::i16::seqcst+0x74> (a1f01d00 <asm_test::fetch_max::i16::seqcst+0xa1f01d00>)
        l32r              a8, 78 <asm_test::fetch_max::i16::seqcst+0x78> (ff81ffff <asm_test::fetch_max::i16::seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_max::i16::acquire:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_max::i16::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_max::i16::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_max::i16::acquire+0x8> (ffff8105 <asm_test::fetch_max::i16::acquire+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
2:
        and               a8, a8, a9
        l32r              a9, 2b (91108890 <asm_test::fetch_max::i16::acquire+0x91108890>)
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
        j                 4f
3:
        mov.n             a14, a15
        beqi              a7, 1, 5f
4:
        and               a15, a14, a9
        ssr               a8
        srl               a7, a14
        sext              a7, a7, 15
        max               a7, a7, a11
        l32r              a6, 48 <asm_test::fetch_max::i16::acquire+0x48> (ff615377 <asm_test::fetch_max::i16::acquire+0xff615377>)
        and               a7, a7, a6
        ssl               a8
        sll               a7, a7
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a10, 0
        mov.n             a7, a13
        beq               a15, a14, 3b
        mov.n             a7, a12
        j                 3b
5:
        ssr               a8
        srl               a2, a15
        memw
        retw.n
6:
        l32r              a10, fffc0074 <asm_test::fetch_max::i16::acquire+0xfffc0074>
        l32r              a8, 6b (810000a1 <asm_test::fetch_max::i16::acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_max::i16::relaxed:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_max::i16::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_max::i16::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_max::i16::relaxed+0x8> (ffff8105 <asm_test::fetch_max::i16::relaxed+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
2:
        and               a8, a8, a9
        l32r              a9, 2b (91108890 <asm_test::fetch_max::i16::relaxed+0x91108890>)
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
        j                 4f
3:
        mov.n             a14, a15
        beqi              a7, 1, 5f
4:
        and               a15, a14, a9
        ssr               a8
        srl               a7, a14
        sext              a7, a7, 15
        max               a7, a7, a11
        l32r              a6, 48 <asm_test::fetch_max::i16::relaxed+0x48> (ff615377 <asm_test::fetch_max::i16::relaxed+0xff615377>)
        and               a7, a7, a6
        ssl               a8
        sll               a7, a7
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a10, 0
        mov.n             a7, a13
        beq               a15, a14, 3b
        mov.n             a7, a12
        j                 3b
5:
        ssr               a8
        srl               a2, a15
        retw.n
6:
        l32r              a10, 70 <asm_test::fetch_max::i16::relaxed+0x70> (ffffa1f0 <asm_test::fetch_max::i16::relaxed+0xffffa1f0>)
        l32r              a8, fffc0074 <asm_test::fetch_max::i16::relaxed+0xfffc0074>
        callx8            a8

.literal.asm_test::fetch_max::i16::release:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_max::i16::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_max::i16::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_max::i16::release+0x8> (ffff8105 <asm_test::fetch_max::i16::release+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
2:
        and               a8, a8, a9
        l32r              a9, 2b (91108890 <asm_test::fetch_max::i16::release+0x91108890>)
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
        j                 4f
3:
        mov.n             a14, a15
        beqi              a7, 1, 5f
4:
        and               a15, a14, a9
        ssr               a8
        srl               a7, a14
        sext              a7, a7, 15
        max               a7, a7, a11
        l32r              a6, 4c <asm_test::fetch_max::i16::release+0x4c> (ffff6153 <asm_test::fetch_max::i16::release+0xffff6153>)
        and               a7, a7, a6
        ssl               a8
        sll               a7, a7
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a10, 0
        mov.n             a7, a13
        beq               a15, a14, 3b
        mov.n             a7, a12
        j                 3b
5:
        ssr               a8
        srl               a2, a15
        retw.n
6:
        l32r              a10, fffc0074 <asm_test::fetch_max::i16::release+0xfffc0074>
        l32r              a8, 6b (810000a1 <asm_test::fetch_max::i16::release+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_max::i32::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_max::i32::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_max::i32::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_max::i32::acqrel+0x8> (ffff8105 <asm_test::fetch_max::i32::acqrel+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        max               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_max::i32::acqrel+0xffa1f01d>)
        l32r              a8, 3c <asm_test::fetch_max::i32::acqrel+0x3c> (ffff81ff <asm_test::fetch_max::i32::acqrel+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_max::i32::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_max::i32::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_max::i32::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_max::i32::seqcst+0x8> (ffff8105 <asm_test::fetch_max::i32::seqcst+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        max               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_max::i32::seqcst+0xffa1f01d>)
        l32r              a8, 3c <asm_test::fetch_max::i32::seqcst+0x3c> (ffff81ff <asm_test::fetch_max::i32::seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_max::i32::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_max::i32::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_max::i32::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_max::i32::acquire+0x8> (ffff8105 <asm_test::fetch_max::i32::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        max               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 34 <asm_test::fetch_max::i32::acquire+0x34> (a1f01d08 <asm_test::fetch_max::i32::acquire+0xa1f01d08>)
        l32r              a8, 38 <asm_test::fetch_max::i32::acquire+0x38> (ff81ffff <asm_test::fetch_max::i32::acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_max::i32::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_max::i32::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_max::i32::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_max::i32::relaxed+0x8> (ffff8105 <asm_test::fetch_max::i32::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        max               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, fffc0034 <asm_test::fetch_max::i32::relaxed+0xfffc0034>
        l32r              a8, 5b (810000a1 <asm_test::fetch_max::i32::relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_max::i32::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_max::i32::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_max::i32::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_max::i32::release+0x8> (ffff8105 <asm_test::fetch_max::i32::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        max               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 34 <asm_test::fetch_max::i32::release+0x34> (a1f01d08 <asm_test::fetch_max::i32::release+0xa1f01d08>)
        l32r              a8, 38 <asm_test::fetch_max::i32::release+0x38> (ff81ffff <asm_test::fetch_max::i32::release+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_min::i8::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_min::i8::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_min::i8::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_min::i8::acqrel+0x8> (ffff8105 <asm_test::fetch_min::i8::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a15, a7
        beqi              a6, 1, 4f
3:
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
        beq               a7, a15, 2b
        mov.n             a6, a13
        j                 2b
4:
        ssr               a8
        srl               a2, a7
        memw
        retw.n
5:
        l32r              a10, fffc0074 <asm_test::fetch_min::i8::acqrel+0xfffc0074>
        l32r              a8, 5b (810000a1 <asm_test::fetch_min::i8::acqrel+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_min::i8::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_min::i8::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_min::i8::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_min::i8::seqcst+0x8> (ffff8105 <asm_test::fetch_min::i8::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a15, a7
        beqi              a6, 1, 4f
3:
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
        beq               a7, a15, 2b
        mov.n             a6, a13
        j                 2b
4:
        ssr               a8
        srl               a2, a7
        memw
        retw.n
5:
        l32r              a10, fffc0074 <asm_test::fetch_min::i8::seqcst+0xfffc0074>
        l32r              a8, 5b (810000a1 <asm_test::fetch_min::i8::seqcst+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_min::i8::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_min::i8::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_min::i8::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_min::i8::acquire+0x8> (ffff8105 <asm_test::fetch_min::i8::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a15, a7
        beqi              a6, 1, 4f
3:
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
        beq               a7, a15, 2b
        mov.n             a6, a13
        j                 2b
4:
        ssr               a8
        srl               a2, a7
        memw
        retw.n
5:
        l32r              a10, 70 <asm_test::fetch_min::i8::acquire+0x70> (ffffa1f0 <asm_test::fetch_min::i8::acquire+0xffffa1f0>)
        l32r              a8, fffc0074 <asm_test::fetch_min::i8::acquire+0xfffc0074>
        callx8            a8

.literal.asm_test::fetch_min::i8::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_min::i8::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_min::i8::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_min::i8::relaxed+0x8> (ffff8105 <asm_test::fetch_min::i8::relaxed+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
        j                 3f
2:
        mov.n             a15, a7
        beqi              a6, 1, 4f
3:
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
        beq               a7, a15, 2b
        mov.n             a6, a13
        j                 2b
4:
        ssr               a8
        srl               a2, a7
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_min::i8::relaxed+0xffa1f01d>)
        l32r              a8, 70 <asm_test::fetch_min::i8::relaxed+0x70> (ffff81ff <asm_test::fetch_min::i8::relaxed+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_min::i8::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_min::i8::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_min::i8::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_min::i8::release+0x8> (ffff8105 <asm_test::fetch_min::i8::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a15, a7
        beqi              a6, 1, 4f
3:
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
        beq               a7, a15, 2b
        mov.n             a6, a13
        j                 2b
4:
        ssr               a8
        srl               a2, a7
        retw.n
5:
        l32r              a10, 70 <asm_test::fetch_min::i8::release+0x70> (ffffa1f0 <asm_test::fetch_min::i8::release+0xffffa1f0>)
        l32r              a8, fffc0074 <asm_test::fetch_min::i8::release+0xfffc0074>
        callx8            a8

.literal.asm_test::fetch_min::f32::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_min::f32::acqrel:
        entry             a1, 32
        l32i.n            a9, a2, 0
        l32r              a8, 4 <asm_test::fetch_min::f32::acqrel+0x4> (ffff8102 <asm_test::fetch_min::f32::acqrel+0xffff8102>)
0:
        bltu              a2, a8, 1f
        l32r              a8, 0b (81053287 <asm_test::fetch_min::f32::acqrel+0x81053287>)
        bltu              a2, a8, 7f
1:
        wfr               f8, a3
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        memw
        mov.n             a9, a8
        bnez              a12, 6f
3:
        wfr               f9, a9
        ole.s             b0, f8, f9
        mov.n             a12, a3
        bt                b0, 4f
        mov.n             a12, a9
4:
        un.s              b0, f9, f9
        mov.n             a8, a3
        bt                b0, 5f
        mov.n             a8, a12
5:
        memw
        wsr.scompare1     a9
        s32c1i            a8, a2, 0
        mov.n             a12, a11
        beq               a8, a9, 2b
        mov.n             a12, a10
        j                 2b
6:
        mov.n             a2, a8
        retw.n
7:
        l32r              a10, 50 <asm_test::fetch_min::f32::acqrel+0x50> (ffffa1f0 <asm_test::fetch_min::f32::acqrel+0xffffa1f0>)
        l32r              a8, fffc0054 <asm_test::fetch_min::f32::acqrel+0xfffc0054>
        callx8            a8

.literal.asm_test::fetch_min::f32::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_min::f32::seqcst:
        entry             a1, 32
        l32i.n            a9, a2, 0
        l32r              a8, 4 <asm_test::fetch_min::f32::seqcst+0x4> (ffff8102 <asm_test::fetch_min::f32::seqcst+0xffff8102>)
0:
        bltu              a2, a8, 1f
        l32r              a8, 0b (81053287 <asm_test::fetch_min::f32::seqcst+0x81053287>)
        bltu              a2, a8, 7f
1:
        wfr               f8, a3
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        memw
        mov.n             a9, a8
        bnez              a12, 6f
3:
        wfr               f9, a9
        ole.s             b0, f8, f9
        mov.n             a12, a3
        bt                b0, 4f
        mov.n             a12, a9
4:
        un.s              b0, f9, f9
        mov.n             a8, a3
        bt                b0, 5f
        mov.n             a8, a12
5:
        memw
        wsr.scompare1     a9
        s32c1i            a8, a2, 0
        mov.n             a12, a11
        beq               a8, a9, 2b
        mov.n             a12, a10
        j                 2b
6:
        mov.n             a2, a8
        retw.n
7:
        l32r              a10, 50 <asm_test::fetch_min::f32::seqcst+0x50> (ffffa1f0 <asm_test::fetch_min::f32::seqcst+0xffffa1f0>)
        l32r              a8, fffc0054 <asm_test::fetch_min::f32::seqcst+0xfffc0054>
        callx8            a8

.literal.asm_test::fetch_min::f32::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_min::f32::acquire:
        entry             a1, 32
        l32i.n            a9, a2, 0
        l32r              a8, 4 <asm_test::fetch_min::f32::acquire+0x4> (ffff8102 <asm_test::fetch_min::f32::acquire+0xffff8102>)
0:
        bltu              a2, a8, 1f
        l32r              a8, 0b (81053287 <asm_test::fetch_min::f32::acquire+0x81053287>)
        bltu              a2, a8, 9f
1:
        wfr               f8, a3
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        memw
        mov.n             a9, a8
        bnez              a12, 8f
3:
        wfr               f9, a9
        ole.s             b0, f8, f9
        mov.n             a12, a3
        bf                b0, 5f
        un.s              b0, f9, f9
        mov.n             a8, a3
        bf                b0, 6f
4:
        wsr.scompare1     a9
        s32c1i            a8, a2, 0
        mov.n             a12, a11
        beq               a8, a9, 2b
        j                 7f
5:
        mov.n             a12, a9
        un.s              b0, f9, f9
        mov.n             a8, a3
        bt                b0, 4b
6:
        mov.n             a8, a12
        wsr.scompare1     a9
        s32c1i            a8, a2, 0
        mov.n             a12, a11
        beq               a8, a9, 2b
7:
        mov.n             a12, a10
        j                 2b
8:
        mov.n             a2, a8
        retw.n
9:
        l32r              a10, fffc0064 <asm_test::fetch_min::f32::acquire+0xfffc0064>
        l32r              a8, 9b (810000a1 <asm_test::fetch_min::f32::acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_min::f32::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_min::f32::relaxed:
        entry             a1, 32
        l32i.n            a9, a2, 0
        l32r              a8, 4 <asm_test::fetch_min::f32::relaxed+0x4> (ffff8102 <asm_test::fetch_min::f32::relaxed+0xffff8102>)
0:
        bltu              a2, a8, 1f
        l32r              a8, 0b (81053287 <asm_test::fetch_min::f32::relaxed+0x81053287>)
        bltu              a2, a8, 9f
1:
        wfr               f8, a3
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a9, a8
        bnez              a12, 8f
3:
        wfr               f9, a9
        ole.s             b0, f8, f9
        mov.n             a12, a3
        bf                b0, 5f
        un.s              b0, f9, f9
        mov.n             a8, a3
        bf                b0, 6f
4:
        wsr.scompare1     a9
        s32c1i            a8, a2, 0
        mov.n             a12, a11
        beq               a8, a9, 2b
        j                 7f
5:
        mov.n             a12, a9
        un.s              b0, f9, f9
        mov.n             a8, a3
        bt                b0, 4b
6:
        mov.n             a8, a12
        wsr.scompare1     a9
        s32c1i            a8, a2, 0
        mov.n             a12, a11
        beq               a8, a9, 2b
7:
        mov.n             a12, a10
        j                 2b
8:
        mov.n             a2, a8
        retw.n
9:
        l32r              a10, 60 <asm_test::fetch_min::f32::relaxed+0x60> (ffffa1f0 <asm_test::fetch_min::f32::relaxed+0xffffa1f0>)
        l32r              a8, fffc0064 <asm_test::fetch_min::f32::relaxed+0xfffc0064>
        callx8            a8

.literal.asm_test::fetch_min::f32::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_min::f32::release:
        entry             a1, 32
        l32i.n            a9, a2, 0
        l32r              a8, 4 <asm_test::fetch_min::f32::release+0x4> (ffff8102 <asm_test::fetch_min::f32::release+0xffff8102>)
0:
        bltu              a2, a8, 1f
        l32r              a8, 0b (81053287 <asm_test::fetch_min::f32::release+0x81053287>)
        bltu              a2, a8, 8f
1:
        wfr               f8, a3
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a9, a8
        bnez              a12, 6f
3:
        wfr               f9, a9
        ole.s             b0, f8, f9
        mov.n             a12, a3
        bt                b0, 4f
        mov.n             a12, a9
4:
        un.s              b0, f9, f9
        mov.n             a8, a3
        bt                b0, 5f
        mov.n             a8, a12
5:
        memw
        wsr.scompare1     a9
        s32c1i            a8, a2, 0
        mov.n             a12, a11
        beq               a8, a9, 2b
        mov.n             a12, a10
        j                 2b
6:
        mov.n             a2, a8
7:
        retw.n
8:
        l32r              a10, 7b (ffa1f01d <asm_test::fetch_min::f32::release+0xffa1f01d>)
        l32r              a8, 50 <asm_test::fetch_min::f32::release+0x50> (ffff81ff <asm_test::fetch_min::f32::release+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_min::i16::acqrel:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_min::i16::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_min::i16::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_min::i16::acqrel+0x8> (ffff8105 <asm_test::fetch_min::i16::acqrel+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
2:
        and               a8, a8, a9
        l32r              a9, 2b (91108890 <asm_test::fetch_min::i16::acqrel+0x91108890>)
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
        j                 4f
3:
        mov.n             a14, a15
        beqi              a7, 1, 5f
4:
        and               a15, a14, a9
        ssr               a8
        srl               a7, a14
        sext              a7, a7, 15
        min               a7, a7, a11
        l32r              a6, 4c <asm_test::fetch_min::i16::acqrel+0x4c> (ffff6143 <asm_test::fetch_min::i16::acqrel+0xffff6143>)
        and               a7, a7, a6
        ssl               a8
        sll               a7, a7
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a10, 0
        mov.n             a7, a13
        beq               a15, a14, 3b
        mov.n             a7, a12
        j                 3b
5:
        ssr               a8
        srl               a2, a15
        memw
        retw.n
6:
        l32r              a10, 74 <asm_test::fetch_min::i16::acqrel+0x74> (a1f01d00 <asm_test::fetch_min::i16::acqrel+0xa1f01d00>)
        l32r              a8, 78 <asm_test::fetch_min::i16::acqrel+0x78> (ff81ffff <asm_test::fetch_min::i16::acqrel+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_min::i16::seqcst:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_min::i16::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_min::i16::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_min::i16::seqcst+0x8> (ffff8105 <asm_test::fetch_min::i16::seqcst+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
2:
        and               a8, a8, a9
        l32r              a9, 2b (91108890 <asm_test::fetch_min::i16::seqcst+0x91108890>)
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
        j                 4f
3:
        mov.n             a14, a15
        beqi              a7, 1, 5f
4:
        and               a15, a14, a9
        ssr               a8
        srl               a7, a14
        sext              a7, a7, 15
        min               a7, a7, a11
        l32r              a6, 4c <asm_test::fetch_min::i16::seqcst+0x4c> (ffff6143 <asm_test::fetch_min::i16::seqcst+0xffff6143>)
        and               a7, a7, a6
        ssl               a8
        sll               a7, a7
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a10, 0
        mov.n             a7, a13
        beq               a15, a14, 3b
        mov.n             a7, a12
        j                 3b
5:
        ssr               a8
        srl               a2, a15
        memw
        retw.n
6:
        l32r              a10, 74 <asm_test::fetch_min::i16::seqcst+0x74> (a1f01d00 <asm_test::fetch_min::i16::seqcst+0xa1f01d00>)
        l32r              a8, 78 <asm_test::fetch_min::i16::seqcst+0x78> (ff81ffff <asm_test::fetch_min::i16::seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_min::i16::acquire:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_min::i16::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_min::i16::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_min::i16::acquire+0x8> (ffff8105 <asm_test::fetch_min::i16::acquire+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
2:
        and               a8, a8, a9
        l32r              a9, 2b (91108890 <asm_test::fetch_min::i16::acquire+0x91108890>)
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
        j                 4f
3:
        mov.n             a14, a15
        beqi              a7, 1, 5f
4:
        and               a15, a14, a9
        ssr               a8
        srl               a7, a14
        sext              a7, a7, 15
        min               a7, a7, a11
        l32r              a6, 48 <asm_test::fetch_min::i16::acquire+0x48> (ff614377 <asm_test::fetch_min::i16::acquire+0xff614377>)
        and               a7, a7, a6
        ssl               a8
        sll               a7, a7
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a10, 0
        mov.n             a7, a13
        beq               a15, a14, 3b
        mov.n             a7, a12
        j                 3b
5:
        ssr               a8
        srl               a2, a15
        memw
        retw.n
6:
        l32r              a10, fffc0074 <asm_test::fetch_min::i16::acquire+0xfffc0074>
        l32r              a8, 6b (810000a1 <asm_test::fetch_min::i16::acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_min::i16::relaxed:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_min::i16::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_min::i16::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_min::i16::relaxed+0x8> (ffff8105 <asm_test::fetch_min::i16::relaxed+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
2:
        and               a8, a8, a9
        l32r              a9, 2b (91108890 <asm_test::fetch_min::i16::relaxed+0x91108890>)
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
        j                 4f
3:
        mov.n             a14, a15
        beqi              a7, 1, 5f
4:
        and               a15, a14, a9
        ssr               a8
        srl               a7, a14
        sext              a7, a7, 15
        min               a7, a7, a11
        l32r              a6, 48 <asm_test::fetch_min::i16::relaxed+0x48> (ff614377 <asm_test::fetch_min::i16::relaxed+0xff614377>)
        and               a7, a7, a6
        ssl               a8
        sll               a7, a7
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a10, 0
        mov.n             a7, a13
        beq               a15, a14, 3b
        mov.n             a7, a12
        j                 3b
5:
        ssr               a8
        srl               a2, a15
        retw.n
6:
        l32r              a10, 70 <asm_test::fetch_min::i16::relaxed+0x70> (ffffa1f0 <asm_test::fetch_min::i16::relaxed+0xffffa1f0>)
        l32r              a8, fffc0074 <asm_test::fetch_min::i16::relaxed+0xfffc0074>
        callx8            a8

.literal.asm_test::fetch_min::i16::release:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_min::i16::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_min::i16::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_min::i16::release+0x8> (ffff8105 <asm_test::fetch_min::i16::release+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
2:
        and               a8, a8, a9
        l32r              a9, 2b (91108890 <asm_test::fetch_min::i16::release+0x91108890>)
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
        j                 4f
3:
        mov.n             a14, a15
        beqi              a7, 1, 5f
4:
        and               a15, a14, a9
        ssr               a8
        srl               a7, a14
        sext              a7, a7, 15
        min               a7, a7, a11
        l32r              a6, 4c <asm_test::fetch_min::i16::release+0x4c> (ffff6143 <asm_test::fetch_min::i16::release+0xffff6143>)
        and               a7, a7, a6
        ssl               a8
        sll               a7, a7
        or                a15, a15, a7
        wsr.scompare1     a14
        s32c1i            a15, a10, 0
        mov.n             a7, a13
        beq               a15, a14, 3b
        mov.n             a7, a12
        j                 3b
5:
        ssr               a8
        srl               a2, a15
        retw.n
6:
        l32r              a10, fffc0074 <asm_test::fetch_min::i16::release+0xfffc0074>
        l32r              a8, 6b (810000a1 <asm_test::fetch_min::i16::release+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_min::i32::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_min::i32::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_min::i32::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_min::i32::acqrel+0x8> (ffff8105 <asm_test::fetch_min::i32::acqrel+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        min               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_min::i32::acqrel+0xffa1f01d>)
        l32r              a8, 3c <asm_test::fetch_min::i32::acqrel+0x3c> (ffff81ff <asm_test::fetch_min::i32::acqrel+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_min::i32::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_min::i32::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_min::i32::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_min::i32::seqcst+0x8> (ffff8105 <asm_test::fetch_min::i32::seqcst+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        min               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_min::i32::seqcst+0xffa1f01d>)
        l32r              a8, 3c <asm_test::fetch_min::i32::seqcst+0x3c> (ffff81ff <asm_test::fetch_min::i32::seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_min::i32::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_min::i32::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_min::i32::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_min::i32::acquire+0x8> (ffff8105 <asm_test::fetch_min::i32::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        min               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 34 <asm_test::fetch_min::i32::acquire+0x34> (a1f01d08 <asm_test::fetch_min::i32::acquire+0xa1f01d08>)
        l32r              a8, 38 <asm_test::fetch_min::i32::acquire+0x38> (ff81ffff <asm_test::fetch_min::i32::acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_min::i32::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_min::i32::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_min::i32::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_min::i32::relaxed+0x8> (ffff8105 <asm_test::fetch_min::i32::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        min               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, fffc0034 <asm_test::fetch_min::i32::relaxed+0xfffc0034>
        l32r              a8, 5b (810000a1 <asm_test::fetch_min::i32::relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_min::i32::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_min::i32::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_min::i32::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_min::i32::release+0x8> (ffff8105 <asm_test::fetch_min::i32::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        min               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 34 <asm_test::fetch_min::i32::release+0x34> (a1f01d08 <asm_test::fetch_min::i32::release+0xa1f01d08>)
        l32r              a8, 38 <asm_test::fetch_min::i32::release+0x38> (ff81ffff <asm_test::fetch_min::i32::release+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_neg::u8::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_neg::u8::acqrel:
        entry             a1, 32
        mov.n             a8, a2
        l32r              a9, 4 <asm_test::fetch_neg::u8::acqrel+0x4> (ffff9102 <asm_test::fetch_neg::u8::acqrel+0xffff9102>)
0:
        bltu              a8, a9, 1f
        l32r              a9, 0b (91053897 <asm_test::fetch_neg::u8::acqrel+0x91053897>)
        bltu              a8, a9, 5f
1:
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
        j                 3f
2:
        ssr               a10
        srl               a2, a15
        and               a14, a14, a13
        memw
        bnez              a14, 4f
3:
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
        beq               a15, a7, 2b
        mov.n             a14, a12
        j                 2b
4:
        retw.n
5:
        l32r              a10, 4b (ffa1f01d <asm_test::fetch_neg::u8::acqrel+0xffa1f01d>)
        l32r              a8, 7c <asm_test::fetch_neg::u8::acqrel+0x7c> (ffff81ff <asm_test::fetch_neg::u8::acqrel+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_neg::u8::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_neg::u8::seqcst:
        entry             a1, 32
        mov.n             a8, a2
        l32r              a9, 4 <asm_test::fetch_neg::u8::seqcst+0x4> (ffff9102 <asm_test::fetch_neg::u8::seqcst+0xffff9102>)
0:
        bltu              a8, a9, 1f
        l32r              a9, 0b (91053897 <asm_test::fetch_neg::u8::seqcst+0x91053897>)
        bltu              a8, a9, 5f
1:
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
        j                 3f
2:
        ssr               a10
        srl               a2, a15
        and               a14, a14, a13
        memw
        bnez              a14, 4f
3:
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
        beq               a15, a7, 2b
        mov.n             a14, a12
        j                 2b
4:
        retw.n
5:
        l32r              a10, 4b (ffa1f01d <asm_test::fetch_neg::u8::seqcst+0xffa1f01d>)
        l32r              a8, 7c <asm_test::fetch_neg::u8::seqcst+0x7c> (ffff81ff <asm_test::fetch_neg::u8::seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_neg::u8::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_neg::u8::acquire:
        entry             a1, 32
        mov.n             a8, a2
        l32r              a9, 4 <asm_test::fetch_neg::u8::acquire+0x4> (ffff9102 <asm_test::fetch_neg::u8::acquire+0xffff9102>)
0:
        bltu              a8, a9, 1f
        l32r              a9, 0b (91053897 <asm_test::fetch_neg::u8::acquire+0x91053897>)
        bltu              a8, a9, 5f
1:
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
        j                 3f
2:
        ssr               a10
        srl               a2, a14
        and               a14, a15, a13
        memw
        bnez              a14, 4f
3:
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
        beq               a14, a7, 2b
        mov.n             a15, a12
        j                 2b
4:
        retw.n
5:
        l32r              a10, 74 <asm_test::fetch_neg::u8::acquire+0x74> (a1f01dff <asm_test::fetch_neg::u8::acquire+0xa1f01dff>)
        l32r              a8, 78 <asm_test::fetch_neg::u8::acquire+0x78> (ff81ffff <asm_test::fetch_neg::u8::acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_neg::u8::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_neg::u8::relaxed:
        entry             a1, 32
        mov.n             a8, a2
        l32r              a9, 4 <asm_test::fetch_neg::u8::relaxed+0x4> (ffff9102 <asm_test::fetch_neg::u8::relaxed+0xffff9102>)
0:
        bltu              a8, a9, 1f
        l32r              a9, 0b (91053897 <asm_test::fetch_neg::u8::relaxed+0x91053897>)
        bltu              a8, a9, 5f
1:
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
        j                 3f
2:
        ssr               a10
        srl               a2, a14
        and               a14, a15, a13
        bnez              a14, 4f
3:
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
        beq               a14, a7, 2b
        mov.n             a15, a12
        j                 2b
4:
        retw.n
5:
        l32r              a10, fffc0074 <asm_test::fetch_neg::u8::relaxed+0xfffc0074>
        l32r              a8, 5b (810000a1 <asm_test::fetch_neg::u8::relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_neg::u8::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_neg::u8::release:
        entry             a1, 32
        mov.n             a8, a2
        l32r              a9, 4 <asm_test::fetch_neg::u8::release+0x4> (ffff9102 <asm_test::fetch_neg::u8::release+0xffff9102>)
0:
        bltu              a8, a9, 1f
        l32r              a9, 0b (91053897 <asm_test::fetch_neg::u8::release+0x91053897>)
        bltu              a8, a9, 5f
1:
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
        j                 3f
2:
        ssr               a10
        srl               a2, a15
        and               a14, a14, a13
        bnez              a14, 4f
3:
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
        beq               a15, a7, 2b
        mov.n             a14, a12
        j                 2b
4:
        retw.n
5:
        l32r              a10, 74 <asm_test::fetch_neg::u8::release+0x74> (a1f01dff <asm_test::fetch_neg::u8::release+0xa1f01dff>)
        l32r              a8, 78 <asm_test::fetch_neg::u8::release+0x78> (ff81ffff <asm_test::fetch_neg::u8::release+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_neg::f32::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ret
        ill
        ill

asm_test::fetch_neg::f32::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_neg::f32::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_neg::f32::acqrel+0x8> (ffff8105 <asm_test::fetch_neg::f32::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        l32r              a8, fffc0020 <asm_test::fetch_neg::f32::acqrel+0xfffc0020>
        xor               a8, a11, a8
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 3c <asm_test::fetch_neg::f32::acqrel+0x3c> (ffffa1f0 <asm_test::fetch_neg::f32::acqrel+0xffffa1f0>)
        l32r              a8, fffc0040 <asm_test::fetch_neg::f32::acqrel+0xfffc0040>
        callx8            a8

.literal.asm_test::fetch_neg::f32::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ret
        ill
        ill

asm_test::fetch_neg::f32::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_neg::f32::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_neg::f32::seqcst+0x8> (ffff8105 <asm_test::fetch_neg::f32::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        l32r              a8, fffc0020 <asm_test::fetch_neg::f32::seqcst+0xfffc0020>
        xor               a8, a11, a8
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 3c <asm_test::fetch_neg::f32::seqcst+0x3c> (ffffa1f0 <asm_test::fetch_neg::f32::seqcst+0xffffa1f0>)
        l32r              a8, fffc0040 <asm_test::fetch_neg::f32::seqcst+0xfffc0040>
        callx8            a8

.literal.asm_test::fetch_neg::f32::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ret
        ill
        ill

asm_test::fetch_neg::f32::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_neg::f32::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_neg::f32::acquire+0x8> (ffff8105 <asm_test::fetch_neg::f32::acquire+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        l32r              a8, 1c <asm_test::fetch_neg::f32::acquire+0x1c> (ffff8115 <asm_test::fetch_neg::f32::acquire+0xffff8115>)
        xor               a8, a11, a8
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_neg::f32::acquire+0xffa1f01d>)
        l32r              a8, 3c <asm_test::fetch_neg::f32::acquire+0x3c> (ffff81ff <asm_test::fetch_neg::f32::acquire+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_neg::f32::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ret
        ill
        ill

asm_test::fetch_neg::f32::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_neg::f32::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_neg::f32::relaxed+0x8> (ffff8105 <asm_test::fetch_neg::f32::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        l32r              a8, 1c <asm_test::fetch_neg::f32::relaxed+0x1c> (ffff8115 <asm_test::fetch_neg::f32::relaxed+0xffff8115>)
        xor               a8, a11, a8
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 34 <asm_test::fetch_neg::f32::relaxed+0x34> (a1f01d08 <asm_test::fetch_neg::f32::relaxed+0xa1f01d08>)
        l32r              a8, 38 <asm_test::fetch_neg::f32::relaxed+0x38> (ff81ffff <asm_test::fetch_neg::f32::relaxed+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_neg::f32::release:
        add               a0, a0, a0
        {                 excw; excw }
        ret
        ill
        ill

asm_test::fetch_neg::f32::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_neg::f32::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_neg::f32::release+0x8> (ffff8105 <asm_test::fetch_neg::f32::release+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        l32r              a8, fffc0020 <asm_test::fetch_neg::f32::release+0xfffc0020>
        xor               a8, a11, a8
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        mov.n             a2, a8
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_neg::f32::release+0xffa1f01d>)
        l32r              a8, 3c <asm_test::fetch_neg::f32::release+0x3c> (ffff81ff <asm_test::fetch_neg::f32::release+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_neg::u16::acqrel:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 28, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_neg::u16::acqrel:
        entry             a1, 32
        mov.n             a8, a2
        l32r              a9, 4 <asm_test::fetch_neg::u16::acqrel+0x4> (ffff9102 <asm_test::fetch_neg::u16::acqrel+0xffff9102>)
0:
        bltu              a8, a9, 1f
        l32r              a9, 0b (91053897 <asm_test::fetch_neg::u16::acqrel+0x91053897>)
        bltu              a8, a9, 5f
1:
        l16ui             a2, a8, 0
        slli              a9, a8, 3
        movi.n            a10, 24
        and               a9, a9, a10
        movi.n            a10, -1
        movi.n            a11, -4
        and               a8, a8, a11
        movi.n            a11, 0
        movi.n            a12, 1
        j                 3f
2:
        ssr               a9
        srl               a2, a14
        and               a13, a13, a12
        memw
        bnez              a13, 4f
3:
        l32r              a15, 38 <asm_test::fetch_neg::u16::acqrel+0x38> (fffff103 <asm_test::fetch_neg::u16::acqrel+0xfffff103>)
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
        beq               a14, a15, 2b
        mov.n             a13, a11
        j                 2b
4:
        retw.n
5:
        l32r              a10, 4b (ffa1f01d <asm_test::fetch_neg::u16::acqrel+0xffa1f01d>)
        l32r              a8, 7c <asm_test::fetch_neg::u16::acqrel+0x7c> (ffff81ff <asm_test::fetch_neg::u16::acqrel+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_neg::u16::seqcst:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 28, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_neg::u16::seqcst:
        entry             a1, 32
        mov.n             a8, a2
        l32r              a9, 4 <asm_test::fetch_neg::u16::seqcst+0x4> (ffff9102 <asm_test::fetch_neg::u16::seqcst+0xffff9102>)
0:
        bltu              a8, a9, 1f
        l32r              a9, 0b (91053897 <asm_test::fetch_neg::u16::seqcst+0x91053897>)
        bltu              a8, a9, 5f
1:
        l16ui             a2, a8, 0
        slli              a9, a8, 3
        movi.n            a10, 24
        and               a9, a9, a10
        movi.n            a10, -1
        movi.n            a11, -4
        and               a8, a8, a11
        movi.n            a11, 0
        movi.n            a12, 1
        j                 3f
2:
        ssr               a9
        srl               a2, a14
        and               a13, a13, a12
        memw
        bnez              a13, 4f
3:
        l32r              a15, 38 <asm_test::fetch_neg::u16::seqcst+0x38> (fffff103 <asm_test::fetch_neg::u16::seqcst+0xfffff103>)
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
        beq               a14, a15, 2b
        mov.n             a13, a11
        j                 2b
4:
        retw.n
5:
        l32r              a10, 4b (ffa1f01d <asm_test::fetch_neg::u16::seqcst+0xffa1f01d>)
        l32r              a8, 7c <asm_test::fetch_neg::u16::seqcst+0x7c> (ffff81ff <asm_test::fetch_neg::u16::seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_neg::u16::acquire:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 28, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_neg::u16::acquire:
        entry             a1, 32
        mov.n             a8, a2
        l32r              a9, 4 <asm_test::fetch_neg::u16::acquire+0x4> (ffff9102 <asm_test::fetch_neg::u16::acquire+0xffff9102>)
0:
        bltu              a8, a9, 1f
        l32r              a9, 0b (91053897 <asm_test::fetch_neg::u16::acquire+0x91053897>)
        bltu              a8, a9, 5f
1:
        l16ui             a2, a8, 0
        slli              a9, a8, 3
        movi.n            a10, 24
        and               a9, a9, a10
        movi.n            a10, -1
        movi.n            a11, -4
        and               a8, a8, a11
        movi.n            a11, 0
        movi.n            a12, 1
        j                 3f
2:
        ssr               a9
        srl               a2, a13
        and               a13, a14, a12
        memw
        bnez              a13, 4f
3:
        l32r              a15, 38 <asm_test::fetch_neg::u16::acquire+0x38> (fffff103 <asm_test::fetch_neg::u16::acquire+0xfffff103>)
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
        beq               a13, a15, 2b
        mov.n             a14, a11
        j                 2b
4:
        retw.n
5:
        l32r              a10, 74 <asm_test::fetch_neg::u16::acquire+0x74> (a1f01dff <asm_test::fetch_neg::u16::acquire+0xa1f01dff>)
        l32r              a8, 78 <asm_test::fetch_neg::u16::acquire+0x78> (ff81ffff <asm_test::fetch_neg::u16::acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_neg::u16::relaxed:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 28, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_neg::u16::relaxed:
        entry             a1, 32
        mov.n             a8, a2
        l32r              a9, 4 <asm_test::fetch_neg::u16::relaxed+0x4> (ffff9102 <asm_test::fetch_neg::u16::relaxed+0xffff9102>)
0:
        bltu              a8, a9, 1f
        l32r              a9, 0b (91053897 <asm_test::fetch_neg::u16::relaxed+0x91053897>)
        bltu              a8, a9, 5f
1:
        l16ui             a2, a8, 0
        slli              a9, a8, 3
        movi.n            a10, 24
        and               a9, a9, a10
        movi.n            a10, -1
        movi.n            a11, -4
        and               a8, a8, a11
        movi.n            a11, 0
        movi.n            a12, 1
        j                 3f
2:
        ssr               a9
        srl               a2, a13
        and               a13, a14, a12
        bnez              a13, 4f
3:
        l32r              a15, 34 <asm_test::fetch_neg::u16::relaxed+0x34> (fff103bd <asm_test::fetch_neg::u16::relaxed+0xfff103bd>)
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
        beq               a13, a15, 2b
        mov.n             a14, a11
        j                 2b
4:
        retw.n
5:
        l32r              a10, fffc0074 <asm_test::fetch_neg::u16::relaxed+0xfffc0074>
        l32r              a8, 5b (810000a1 <asm_test::fetch_neg::u16::relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_neg::u16::release:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 28, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_neg::u16::release:
        entry             a1, 32
        mov.n             a8, a2
        l32r              a9, 4 <asm_test::fetch_neg::u16::release+0x4> (ffff9102 <asm_test::fetch_neg::u16::release+0xffff9102>)
0:
        bltu              a8, a9, 1f
        l32r              a9, 0b (91053897 <asm_test::fetch_neg::u16::release+0x91053897>)
        bltu              a8, a9, 5f
1:
        l16ui             a2, a8, 0
        slli              a9, a8, 3
        movi.n            a10, 24
        and               a9, a9, a10
        movi.n            a10, -1
        movi.n            a11, -4
        and               a8, a8, a11
        movi.n            a11, 0
        movi.n            a12, 1
        j                 3f
2:
        ssr               a9
        srl               a2, a14
        and               a13, a13, a12
        bnez              a13, 4f
3:
        l32r              a15, 34 <asm_test::fetch_neg::u16::release+0x34> (fff103ed <asm_test::fetch_neg::u16::release+0xfff103ed>)
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
        beq               a14, a15, 2b
        mov.n             a13, a11
        j                 2b
4:
        retw.n
5:
        l32r              a10, 74 <asm_test::fetch_neg::u16::release+0x74> (a1f01dff <asm_test::fetch_neg::u16::release+0xa1f01dff>)
        l32r              a8, 78 <asm_test::fetch_neg::u16::release+0x78> (ff81ffff <asm_test::fetch_neg::u16::release+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_neg::u32::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_neg::u32::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_neg::u32::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_neg::u32::acqrel+0x8> (ffff8105 <asm_test::fetch_neg::u32::acqrel+0xffff8105>)
        bltu              a2, a8, 6f
1:
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        memw
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        memw
        neg               a8, a11
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        mov.n             a2, a8
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_neg::u32::acqrel+0xffa1f01d>)
        l32r              a8, 3c <asm_test::fetch_neg::u32::acqrel+0x3c> (ffff81ff <asm_test::fetch_neg::u32::acqrel+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_neg::u32::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_neg::u32::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_neg::u32::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_neg::u32::seqcst+0x8> (ffff8105 <asm_test::fetch_neg::u32::seqcst+0xffff8105>)
        bltu              a2, a8, 6f
1:
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        memw
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        memw
        neg               a8, a11
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        mov.n             a2, a8
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_neg::u32::seqcst+0xffa1f01d>)
        l32r              a8, 3c <asm_test::fetch_neg::u32::seqcst+0x3c> (ffff81ff <asm_test::fetch_neg::u32::seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_neg::u32::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_neg::u32::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_neg::u32::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_neg::u32::acquire+0x8> (ffff8105 <asm_test::fetch_neg::u32::acquire+0xffff8105>)
        bltu              a2, a8, 5f
1:
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        memw
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        neg               a8, a11
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 34 <asm_test::fetch_neg::u32::acquire+0x34> (a1f01d08 <asm_test::fetch_neg::u32::acquire+0xa1f01d08>)
        l32r              a8, 38 <asm_test::fetch_neg::u32::acquire+0x38> (ff81ffff <asm_test::fetch_neg::u32::acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_neg::u32::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_neg::u32::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_neg::u32::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_neg::u32::relaxed+0x8> (ffff8105 <asm_test::fetch_neg::u32::relaxed+0xffff8105>)
        bltu              a2, a8, 5f
1:
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        neg               a8, a11
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, fffc0034 <asm_test::fetch_neg::u32::relaxed+0xfffc0034>
        l32r              a8, 5b (810000a1 <asm_test::fetch_neg::u32::relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_neg::u32::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_neg::u32::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_neg::u32::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_neg::u32::release+0x8> (ffff8105 <asm_test::fetch_neg::u32::release+0xffff8105>)
        bltu              a2, a8, 5f
1:
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        memw
        neg               a8, a11
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 34 <asm_test::fetch_neg::u32::release+0x34> (a1f01d08 <asm_test::fetch_neg::u32::release+0xa1f01d08>)
        l32r              a8, 38 <asm_test::fetch_neg::u32::release+0x38> (ff81ffff <asm_test::fetch_neg::u32::release+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_not::u8::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_not::u8::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_not::u8::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_not::u8::acqrel+0x8> (ffff8105 <asm_test::fetch_not::u8::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a2, a13
        memw
        retw.n
5:
        l32r              a10, fffc0054 <asm_test::fetch_not::u8::acqrel+0xfffc0054>
        l32r              a8, 5b (810000a1 <asm_test::fetch_not::u8::acqrel+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_not::u8::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_not::u8::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_not::u8::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_not::u8::seqcst+0x8> (ffff8105 <asm_test::fetch_not::u8::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a2, a13
        memw
        retw.n
5:
        l32r              a10, fffc0054 <asm_test::fetch_not::u8::seqcst+0xfffc0054>
        l32r              a8, 5b (810000a1 <asm_test::fetch_not::u8::seqcst+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_not::u8::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_not::u8::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_not::u8::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_not::u8::acquire+0x8> (ffff8105 <asm_test::fetch_not::u8::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a2, a13
        memw
        retw.n
5:
        l32r              a10, 50 <asm_test::fetch_not::u8::acquire+0x50> (ffffa1f0 <asm_test::fetch_not::u8::acquire+0xffffa1f0>)
        l32r              a8, fffc0054 <asm_test::fetch_not::u8::acquire+0xfffc0054>
        callx8            a8

.literal.asm_test::fetch_not::u8::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_not::u8::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_not::u8::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_not::u8::relaxed+0x8> (ffff8105 <asm_test::fetch_not::u8::relaxed+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a2, a13
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_not::u8::relaxed+0xffa1f01d>)
        l32r              a8, 50 <asm_test::fetch_not::u8::relaxed+0x50> (ffff81ff <asm_test::fetch_not::u8::relaxed+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_not::u8::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_not::u8::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_not::u8::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_not::u8::release+0x8> (ffff8105 <asm_test::fetch_not::u8::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a2, a13
        retw.n
5:
        l32r              a10, 50 <asm_test::fetch_not::u8::release+0x50> (ffffa1f0 <asm_test::fetch_not::u8::release+0xffffa1f0>)
        l32r              a8, fffc0054 <asm_test::fetch_not::u8::release+0xfffc0054>
        callx8            a8

.literal.asm_test::fetch_not::u16::acqrel:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_not::u16::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_not::u16::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_not::u16::acqrel+0x8> (ffff8105 <asm_test::fetch_not::u16::acqrel+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
2:
        and               a8, a8, a9
        l32r              a9, 2b (91108890 <asm_test::fetch_not::u16::acqrel+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 4f
3:
        mov.n             a14, a13
        beqi              a15, 1, 5f
4:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 3b
        mov.n             a15, a11
        j                 3b
5:
        ssr               a8
        srl               a2, a13
        memw
        retw.n
6:
        l32r              a10, fffc0054 <asm_test::fetch_not::u16::acqrel+0xfffc0054>
        l32r              a8, 6b (810000a1 <asm_test::fetch_not::u16::acqrel+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_not::u16::seqcst:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_not::u16::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_not::u16::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_not::u16::seqcst+0x8> (ffff8105 <asm_test::fetch_not::u16::seqcst+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
2:
        and               a8, a8, a9
        l32r              a9, 2b (91108890 <asm_test::fetch_not::u16::seqcst+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 4f
3:
        mov.n             a14, a13
        beqi              a15, 1, 5f
4:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 3b
        mov.n             a15, a11
        j                 3b
5:
        ssr               a8
        srl               a2, a13
        memw
        retw.n
6:
        l32r              a10, fffc0054 <asm_test::fetch_not::u16::seqcst+0xfffc0054>
        l32r              a8, 6b (810000a1 <asm_test::fetch_not::u16::seqcst+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_not::u16::acquire:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_not::u16::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_not::u16::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_not::u16::acquire+0x8> (ffff8105 <asm_test::fetch_not::u16::acquire+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
2:
        and               a8, a8, a9
        l32r              a9, 2b (91108890 <asm_test::fetch_not::u16::acquire+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 4f
3:
        mov.n             a14, a13
        beqi              a15, 1, 5f
4:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 3b
        mov.n             a15, a11
        j                 3b
5:
        ssr               a8
        srl               a2, a13
        memw
        retw.n
6:
        l32r              a10, 50 <asm_test::fetch_not::u16::acquire+0x50> (ffffa1f0 <asm_test::fetch_not::u16::acquire+0xffffa1f0>)
        l32r              a8, fffc0054 <asm_test::fetch_not::u16::acquire+0xfffc0054>
        callx8            a8

.literal.asm_test::fetch_not::u16::relaxed:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_not::u16::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_not::u16::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_not::u16::relaxed+0x8> (ffff8105 <asm_test::fetch_not::u16::relaxed+0xffff8105>)
        bgeu              a8, a2, 7f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
2:
        and               a8, a8, a9
        l32r              a9, 2b (91108890 <asm_test::fetch_not::u16::relaxed+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 4f
3:
        mov.n             a14, a13
        beqi              a15, 1, 5f
4:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 3b
        mov.n             a15, a11
        j                 3b
5:
        ssr               a8
        srl               a2, a13
6:
        retw.n
7:
        l32r              a10, 6b (ffa1f01d <asm_test::fetch_not::u16::relaxed+0xffa1f01d>)
        l32r              a8, 50 <asm_test::fetch_not::u16::relaxed+0x50> (ffff81ff <asm_test::fetch_not::u16::relaxed+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_not::u16::release:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_not::u16::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_not::u16::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_not::u16::release+0x8> (ffff8105 <asm_test::fetch_not::u16::release+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        slli              a8, a2, 3
        movi.n            a9, 24
2:
        and               a8, a8, a9
        l32r              a9, 2b (91108890 <asm_test::fetch_not::u16::release+0x91108890>)
        ssl               a8
        sll               a9, a9
        movi.n            a10, -4
        and               a10, a2, a10
        memw
        l32i.n            a14, a10, 0
        movi.n            a11, 0
        movi.n            a12, 1
        j                 4f
3:
        mov.n             a14, a13
        beqi              a15, 1, 5f
4:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 3b
        mov.n             a15, a11
        j                 3b
5:
        ssr               a8
        srl               a2, a13
        retw.n
6:
        l32r              a10, 50 <asm_test::fetch_not::u16::release+0x50> (ffffa1f0 <asm_test::fetch_not::u16::release+0xffffa1f0>)
        l32r              a8, fffc0054 <asm_test::fetch_not::u16::release+0xfffc0054>
        callx8            a8

.literal.asm_test::fetch_not::u32::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_not::u32::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_not::u32::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_not::u32::acqrel+0x8> (ffff8105 <asm_test::fetch_not::u32::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a12, a2, 0
        movi.n            a9, -1
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a12, a8
        beqi              a13, 1, 4f
3:
        xor               a8, a12, a9
        wsr.scompare1     a12
        s32c1i            a8, a2, 0
        mov.n             a13, a11
        beq               a8, a12, 2b
        mov.n             a13, a10
        j                 2b
4:
        memw
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, fffc003c <asm_test::fetch_not::u32::acqrel+0xfffc003c>
        l32r              a8, 5b (810000a1 <asm_test::fetch_not::u32::acqrel+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_not::u32::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_not::u32::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_not::u32::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_not::u32::seqcst+0x8> (ffff8105 <asm_test::fetch_not::u32::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a12, a2, 0
        movi.n            a9, -1
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a12, a8
        beqi              a13, 1, 4f
3:
        xor               a8, a12, a9
        wsr.scompare1     a12
        s32c1i            a8, a2, 0
        mov.n             a13, a11
        beq               a8, a12, 2b
        mov.n             a13, a10
        j                 2b
4:
        memw
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, fffc003c <asm_test::fetch_not::u32::seqcst+0xfffc003c>
        l32r              a8, 5b (810000a1 <asm_test::fetch_not::u32::seqcst+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_not::u32::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_not::u32::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_not::u32::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_not::u32::acquire+0x8> (ffff8105 <asm_test::fetch_not::u32::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a12, a2, 0
        movi.n            a9, -1
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a12, a8
        beqi              a13, 1, 4f
3:
        xor               a8, a12, a9
        wsr.scompare1     a12
        s32c1i            a8, a2, 0
        mov.n             a13, a11
        beq               a8, a12, 2b
        mov.n             a13, a10
        j                 2b
4:
        memw
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 38 <asm_test::fetch_not::u32::acquire+0x38> (ffffa1f0 <asm_test::fetch_not::u32::acquire+0xffffa1f0>)
        l32r              a8, fffc003c <asm_test::fetch_not::u32::acquire+0xfffc003c>
        callx8            a8

.literal.asm_test::fetch_not::u32::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_not::u32::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_not::u32::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_not::u32::relaxed+0x8> (ffff8105 <asm_test::fetch_not::u32::relaxed+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        l32i.n            a12, a2, 0
        movi.n            a9, -1
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a12, a8
        beqi              a13, 1, 4f
3:
        xor               a8, a12, a9
        wsr.scompare1     a12
        s32c1i            a8, a2, 0
        mov.n             a13, a11
        beq               a8, a12, 2b
        mov.n             a13, a10
        j                 2b
4:
        mov.n             a2, a8
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_not::u32::relaxed+0xffa1f01d>)
        l32r              a8, 38 <asm_test::fetch_not::u32::relaxed+0x38> (ffff81ff <asm_test::fetch_not::u32::relaxed+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_not::u32::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_not::u32::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_not::u32::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_not::u32::release+0x8> (ffff8105 <asm_test::fetch_not::u32::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a12, a2, 0
        movi.n            a9, -1
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a12, a8
        beqi              a13, 1, 4f
3:
        xor               a8, a12, a9
        wsr.scompare1     a12
        s32c1i            a8, a2, 0
        mov.n             a13, a11
        beq               a8, a12, 2b
        mov.n             a13, a10
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 38 <asm_test::fetch_not::u32::release+0x38> (ffffa1f0 <asm_test::fetch_not::u32::release+0xffffa1f0>)
        l32r              a8, fffc003c <asm_test::fetch_not::u32::release+0xfffc003c>
        callx8            a8

.literal.asm_test::fetch_not::bool::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_not::bool::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_not::bool::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_not::bool::acqrel+0x8> (ffff8105 <asm_test::fetch_not::bool::acqrel+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        xor               a13, a14, a10
        wsr.scompare1     a14
        s32c1i            a13, a11, 0
        mov.n             a15, a9
        beq               a13, a14, 2b
        mov.n             a15, a12
        j                 2b
4:
        ssr               a8
        srl               a8, a13
        movi.n            a9, 1
        and               a2, a8, a9
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_not::bool::acqrel+0xffa1f01d>)
        l32r              a8, 58 <asm_test::fetch_not::bool::acqrel+0x58> (ffff81ff <asm_test::fetch_not::bool::acqrel+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_not::bool::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_not::bool::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_not::bool::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_not::bool::seqcst+0x8> (ffff8105 <asm_test::fetch_not::bool::seqcst+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        xor               a13, a14, a10
        wsr.scompare1     a14
        s32c1i            a13, a11, 0
        mov.n             a15, a9
        beq               a13, a14, 2b
        mov.n             a15, a12
        j                 2b
4:
        ssr               a8
        srl               a8, a13
        movi.n            a9, 1
        and               a2, a8, a9
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_not::bool::seqcst+0xffa1f01d>)
        l32r              a8, 58 <asm_test::fetch_not::bool::seqcst+0x58> (ffff81ff <asm_test::fetch_not::bool::seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_not::bool::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_not::bool::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_not::bool::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_not::bool::acquire+0x8> (ffff8105 <asm_test::fetch_not::bool::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        xor               a13, a14, a10
        wsr.scompare1     a14
        s32c1i            a13, a11, 0
        mov.n             a15, a9
        beq               a13, a14, 2b
        mov.n             a15, a12
        j                 2b
4:
        ssr               a8
        srl               a8, a13
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n
5:
        l32r              a10, 50 <asm_test::fetch_not::bool::acquire+0x50> (a1f01d00 <asm_test::fetch_not::bool::acquire+0xa1f01d00>)
        l32r              a8, 54 <asm_test::fetch_not::bool::acquire+0x54> (ff81ffff <asm_test::fetch_not::bool::acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_not::bool::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_not::bool::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_not::bool::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_not::bool::relaxed+0x8> (ffff8105 <asm_test::fetch_not::bool::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        xor               a13, a14, a10
        wsr.scompare1     a14
        s32c1i            a13, a11, 0
        mov.n             a15, a9
        beq               a13, a14, 2b
        mov.n             a15, a12
        j                 2b
4:
        ssr               a8
        srl               a8, a13
        movi.n            a9, 1
        and               a2, a8, a9
        retw.n
5:
        l32r              a10, fffc0050 <asm_test::fetch_not::bool::relaxed+0xfffc0050>
        l32r              a8, 5b (810000a1 <asm_test::fetch_not::bool::relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_not::bool::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_not::bool::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_not::bool::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_not::bool::release+0x8> (ffff8105 <asm_test::fetch_not::bool::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        xor               a13, a14, a10
        wsr.scompare1     a14
        s32c1i            a13, a11, 0
        mov.n             a15, a9
        beq               a13, a14, 2b
        mov.n             a15, a12
        j                 2b
4:
        ssr               a8
        srl               a8, a13
        movi.n            a9, 1
        and               a2, a8, a9
        retw.n
5:
        l32r              a10, 50 <asm_test::fetch_not::bool::release+0x50> (a1f01d10 <asm_test::fetch_not::bool::release+0xa1f01d10>)
        l32r              a8, 54 <asm_test::fetch_not::bool::release+0x54> (ff81ffff <asm_test::fetch_not::bool::release+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_sub::u8::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_sub::u8::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_sub::u8::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_sub::u8::acqrel+0x8> (ffff8105 <asm_test::fetch_sub::u8::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a15, a7
        beqi              a6, 1, 4f
3:
        and               a7, a15, a11
        sub               a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 2b
        mov.n             a6, a13
        j                 2b
4:
        ssr               a8
        srl               a2, a7
        memw
        retw.n
5:
        l32r              a10, 68 <asm_test::fetch_sub::u8::acqrel+0x68> (a1f01d00 <asm_test::fetch_sub::u8::acqrel+0xa1f01d00>)
        l32r              a8, 6c <asm_test::fetch_sub::u8::acqrel+0x6c> (ff81ffff <asm_test::fetch_sub::u8::acqrel+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_sub::u8::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_sub::u8::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_sub::u8::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_sub::u8::seqcst+0x8> (ffff8105 <asm_test::fetch_sub::u8::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a15, a7
        beqi              a6, 1, 4f
3:
        and               a7, a15, a11
        sub               a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 2b
        mov.n             a6, a13
        j                 2b
4:
        ssr               a8
        srl               a2, a7
        memw
        retw.n
5:
        l32r              a10, 68 <asm_test::fetch_sub::u8::seqcst+0x68> (a1f01d00 <asm_test::fetch_sub::u8::seqcst+0xa1f01d00>)
        l32r              a8, 6c <asm_test::fetch_sub::u8::seqcst+0x6c> (ff81ffff <asm_test::fetch_sub::u8::seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_sub::u8::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_sub::u8::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_sub::u8::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_sub::u8::acquire+0x8> (ffff8105 <asm_test::fetch_sub::u8::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a15, a7
        beqi              a6, 1, 4f
3:
        and               a7, a15, a11
        sub               a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 2b
        mov.n             a6, a13
        j                 2b
4:
        ssr               a8
        srl               a2, a7
        memw
        retw.n
5:
        l32r              a10, fffc0068 <asm_test::fetch_sub::u8::acquire+0xfffc0068>
        l32r              a8, 5b (810000a1 <asm_test::fetch_sub::u8::acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_sub::u8::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_sub::u8::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_sub::u8::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_sub::u8::relaxed+0x8> (ffff8105 <asm_test::fetch_sub::u8::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a15, a7
        beqi              a6, 1, 4f
3:
        and               a7, a15, a11
        sub               a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 2b
        mov.n             a6, a13
        j                 2b
4:
        ssr               a8
        srl               a2, a7
        retw.n
5:
        l32r              a10, 64 <asm_test::fetch_sub::u8::relaxed+0x64> (ffffa1f0 <asm_test::fetch_sub::u8::relaxed+0xffffa1f0>)
        l32r              a8, fffc0068 <asm_test::fetch_sub::u8::relaxed+0xfffc0068>
        callx8            a8

.literal.asm_test::fetch_sub::u8::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_sub::u8::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_sub::u8::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_sub::u8::release+0x8> (ffff8105 <asm_test::fetch_sub::u8::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a15, a7
        beqi              a6, 1, 4f
3:
        and               a7, a15, a11
        sub               a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 2b
        mov.n             a6, a13
        j                 2b
4:
        ssr               a8
        srl               a2, a7
        retw.n
5:
        l32r              a10, fffc0068 <asm_test::fetch_sub::u8::release+0xfffc0068>
        l32r              a8, 5b (810000a1 <asm_test::fetch_sub::u8::release+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_sub::f32::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_sub::f32::acqrel:
        entry             a1, 32
        l32i.n            a9, a2, 0
        l32r              a8, 4 <asm_test::fetch_sub::f32::acqrel+0x4> (ffff8102 <asm_test::fetch_sub::f32::acqrel+0xffff8102>)
0:
        bltu              a2, a8, 1f
        l32r              a8, 0b (81053287 <asm_test::fetch_sub::f32::acqrel+0x81053287>)
        bltu              a2, a8, 5f
1:
        wfr               f8, a3
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        memw
        mov.n             a9, a8
        bnez              a12, 4f
3:
        wfr               f9, a9
        sub.s             f9, f9, f8
        rfr               a8, f9
        memw
        wsr.scompare1     a9
        s32c1i            a8, a2, 0
        mov.n             a12, a11
        beq               a8, a9, 2b
        mov.n             a12, a10
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 40 <asm_test::fetch_sub::f32::acqrel+0x40> (a1f01d08 <asm_test::fetch_sub::f32::acqrel+0xa1f01d08>)
        l32r              a8, 44 <asm_test::fetch_sub::f32::acqrel+0x44> (ff81ffff <asm_test::fetch_sub::f32::acqrel+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_sub::f32::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_sub::f32::seqcst:
        entry             a1, 32
        l32i.n            a9, a2, 0
        l32r              a8, 4 <asm_test::fetch_sub::f32::seqcst+0x4> (ffff8102 <asm_test::fetch_sub::f32::seqcst+0xffff8102>)
0:
        bltu              a2, a8, 1f
        l32r              a8, 0b (81053287 <asm_test::fetch_sub::f32::seqcst+0x81053287>)
        bltu              a2, a8, 5f
1:
        wfr               f8, a3
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        memw
        mov.n             a9, a8
        bnez              a12, 4f
3:
        wfr               f9, a9
        sub.s             f9, f9, f8
        rfr               a8, f9
        memw
        wsr.scompare1     a9
        s32c1i            a8, a2, 0
        mov.n             a12, a11
        beq               a8, a9, 2b
        mov.n             a12, a10
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 40 <asm_test::fetch_sub::f32::seqcst+0x40> (a1f01d08 <asm_test::fetch_sub::f32::seqcst+0xa1f01d08>)
        l32r              a8, 44 <asm_test::fetch_sub::f32::seqcst+0x44> (ff81ffff <asm_test::fetch_sub::f32::seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_sub::f32::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_sub::f32::acquire:
        entry             a1, 32
        l32i.n            a9, a2, 0
        l32r              a8, 4 <asm_test::fetch_sub::f32::acquire+0x4> (ffff8102 <asm_test::fetch_sub::f32::acquire+0xffff8102>)
0:
        bltu              a2, a8, 1f
        l32r              a8, 0b (81053287 <asm_test::fetch_sub::f32::acquire+0x81053287>)
        bltu              a2, a8, 5f
1:
        wfr               f8, a3
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        memw
        mov.n             a9, a8
        bnez              a12, 4f
3:
        wfr               f9, a9
        sub.s             f9, f9, f8
        rfr               a8, f9
        wsr.scompare1     a9
        s32c1i            a8, a2, 0
        mov.n             a12, a11
        beq               a8, a9, 2b
        mov.n             a12, a10
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, fffc0040 <asm_test::fetch_sub::f32::acquire+0xfffc0040>
        l32r              a8, 5b (810000a1 <asm_test::fetch_sub::f32::acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_sub::f32::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_sub::f32::relaxed:
        entry             a1, 32
        l32i.n            a9, a2, 0
        l32r              a8, 4 <asm_test::fetch_sub::f32::relaxed+0x4> (ffff8102 <asm_test::fetch_sub::f32::relaxed+0xffff8102>)
0:
        bltu              a2, a8, 1f
        l32r              a8, 0b (81053287 <asm_test::fetch_sub::f32::relaxed+0x81053287>)
        bltu              a2, a8, 5f
1:
        wfr               f8, a3
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a9, a8
        bnez              a12, 4f
3:
        wfr               f9, a9
        sub.s             f9, f9, f8
        rfr               a8, f9
        wsr.scompare1     a9
        s32c1i            a8, a2, 0
        mov.n             a12, a11
        beq               a8, a9, 2b
        mov.n             a12, a10
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 3c <asm_test::fetch_sub::f32::relaxed+0x3c> (ffffa1f0 <asm_test::fetch_sub::f32::relaxed+0xffffa1f0>)
        l32r              a8, fffc0040 <asm_test::fetch_sub::f32::relaxed+0xfffc0040>
        callx8            a8

.literal.asm_test::fetch_sub::f32::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_sub::f32::release:
        entry             a1, 32
        l32i.n            a9, a2, 0
        l32r              a8, 4 <asm_test::fetch_sub::f32::release+0x4> (ffff8102 <asm_test::fetch_sub::f32::release+0xffff8102>)
0:
        bltu              a2, a8, 1f
        l32r              a8, 0b (81053287 <asm_test::fetch_sub::f32::release+0x81053287>)
        bltu              a2, a8, 5f
1:
        wfr               f8, a3
        movi.n            a10, 0
        movi.n            a11, 1
        j                 3f
2:
        mov.n             a9, a8
        bnez              a12, 4f
3:
        wfr               f9, a9
        sub.s             f9, f9, f8
        rfr               a8, f9
        memw
        wsr.scompare1     a9
        s32c1i            a8, a2, 0
        mov.n             a12, a11
        beq               a8, a9, 2b
        mov.n             a12, a10
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, fffc0040 <asm_test::fetch_sub::f32::release+0xfffc0040>
        l32r              a8, 5b (810000a1 <asm_test::fetch_sub::f32::release+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_sub::u16::acqrel:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_sub::u16::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_sub::u16::acqrel+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::fetch_sub::u16::acqrel+0x8> (ffff8105 <asm_test::fetch_sub::u16::acqrel+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a10, 1b (a15bb827 <asm_test::fetch_sub::u16::acqrel+0xa15bb827>)
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
        j                 4f
3:
        mov.n             a15, a7
        beqi              a6, 1, 5f
4:
        and               a7, a15, a11
        sub               a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 3b
        mov.n             a6, a13
        j                 3b
5:
        ssr               a8
        srl               a2, a7
        memw
        retw.n
6:
        l32r              a10, 68 <asm_test::fetch_sub::u16::acqrel+0x68> (a1f01d00 <asm_test::fetch_sub::u16::acqrel+0xa1f01d00>)
        l32r              a8, 6c <asm_test::fetch_sub::u16::acqrel+0x6c> (ff81ffff <asm_test::fetch_sub::u16::acqrel+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_sub::u16::seqcst:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_sub::u16::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_sub::u16::seqcst+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::fetch_sub::u16::seqcst+0x8> (ffff8105 <asm_test::fetch_sub::u16::seqcst+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a10, 1b (a15bb827 <asm_test::fetch_sub::u16::seqcst+0xa15bb827>)
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
        j                 4f
3:
        mov.n             a15, a7
        beqi              a6, 1, 5f
4:
        and               a7, a15, a11
        sub               a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 3b
        mov.n             a6, a13
        j                 3b
5:
        ssr               a8
        srl               a2, a7
        memw
        retw.n
6:
        l32r              a10, 68 <asm_test::fetch_sub::u16::seqcst+0x68> (a1f01d00 <asm_test::fetch_sub::u16::seqcst+0xa1f01d00>)
        l32r              a8, 6c <asm_test::fetch_sub::u16::seqcst+0x6c> (ff81ffff <asm_test::fetch_sub::u16::seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_sub::u16::acquire:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_sub::u16::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_sub::u16::acquire+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::fetch_sub::u16::acquire+0x8> (ffff8105 <asm_test::fetch_sub::u16::acquire+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a10, 1b (a158b827 <asm_test::fetch_sub::u16::acquire+0xa158b827>)
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
        j                 4f
3:
        mov.n             a15, a7
        beqi              a6, 1, 5f
4:
        and               a7, a15, a11
        sub               a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 3b
        mov.n             a6, a13
        j                 3b
5:
        ssr               a8
        srl               a2, a7
        memw
        retw.n
6:
        l32r              a10, fffc0068 <asm_test::fetch_sub::u16::acquire+0xfffc0068>
        l32r              a8, 6b (810000a1 <asm_test::fetch_sub::u16::acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_sub::u16::relaxed:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_sub::u16::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_sub::u16::relaxed+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::fetch_sub::u16::relaxed+0x8> (ffff8105 <asm_test::fetch_sub::u16::relaxed+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a10, 1b (a155b827 <asm_test::fetch_sub::u16::relaxed+0xa155b827>)
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
        j                 4f
3:
        mov.n             a15, a7
        beqi              a6, 1, 5f
4:
        and               a7, a15, a11
        sub               a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 3b
        mov.n             a6, a13
        j                 3b
5:
        ssr               a8
        srl               a2, a7
        retw.n
6:
        l32r              a10, 64 <asm_test::fetch_sub::u16::relaxed+0x64> (ffffa1f0 <asm_test::fetch_sub::u16::relaxed+0xffffa1f0>)
        l32r              a8, fffc0068 <asm_test::fetch_sub::u16::relaxed+0xfffc0068>
        callx8            a8

.literal.asm_test::fetch_sub::u16::release:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_sub::u16::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_sub::u16::release+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::fetch_sub::u16::release+0x8> (ffff8105 <asm_test::fetch_sub::u16::release+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a10, 1b (a158b827 <asm_test::fetch_sub::u16::release+0xa158b827>)
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
        j                 4f
3:
        mov.n             a15, a7
        beqi              a6, 1, 5f
4:
        and               a7, a15, a11
        sub               a6, a15, a9
        and               a6, a6, a10
        or                a7, a7, a6
        wsr.scompare1     a15
        s32c1i            a7, a12, 0
        mov.n             a6, a14
        beq               a7, a15, 3b
        mov.n             a6, a13
        j                 3b
5:
        ssr               a8
        srl               a2, a7
        retw.n
6:
        l32r              a10, fffc0068 <asm_test::fetch_sub::u16::release+0xfffc0068>
        l32r              a8, 6b (810000a1 <asm_test::fetch_sub::u16::release+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_sub::u32::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_sub::u32::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_sub::u32::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_sub::u32::acqrel+0x8> (ffff8105 <asm_test::fetch_sub::u32::acqrel+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        sub               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_sub::u32::acqrel+0xffa1f01d>)
        l32r              a8, 3c <asm_test::fetch_sub::u32::acqrel+0x3c> (ffff81ff <asm_test::fetch_sub::u32::acqrel+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_sub::u32::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_sub::u32::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_sub::u32::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_sub::u32::seqcst+0x8> (ffff8105 <asm_test::fetch_sub::u32::seqcst+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        sub               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_sub::u32::seqcst+0xffa1f01d>)
        l32r              a8, 3c <asm_test::fetch_sub::u32::seqcst+0x3c> (ffff81ff <asm_test::fetch_sub::u32::seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_sub::u32::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_sub::u32::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_sub::u32::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_sub::u32::acquire+0x8> (ffff8105 <asm_test::fetch_sub::u32::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        sub               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 34 <asm_test::fetch_sub::u32::acquire+0x34> (a1f01d08 <asm_test::fetch_sub::u32::acquire+0xa1f01d08>)
        l32r              a8, 38 <asm_test::fetch_sub::u32::acquire+0x38> (ff81ffff <asm_test::fetch_sub::u32::acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_sub::u32::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_sub::u32::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_sub::u32::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_sub::u32::relaxed+0x8> (ffff8105 <asm_test::fetch_sub::u32::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        sub               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, fffc0034 <asm_test::fetch_sub::u32::relaxed+0xfffc0034>
        l32r              a8, 5b (810000a1 <asm_test::fetch_sub::u32::relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_sub::u32::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_sub::u32::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_sub::u32::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_sub::u32::release+0x8> (ffff8105 <asm_test::fetch_sub::u32::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        sub               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 34 <asm_test::fetch_sub::u32::release+0x34> (a1f01d08 <asm_test::fetch_sub::u32::release+0xa1f01d08>)
        l32r              a8, 38 <asm_test::fetch_sub::u32::release+0x38> (ff81ffff <asm_test::fetch_sub::u32::release+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_xor::u8::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_xor::u8::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_xor::u8::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_xor::u8::acqrel+0x8> (ffff8105 <asm_test::fetch_xor::u8::acqrel+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a2, a13
        memw
        retw.n
5:
        l32r              a10, 54 <asm_test::fetch_xor::u8::acqrel+0x54> (a1f01d00 <asm_test::fetch_xor::u8::acqrel+0xa1f01d00>)
        l32r              a8, 58 <asm_test::fetch_xor::u8::acqrel+0x58> (ff81ffff <asm_test::fetch_xor::u8::acqrel+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_xor::u8::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_xor::u8::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_xor::u8::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_xor::u8::seqcst+0x8> (ffff8105 <asm_test::fetch_xor::u8::seqcst+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a2, a13
        memw
        retw.n
5:
        l32r              a10, 54 <asm_test::fetch_xor::u8::seqcst+0x54> (a1f01d00 <asm_test::fetch_xor::u8::seqcst+0xa1f01d00>)
        l32r              a8, 58 <asm_test::fetch_xor::u8::seqcst+0x58> (ff81ffff <asm_test::fetch_xor::u8::seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_xor::u8::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_xor::u8::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_xor::u8::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_xor::u8::acquire+0x8> (ffff8105 <asm_test::fetch_xor::u8::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a2, a13
        memw
        retw.n
5:
        l32r              a10, fffc0054 <asm_test::fetch_xor::u8::acquire+0xfffc0054>
        l32r              a8, 5b (810000a1 <asm_test::fetch_xor::u8::acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_xor::u8::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_xor::u8::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_xor::u8::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_xor::u8::relaxed+0x8> (ffff8105 <asm_test::fetch_xor::u8::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a2, a13
        retw.n
5:
        l32r              a10, 50 <asm_test::fetch_xor::u8::relaxed+0x50> (ffffa1f0 <asm_test::fetch_xor::u8::relaxed+0xffffa1f0>)
        l32r              a8, fffc0054 <asm_test::fetch_xor::u8::relaxed+0xfffc0054>
        callx8            a8

.literal.asm_test::fetch_xor::u8::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_xor::u8::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_xor::u8::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_xor::u8::release+0x8> (ffff8105 <asm_test::fetch_xor::u8::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a2, a13
        retw.n
5:
        l32r              a10, fffc0054 <asm_test::fetch_xor::u8::release+0xfffc0054>
        l32r              a8, 5b (810000a1 <asm_test::fetch_xor::u8::release+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_xor::u16::acqrel:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_xor::u16::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_xor::u16::acqrel+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::fetch_xor::u16::acqrel+0x8> (ffff8105 <asm_test::fetch_xor::u16::acqrel+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a8, 1b (8147b827 <asm_test::fetch_xor::u16::acqrel+0x8147b827>)
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
        j                 4f
3:
        mov.n             a14, a13
        beqi              a15, 1, 5f
4:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 3b
        mov.n             a15, a11
        j                 3b
5:
        ssr               a8
        srl               a2, a13
        memw
        retw.n
6:
        l32r              a10, 54 <asm_test::fetch_xor::u16::acqrel+0x54> (a1f01d00 <asm_test::fetch_xor::u16::acqrel+0xa1f01d00>)
        l32r              a8, 58 <asm_test::fetch_xor::u16::acqrel+0x58> (ff81ffff <asm_test::fetch_xor::u16::acqrel+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_xor::u16::seqcst:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_xor::u16::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_xor::u16::seqcst+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::fetch_xor::u16::seqcst+0x8> (ffff8105 <asm_test::fetch_xor::u16::seqcst+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a8, 1b (8147b827 <asm_test::fetch_xor::u16::seqcst+0x8147b827>)
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
        j                 4f
3:
        mov.n             a14, a13
        beqi              a15, 1, 5f
4:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 3b
        mov.n             a15, a11
        j                 3b
5:
        ssr               a8
        srl               a2, a13
        memw
        retw.n
6:
        l32r              a10, 54 <asm_test::fetch_xor::u16::seqcst+0x54> (a1f01d00 <asm_test::fetch_xor::u16::seqcst+0xa1f01d00>)
        l32r              a8, 58 <asm_test::fetch_xor::u16::seqcst+0x58> (ff81ffff <asm_test::fetch_xor::u16::seqcst+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_xor::u16::acquire:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_xor::u16::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_xor::u16::acquire+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::fetch_xor::u16::acquire+0x8> (ffff8105 <asm_test::fetch_xor::u16::acquire+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a8, 1b (8144b827 <asm_test::fetch_xor::u16::acquire+0x8144b827>)
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
        j                 4f
3:
        mov.n             a14, a13
        beqi              a15, 1, 5f
4:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 3b
        mov.n             a15, a11
        j                 3b
5:
        ssr               a8
        srl               a2, a13
        memw
        retw.n
6:
        l32r              a10, fffc0054 <asm_test::fetch_xor::u16::acquire+0xfffc0054>
        l32r              a8, 6b (810000a1 <asm_test::fetch_xor::u16::acquire+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_xor::u16::relaxed:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_xor::u16::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_xor::u16::relaxed+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::fetch_xor::u16::relaxed+0x8> (ffff8105 <asm_test::fetch_xor::u16::relaxed+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a8, 1b (8141b827 <asm_test::fetch_xor::u16::relaxed+0x8141b827>)
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
        j                 4f
3:
        mov.n             a14, a13
        beqi              a15, 1, 5f
4:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 3b
        mov.n             a15, a11
        j                 3b
5:
        ssr               a8
        srl               a2, a13
        retw.n
6:
        l32r              a10, 50 <asm_test::fetch_xor::u16::relaxed+0x50> (ffffa1f0 <asm_test::fetch_xor::u16::relaxed+0xffffa1f0>)
        l32r              a8, fffc0054 <asm_test::fetch_xor::u16::relaxed+0xfffc0054>
        callx8            a8

.literal.asm_test::fetch_xor::u16::release:
        add               a0, a0, a0
        {                 excw; bbci.w18	a15, 27, fffffffa <asm_test::fetch_nand::bool::acqrel+0xfffffffa> }

asm_test::fetch_xor::u16::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_xor::u16::release+0x81004136>)
        bltu              a2, a8, 2f
        l32r              a8, 8 <asm_test::fetch_xor::u16::release+0x8> (ffff8105 <asm_test::fetch_xor::u16::release+0xffff8105>)
1:
        bgeu              a8, a2, 6f
2:
        l32r              a8, 1b (8144b827 <asm_test::fetch_xor::u16::release+0x8144b827>)
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
        j                 4f
3:
        mov.n             a14, a13
        beqi              a15, 1, 5f
4:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 3b
        mov.n             a15, a11
        j                 3b
5:
        ssr               a8
        srl               a2, a13
        retw.n
6:
        l32r              a10, fffc0054 <asm_test::fetch_xor::u16::release+0xfffc0054>
        l32r              a8, 6b (810000a1 <asm_test::fetch_xor::u16::release+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_xor::u32::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_xor::u32::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_xor::u32::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_xor::u32::acqrel+0x8> (ffff8105 <asm_test::fetch_xor::u32::acqrel+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        xor               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_xor::u32::acqrel+0xffa1f01d>)
        l32r              a8, 3c <asm_test::fetch_xor::u32::acqrel+0x3c> (ffff81ff <asm_test::fetch_xor::u32::acqrel+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_xor::u32::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_xor::u32::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_xor::u32::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_xor::u32::seqcst+0x8> (ffff8105 <asm_test::fetch_xor::u32::seqcst+0xffff8105>)
        bgeu              a8, a2, 6f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        xor               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_xor::u32::seqcst+0xffa1f01d>)
        l32r              a8, 3c <asm_test::fetch_xor::u32::seqcst+0x3c> (ffff81ff <asm_test::fetch_xor::u32::seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_xor::u32::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_xor::u32::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_xor::u32::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_xor::u32::acquire+0x8> (ffff8105 <asm_test::fetch_xor::u32::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        xor               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        memw
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 34 <asm_test::fetch_xor::u32::acquire+0x34> (a1f01d08 <asm_test::fetch_xor::u32::acquire+0xa1f01d08>)
        l32r              a8, 38 <asm_test::fetch_xor::u32::acquire+0x38> (ff81ffff <asm_test::fetch_xor::u32::acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_xor::u32::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_xor::u32::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_xor::u32::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_xor::u32::relaxed+0x8> (ffff8105 <asm_test::fetch_xor::u32::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        xor               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, fffc0034 <asm_test::fetch_xor::u32::relaxed+0xfffc0034>
        l32r              a8, 5b (810000a1 <asm_test::fetch_xor::u32::relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_xor::u32::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_xor::u32::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_xor::u32::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_xor::u32::release+0x8> (ffff8105 <asm_test::fetch_xor::u32::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
        memw
        l32i.n            a11, a2, 0
        movi.n            a9, 0
        movi.n            a10, 1
        j                 3f
2:
        mov.n             a11, a8
        beqi              a12, 1, 4f
3:
        xor               a8, a11, a3
        wsr.scompare1     a11
        s32c1i            a8, a2, 0
        mov.n             a12, a10
        beq               a8, a11, 2b
        mov.n             a12, a9
        j                 2b
4:
        mov.n             a2, a8
        retw.n
5:
        l32r              a10, 34 <asm_test::fetch_xor::u32::release+0x34> (a1f01d08 <asm_test::fetch_xor::u32::release+0xa1f01d08>)
        l32r              a8, 38 <asm_test::fetch_xor::u32::release+0x38> (ff81ffff <asm_test::fetch_xor::u32::release+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_xor::bool::acqrel:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_xor::bool::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_xor::bool::acqrel+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_xor::bool::acqrel+0x8> (ffff8105 <asm_test::fetch_xor::bool::acqrel+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a8, a13
        movi.n            a9, 1
        and               a2, a8, a9
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_xor::bool::acqrel+0xffa1f01d>)
        l32r              a8, 58 <asm_test::fetch_xor::bool::acqrel+0x58> (ffff81ff <asm_test::fetch_xor::bool::acqrel+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_xor::bool::seqcst:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_xor::bool::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_xor::bool::seqcst+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_xor::bool::seqcst+0x8> (ffff8105 <asm_test::fetch_xor::bool::seqcst+0xffff8105>)
        bgeu              a8, a2, 6f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a8, a13
        movi.n            a9, 1
        and               a2, a8, a9
        memw
5:
        retw.n
6:
        l32r              a10, 5b (ffa1f01d <asm_test::fetch_xor::bool::seqcst+0xffa1f01d>)
        l32r              a8, 58 <asm_test::fetch_xor::bool::seqcst+0x58> (ffff81ff <asm_test::fetch_xor::bool::seqcst+0xffff81ff>)
        callx8            a8

.literal.asm_test::fetch_xor::bool::acquire:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_xor::bool::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_xor::bool::acquire+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_xor::bool::acquire+0x8> (ffff8105 <asm_test::fetch_xor::bool::acquire+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a8, a13
        movi.n            a9, 1
        and               a2, a8, a9
        memw
        retw.n
5:
        l32r              a10, 50 <asm_test::fetch_xor::bool::acquire+0x50> (a1f01d00 <asm_test::fetch_xor::bool::acquire+0xa1f01d00>)
        l32r              a8, 54 <asm_test::fetch_xor::bool::acquire+0x54> (ff81ffff <asm_test::fetch_xor::bool::acquire+0xff81ffff>)
        callx8            a8

.literal.asm_test::fetch_xor::bool::relaxed:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_xor::bool::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_xor::bool::relaxed+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_xor::bool::relaxed+0x8> (ffff8105 <asm_test::fetch_xor::bool::relaxed+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a8, a13
        movi.n            a9, 1
        and               a2, a8, a9
        retw.n
5:
        l32r              a10, fffc0050 <asm_test::fetch_xor::bool::relaxed+0xfffc0050>
        l32r              a8, 5b (810000a1 <asm_test::fetch_xor::bool::relaxed+0x810000a1>)
        callx8            a8

.literal.asm_test::fetch_xor::bool::release:
        add               a0, a0, a0
        {                 excw; excw }
        ill

asm_test::fetch_xor::bool::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_xor::bool::release+0x81004136>)
        bltu              a2, a8, 1f
        l32r              a8, 8 <asm_test::fetch_xor::bool::release+0x8> (ffff8105 <asm_test::fetch_xor::bool::release+0xffff8105>)
        bgeu              a8, a2, 5f
1:
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
        j                 3f
2:
        mov.n             a14, a13
        beqi              a15, 1, 4f
3:
        xor               a13, a14, a9
        wsr.scompare1     a14
        s32c1i            a13, a10, 0
        mov.n             a15, a12
        beq               a13, a14, 2b
        mov.n             a15, a11
        j                 2b
4:
        ssr               a8
        srl               a8, a13
        movi.n            a9, 1
        and               a2, a8, a9
        retw.n
5:
        l32r              a10, 50 <asm_test::fetch_xor::bool::release+0x50> (a1f01d10 <asm_test::fetch_xor::bool::release+0xa1f01d10>)
        l32r              a8, 54 <asm_test::fetch_xor::bool::release+0x54> (ff81ffff <asm_test::fetch_xor::bool::release+0xff81ffff>)
        callx8            a8

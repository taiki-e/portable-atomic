asm_test::fetch_nand::u8::acqrel:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        and               a10, a8, a3
        movi.n            a11, -1
        xor               a10, a10, a11
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u8::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        and               a10, a8, a3
        movi.n            a11, -1
        xor               a10, a10, a11
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u8::acquire:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        and               a10, a8, a3
        movi.n            a11, -1
        xor               a10, a10, a11
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u8::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        and               a10, a8, a3
        movi.n            a11, -1
        xor               a10, a10, a11
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u8::release:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        and               a10, a8, a3
        movi.n            a11, -1
        xor               a10, a10, a11
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u16::acqrel:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        and               a10, a8, a3
        movi.n            a11, -1
        xor               a10, a10, a11
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u16::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        and               a10, a8, a3
        movi.n            a11, -1
        xor               a10, a10, a11
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u16::acquire:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        and               a10, a8, a3
        movi.n            a11, -1
        xor               a10, a10, a11
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u16::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        and               a10, a8, a3
        movi.n            a11, -1
        xor               a10, a10, a11
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u16::release:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        and               a10, a8, a3
        movi.n            a11, -1
        xor               a10, a10, a11
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u32::acqrel:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        and               a10, a8, a3
        movi.n            a11, -1
        xor               a10, a10, a11
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u32::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        and               a10, a8, a3
        movi.n            a11, -1
        xor               a10, a10, a11
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u32::acquire:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        and               a10, a8, a3
        movi.n            a11, -1
        xor               a10, a10, a11
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u32::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        and               a10, a8, a3
        movi.n            a11, -1
        xor               a10, a10, a11
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u32::release:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        and               a10, a8, a3
        movi.n            a11, -1
        xor               a10, a10, a11
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::bool::acqrel:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a10, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        beqz              a3, 0f
        movi.n            a11, 1
        xor               a11, a9, a11
        s8i               a11, a8, 0
        wsr.ps            a10
        rsync
        movi              a8, 255
        and               a9, a9, a8
        movi.n            a8, 0
        beq               a9, a8, 1f
        j                 2f
0:
        s8i               a2, a8, 0
        wsr.ps            a10
        rsync
        movi              a8, 255
        and               a9, a9, a8
        movi.n            a8, 0
        bne               a9, a8, 2f
1:
        mov.n             a2, a8
2:
        retw.n

asm_test::fetch_nand::bool::seqcst:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a10, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        beqz              a3, 0f
        movi.n            a11, 1
        xor               a11, a9, a11
        s8i               a11, a8, 0
        wsr.ps            a10
        rsync
        movi              a8, 255
        and               a9, a9, a8
        movi.n            a8, 0
        beq               a9, a8, 1f
        j                 2f
0:
        s8i               a2, a8, 0
        wsr.ps            a10
        rsync
        movi              a8, 255
        and               a9, a9, a8
        movi.n            a8, 0
        bne               a9, a8, 2f
1:
        mov.n             a2, a8
2:
        retw.n

asm_test::fetch_nand::bool::acquire:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a10, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        beqz              a3, 0f
        movi.n            a11, 1
        xor               a11, a9, a11
        s8i               a11, a8, 0
        wsr.ps            a10
        rsync
        movi              a8, 255
        and               a9, a9, a8
        movi.n            a8, 0
        beq               a9, a8, 1f
        j                 2f
0:
        s8i               a2, a8, 0
        wsr.ps            a10
        rsync
        movi              a8, 255
        and               a9, a9, a8
        movi.n            a8, 0
        bne               a9, a8, 2f
1:
        mov.n             a2, a8
2:
        retw.n

asm_test::fetch_nand::bool::relaxed:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a10, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        beqz              a3, 0f
        movi.n            a11, 1
        xor               a11, a9, a11
        s8i               a11, a8, 0
        wsr.ps            a10
        rsync
        movi              a8, 255
        and               a9, a9, a8
        movi.n            a8, 0
        beq               a9, a8, 1f
        j                 2f
0:
        s8i               a2, a8, 0
        wsr.ps            a10
        rsync
        movi              a8, 255
        and               a9, a9, a8
        movi.n            a8, 0
        bne               a9, a8, 2f
1:
        mov.n             a2, a8
2:
        retw.n

asm_test::fetch_nand::bool::release:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a10, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        beqz              a3, 0f
        movi.n            a11, 1
        xor               a11, a9, a11
        s8i               a11, a8, 0
        wsr.ps            a10
        rsync
        movi              a8, 255
        and               a9, a9, a8
        movi.n            a8, 0
        beq               a9, a8, 1f
        j                 2f
0:
        s8i               a2, a8, 0
        wsr.ps            a10
        rsync
        movi              a8, 255
        and               a9, a9, a8
        movi.n            a8, 0
        bne               a9, a8, 2f
1:
        mov.n             a2, a8
2:
        retw.n

asm_test::fetch_umax::u8::acqrel:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        rsil              a10, 15
        l8ui              a8, a2, 0
        maxu              a9, a9, a8
        s8i               a9, a2, 0
        wsr.ps            a10
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umax::u8::seqcst:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        rsil              a10, 15
        l8ui              a8, a2, 0
        maxu              a9, a9, a8
        s8i               a9, a2, 0
        wsr.ps            a10
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umax::u8::acquire:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        rsil              a10, 15
        l8ui              a8, a2, 0
        maxu              a9, a9, a8
        s8i               a9, a2, 0
        wsr.ps            a10
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umax::u8::relaxed:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        rsil              a10, 15
        l8ui              a8, a2, 0
        maxu              a9, a9, a8
        s8i               a9, a2, 0
        wsr.ps            a10
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umax::u8::release:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        rsil              a10, 15
        l8ui              a8, a2, 0
        maxu              a9, a9, a8
        s8i               a9, a2, 0
        wsr.ps            a10
        rsync
        mov.n             a2, a8
        retw.n

.literal.asm_test::fetch_umax::u16::acqrel:
        .byte             0xff
        .byte             0xff

asm_test::fetch_umax::u16::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umax::u16::acqrel+0x81004136>)
        and               a9, a3, a8
        rsil              a10, 15
        l16ui             a8, a2, 0
        maxu              a9, a9, a8
        s16i              a9, a2, 0
        wsr.ps            a10
        rsync
        mov.n             a2, a8
        retw.n

.literal.asm_test::fetch_umax::u16::seqcst:
        .byte             0xff
        .byte             0xff

asm_test::fetch_umax::u16::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umax::u16::seqcst+0x81004136>)
        and               a9, a3, a8
        rsil              a10, 15
        l16ui             a8, a2, 0
        maxu              a9, a9, a8
        s16i              a9, a2, 0
        wsr.ps            a10
        rsync
        mov.n             a2, a8
        retw.n

.literal.asm_test::fetch_umax::u16::acquire:
        .byte             0xff
        .byte             0xff

asm_test::fetch_umax::u16::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umax::u16::acquire+0x81004136>)
        and               a9, a3, a8
        rsil              a10, 15
        l16ui             a8, a2, 0
        maxu              a9, a9, a8
        s16i              a9, a2, 0
        wsr.ps            a10
        rsync
        mov.n             a2, a8
        retw.n

.literal.asm_test::fetch_umax::u16::relaxed:
        .byte             0xff
        .byte             0xff

asm_test::fetch_umax::u16::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umax::u16::relaxed+0x81004136>)
        and               a9, a3, a8
        rsil              a10, 15
        l16ui             a8, a2, 0
        maxu              a9, a9, a8
        s16i              a9, a2, 0
        wsr.ps            a10
        rsync
        mov.n             a2, a8
        retw.n

.literal.asm_test::fetch_umax::u16::release:
        .byte             0xff
        .byte             0xff

asm_test::fetch_umax::u16::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umax::u16::release+0x81004136>)
        and               a9, a3, a8
        rsil              a10, 15
        l16ui             a8, a2, 0
        maxu              a9, a9, a8
        s16i              a9, a2, 0
        wsr.ps            a10
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umax::u32::acqrel:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        maxu              a10, a3, a8
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umax::u32::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        maxu              a10, a3, a8
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umax::u32::acquire:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        maxu              a10, a3, a8
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umax::u32::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        maxu              a10, a3, a8
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umax::u32::release:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        maxu              a10, a3, a8
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umin::u8::acqrel:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        rsil              a10, 15
        l8ui              a8, a2, 0
        minu              a9, a9, a8
        s8i               a9, a2, 0
        wsr.ps            a10
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umin::u8::seqcst:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        rsil              a10, 15
        l8ui              a8, a2, 0
        minu              a9, a9, a8
        s8i               a9, a2, 0
        wsr.ps            a10
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umin::u8::acquire:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        rsil              a10, 15
        l8ui              a8, a2, 0
        minu              a9, a9, a8
        s8i               a9, a2, 0
        wsr.ps            a10
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umin::u8::relaxed:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        rsil              a10, 15
        l8ui              a8, a2, 0
        minu              a9, a9, a8
        s8i               a9, a2, 0
        wsr.ps            a10
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umin::u8::release:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        rsil              a10, 15
        l8ui              a8, a2, 0
        minu              a9, a9, a8
        s8i               a9, a2, 0
        wsr.ps            a10
        rsync
        mov.n             a2, a8
        retw.n

.literal.asm_test::fetch_umin::u16::acqrel:
        .byte             0xff
        .byte             0xff

asm_test::fetch_umin::u16::acqrel:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umin::u16::acqrel+0x81004136>)
        and               a9, a3, a8
        rsil              a10, 15
        l16ui             a8, a2, 0
        minu              a9, a9, a8
        s16i              a9, a2, 0
        wsr.ps            a10
        rsync
        mov.n             a2, a8
        retw.n

.literal.asm_test::fetch_umin::u16::seqcst:
        .byte             0xff
        .byte             0xff

asm_test::fetch_umin::u16::seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umin::u16::seqcst+0x81004136>)
        and               a9, a3, a8
        rsil              a10, 15
        l16ui             a8, a2, 0
        minu              a9, a9, a8
        s16i              a9, a2, 0
        wsr.ps            a10
        rsync
        mov.n             a2, a8
        retw.n

.literal.asm_test::fetch_umin::u16::acquire:
        .byte             0xff
        .byte             0xff

asm_test::fetch_umin::u16::acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umin::u16::acquire+0x81004136>)
        and               a9, a3, a8
        rsil              a10, 15
        l16ui             a8, a2, 0
        minu              a9, a9, a8
        s16i              a9, a2, 0
        wsr.ps            a10
        rsync
        mov.n             a2, a8
        retw.n

.literal.asm_test::fetch_umin::u16::relaxed:
        .byte             0xff
        .byte             0xff

asm_test::fetch_umin::u16::relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umin::u16::relaxed+0x81004136>)
        and               a9, a3, a8
        rsil              a10, 15
        l16ui             a8, a2, 0
        minu              a9, a9, a8
        s16i              a9, a2, 0
        wsr.ps            a10
        rsync
        mov.n             a2, a8
        retw.n

.literal.asm_test::fetch_umin::u16::release:
        .byte             0xff
        .byte             0xff

asm_test::fetch_umin::u16::release:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::fetch_umin::u16::release+0x81004136>)
        and               a9, a3, a8
        rsil              a10, 15
        l16ui             a8, a2, 0
        minu              a9, a9, a8
        s16i              a9, a2, 0
        wsr.ps            a10
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umin::u32::acqrel:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        minu              a10, a3, a8
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umin::u32::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        minu              a10, a3, a8
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umin::u32::acquire:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        minu              a10, a3, a8
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umin::u32::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        minu              a10, a3, a8
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umin::u32::release:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        minu              a10, a3, a8
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::compare_exchange::u8::acqrel_seqcst:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        rsil              a9, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a9
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange::u8::seqcst_seqcst:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        rsil              a9, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a9
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange::u8::acqrel_acquire:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        rsil              a9, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a9
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange::u8::acqrel_relaxed:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        rsil              a9, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a9
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange::u8::acquire_seqcst:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        rsil              a9, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a9
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange::u8::relaxed_seqcst:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        rsil              a9, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a9
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange::u8::release_seqcst:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        rsil              a9, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a9
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange::u8::seqcst_acquire:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        rsil              a9, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a9
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange::u8::seqcst_relaxed:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        rsil              a9, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a9
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange::u8::acquire_acquire:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        rsil              a9, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a9
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange::u8::acquire_relaxed:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        rsil              a9, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a9
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange::u8::relaxed_acquire:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        rsil              a9, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a9
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange::u8::relaxed_relaxed:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        rsil              a9, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a9
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange::u8::release_acquire:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        rsil              a9, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a9
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange::u8::release_relaxed:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        rsil              a9, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a9
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

.literal.asm_test::compare_exchange::u16::acqrel_seqcst:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::acqrel_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::acqrel_seqcst+0x81004136>)
        and               a9, a3, a8
        rsil              a8, 15
        l16ui             a3, a2, 0
        bne               a3, a9, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a8
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a8
        rsync
        retw.n

.literal.asm_test::compare_exchange::u16::seqcst_seqcst:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::seqcst_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::seqcst_seqcst+0x81004136>)
        and               a9, a3, a8
        rsil              a8, 15
        l16ui             a3, a2, 0
        bne               a3, a9, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a8
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a8
        rsync
        retw.n

.literal.asm_test::compare_exchange::u16::acqrel_acquire:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::acqrel_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::acqrel_acquire+0x81004136>)
        and               a9, a3, a8
        rsil              a8, 15
        l16ui             a3, a2, 0
        bne               a3, a9, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a8
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a8
        rsync
        retw.n

.literal.asm_test::compare_exchange::u16::acqrel_relaxed:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::acqrel_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::acqrel_relaxed+0x81004136>)
        and               a9, a3, a8
        rsil              a8, 15
        l16ui             a3, a2, 0
        bne               a3, a9, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a8
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a8
        rsync
        retw.n

.literal.asm_test::compare_exchange::u16::acquire_seqcst:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::acquire_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::acquire_seqcst+0x81004136>)
        and               a9, a3, a8
        rsil              a8, 15
        l16ui             a3, a2, 0
        bne               a3, a9, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a8
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a8
        rsync
        retw.n

.literal.asm_test::compare_exchange::u16::relaxed_seqcst:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::relaxed_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::relaxed_seqcst+0x81004136>)
        and               a9, a3, a8
        rsil              a8, 15
        l16ui             a3, a2, 0
        bne               a3, a9, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a8
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a8
        rsync
        retw.n

.literal.asm_test::compare_exchange::u16::release_seqcst:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::release_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::release_seqcst+0x81004136>)
        and               a9, a3, a8
        rsil              a8, 15
        l16ui             a3, a2, 0
        bne               a3, a9, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a8
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a8
        rsync
        retw.n

.literal.asm_test::compare_exchange::u16::seqcst_acquire:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::seqcst_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::seqcst_acquire+0x81004136>)
        and               a9, a3, a8
        rsil              a8, 15
        l16ui             a3, a2, 0
        bne               a3, a9, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a8
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a8
        rsync
        retw.n

.literal.asm_test::compare_exchange::u16::seqcst_relaxed:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::seqcst_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::seqcst_relaxed+0x81004136>)
        and               a9, a3, a8
        rsil              a8, 15
        l16ui             a3, a2, 0
        bne               a3, a9, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a8
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a8
        rsync
        retw.n

.literal.asm_test::compare_exchange::u16::acquire_acquire:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::acquire_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::acquire_acquire+0x81004136>)
        and               a9, a3, a8
        rsil              a8, 15
        l16ui             a3, a2, 0
        bne               a3, a9, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a8
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a8
        rsync
        retw.n

.literal.asm_test::compare_exchange::u16::acquire_relaxed:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::acquire_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::acquire_relaxed+0x81004136>)
        and               a9, a3, a8
        rsil              a8, 15
        l16ui             a3, a2, 0
        bne               a3, a9, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a8
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a8
        rsync
        retw.n

.literal.asm_test::compare_exchange::u16::relaxed_acquire:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::relaxed_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::relaxed_acquire+0x81004136>)
        and               a9, a3, a8
        rsil              a8, 15
        l16ui             a3, a2, 0
        bne               a3, a9, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a8
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a8
        rsync
        retw.n

.literal.asm_test::compare_exchange::u16::relaxed_relaxed:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::relaxed_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::relaxed_relaxed+0x81004136>)
        and               a9, a3, a8
        rsil              a8, 15
        l16ui             a3, a2, 0
        bne               a3, a9, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a8
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a8
        rsync
        retw.n

.literal.asm_test::compare_exchange::u16::release_acquire:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::release_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::release_acquire+0x81004136>)
        and               a9, a3, a8
        rsil              a8, 15
        l16ui             a3, a2, 0
        bne               a3, a9, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a8
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a8
        rsync
        retw.n

.literal.asm_test::compare_exchange::u16::release_relaxed:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::release_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::release_relaxed+0x81004136>)
        and               a9, a3, a8
        rsil              a8, 15
        l16ui             a3, a2, 0
        bne               a3, a9, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a8
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a8
        rsync
        retw.n

asm_test::compare_exchange::u32::acqrel_seqcst:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a9, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a9
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a9
        rsync
        retw.n

asm_test::compare_exchange::u32::seqcst_seqcst:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a9, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a9
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a9
        rsync
        retw.n

asm_test::compare_exchange::u32::acqrel_acquire:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a9, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a9
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a9
        rsync
        retw.n

asm_test::compare_exchange::u32::acqrel_relaxed:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a9, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a9
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a9
        rsync
        retw.n

asm_test::compare_exchange::u32::acquire_seqcst:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a9, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a9
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a9
        rsync
        retw.n

asm_test::compare_exchange::u32::relaxed_seqcst:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a9, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a9
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a9
        rsync
        retw.n

asm_test::compare_exchange::u32::release_seqcst:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a9, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a9
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a9
        rsync
        retw.n

asm_test::compare_exchange::u32::seqcst_acquire:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a9, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a9
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a9
        rsync
        retw.n

asm_test::compare_exchange::u32::seqcst_relaxed:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a9, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a9
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a9
        rsync
        retw.n

asm_test::compare_exchange::u32::acquire_acquire:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a9, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a9
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a9
        rsync
        retw.n

asm_test::compare_exchange::u32::acquire_relaxed:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a9, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a9
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a9
        rsync
        retw.n

asm_test::compare_exchange::u32::relaxed_acquire:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a9, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a9
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a9
        rsync
        retw.n

asm_test::compare_exchange::u32::relaxed_relaxed:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a9, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a9
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a9
        rsync
        retw.n

asm_test::compare_exchange::u32::release_acquire:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a9, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a9
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a9
        rsync
        retw.n

asm_test::compare_exchange::u32::release_relaxed:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a9, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a9
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a9
        rsync
        retw.n

asm_test::compare_exchange::bool::acqrel_seqcst:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a8
        rsync
        movi.n            a10, 0
        movi.n            a8, 1
        mov.n             a2, a8
        beq               a9, a3, 2f
        beq               a9, a10, 3f
1:
        mov.n             a3, a8
        retw.n
2:
        mov.n             a2, a10
        bne               a9, a10, 1b
3:
        mov.n             a8, a10
        mov.n             a3, a8
        retw.n

asm_test::compare_exchange::bool::seqcst_seqcst:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a8
        rsync
        movi.n            a10, 0
        movi.n            a8, 1
        mov.n             a2, a8
        beq               a9, a3, 2f
        beq               a9, a10, 3f
1:
        mov.n             a3, a8
        retw.n
2:
        mov.n             a2, a10
        bne               a9, a10, 1b
3:
        mov.n             a8, a10
        mov.n             a3, a8
        retw.n

asm_test::compare_exchange::bool::acqrel_acquire:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a8
        rsync
        movi.n            a10, 0
        movi.n            a8, 1
        mov.n             a2, a8
        beq               a9, a3, 2f
        beq               a9, a10, 3f
1:
        mov.n             a3, a8
        retw.n
2:
        mov.n             a2, a10
        bne               a9, a10, 1b
3:
        mov.n             a8, a10
        mov.n             a3, a8
        retw.n

asm_test::compare_exchange::bool::acqrel_relaxed:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a8
        rsync
        movi.n            a10, 0
        movi.n            a8, 1
        mov.n             a2, a8
        beq               a9, a3, 2f
        beq               a9, a10, 3f
1:
        mov.n             a3, a8
        retw.n
2:
        mov.n             a2, a10
        bne               a9, a10, 1b
3:
        mov.n             a8, a10
        mov.n             a3, a8
        retw.n

asm_test::compare_exchange::bool::acquire_seqcst:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a8
        rsync
        movi.n            a10, 0
        movi.n            a8, 1
        mov.n             a2, a8
        beq               a9, a3, 2f
        beq               a9, a10, 3f
1:
        mov.n             a3, a8
        retw.n
2:
        mov.n             a2, a10
        bne               a9, a10, 1b
3:
        mov.n             a8, a10
        mov.n             a3, a8
        retw.n

asm_test::compare_exchange::bool::relaxed_seqcst:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a8
        rsync
        movi.n            a10, 0
        movi.n            a8, 1
        mov.n             a2, a8
        beq               a9, a3, 2f
        beq               a9, a10, 3f
1:
        mov.n             a3, a8
        retw.n
2:
        mov.n             a2, a10
        bne               a9, a10, 1b
3:
        mov.n             a8, a10
        mov.n             a3, a8
        retw.n

asm_test::compare_exchange::bool::release_seqcst:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a8
        rsync
        movi.n            a10, 0
        movi.n            a8, 1
        mov.n             a2, a8
        beq               a9, a3, 2f
        beq               a9, a10, 3f
1:
        mov.n             a3, a8
        retw.n
2:
        mov.n             a2, a10
        bne               a9, a10, 1b
3:
        mov.n             a8, a10
        mov.n             a3, a8
        retw.n

asm_test::compare_exchange::bool::seqcst_acquire:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a8
        rsync
        movi.n            a10, 0
        movi.n            a8, 1
        mov.n             a2, a8
        beq               a9, a3, 2f
        beq               a9, a10, 3f
1:
        mov.n             a3, a8
        retw.n
2:
        mov.n             a2, a10
        bne               a9, a10, 1b
3:
        mov.n             a8, a10
        mov.n             a3, a8
        retw.n

asm_test::compare_exchange::bool::seqcst_relaxed:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a8
        rsync
        movi.n            a10, 0
        movi.n            a8, 1
        mov.n             a2, a8
        beq               a9, a3, 2f
        beq               a9, a10, 3f
1:
        mov.n             a3, a8
        retw.n
2:
        mov.n             a2, a10
        bne               a9, a10, 1b
3:
        mov.n             a8, a10
        mov.n             a3, a8
        retw.n

asm_test::compare_exchange::bool::acquire_acquire:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a8
        rsync
        movi.n            a10, 0
        movi.n            a8, 1
        mov.n             a2, a8
        beq               a9, a3, 2f
        beq               a9, a10, 3f
1:
        mov.n             a3, a8
        retw.n
2:
        mov.n             a2, a10
        bne               a9, a10, 1b
3:
        mov.n             a8, a10
        mov.n             a3, a8
        retw.n

asm_test::compare_exchange::bool::acquire_relaxed:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a8
        rsync
        movi.n            a10, 0
        movi.n            a8, 1
        mov.n             a2, a8
        beq               a9, a3, 2f
        beq               a9, a10, 3f
1:
        mov.n             a3, a8
        retw.n
2:
        mov.n             a2, a10
        bne               a9, a10, 1b
3:
        mov.n             a8, a10
        mov.n             a3, a8
        retw.n

asm_test::compare_exchange::bool::relaxed_acquire:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a8
        rsync
        movi.n            a10, 0
        movi.n            a8, 1
        mov.n             a2, a8
        beq               a9, a3, 2f
        beq               a9, a10, 3f
1:
        mov.n             a3, a8
        retw.n
2:
        mov.n             a2, a10
        bne               a9, a10, 1b
3:
        mov.n             a8, a10
        mov.n             a3, a8
        retw.n

asm_test::compare_exchange::bool::relaxed_relaxed:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a8
        rsync
        movi.n            a10, 0
        movi.n            a8, 1
        mov.n             a2, a8
        beq               a9, a3, 2f
        beq               a9, a10, 3f
1:
        mov.n             a3, a8
        retw.n
2:
        mov.n             a2, a10
        bne               a9, a10, 1b
3:
        mov.n             a8, a10
        mov.n             a3, a8
        retw.n

asm_test::compare_exchange::bool::release_acquire:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a8
        rsync
        movi.n            a10, 0
        movi.n            a8, 1
        mov.n             a2, a8
        beq               a9, a3, 2f
        beq               a9, a10, 3f
1:
        mov.n             a3, a8
        retw.n
2:
        mov.n             a2, a10
        bne               a9, a10, 1b
3:
        mov.n             a8, a10
        mov.n             a3, a8
        retw.n

asm_test::compare_exchange::bool::release_relaxed:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a8
        rsync
        movi.n            a10, 0
        movi.n            a8, 1
        mov.n             a2, a8
        beq               a9, a3, 2f
        beq               a9, a10, 3f
1:
        mov.n             a3, a8
        retw.n
2:
        mov.n             a2, a10
        bne               a9, a10, 1b
3:
        mov.n             a8, a10
        mov.n             a3, a8
        retw.n

asm_test::compare_exchange_weak::u8::acqrel_seqcst:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        rsil              a9, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a9
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange_weak::u8::seqcst_seqcst:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        rsil              a9, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a9
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange_weak::u8::acqrel_acquire:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        rsil              a9, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a9
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange_weak::u8::acqrel_relaxed:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        rsil              a9, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a9
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange_weak::u8::acquire_seqcst:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        rsil              a9, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a9
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange_weak::u8::relaxed_seqcst:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        rsil              a9, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a9
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange_weak::u8::release_seqcst:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        rsil              a9, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a9
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange_weak::u8::seqcst_acquire:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        rsil              a9, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a9
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange_weak::u8::seqcst_relaxed:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        rsil              a9, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a9
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange_weak::u8::acquire_acquire:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        rsil              a9, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a9
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange_weak::u8::acquire_relaxed:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        rsil              a9, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a9
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange_weak::u8::relaxed_acquire:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        rsil              a9, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a9
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange_weak::u8::relaxed_relaxed:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        rsil              a9, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a9
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange_weak::u8::release_acquire:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        rsil              a9, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a9
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange_weak::u8::release_relaxed:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        rsil              a9, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a9
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

.literal.asm_test::compare_exchange_weak::u16::acqrel_seqcst:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::acqrel_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::acqrel_seqcst+0x81004136>)
        and               a9, a3, a8
        rsil              a8, 15
        l16ui             a3, a2, 0
        bne               a3, a9, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a8
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a8
        rsync
        retw.n

.literal.asm_test::compare_exchange_weak::u16::seqcst_seqcst:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::seqcst_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::seqcst_seqcst+0x81004136>)
        and               a9, a3, a8
        rsil              a8, 15
        l16ui             a3, a2, 0
        bne               a3, a9, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a8
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a8
        rsync
        retw.n

.literal.asm_test::compare_exchange_weak::u16::acqrel_acquire:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::acqrel_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::acqrel_acquire+0x81004136>)
        and               a9, a3, a8
        rsil              a8, 15
        l16ui             a3, a2, 0
        bne               a3, a9, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a8
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a8
        rsync
        retw.n

.literal.asm_test::compare_exchange_weak::u16::acqrel_relaxed:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::acqrel_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::acqrel_relaxed+0x81004136>)
        and               a9, a3, a8
        rsil              a8, 15
        l16ui             a3, a2, 0
        bne               a3, a9, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a8
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a8
        rsync
        retw.n

.literal.asm_test::compare_exchange_weak::u16::acquire_seqcst:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::acquire_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::acquire_seqcst+0x81004136>)
        and               a9, a3, a8
        rsil              a8, 15
        l16ui             a3, a2, 0
        bne               a3, a9, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a8
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a8
        rsync
        retw.n

.literal.asm_test::compare_exchange_weak::u16::relaxed_seqcst:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::relaxed_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::relaxed_seqcst+0x81004136>)
        and               a9, a3, a8
        rsil              a8, 15
        l16ui             a3, a2, 0
        bne               a3, a9, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a8
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a8
        rsync
        retw.n

.literal.asm_test::compare_exchange_weak::u16::release_seqcst:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::release_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::release_seqcst+0x81004136>)
        and               a9, a3, a8
        rsil              a8, 15
        l16ui             a3, a2, 0
        bne               a3, a9, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a8
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a8
        rsync
        retw.n

.literal.asm_test::compare_exchange_weak::u16::seqcst_acquire:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::seqcst_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::seqcst_acquire+0x81004136>)
        and               a9, a3, a8
        rsil              a8, 15
        l16ui             a3, a2, 0
        bne               a3, a9, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a8
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a8
        rsync
        retw.n

.literal.asm_test::compare_exchange_weak::u16::seqcst_relaxed:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::seqcst_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::seqcst_relaxed+0x81004136>)
        and               a9, a3, a8
        rsil              a8, 15
        l16ui             a3, a2, 0
        bne               a3, a9, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a8
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a8
        rsync
        retw.n

.literal.asm_test::compare_exchange_weak::u16::acquire_acquire:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::acquire_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::acquire_acquire+0x81004136>)
        and               a9, a3, a8
        rsil              a8, 15
        l16ui             a3, a2, 0
        bne               a3, a9, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a8
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a8
        rsync
        retw.n

.literal.asm_test::compare_exchange_weak::u16::acquire_relaxed:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::acquire_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::acquire_relaxed+0x81004136>)
        and               a9, a3, a8
        rsil              a8, 15
        l16ui             a3, a2, 0
        bne               a3, a9, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a8
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a8
        rsync
        retw.n

.literal.asm_test::compare_exchange_weak::u16::relaxed_acquire:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::relaxed_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::relaxed_acquire+0x81004136>)
        and               a9, a3, a8
        rsil              a8, 15
        l16ui             a3, a2, 0
        bne               a3, a9, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a8
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a8
        rsync
        retw.n

.literal.asm_test::compare_exchange_weak::u16::relaxed_relaxed:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::relaxed_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::relaxed_relaxed+0x81004136>)
        and               a9, a3, a8
        rsil              a8, 15
        l16ui             a3, a2, 0
        bne               a3, a9, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a8
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a8
        rsync
        retw.n

.literal.asm_test::compare_exchange_weak::u16::release_acquire:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::release_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::release_acquire+0x81004136>)
        and               a9, a3, a8
        rsil              a8, 15
        l16ui             a3, a2, 0
        bne               a3, a9, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a8
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a8
        rsync
        retw.n

.literal.asm_test::compare_exchange_weak::u16::release_relaxed:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::release_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::release_relaxed+0x81004136>)
        and               a9, a3, a8
        rsil              a8, 15
        l16ui             a3, a2, 0
        bne               a3, a9, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a8
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a8
        rsync
        retw.n

asm_test::compare_exchange_weak::u32::acqrel_seqcst:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a9, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a9
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a9
        rsync
        retw.n

asm_test::compare_exchange_weak::u32::seqcst_seqcst:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a9, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a9
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a9
        rsync
        retw.n

asm_test::compare_exchange_weak::u32::acqrel_acquire:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a9, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a9
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a9
        rsync
        retw.n

asm_test::compare_exchange_weak::u32::acqrel_relaxed:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a9, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a9
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a9
        rsync
        retw.n

asm_test::compare_exchange_weak::u32::acquire_seqcst:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a9, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a9
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a9
        rsync
        retw.n

asm_test::compare_exchange_weak::u32::relaxed_seqcst:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a9, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a9
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a9
        rsync
        retw.n

asm_test::compare_exchange_weak::u32::release_seqcst:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a9, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a9
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a9
        rsync
        retw.n

asm_test::compare_exchange_weak::u32::seqcst_acquire:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a9, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a9
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a9
        rsync
        retw.n

asm_test::compare_exchange_weak::u32::seqcst_relaxed:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a9, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a9
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a9
        rsync
        retw.n

asm_test::compare_exchange_weak::u32::acquire_acquire:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a9, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a9
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a9
        rsync
        retw.n

asm_test::compare_exchange_weak::u32::acquire_relaxed:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a9, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a9
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a9
        rsync
        retw.n

asm_test::compare_exchange_weak::u32::relaxed_acquire:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a9, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a9
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a9
        rsync
        retw.n

asm_test::compare_exchange_weak::u32::relaxed_relaxed:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a9, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a9
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a9
        rsync
        retw.n

asm_test::compare_exchange_weak::u32::release_acquire:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a9, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a9
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a9
        rsync
        retw.n

asm_test::compare_exchange_weak::u32::release_relaxed:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a9, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a9
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a9
        rsync
        retw.n

asm_test::compare_exchange_weak::bool::acqrel_seqcst:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a8
        rsync
        movi.n            a10, 0
        movi.n            a8, 1
        mov.n             a2, a8
        beq               a9, a3, 2f
        beq               a9, a10, 3f
1:
        mov.n             a3, a8
        retw.n
2:
        mov.n             a2, a10
        bne               a9, a10, 1b
3:
        mov.n             a8, a10
        mov.n             a3, a8
        retw.n

asm_test::compare_exchange_weak::bool::seqcst_seqcst:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a8
        rsync
        movi.n            a10, 0
        movi.n            a8, 1
        mov.n             a2, a8
        beq               a9, a3, 2f
        beq               a9, a10, 3f
1:
        mov.n             a3, a8
        retw.n
2:
        mov.n             a2, a10
        bne               a9, a10, 1b
3:
        mov.n             a8, a10
        mov.n             a3, a8
        retw.n

asm_test::compare_exchange_weak::bool::acqrel_acquire:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a8
        rsync
        movi.n            a10, 0
        movi.n            a8, 1
        mov.n             a2, a8
        beq               a9, a3, 2f
        beq               a9, a10, 3f
1:
        mov.n             a3, a8
        retw.n
2:
        mov.n             a2, a10
        bne               a9, a10, 1b
3:
        mov.n             a8, a10
        mov.n             a3, a8
        retw.n

asm_test::compare_exchange_weak::bool::acqrel_relaxed:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a8
        rsync
        movi.n            a10, 0
        movi.n            a8, 1
        mov.n             a2, a8
        beq               a9, a3, 2f
        beq               a9, a10, 3f
1:
        mov.n             a3, a8
        retw.n
2:
        mov.n             a2, a10
        bne               a9, a10, 1b
3:
        mov.n             a8, a10
        mov.n             a3, a8
        retw.n

asm_test::compare_exchange_weak::bool::acquire_seqcst:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a8
        rsync
        movi.n            a10, 0
        movi.n            a8, 1
        mov.n             a2, a8
        beq               a9, a3, 2f
        beq               a9, a10, 3f
1:
        mov.n             a3, a8
        retw.n
2:
        mov.n             a2, a10
        bne               a9, a10, 1b
3:
        mov.n             a8, a10
        mov.n             a3, a8
        retw.n

asm_test::compare_exchange_weak::bool::relaxed_seqcst:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a8
        rsync
        movi.n            a10, 0
        movi.n            a8, 1
        mov.n             a2, a8
        beq               a9, a3, 2f
        beq               a9, a10, 3f
1:
        mov.n             a3, a8
        retw.n
2:
        mov.n             a2, a10
        bne               a9, a10, 1b
3:
        mov.n             a8, a10
        mov.n             a3, a8
        retw.n

asm_test::compare_exchange_weak::bool::release_seqcst:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a8
        rsync
        movi.n            a10, 0
        movi.n            a8, 1
        mov.n             a2, a8
        beq               a9, a3, 2f
        beq               a9, a10, 3f
1:
        mov.n             a3, a8
        retw.n
2:
        mov.n             a2, a10
        bne               a9, a10, 1b
3:
        mov.n             a8, a10
        mov.n             a3, a8
        retw.n

asm_test::compare_exchange_weak::bool::seqcst_acquire:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a8
        rsync
        movi.n            a10, 0
        movi.n            a8, 1
        mov.n             a2, a8
        beq               a9, a3, 2f
        beq               a9, a10, 3f
1:
        mov.n             a3, a8
        retw.n
2:
        mov.n             a2, a10
        bne               a9, a10, 1b
3:
        mov.n             a8, a10
        mov.n             a3, a8
        retw.n

asm_test::compare_exchange_weak::bool::seqcst_relaxed:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a8
        rsync
        movi.n            a10, 0
        movi.n            a8, 1
        mov.n             a2, a8
        beq               a9, a3, 2f
        beq               a9, a10, 3f
1:
        mov.n             a3, a8
        retw.n
2:
        mov.n             a2, a10
        bne               a9, a10, 1b
3:
        mov.n             a8, a10
        mov.n             a3, a8
        retw.n

asm_test::compare_exchange_weak::bool::acquire_acquire:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a8
        rsync
        movi.n            a10, 0
        movi.n            a8, 1
        mov.n             a2, a8
        beq               a9, a3, 2f
        beq               a9, a10, 3f
1:
        mov.n             a3, a8
        retw.n
2:
        mov.n             a2, a10
        bne               a9, a10, 1b
3:
        mov.n             a8, a10
        mov.n             a3, a8
        retw.n

asm_test::compare_exchange_weak::bool::acquire_relaxed:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a8
        rsync
        movi.n            a10, 0
        movi.n            a8, 1
        mov.n             a2, a8
        beq               a9, a3, 2f
        beq               a9, a10, 3f
1:
        mov.n             a3, a8
        retw.n
2:
        mov.n             a2, a10
        bne               a9, a10, 1b
3:
        mov.n             a8, a10
        mov.n             a3, a8
        retw.n

asm_test::compare_exchange_weak::bool::relaxed_acquire:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a8
        rsync
        movi.n            a10, 0
        movi.n            a8, 1
        mov.n             a2, a8
        beq               a9, a3, 2f
        beq               a9, a10, 3f
1:
        mov.n             a3, a8
        retw.n
2:
        mov.n             a2, a10
        bne               a9, a10, 1b
3:
        mov.n             a8, a10
        mov.n             a3, a8
        retw.n

asm_test::compare_exchange_weak::bool::relaxed_relaxed:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a8
        rsync
        movi.n            a10, 0
        movi.n            a8, 1
        mov.n             a2, a8
        beq               a9, a3, 2f
        beq               a9, a10, 3f
1:
        mov.n             a3, a8
        retw.n
2:
        mov.n             a2, a10
        bne               a9, a10, 1b
3:
        mov.n             a8, a10
        mov.n             a3, a8
        retw.n

asm_test::compare_exchange_weak::bool::release_acquire:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a8
        rsync
        movi.n            a10, 0
        movi.n            a8, 1
        mov.n             a2, a8
        beq               a9, a3, 2f
        beq               a9, a10, 3f
1:
        mov.n             a3, a8
        retw.n
2:
        mov.n             a2, a10
        bne               a9, a10, 1b
3:
        mov.n             a8, a10
        mov.n             a3, a8
        retw.n

asm_test::compare_exchange_weak::bool::release_relaxed:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a8
        rsync
        movi.n            a10, 0
        movi.n            a8, 1
        mov.n             a2, a8
        beq               a9, a3, 2f
        beq               a9, a10, 3f
1:
        mov.n             a3, a8
        retw.n
2:
        mov.n             a2, a10
        bne               a9, a10, 1b
3:
        mov.n             a8, a10
        mov.n             a3, a8
        retw.n

asm_test::or::u8::acqrel:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        or                a9, a9, a3
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::or::u8::seqcst:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        or                a9, a9, a3
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::or::u8::acquire:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        or                a9, a9, a3
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::or::u8::relaxed:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        or                a9, a9, a3
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::or::u8::release:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        or                a9, a9, a3
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::or::u16::acqrel:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        or                a9, a9, a3
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::or::u16::seqcst:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        or                a9, a9, a3
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::or::u16::acquire:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        or                a9, a9, a3
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::or::u16::relaxed:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        or                a9, a9, a3
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::or::u16::release:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        or                a9, a9, a3
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::or::u32::acqrel:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        or                a9, a9, a3
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::or::u32::seqcst:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        or                a9, a9, a3
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::or::u32::acquire:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        or                a9, a9, a3
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::or::u32::relaxed:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        or                a9, a9, a3
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::or::u32::release:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        or                a9, a9, a3
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::add::u8::acqrel:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        add.n             a9, a9, a3
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::add::u8::seqcst:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        add.n             a9, a9, a3
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::add::u8::acquire:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        add.n             a9, a9, a3
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::add::u8::relaxed:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        add.n             a9, a9, a3
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::add::u8::release:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        add.n             a9, a9, a3
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::add::u16::acqrel:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        add.n             a9, a9, a3
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::add::u16::seqcst:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        add.n             a9, a9, a3
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::add::u16::acquire:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        add.n             a9, a9, a3
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::add::u16::relaxed:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        add.n             a9, a9, a3
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::add::u16::release:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        add.n             a9, a9, a3
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::add::u32::acqrel:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        add.n             a9, a9, a3
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::add::u32::seqcst:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        add.n             a9, a9, a3
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::add::u32::acquire:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        add.n             a9, a9, a3
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::add::u32::relaxed:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        add.n             a9, a9, a3
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::add::u32::release:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        add.n             a9, a9, a3
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::and::u8::acqrel:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        and               a9, a9, a3
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::and::u8::seqcst:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        and               a9, a9, a3
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::and::u8::acquire:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        and               a9, a9, a3
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::and::u8::relaxed:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        and               a9, a9, a3
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::and::u8::release:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        and               a9, a9, a3
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::and::u16::acqrel:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        and               a9, a9, a3
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::and::u16::seqcst:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        and               a9, a9, a3
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::and::u16::acquire:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        and               a9, a9, a3
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::and::u16::relaxed:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        and               a9, a9, a3
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::and::u16::release:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        and               a9, a9, a3
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::and::u32::acqrel:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        and               a9, a9, a3
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::and::u32::seqcst:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        and               a9, a9, a3
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::and::u32::acquire:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        and               a9, a9, a3
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::and::u32::relaxed:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        and               a9, a9, a3
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::and::u32::release:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        and               a9, a9, a3
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::neg::u8::acqrel:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        neg               a9, a9
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::neg::u8::seqcst:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        neg               a9, a9
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::neg::u8::acquire:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        neg               a9, a9
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::neg::u8::relaxed:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        neg               a9, a9
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::neg::u8::release:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        neg               a9, a9
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::neg::u16::acqrel:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        neg               a9, a9
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::neg::u16::seqcst:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        neg               a9, a9
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::neg::u16::acquire:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        neg               a9, a9
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::neg::u16::relaxed:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        neg               a9, a9
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::neg::u16::release:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        neg               a9, a9
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::neg::u32::acqrel:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        neg               a9, a9
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::neg::u32::seqcst:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        neg               a9, a9
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::neg::u32::acquire:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        neg               a9, a9
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::neg::u32::relaxed:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        neg               a9, a9
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::neg::u32::release:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        neg               a9, a9
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::not::u8::acqrel:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        movi.n            a10, -1
        xor               a9, a9, a10
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::not::u8::seqcst:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        movi.n            a10, -1
        xor               a9, a9, a10
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::not::u8::acquire:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        movi.n            a10, -1
        xor               a9, a9, a10
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::not::u8::relaxed:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        movi.n            a10, -1
        xor               a9, a9, a10
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::not::u8::release:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        movi.n            a10, -1
        xor               a9, a9, a10
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::not::u16::acqrel:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        movi.n            a10, -1
        xor               a9, a9, a10
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::not::u16::seqcst:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        movi.n            a10, -1
        xor               a9, a9, a10
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::not::u16::acquire:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        movi.n            a10, -1
        xor               a9, a9, a10
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::not::u16::relaxed:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        movi.n            a10, -1
        xor               a9, a9, a10
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::not::u16::release:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        movi.n            a10, -1
        xor               a9, a9, a10
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::not::u32::acqrel:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        movi.n            a10, -1
        xor               a9, a9, a10
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::not::u32::seqcst:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        movi.n            a10, -1
        xor               a9, a9, a10
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::not::u32::acquire:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        movi.n            a10, -1
        xor               a9, a9, a10
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::not::u32::relaxed:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        movi.n            a10, -1
        xor               a9, a9, a10
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::not::u32::release:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        movi.n            a10, -1
        xor               a9, a9, a10
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::sub::u8::acqrel:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        sub               a9, a9, a3
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::sub::u8::seqcst:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        sub               a9, a9, a3
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::sub::u8::acquire:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        sub               a9, a9, a3
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::sub::u8::relaxed:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        sub               a9, a9, a3
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::sub::u8::release:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        sub               a9, a9, a3
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::sub::u16::acqrel:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        sub               a9, a9, a3
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::sub::u16::seqcst:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        sub               a9, a9, a3
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::sub::u16::acquire:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        sub               a9, a9, a3
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::sub::u16::relaxed:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        sub               a9, a9, a3
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::sub::u16::release:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        sub               a9, a9, a3
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::sub::u32::acqrel:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        sub               a9, a9, a3
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::sub::u32::seqcst:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        sub               a9, a9, a3
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::sub::u32::acquire:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        sub               a9, a9, a3
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::sub::u32::relaxed:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        sub               a9, a9, a3
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::sub::u32::release:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        sub               a9, a9, a3
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::xor::u8::acqrel:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        xor               a9, a9, a3
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::xor::u8::seqcst:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        xor               a9, a9, a3
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::xor::u8::acquire:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        xor               a9, a9, a3
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::xor::u8::relaxed:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        xor               a9, a9, a3
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::xor::u8::release:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        xor               a9, a9, a3
        s8i               a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::xor::u16::acqrel:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        xor               a9, a9, a3
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::xor::u16::seqcst:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        xor               a9, a9, a3
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::xor::u16::acquire:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        xor               a9, a9, a3
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::xor::u16::relaxed:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        xor               a9, a9, a3
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::xor::u16::release:
        entry             a1, 32
        rsil              a8, 15
        l16ui             a9, a2, 0
        xor               a9, a9, a3
        s16i              a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::xor::u32::acqrel:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        xor               a9, a9, a3
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::xor::u32::seqcst:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        xor               a9, a9, a3
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::xor::u32::acquire:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        xor               a9, a9, a3
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::xor::u32::relaxed:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        xor               a9, a9, a3
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
        retw.n

asm_test::xor::u32::release:
        entry             a1, 32
        rsil              a8, 15
        l32i.n            a9, a2, 0
        xor               a9, a9, a3
        s32i.n            a9, a2, 0
        wsr.ps            a8
        rsync
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
        rsil              a9, 15
        l8ui              a8, a2, 0
        s8i               a3, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::u8::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        s8i               a3, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::u8::acquire:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        s8i               a3, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::u8::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        s8i               a3, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::u8::release:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        s8i               a3, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::u16::acqrel:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        s16i              a3, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::u16::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        s16i              a3, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::u16::acquire:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        s16i              a3, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::u16::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        s16i              a3, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::u16::release:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        s16i              a3, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::u32::acqrel:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        s32i.n            a3, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::u32::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        s32i.n            a3, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::u32::acquire:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        s32i.n            a3, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::u32::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        s32i.n            a3, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::u32::release:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        s32i.n            a3, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::bool::acqrel:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        s8i               a3, a2, 0
        wsr.ps            a8
        rsync
        movi.n            a2, 0
        beq               a9, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::swap::bool::seqcst:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        s8i               a3, a2, 0
        wsr.ps            a8
        rsync
        movi.n            a2, 0
        beq               a9, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::swap::bool::acquire:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        s8i               a3, a2, 0
        wsr.ps            a8
        rsync
        movi.n            a2, 0
        beq               a9, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::swap::bool::relaxed:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        s8i               a3, a2, 0
        wsr.ps            a8
        rsync
        movi.n            a2, 0
        beq               a9, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::swap::bool::release:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        s8i               a3, a2, 0
        wsr.ps            a8
        rsync
        movi.n            a2, 0
        beq               a9, a2, 0f
        movi.n            a2, 1
0:
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
        rsil              a9, 15
        l8ui              a8, a2, 0
        or                a10, a8, a3
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u8::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        or                a10, a8, a3
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u8::acquire:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        or                a10, a8, a3
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u8::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        or                a10, a8, a3
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u8::release:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        or                a10, a8, a3
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u16::acqrel:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        or                a10, a8, a3
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u16::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        or                a10, a8, a3
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u16::acquire:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        or                a10, a8, a3
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u16::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        or                a10, a8, a3
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u16::release:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        or                a10, a8, a3
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u32::acqrel:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        or                a10, a8, a3
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u32::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        or                a10, a8, a3
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u32::acquire:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        or                a10, a8, a3
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u32::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        or                a10, a8, a3
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u32::release:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        or                a10, a8, a3
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::bool::acqrel:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        or                a10, a9, a3
        s8i               a10, a2, 0
        wsr.ps            a8
        rsync
        movi.n            a2, 0
        beq               a9, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_or::bool::seqcst:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        or                a10, a9, a3
        s8i               a10, a2, 0
        wsr.ps            a8
        rsync
        movi.n            a2, 0
        beq               a9, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_or::bool::acquire:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        or                a10, a9, a3
        s8i               a10, a2, 0
        wsr.ps            a8
        rsync
        movi.n            a2, 0
        beq               a9, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_or::bool::relaxed:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        or                a10, a9, a3
        s8i               a10, a2, 0
        wsr.ps            a8
        rsync
        movi.n            a2, 0
        beq               a9, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_or::bool::release:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        or                a10, a9, a3
        s8i               a10, a2, 0
        wsr.ps            a8
        rsync
        movi.n            a2, 0
        beq               a9, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_add::u8::acqrel:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        add.n             a10, a8, a3
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_add::u8::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        add.n             a10, a8, a3
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_add::u8::acquire:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        add.n             a10, a8, a3
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_add::u8::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        add.n             a10, a8, a3
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_add::u8::release:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        add.n             a10, a8, a3
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_add::u16::acqrel:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        add.n             a10, a8, a3
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_add::u16::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        add.n             a10, a8, a3
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_add::u16::acquire:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        add.n             a10, a8, a3
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_add::u16::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        add.n             a10, a8, a3
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_add::u16::release:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        add.n             a10, a8, a3
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_add::u32::acqrel:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        add.n             a10, a8, a3
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_add::u32::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        add.n             a10, a8, a3
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_add::u32::acquire:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        add.n             a10, a8, a3
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_add::u32::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        add.n             a10, a8, a3
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_add::u32::release:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        add.n             a10, a8, a3
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u8::acqrel:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        and               a10, a8, a3
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u8::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        and               a10, a8, a3
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u8::acquire:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        and               a10, a8, a3
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u8::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        and               a10, a8, a3
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u8::release:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        and               a10, a8, a3
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u16::acqrel:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        and               a10, a8, a3
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u16::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        and               a10, a8, a3
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u16::acquire:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        and               a10, a8, a3
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u16::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        and               a10, a8, a3
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u16::release:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        and               a10, a8, a3
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u32::acqrel:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        and               a10, a8, a3
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u32::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        and               a10, a8, a3
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u32::acquire:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        and               a10, a8, a3
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u32::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        and               a10, a8, a3
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u32::release:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        and               a10, a8, a3
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::bool::acqrel:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        and               a10, a3, a9
        s8i               a10, a2, 0
        wsr.ps            a8
        rsync
        movi.n            a2, 0
        beq               a9, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_and::bool::seqcst:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        and               a10, a3, a9
        s8i               a10, a2, 0
        wsr.ps            a8
        rsync
        movi.n            a2, 0
        beq               a9, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_and::bool::acquire:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        and               a10, a3, a9
        s8i               a10, a2, 0
        wsr.ps            a8
        rsync
        movi.n            a2, 0
        beq               a9, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_and::bool::relaxed:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        and               a10, a3, a9
        s8i               a10, a2, 0
        wsr.ps            a8
        rsync
        movi.n            a2, 0
        beq               a9, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_and::bool::release:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        and               a10, a3, a9
        s8i               a10, a2, 0
        wsr.ps            a8
        rsync
        movi.n            a2, 0
        beq               a9, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_max::i8::acqrel:
        entry             a1, 32
        slli              a8, a3, 24
        srai              a9, a8, 24
        rsil              a10, 15
        l8ui              a8, a2, 0
        slli              a11, a8, 24
        srai              a11, a11, 24
        max               a9, a9, a11
        s8i               a9, a2, 0
        wsr.ps            a10
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_max::i8::seqcst:
        entry             a1, 32
        slli              a8, a3, 24
        srai              a9, a8, 24
        rsil              a10, 15
        l8ui              a8, a2, 0
        slli              a11, a8, 24
        srai              a11, a11, 24
        max               a9, a9, a11
        s8i               a9, a2, 0
        wsr.ps            a10
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_max::i8::acquire:
        entry             a1, 32
        slli              a8, a3, 24
        srai              a9, a8, 24
        rsil              a10, 15
        l8ui              a8, a2, 0
        slli              a11, a8, 24
        srai              a11, a11, 24
        max               a9, a9, a11
        s8i               a9, a2, 0
        wsr.ps            a10
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_max::i8::relaxed:
        entry             a1, 32
        slli              a8, a3, 24
        srai              a9, a8, 24
        rsil              a10, 15
        l8ui              a8, a2, 0
        slli              a11, a8, 24
        srai              a11, a11, 24
        max               a9, a9, a11
        s8i               a9, a2, 0
        wsr.ps            a10
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_max::i8::release:
        entry             a1, 32
        slli              a8, a3, 24
        srai              a9, a8, 24
        rsil              a10, 15
        l8ui              a8, a2, 0
        slli              a11, a8, 24
        srai              a11, a11, 24
        max               a9, a9, a11
        s8i               a9, a2, 0
        wsr.ps            a10
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_max::i16::acqrel:
        entry             a1, 32
        rsil              a9, 15
        l16si             a8, a2, 0
        slli              a10, a3, 16
        srai              a10, a10, 16
        max               a10, a10, a8
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_max::i16::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l16si             a8, a2, 0
        slli              a10, a3, 16
        srai              a10, a10, 16
        max               a10, a10, a8
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_max::i16::acquire:
        entry             a1, 32
        rsil              a9, 15
        l16si             a8, a2, 0
        slli              a10, a3, 16
        srai              a10, a10, 16
        max               a10, a10, a8
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_max::i16::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l16si             a8, a2, 0
        slli              a10, a3, 16
        srai              a10, a10, 16
        max               a10, a10, a8
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_max::i16::release:
        entry             a1, 32
        rsil              a9, 15
        l16si             a8, a2, 0
        slli              a10, a3, 16
        srai              a10, a10, 16
        max               a10, a10, a8
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_max::i32::acqrel:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        max               a10, a3, a8
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_max::i32::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        max               a10, a3, a8
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_max::i32::acquire:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        max               a10, a3, a8
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_max::i32::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        max               a10, a3, a8
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_max::i32::release:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        max               a10, a3, a8
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i8::acqrel:
        entry             a1, 32
        slli              a8, a3, 24
        srai              a9, a8, 24
        rsil              a10, 15
        l8ui              a8, a2, 0
        slli              a11, a8, 24
        srai              a11, a11, 24
        min               a9, a9, a11
        s8i               a9, a2, 0
        wsr.ps            a10
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i8::seqcst:
        entry             a1, 32
        slli              a8, a3, 24
        srai              a9, a8, 24
        rsil              a10, 15
        l8ui              a8, a2, 0
        slli              a11, a8, 24
        srai              a11, a11, 24
        min               a9, a9, a11
        s8i               a9, a2, 0
        wsr.ps            a10
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i8::acquire:
        entry             a1, 32
        slli              a8, a3, 24
        srai              a9, a8, 24
        rsil              a10, 15
        l8ui              a8, a2, 0
        slli              a11, a8, 24
        srai              a11, a11, 24
        min               a9, a9, a11
        s8i               a9, a2, 0
        wsr.ps            a10
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i8::relaxed:
        entry             a1, 32
        slli              a8, a3, 24
        srai              a9, a8, 24
        rsil              a10, 15
        l8ui              a8, a2, 0
        slli              a11, a8, 24
        srai              a11, a11, 24
        min               a9, a9, a11
        s8i               a9, a2, 0
        wsr.ps            a10
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i8::release:
        entry             a1, 32
        slli              a8, a3, 24
        srai              a9, a8, 24
        rsil              a10, 15
        l8ui              a8, a2, 0
        slli              a11, a8, 24
        srai              a11, a11, 24
        min               a9, a9, a11
        s8i               a9, a2, 0
        wsr.ps            a10
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i16::acqrel:
        entry             a1, 32
        rsil              a9, 15
        l16si             a8, a2, 0
        slli              a10, a3, 16
        srai              a10, a10, 16
        min               a10, a10, a8
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i16::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l16si             a8, a2, 0
        slli              a10, a3, 16
        srai              a10, a10, 16
        min               a10, a10, a8
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i16::acquire:
        entry             a1, 32
        rsil              a9, 15
        l16si             a8, a2, 0
        slli              a10, a3, 16
        srai              a10, a10, 16
        min               a10, a10, a8
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i16::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l16si             a8, a2, 0
        slli              a10, a3, 16
        srai              a10, a10, 16
        min               a10, a10, a8
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i16::release:
        entry             a1, 32
        rsil              a9, 15
        l16si             a8, a2, 0
        slli              a10, a3, 16
        srai              a10, a10, 16
        min               a10, a10, a8
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i32::acqrel:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        min               a10, a3, a8
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i32::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        min               a10, a3, a8
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i32::acquire:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        min               a10, a3, a8
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i32::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        min               a10, a3, a8
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i32::release:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        min               a10, a3, a8
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u8::acqrel:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        neg               a10, a8
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u8::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        neg               a10, a8
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u8::acquire:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        neg               a10, a8
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u8::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        neg               a10, a8
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u8::release:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        neg               a10, a8
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u16::acqrel:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        neg               a10, a8
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u16::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        neg               a10, a8
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u16::acquire:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        neg               a10, a8
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u16::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        neg               a10, a8
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u16::release:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        neg               a10, a8
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u32::acqrel:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        neg               a10, a8
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u32::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        neg               a10, a8
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u32::acquire:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        neg               a10, a8
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u32::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        neg               a10, a8
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u32::release:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        neg               a10, a8
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u8::acqrel:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        movi.n            a10, -1
        xor               a10, a8, a10
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u8::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        movi.n            a10, -1
        xor               a10, a8, a10
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u8::acquire:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        movi.n            a10, -1
        xor               a10, a8, a10
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u8::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        movi.n            a10, -1
        xor               a10, a8, a10
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u8::release:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        movi.n            a10, -1
        xor               a10, a8, a10
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u16::acqrel:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        movi.n            a10, -1
        xor               a10, a8, a10
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u16::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        movi.n            a10, -1
        xor               a10, a8, a10
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u16::acquire:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        movi.n            a10, -1
        xor               a10, a8, a10
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u16::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        movi.n            a10, -1
        xor               a10, a8, a10
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u16::release:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        movi.n            a10, -1
        xor               a10, a8, a10
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u32::acqrel:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        movi.n            a10, -1
        xor               a10, a8, a10
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u32::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        movi.n            a10, -1
        xor               a10, a8, a10
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u32::acquire:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        movi.n            a10, -1
        xor               a10, a8, a10
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u32::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        movi.n            a10, -1
        xor               a10, a8, a10
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u32::release:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        movi.n            a10, -1
        xor               a10, a8, a10
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::bool::acqrel:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a9, 15
        l8ui              a10, a8, 0
        movi.n            a2, 1
        xor               a11, a10, a2
        s8i               a11, a8, 0
        wsr.ps            a9
        rsync
        movi.n            a8, 0
        bne               a10, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_not::bool::seqcst:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a9, 15
        l8ui              a10, a8, 0
        movi.n            a2, 1
        xor               a11, a10, a2
        s8i               a11, a8, 0
        wsr.ps            a9
        rsync
        movi.n            a8, 0
        bne               a10, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_not::bool::acquire:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a9, 15
        l8ui              a10, a8, 0
        movi.n            a2, 1
        xor               a11, a10, a2
        s8i               a11, a8, 0
        wsr.ps            a9
        rsync
        movi.n            a8, 0
        bne               a10, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_not::bool::relaxed:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a9, 15
        l8ui              a10, a8, 0
        movi.n            a2, 1
        xor               a11, a10, a2
        s8i               a11, a8, 0
        wsr.ps            a9
        rsync
        movi.n            a8, 0
        bne               a10, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_not::bool::release:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a9, 15
        l8ui              a10, a8, 0
        movi.n            a2, 1
        xor               a11, a10, a2
        s8i               a11, a8, 0
        wsr.ps            a9
        rsync
        movi.n            a8, 0
        bne               a10, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_sub::u8::acqrel:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        sub               a10, a8, a3
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::u8::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        sub               a10, a8, a3
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::u8::acquire:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        sub               a10, a8, a3
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::u8::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        sub               a10, a8, a3
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::u8::release:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        sub               a10, a8, a3
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::u16::acqrel:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        sub               a10, a8, a3
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::u16::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        sub               a10, a8, a3
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::u16::acquire:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        sub               a10, a8, a3
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::u16::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        sub               a10, a8, a3
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::u16::release:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        sub               a10, a8, a3
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::u32::acqrel:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        sub               a10, a8, a3
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::u32::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        sub               a10, a8, a3
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::u32::acquire:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        sub               a10, a8, a3
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::u32::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        sub               a10, a8, a3
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::u32::release:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        sub               a10, a8, a3
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u8::acqrel:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        xor               a10, a8, a3
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u8::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        xor               a10, a8, a3
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u8::acquire:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        xor               a10, a8, a3
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u8::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        xor               a10, a8, a3
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u8::release:
        entry             a1, 32
        rsil              a9, 15
        l8ui              a8, a2, 0
        xor               a10, a8, a3
        s8i               a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u16::acqrel:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        xor               a10, a8, a3
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u16::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        xor               a10, a8, a3
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u16::acquire:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        xor               a10, a8, a3
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u16::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        xor               a10, a8, a3
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u16::release:
        entry             a1, 32
        rsil              a9, 15
        l16ui             a8, a2, 0
        xor               a10, a8, a3
        s16i              a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u32::acqrel:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        xor               a10, a8, a3
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u32::seqcst:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        xor               a10, a8, a3
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u32::acquire:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        xor               a10, a8, a3
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u32::relaxed:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        xor               a10, a8, a3
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u32::release:
        entry             a1, 32
        rsil              a9, 15
        l32i.n            a8, a2, 0
        xor               a10, a8, a3
        s32i.n            a10, a2, 0
        wsr.ps            a9
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::bool::acqrel:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        xor               a10, a9, a3
        s8i               a10, a2, 0
        wsr.ps            a8
        rsync
        movi.n            a2, 0
        beq               a9, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_xor::bool::seqcst:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        xor               a10, a9, a3
        s8i               a10, a2, 0
        wsr.ps            a8
        rsync
        movi.n            a2, 0
        beq               a9, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_xor::bool::acquire:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        xor               a10, a9, a3
        s8i               a10, a2, 0
        wsr.ps            a8
        rsync
        movi.n            a2, 0
        beq               a9, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_xor::bool::relaxed:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        xor               a10, a9, a3
        s8i               a10, a2, 0
        wsr.ps            a8
        rsync
        movi.n            a2, 0
        beq               a9, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_xor::bool::release:
        entry             a1, 32
        rsil              a8, 15
        l8ui              a9, a2, 0
        xor               a10, a9, a3
        s8i               a10, a2, 0
        wsr.ps            a8
        rsync
        movi.n            a2, 0
        beq               a9, a2, 0f
        movi.n            a2, 1
0:
        retw.n


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

asm_test::bit_toggle::u8::acqrel:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 7
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        rsil              a14, 15
        l8ui              a10, a8, 0
        xor               a11, a10, a9
        s8i               a11, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a10, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_toggle::u8::seqcst:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 7
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        rsil              a14, 15
        l8ui              a10, a8, 0
        xor               a11, a10, a9
        s8i               a11, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a10, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_toggle::u8::acquire:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 7
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        rsil              a14, 15
        l8ui              a10, a8, 0
        xor               a11, a10, a9
        s8i               a11, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a10, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_toggle::u8::relaxed:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 7
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        rsil              a14, 15
        l8ui              a10, a8, 0
        xor               a11, a10, a9
        s8i               a11, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a10, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_toggle::u8::release:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 7
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        rsil              a14, 15
        l8ui              a10, a8, 0
        xor               a11, a10, a9
        s8i               a11, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a10, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_toggle::u16::acqrel:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 15
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        rsil              a14, 15
        l16ui             a10, a8, 0
        xor               a11, a10, a9
        s16i              a11, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a10, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_toggle::u16::seqcst:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 15
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        rsil              a14, 15
        l16ui             a10, a8, 0
        xor               a11, a10, a9
        s16i              a11, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a10, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_toggle::u16::acquire:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 15
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        rsil              a14, 15
        l16ui             a10, a8, 0
        xor               a11, a10, a9
        s16i              a11, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a10, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_toggle::u16::relaxed:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 15
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        rsil              a14, 15
        l16ui             a10, a8, 0
        xor               a11, a10, a9
        s16i              a11, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a10, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_toggle::u16::release:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 15
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        rsil              a14, 15
        l16ui             a10, a8, 0
        xor               a11, a10, a9
        s16i              a11, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a10, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_toggle::u32::acqrel:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 31
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        rsil              a14, 15
        l32i.n            a10, a8, 0
        xor               a11, a10, a9
        s32i.n            a11, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a10, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_toggle::u32::seqcst:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 31
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        rsil              a14, 15
        l32i.n            a10, a8, 0
        xor               a11, a10, a9
        s32i.n            a11, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a10, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_toggle::u32::acquire:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 31
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        rsil              a14, 15
        l32i.n            a10, a8, 0
        xor               a11, a10, a9
        s32i.n            a11, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a10, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_toggle::u32::relaxed:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 31
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        rsil              a14, 15
        l32i.n            a10, a8, 0
        xor               a11, a10, a9
        s32i.n            a11, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a10, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_toggle::u32::release:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 31
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        rsil              a14, 15
        l32i.n            a10, a8, 0
        xor               a11, a10, a9
        s32i.n            a11, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a10, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_nand::u8::acqrel_all:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, -1
        xor               a9, a8, a9
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u8::seqcst_all:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, -1
        xor               a9, a8, a9
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u8::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi              a9, 255
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u8::acquire_all:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, -1
        xor               a9, a8, a9
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u8::relaxed_all:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, -1
        xor               a9, a8, a9
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u8::release_all:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, -1
        xor               a9, a8, a9
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u8::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi              a9, 255
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u8::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi              a9, 255
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u8::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi              a9, 255
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u8::release_zero:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi              a9, 255
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u8::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        and               a9, a8, a3
        movi.n            a10, -1
        xor               a9, a9, a10
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u8::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        and               a9, a8, a3
        movi.n            a10, -1
        xor               a9, a9, a10
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u8::acquire:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        and               a9, a8, a3
        movi.n            a10, -1
        xor               a9, a9, a10
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u8::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        and               a9, a8, a3
        movi.n            a10, -1
        xor               a9, a9, a10
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u8::release:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        and               a9, a8, a3
        movi.n            a10, -1
        xor               a9, a9, a10
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u16::acqrel_all:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        movi.n            a9, -1
        xor               a9, a8, a9
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u16::seqcst_all:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        movi.n            a9, -1
        xor               a9, a8, a9
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

.literal.asm_test::fetch_nand::u16::acqrel_zero:
        .byte             0xff
        .byte             0xff

asm_test::fetch_nand::u16::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        l32r              a9, 8 <asm_test::fetch_nand::u16::acqrel_zero+0x8> (ffff9100 <asm_test::fetch_nand::u16::acqrel_zero+0xffff9100>)
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u16::acquire_all:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        movi.n            a9, -1
        xor               a9, a8, a9
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u16::relaxed_all:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        movi.n            a9, -1
        xor               a9, a8, a9
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u16::release_all:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        movi.n            a9, -1
        xor               a9, a8, a9
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

.literal.asm_test::fetch_nand::u16::seqcst_zero:
        .byte             0xff
        .byte             0xff

asm_test::fetch_nand::u16::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        l32r              a9, 8 <asm_test::fetch_nand::u16::seqcst_zero+0x8> (ffff9100 <asm_test::fetch_nand::u16::seqcst_zero+0xffff9100>)
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

.literal.asm_test::fetch_nand::u16::acquire_zero:
        .byte             0xff
        .byte             0xff

asm_test::fetch_nand::u16::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        l32r              a9, 8 <asm_test::fetch_nand::u16::acquire_zero+0x8> (ffff9100 <asm_test::fetch_nand::u16::acquire_zero+0xffff9100>)
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

.literal.asm_test::fetch_nand::u16::relaxed_zero:
        .byte             0xff
        .byte             0xff

asm_test::fetch_nand::u16::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        l32r              a9, 8 <asm_test::fetch_nand::u16::relaxed_zero+0x8> (ffff9100 <asm_test::fetch_nand::u16::relaxed_zero+0xffff9100>)
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

.literal.asm_test::fetch_nand::u16::release_zero:
        .byte             0xff
        .byte             0xff

asm_test::fetch_nand::u16::release_zero:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        l32r              a9, 8 <asm_test::fetch_nand::u16::release_zero+0x8> (ffff9100 <asm_test::fetch_nand::u16::release_zero+0xffff9100>)
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u16::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        and               a9, a8, a3
        movi.n            a10, -1
        xor               a9, a9, a10
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u16::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        and               a9, a8, a3
        movi.n            a10, -1
        xor               a9, a9, a10
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u16::acquire:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        and               a9, a8, a3
        movi.n            a10, -1
        xor               a9, a9, a10
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u16::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        and               a9, a8, a3
        movi.n            a10, -1
        xor               a9, a9, a10
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u16::release:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        and               a9, a8, a3
        movi.n            a10, -1
        xor               a9, a9, a10
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u32::acqrel_all:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        movi.n            a9, -1
        xor               a9, a8, a9
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u32::seqcst_all:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        movi.n            a9, -1
        xor               a9, a8, a9
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u32::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        movi.n            a9, -1
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u32::acquire_all:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        movi.n            a9, -1
        xor               a9, a8, a9
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u32::relaxed_all:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        movi.n            a9, -1
        xor               a9, a8, a9
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u32::release_all:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        movi.n            a9, -1
        xor               a9, a8, a9
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u32::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        movi.n            a9, -1
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u32::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        movi.n            a9, -1
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u32::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        movi.n            a9, -1
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u32::release_zero:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        movi.n            a9, -1
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u32::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        and               a9, a8, a3
        movi.n            a10, -1
        xor               a9, a9, a10
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u32::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        and               a9, a8, a3
        movi.n            a10, -1
        xor               a9, a9, a10
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u32::acquire:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        and               a9, a8, a3
        movi.n            a10, -1
        xor               a9, a9, a10
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u32::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        and               a9, a8, a3
        movi.n            a10, -1
        xor               a9, a9, a10
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::u32::release:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        and               a9, a8, a3
        movi.n            a10, -1
        xor               a9, a9, a10
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_nand::bool::acqrel_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        xor               a10, a9, a2
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_nand::bool::seqcst_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        xor               a10, a9, a2
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_nand::bool::acqrel_false:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_nand::bool::acquire_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        xor               a10, a9, a2
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_nand::bool::relaxed_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        xor               a10, a9, a2
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_nand::bool::release_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        xor               a10, a9, a2
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_nand::bool::seqcst_false:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_nand::bool::acquire_false:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_nand::bool::relaxed_false:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_nand::bool::release_false:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_nand::bool::acqrel:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        beqz              a3, 0f
        movi.n            a10, 1
        xor               a10, a9, a10
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        movi              a8, 255
        and               a9, a9, a8
        movi.n            a8, 0
        beq               a9, a8, 1f
        j                 2f
0:
        s8i               a2, a8, 0
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        beqz              a3, 0f
        movi.n            a10, 1
        xor               a10, a9, a10
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        movi              a8, 255
        and               a9, a9, a8
        movi.n            a8, 0
        beq               a9, a8, 1f
        j                 2f
0:
        s8i               a2, a8, 0
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        beqz              a3, 0f
        movi.n            a10, 1
        xor               a10, a9, a10
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        movi              a8, 255
        and               a9, a9, a8
        movi.n            a8, 0
        beq               a9, a8, 1f
        j                 2f
0:
        s8i               a2, a8, 0
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        beqz              a3, 0f
        movi.n            a10, 1
        xor               a10, a9, a10
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        movi              a8, 255
        and               a9, a9, a8
        movi.n            a8, 0
        beq               a9, a8, 1f
        j                 2f
0:
        s8i               a2, a8, 0
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        beqz              a3, 0f
        movi.n            a10, 1
        xor               a10, a9, a10
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        movi              a8, 255
        and               a9, a9, a8
        movi.n            a8, 0
        beq               a9, a8, 1f
        j                 2f
0:
        s8i               a2, a8, 0
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a8, a2, 0
        maxu              a9, a9, a8
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umax::u8::seqcst:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        rsil              a14, 15
        l8ui              a8, a2, 0
        maxu              a9, a9, a8
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umax::u8::acquire:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        rsil              a14, 15
        l8ui              a8, a2, 0
        maxu              a9, a9, a8
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umax::u8::relaxed:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        rsil              a14, 15
        l8ui              a8, a2, 0
        maxu              a9, a9, a8
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umax::u8::release:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        rsil              a14, 15
        l8ui              a8, a2, 0
        maxu              a9, a9, a8
        s8i               a9, a2, 0
        wsr.ps            a14
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
        rsil              a14, 15
        l16ui             a8, a2, 0
        maxu              a9, a9, a8
        s16i              a9, a2, 0
        wsr.ps            a14
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
        rsil              a14, 15
        l16ui             a8, a2, 0
        maxu              a9, a9, a8
        s16i              a9, a2, 0
        wsr.ps            a14
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
        rsil              a14, 15
        l16ui             a8, a2, 0
        maxu              a9, a9, a8
        s16i              a9, a2, 0
        wsr.ps            a14
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
        rsil              a14, 15
        l16ui             a8, a2, 0
        maxu              a9, a9, a8
        s16i              a9, a2, 0
        wsr.ps            a14
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
        rsil              a14, 15
        l16ui             a8, a2, 0
        maxu              a9, a9, a8
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umax::u32::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        maxu              a9, a3, a8
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umax::u32::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        maxu              a9, a3, a8
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umax::u32::acquire:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        maxu              a9, a3, a8
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umax::u32::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        maxu              a9, a3, a8
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umax::u32::release:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        maxu              a9, a3, a8
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umin::u8::acqrel:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        rsil              a14, 15
        l8ui              a8, a2, 0
        minu              a9, a9, a8
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umin::u8::seqcst:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        rsil              a14, 15
        l8ui              a8, a2, 0
        minu              a9, a9, a8
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umin::u8::acquire:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        rsil              a14, 15
        l8ui              a8, a2, 0
        minu              a9, a9, a8
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umin::u8::relaxed:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        rsil              a14, 15
        l8ui              a8, a2, 0
        minu              a9, a9, a8
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umin::u8::release:
        entry             a1, 32
        movi              a8, 255
        and               a9, a3, a8
        rsil              a14, 15
        l8ui              a8, a2, 0
        minu              a9, a9, a8
        s8i               a9, a2, 0
        wsr.ps            a14
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
        rsil              a14, 15
        l16ui             a8, a2, 0
        minu              a9, a9, a8
        s16i              a9, a2, 0
        wsr.ps            a14
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
        rsil              a14, 15
        l16ui             a8, a2, 0
        minu              a9, a9, a8
        s16i              a9, a2, 0
        wsr.ps            a14
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
        rsil              a14, 15
        l16ui             a8, a2, 0
        minu              a9, a9, a8
        s16i              a9, a2, 0
        wsr.ps            a14
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
        rsil              a14, 15
        l16ui             a8, a2, 0
        minu              a9, a9, a8
        s16i              a9, a2, 0
        wsr.ps            a14
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
        rsil              a14, 15
        l16ui             a8, a2, 0
        minu              a9, a9, a8
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umin::u32::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        minu              a9, a3, a8
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umin::u32::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        minu              a9, a3, a8
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umin::u32::acquire:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        minu              a9, a3, a8
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umin::u32::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        minu              a9, a3, a8
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_umin::u32::release:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        minu              a9, a3, a8
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::compare_exchange::u8::acqrel_seqcst:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        rsil              a14, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange::f32::acqrel_seqcst:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
0:
        wsr.ps            a14
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange::f32::seqcst_seqcst:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
0:
        wsr.ps            a14
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange::f32::acqrel_acquire:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
0:
        wsr.ps            a14
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange::f32::acqrel_relaxed:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
0:
        wsr.ps            a14
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange::f32::acquire_seqcst:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
0:
        wsr.ps            a14
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange::f32::relaxed_seqcst:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
0:
        wsr.ps            a14
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange::f32::release_seqcst:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
0:
        wsr.ps            a14
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange::f32::seqcst_acquire:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
0:
        wsr.ps            a14
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange::f32::seqcst_relaxed:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
0:
        wsr.ps            a14
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange::f32::acquire_acquire:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
0:
        wsr.ps            a14
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange::f32::acquire_relaxed:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
0:
        wsr.ps            a14
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange::f32::relaxed_acquire:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
0:
        wsr.ps            a14
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange::f32::relaxed_relaxed:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
0:
        wsr.ps            a14
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange::f32::release_acquire:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
0:
        wsr.ps            a14
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange::f32::release_relaxed:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
0:
        wsr.ps            a14
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
        and               a8, a3, a8
        rsil              a14, 15
        l16ui             a3, a2, 0
        bne               a3, a8, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::compare_exchange::u16::seqcst_seqcst:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::seqcst_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::seqcst_seqcst+0x81004136>)
        and               a8, a3, a8
        rsil              a14, 15
        l16ui             a3, a2, 0
        bne               a3, a8, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::compare_exchange::u16::acqrel_acquire:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::acqrel_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::acqrel_acquire+0x81004136>)
        and               a8, a3, a8
        rsil              a14, 15
        l16ui             a3, a2, 0
        bne               a3, a8, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::compare_exchange::u16::acqrel_relaxed:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::acqrel_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::acqrel_relaxed+0x81004136>)
        and               a8, a3, a8
        rsil              a14, 15
        l16ui             a3, a2, 0
        bne               a3, a8, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::compare_exchange::u16::acquire_seqcst:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::acquire_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::acquire_seqcst+0x81004136>)
        and               a8, a3, a8
        rsil              a14, 15
        l16ui             a3, a2, 0
        bne               a3, a8, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::compare_exchange::u16::relaxed_seqcst:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::relaxed_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::relaxed_seqcst+0x81004136>)
        and               a8, a3, a8
        rsil              a14, 15
        l16ui             a3, a2, 0
        bne               a3, a8, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::compare_exchange::u16::release_seqcst:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::release_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::release_seqcst+0x81004136>)
        and               a8, a3, a8
        rsil              a14, 15
        l16ui             a3, a2, 0
        bne               a3, a8, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::compare_exchange::u16::seqcst_acquire:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::seqcst_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::seqcst_acquire+0x81004136>)
        and               a8, a3, a8
        rsil              a14, 15
        l16ui             a3, a2, 0
        bne               a3, a8, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::compare_exchange::u16::seqcst_relaxed:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::seqcst_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::seqcst_relaxed+0x81004136>)
        and               a8, a3, a8
        rsil              a14, 15
        l16ui             a3, a2, 0
        bne               a3, a8, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::compare_exchange::u16::acquire_acquire:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::acquire_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::acquire_acquire+0x81004136>)
        and               a8, a3, a8
        rsil              a14, 15
        l16ui             a3, a2, 0
        bne               a3, a8, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::compare_exchange::u16::acquire_relaxed:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::acquire_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::acquire_relaxed+0x81004136>)
        and               a8, a3, a8
        rsil              a14, 15
        l16ui             a3, a2, 0
        bne               a3, a8, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::compare_exchange::u16::relaxed_acquire:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::relaxed_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::relaxed_acquire+0x81004136>)
        and               a8, a3, a8
        rsil              a14, 15
        l16ui             a3, a2, 0
        bne               a3, a8, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::compare_exchange::u16::relaxed_relaxed:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::relaxed_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::relaxed_relaxed+0x81004136>)
        and               a8, a3, a8
        rsil              a14, 15
        l16ui             a3, a2, 0
        bne               a3, a8, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::compare_exchange::u16::release_acquire:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::release_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::release_acquire+0x81004136>)
        and               a8, a3, a8
        rsil              a14, 15
        l16ui             a3, a2, 0
        bne               a3, a8, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::compare_exchange::u16::release_relaxed:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange::u16::release_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange::u16::release_relaxed+0x81004136>)
        and               a8, a3, a8
        rsil              a14, 15
        l16ui             a3, a2, 0
        bne               a3, a8, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

asm_test::compare_exchange::u32::acqrel_seqcst:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

asm_test::compare_exchange::u32::seqcst_seqcst:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

asm_test::compare_exchange::u32::acqrel_acquire:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

asm_test::compare_exchange::u32::acqrel_relaxed:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

asm_test::compare_exchange::u32::acquire_seqcst:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

asm_test::compare_exchange::u32::relaxed_seqcst:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

asm_test::compare_exchange::u32::release_seqcst:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

asm_test::compare_exchange::u32::seqcst_acquire:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

asm_test::compare_exchange::u32::seqcst_relaxed:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

asm_test::compare_exchange::u32::acquire_acquire:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

asm_test::compare_exchange::u32::acquire_relaxed:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

asm_test::compare_exchange::u32::relaxed_acquire:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

asm_test::compare_exchange::u32::relaxed_relaxed:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

asm_test::compare_exchange::u32::release_acquire:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

asm_test::compare_exchange::u32::release_relaxed:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

asm_test::compare_exchange::bool::acqrel_seqcst:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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

asm_test::compare_exchange::bool::acqrel_seqcst_true_true:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a9, 0
        movi.n            a3, 1
        mov.n             a2, a3
        beq               a8, a3, 1f
        beq               a8, a9, 2f
0:
        retw.n
1:
        mov.n             a2, a9
        bne               a8, a9, 0b
2:
        mov.n             a3, a9
        retw.n

asm_test::compare_exchange::bool::seqcst_seqcst_true_true:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a9, 0
        movi.n            a3, 1
        mov.n             a2, a3
        beq               a8, a3, 1f
        beq               a8, a9, 2f
0:
        retw.n
1:
        mov.n             a2, a9
        bne               a8, a9, 0b
2:
        mov.n             a3, a9
        retw.n

asm_test::compare_exchange::bool::acqrel_acquire_true_true:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a9, 0
        movi.n            a3, 1
        mov.n             a2, a3
        beq               a8, a3, 1f
        beq               a8, a9, 2f
0:
        retw.n
1:
        mov.n             a2, a9
        bne               a8, a9, 0b
2:
        mov.n             a3, a9
        retw.n

asm_test::compare_exchange::bool::acqrel_relaxed_true_true:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a9, 0
        movi.n            a3, 1
        mov.n             a2, a3
        beq               a8, a3, 1f
        beq               a8, a9, 2f
0:
        retw.n
1:
        mov.n             a2, a9
        bne               a8, a9, 0b
2:
        mov.n             a3, a9
        retw.n

asm_test::compare_exchange::bool::acqrel_seqcst_false_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        beqz              a9, 1f
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        beq               a9, a8, 2f
0:
        mov.n             a3, a2
        retw.n
1:
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0b
2:
        mov.n             a2, a8
        mov.n             a3, a2
        retw.n

asm_test::compare_exchange::bool::acqrel_seqcst_true_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 0
        beqi              a8, 1, 2f
        wsr.ps            a14
        rsync
        movi.n            a3, 1
        mov.n             a2, a3
        beq               a8, a3, 3f
0:
        beq               a8, a9, 4f
1:
        retw.n
2:
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a3, 1
        mov.n             a2, a3
        bne               a8, a3, 0b
3:
        mov.n             a2, a9
        bne               a8, a9, 1b
4:
        mov.n             a3, a9
        retw.n

asm_test::compare_exchange::bool::acquire_seqcst_true_true:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a9, 0
        movi.n            a3, 1
        mov.n             a2, a3
        beq               a8, a3, 1f
        beq               a8, a9, 2f
0:
        retw.n
1:
        mov.n             a2, a9
        bne               a8, a9, 0b
2:
        mov.n             a3, a9
        retw.n

asm_test::compare_exchange::bool::relaxed_seqcst_true_true:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a9, 0
        movi.n            a3, 1
        mov.n             a2, a3
        beq               a8, a3, 1f
        beq               a8, a9, 2f
0:
        retw.n
1:
        mov.n             a2, a9
        bne               a8, a9, 0b
2:
        mov.n             a3, a9
        retw.n

asm_test::compare_exchange::bool::release_seqcst_true_true:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a9, 0
        movi.n            a3, 1
        mov.n             a2, a3
        beq               a8, a3, 1f
        beq               a8, a9, 2f
0:
        retw.n
1:
        mov.n             a2, a9
        bne               a8, a9, 0b
2:
        mov.n             a3, a9
        retw.n

asm_test::compare_exchange::bool::seqcst_acquire_true_true:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a9, 0
        movi.n            a3, 1
        mov.n             a2, a3
        beq               a8, a3, 1f
        beq               a8, a9, 2f
0:
        retw.n
1:
        mov.n             a2, a9
        bne               a8, a9, 0b
2:
        mov.n             a3, a9
        retw.n

asm_test::compare_exchange::bool::seqcst_relaxed_true_true:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a9, 0
        movi.n            a3, 1
        mov.n             a2, a3
        beq               a8, a3, 1f
        beq               a8, a9, 2f
0:
        retw.n
1:
        mov.n             a2, a9
        bne               a8, a9, 0b
2:
        mov.n             a3, a9
        retw.n

asm_test::compare_exchange::bool::seqcst_seqcst_false_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        beqz              a9, 1f
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        beq               a9, a8, 2f
0:
        mov.n             a3, a2
        retw.n
1:
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0b
2:
        mov.n             a2, a8
        mov.n             a3, a2
        retw.n

asm_test::compare_exchange::bool::seqcst_seqcst_true_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 0
        beqi              a8, 1, 2f
        wsr.ps            a14
        rsync
        movi.n            a3, 1
        mov.n             a2, a3
        beq               a8, a3, 3f
0:
        beq               a8, a9, 4f
1:
        retw.n
2:
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a3, 1
        mov.n             a2, a3
        bne               a8, a3, 0b
3:
        mov.n             a2, a9
        bne               a8, a9, 1b
4:
        mov.n             a3, a9
        retw.n

asm_test::compare_exchange::bool::acqrel_acquire_false_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        beqz              a9, 1f
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        beq               a9, a8, 2f
0:
        mov.n             a3, a2
        retw.n
1:
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0b
2:
        mov.n             a2, a8
        mov.n             a3, a2
        retw.n

asm_test::compare_exchange::bool::acqrel_acquire_true_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 0
        beqi              a8, 1, 2f
        wsr.ps            a14
        rsync
        movi.n            a3, 1
        mov.n             a2, a3
        beq               a8, a3, 3f
0:
        beq               a8, a9, 4f
1:
        retw.n
2:
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a3, 1
        mov.n             a2, a3
        bne               a8, a3, 0b
3:
        mov.n             a2, a9
        bne               a8, a9, 1b
4:
        mov.n             a3, a9
        retw.n

asm_test::compare_exchange::bool::acqrel_relaxed_false_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        beqz              a9, 1f
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        beq               a9, a8, 2f
0:
        mov.n             a3, a2
        retw.n
1:
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0b
2:
        mov.n             a2, a8
        mov.n             a3, a2
        retw.n

asm_test::compare_exchange::bool::acqrel_relaxed_true_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 0
        beqi              a8, 1, 2f
        wsr.ps            a14
        rsync
        movi.n            a3, 1
        mov.n             a2, a3
        beq               a8, a3, 3f
0:
        beq               a8, a9, 4f
1:
        retw.n
2:
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a3, 1
        mov.n             a2, a3
        bne               a8, a3, 0b
3:
        mov.n             a2, a9
        bne               a8, a9, 1b
4:
        mov.n             a3, a9
        retw.n

asm_test::compare_exchange::bool::acqrel_seqcst_false_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        mov.n             a3, a2
        retw.n

asm_test::compare_exchange::bool::acquire_acquire_true_true:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a9, 0
        movi.n            a3, 1
        mov.n             a2, a3
        beq               a8, a3, 1f
        beq               a8, a9, 2f
0:
        retw.n
1:
        mov.n             a2, a9
        bne               a8, a9, 0b
2:
        mov.n             a3, a9
        retw.n

asm_test::compare_exchange::bool::acquire_relaxed_true_true:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a9, 0
        movi.n            a3, 1
        mov.n             a2, a3
        beq               a8, a3, 1f
        beq               a8, a9, 2f
0:
        retw.n
1:
        mov.n             a2, a9
        bne               a8, a9, 0b
2:
        mov.n             a3, a9
        retw.n

asm_test::compare_exchange::bool::acquire_seqcst_false_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        beqz              a9, 1f
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        beq               a9, a8, 2f
0:
        mov.n             a3, a2
        retw.n
1:
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0b
2:
        mov.n             a2, a8
        mov.n             a3, a2
        retw.n

asm_test::compare_exchange::bool::acquire_seqcst_true_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 0
        beqi              a8, 1, 2f
        wsr.ps            a14
        rsync
        movi.n            a3, 1
        mov.n             a2, a3
        beq               a8, a3, 3f
0:
        beq               a8, a9, 4f
1:
        retw.n
2:
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a3, 1
        mov.n             a2, a3
        bne               a8, a3, 0b
3:
        mov.n             a2, a9
        bne               a8, a9, 1b
4:
        mov.n             a3, a9
        retw.n

asm_test::compare_exchange::bool::relaxed_acquire_true_true:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a9, 0
        movi.n            a3, 1
        mov.n             a2, a3
        beq               a8, a3, 1f
        beq               a8, a9, 2f
0:
        retw.n
1:
        mov.n             a2, a9
        bne               a8, a9, 0b
2:
        mov.n             a3, a9
        retw.n

asm_test::compare_exchange::bool::relaxed_relaxed_true_true:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a9, 0
        movi.n            a3, 1
        mov.n             a2, a3
        beq               a8, a3, 1f
        beq               a8, a9, 2f
0:
        retw.n
1:
        mov.n             a2, a9
        bne               a8, a9, 0b
2:
        mov.n             a3, a9
        retw.n

asm_test::compare_exchange::bool::relaxed_seqcst_false_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        beqz              a9, 1f
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        beq               a9, a8, 2f
0:
        mov.n             a3, a2
        retw.n
1:
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0b
2:
        mov.n             a2, a8
        mov.n             a3, a2
        retw.n

asm_test::compare_exchange::bool::relaxed_seqcst_true_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 0
        beqi              a8, 1, 2f
        wsr.ps            a14
        rsync
        movi.n            a3, 1
        mov.n             a2, a3
        beq               a8, a3, 3f
0:
        beq               a8, a9, 4f
1:
        retw.n
2:
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a3, 1
        mov.n             a2, a3
        bne               a8, a3, 0b
3:
        mov.n             a2, a9
        bne               a8, a9, 1b
4:
        mov.n             a3, a9
        retw.n

asm_test::compare_exchange::bool::release_acquire_true_true:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a9, 0
        movi.n            a3, 1
        mov.n             a2, a3
        beq               a8, a3, 1f
        beq               a8, a9, 2f
0:
        retw.n
1:
        mov.n             a2, a9
        bne               a8, a9, 0b
2:
        mov.n             a3, a9
        retw.n

asm_test::compare_exchange::bool::release_relaxed_true_true:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a9, 0
        movi.n            a3, 1
        mov.n             a2, a3
        beq               a8, a3, 1f
        beq               a8, a9, 2f
0:
        retw.n
1:
        mov.n             a2, a9
        bne               a8, a9, 0b
2:
        mov.n             a3, a9
        retw.n

asm_test::compare_exchange::bool::release_seqcst_false_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        beqz              a9, 1f
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        beq               a9, a8, 2f
0:
        mov.n             a3, a2
        retw.n
1:
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0b
2:
        mov.n             a2, a8
        mov.n             a3, a2
        retw.n

asm_test::compare_exchange::bool::release_seqcst_true_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 0
        beqi              a8, 1, 2f
        wsr.ps            a14
        rsync
        movi.n            a3, 1
        mov.n             a2, a3
        beq               a8, a3, 3f
0:
        beq               a8, a9, 4f
1:
        retw.n
2:
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a3, 1
        mov.n             a2, a3
        bne               a8, a3, 0b
3:
        mov.n             a2, a9
        bne               a8, a9, 1b
4:
        mov.n             a3, a9
        retw.n

asm_test::compare_exchange::bool::seqcst_acquire_false_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        beqz              a9, 1f
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        beq               a9, a8, 2f
0:
        mov.n             a3, a2
        retw.n
1:
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0b
2:
        mov.n             a2, a8
        mov.n             a3, a2
        retw.n

asm_test::compare_exchange::bool::seqcst_acquire_true_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 0
        beqi              a8, 1, 2f
        wsr.ps            a14
        rsync
        movi.n            a3, 1
        mov.n             a2, a3
        beq               a8, a3, 3f
0:
        beq               a8, a9, 4f
1:
        retw.n
2:
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a3, 1
        mov.n             a2, a3
        bne               a8, a3, 0b
3:
        mov.n             a2, a9
        bne               a8, a9, 1b
4:
        mov.n             a3, a9
        retw.n

asm_test::compare_exchange::bool::seqcst_relaxed_false_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        beqz              a9, 1f
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        beq               a9, a8, 2f
0:
        mov.n             a3, a2
        retw.n
1:
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0b
2:
        mov.n             a2, a8
        mov.n             a3, a2
        retw.n

asm_test::compare_exchange::bool::seqcst_relaxed_true_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 0
        beqi              a8, 1, 2f
        wsr.ps            a14
        rsync
        movi.n            a3, 1
        mov.n             a2, a3
        beq               a8, a3, 3f
0:
        beq               a8, a9, 4f
1:
        retw.n
2:
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a3, 1
        mov.n             a2, a3
        bne               a8, a3, 0b
3:
        mov.n             a2, a9
        bne               a8, a9, 1b
4:
        mov.n             a3, a9
        retw.n

asm_test::compare_exchange::bool::seqcst_seqcst_false_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        mov.n             a3, a2
        retw.n

asm_test::compare_exchange::bool::acqrel_acquire_false_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        mov.n             a3, a2
        retw.n

asm_test::compare_exchange::bool::acqrel_relaxed_false_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        mov.n             a3, a2
        retw.n

asm_test::compare_exchange::bool::acquire_acquire_false_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        beqz              a9, 1f
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        beq               a9, a8, 2f
0:
        mov.n             a3, a2
        retw.n
1:
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0b
2:
        mov.n             a2, a8
        mov.n             a3, a2
        retw.n

asm_test::compare_exchange::bool::acquire_acquire_true_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 0
        beqi              a8, 1, 2f
        wsr.ps            a14
        rsync
        movi.n            a3, 1
        mov.n             a2, a3
        beq               a8, a3, 3f
0:
        beq               a8, a9, 4f
1:
        retw.n
2:
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a3, 1
        mov.n             a2, a3
        bne               a8, a3, 0b
3:
        mov.n             a2, a9
        bne               a8, a9, 1b
4:
        mov.n             a3, a9
        retw.n

asm_test::compare_exchange::bool::acquire_relaxed_false_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        beqz              a9, 1f
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        beq               a9, a8, 2f
0:
        mov.n             a3, a2
        retw.n
1:
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0b
2:
        mov.n             a2, a8
        mov.n             a3, a2
        retw.n

asm_test::compare_exchange::bool::acquire_relaxed_true_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 0
        beqi              a8, 1, 2f
        wsr.ps            a14
        rsync
        movi.n            a3, 1
        mov.n             a2, a3
        beq               a8, a3, 3f
0:
        beq               a8, a9, 4f
1:
        retw.n
2:
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a3, 1
        mov.n             a2, a3
        bne               a8, a3, 0b
3:
        mov.n             a2, a9
        bne               a8, a9, 1b
4:
        mov.n             a3, a9
        retw.n

asm_test::compare_exchange::bool::acquire_seqcst_false_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        mov.n             a3, a2
        retw.n

asm_test::compare_exchange::bool::relaxed_acquire_false_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        beqz              a9, 1f
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        beq               a9, a8, 2f
0:
        mov.n             a3, a2
        retw.n
1:
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0b
2:
        mov.n             a2, a8
        mov.n             a3, a2
        retw.n

asm_test::compare_exchange::bool::relaxed_acquire_true_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 0
        beqi              a8, 1, 2f
        wsr.ps            a14
        rsync
        movi.n            a3, 1
        mov.n             a2, a3
        beq               a8, a3, 3f
0:
        beq               a8, a9, 4f
1:
        retw.n
2:
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a3, 1
        mov.n             a2, a3
        bne               a8, a3, 0b
3:
        mov.n             a2, a9
        bne               a8, a9, 1b
4:
        mov.n             a3, a9
        retw.n

asm_test::compare_exchange::bool::relaxed_relaxed_false_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        beqz              a9, 1f
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        beq               a9, a8, 2f
0:
        mov.n             a3, a2
        retw.n
1:
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0b
2:
        mov.n             a2, a8
        mov.n             a3, a2
        retw.n

asm_test::compare_exchange::bool::relaxed_relaxed_true_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 0
        beqi              a8, 1, 2f
        wsr.ps            a14
        rsync
        movi.n            a3, 1
        mov.n             a2, a3
        beq               a8, a3, 3f
0:
        beq               a8, a9, 4f
1:
        retw.n
2:
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a3, 1
        mov.n             a2, a3
        bne               a8, a3, 0b
3:
        mov.n             a2, a9
        bne               a8, a9, 1b
4:
        mov.n             a3, a9
        retw.n

asm_test::compare_exchange::bool::relaxed_seqcst_false_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        mov.n             a3, a2
        retw.n

asm_test::compare_exchange::bool::release_acquire_false_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        beqz              a9, 1f
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        beq               a9, a8, 2f
0:
        mov.n             a3, a2
        retw.n
1:
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0b
2:
        mov.n             a2, a8
        mov.n             a3, a2
        retw.n

asm_test::compare_exchange::bool::release_acquire_true_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 0
        beqi              a8, 1, 2f
        wsr.ps            a14
        rsync
        movi.n            a3, 1
        mov.n             a2, a3
        beq               a8, a3, 3f
0:
        beq               a8, a9, 4f
1:
        retw.n
2:
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a3, 1
        mov.n             a2, a3
        bne               a8, a3, 0b
3:
        mov.n             a2, a9
        bne               a8, a9, 1b
4:
        mov.n             a3, a9
        retw.n

asm_test::compare_exchange::bool::release_relaxed_false_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        beqz              a9, 1f
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        beq               a9, a8, 2f
0:
        mov.n             a3, a2
        retw.n
1:
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0b
2:
        mov.n             a2, a8
        mov.n             a3, a2
        retw.n

asm_test::compare_exchange::bool::release_relaxed_true_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 0
        beqi              a8, 1, 2f
        wsr.ps            a14
        rsync
        movi.n            a3, 1
        mov.n             a2, a3
        beq               a8, a3, 3f
0:
        beq               a8, a9, 4f
1:
        retw.n
2:
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a3, 1
        mov.n             a2, a3
        bne               a8, a3, 0b
3:
        mov.n             a2, a9
        bne               a8, a9, 1b
4:
        mov.n             a3, a9
        retw.n

asm_test::compare_exchange::bool::release_seqcst_false_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        mov.n             a3, a2
        retw.n

asm_test::compare_exchange::bool::seqcst_acquire_false_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        mov.n             a3, a2
        retw.n

asm_test::compare_exchange::bool::seqcst_relaxed_false_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        mov.n             a3, a2
        retw.n

asm_test::compare_exchange::bool::acquire_acquire_false_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        mov.n             a3, a2
        retw.n

asm_test::compare_exchange::bool::acquire_relaxed_false_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        mov.n             a3, a2
        retw.n

asm_test::compare_exchange::bool::relaxed_acquire_false_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        mov.n             a3, a2
        retw.n

asm_test::compare_exchange::bool::relaxed_relaxed_false_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        mov.n             a3, a2
        retw.n

asm_test::compare_exchange::bool::release_acquire_false_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        mov.n             a3, a2
        retw.n

asm_test::compare_exchange::bool::release_relaxed_false_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        mov.n             a3, a2
        retw.n

asm_test::compare_exchange_weak::u8::acqrel_seqcst:
        entry             a1, 32
        movi              a8, 255
        and               a8, a3, a8
        rsil              a14, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a3, a2, 0
        bne               a3, a8, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange_weak::f32::acqrel_seqcst:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
0:
        wsr.ps            a14
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange_weak::f32::seqcst_seqcst:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
0:
        wsr.ps            a14
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange_weak::f32::acqrel_acquire:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
0:
        wsr.ps            a14
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange_weak::f32::acqrel_relaxed:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
0:
        wsr.ps            a14
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange_weak::f32::acquire_seqcst:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
0:
        wsr.ps            a14
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange_weak::f32::relaxed_seqcst:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
0:
        wsr.ps            a14
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange_weak::f32::release_seqcst:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
0:
        wsr.ps            a14
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange_weak::f32::seqcst_acquire:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
0:
        wsr.ps            a14
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange_weak::f32::seqcst_relaxed:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
0:
        wsr.ps            a14
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange_weak::f32::acquire_acquire:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
0:
        wsr.ps            a14
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange_weak::f32::acquire_relaxed:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
0:
        wsr.ps            a14
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange_weak::f32::relaxed_acquire:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
0:
        wsr.ps            a14
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange_weak::f32::relaxed_relaxed:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
0:
        wsr.ps            a14
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange_weak::f32::release_acquire:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
0:
        wsr.ps            a14
        rsync
        bne               a3, a8, 1f
        movi.n            a2, 0
        retw.n
1:
        movi.n            a2, 1
        retw.n

asm_test::compare_exchange_weak::f32::release_relaxed:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
0:
        wsr.ps            a14
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
        and               a8, a3, a8
        rsil              a14, 15
        l16ui             a3, a2, 0
        bne               a3, a8, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::compare_exchange_weak::u16::seqcst_seqcst:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::seqcst_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::seqcst_seqcst+0x81004136>)
        and               a8, a3, a8
        rsil              a14, 15
        l16ui             a3, a2, 0
        bne               a3, a8, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::compare_exchange_weak::u16::acqrel_acquire:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::acqrel_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::acqrel_acquire+0x81004136>)
        and               a8, a3, a8
        rsil              a14, 15
        l16ui             a3, a2, 0
        bne               a3, a8, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::compare_exchange_weak::u16::acqrel_relaxed:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::acqrel_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::acqrel_relaxed+0x81004136>)
        and               a8, a3, a8
        rsil              a14, 15
        l16ui             a3, a2, 0
        bne               a3, a8, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::compare_exchange_weak::u16::acquire_seqcst:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::acquire_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::acquire_seqcst+0x81004136>)
        and               a8, a3, a8
        rsil              a14, 15
        l16ui             a3, a2, 0
        bne               a3, a8, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::compare_exchange_weak::u16::relaxed_seqcst:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::relaxed_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::relaxed_seqcst+0x81004136>)
        and               a8, a3, a8
        rsil              a14, 15
        l16ui             a3, a2, 0
        bne               a3, a8, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::compare_exchange_weak::u16::release_seqcst:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::release_seqcst:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::release_seqcst+0x81004136>)
        and               a8, a3, a8
        rsil              a14, 15
        l16ui             a3, a2, 0
        bne               a3, a8, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::compare_exchange_weak::u16::seqcst_acquire:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::seqcst_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::seqcst_acquire+0x81004136>)
        and               a8, a3, a8
        rsil              a14, 15
        l16ui             a3, a2, 0
        bne               a3, a8, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::compare_exchange_weak::u16::seqcst_relaxed:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::seqcst_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::seqcst_relaxed+0x81004136>)
        and               a8, a3, a8
        rsil              a14, 15
        l16ui             a3, a2, 0
        bne               a3, a8, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::compare_exchange_weak::u16::acquire_acquire:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::acquire_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::acquire_acquire+0x81004136>)
        and               a8, a3, a8
        rsil              a14, 15
        l16ui             a3, a2, 0
        bne               a3, a8, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::compare_exchange_weak::u16::acquire_relaxed:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::acquire_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::acquire_relaxed+0x81004136>)
        and               a8, a3, a8
        rsil              a14, 15
        l16ui             a3, a2, 0
        bne               a3, a8, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::compare_exchange_weak::u16::relaxed_acquire:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::relaxed_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::relaxed_acquire+0x81004136>)
        and               a8, a3, a8
        rsil              a14, 15
        l16ui             a3, a2, 0
        bne               a3, a8, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::compare_exchange_weak::u16::relaxed_relaxed:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::relaxed_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::relaxed_relaxed+0x81004136>)
        and               a8, a3, a8
        rsil              a14, 15
        l16ui             a3, a2, 0
        bne               a3, a8, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::compare_exchange_weak::u16::release_acquire:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::release_acquire:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::release_acquire+0x81004136>)
        and               a8, a3, a8
        rsil              a14, 15
        l16ui             a3, a2, 0
        bne               a3, a8, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::compare_exchange_weak::u16::release_relaxed:
        .byte             0xff
        .byte             0xff

asm_test::compare_exchange_weak::u16::release_relaxed:
0:
        entry             a1, 32
        l32r              a8, 0b (81004136 <asm_test::compare_exchange_weak::u16::release_relaxed+0x81004136>)
        and               a8, a3, a8
        rsil              a14, 15
        l16ui             a3, a2, 0
        bne               a3, a8, 1f
        s16i              a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
1:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

asm_test::compare_exchange_weak::u32::acqrel_seqcst:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

asm_test::compare_exchange_weak::u32::seqcst_seqcst:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

asm_test::compare_exchange_weak::u32::acqrel_acquire:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

asm_test::compare_exchange_weak::u32::acqrel_relaxed:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

asm_test::compare_exchange_weak::u32::acquire_seqcst:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

asm_test::compare_exchange_weak::u32::relaxed_seqcst:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

asm_test::compare_exchange_weak::u32::release_seqcst:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

asm_test::compare_exchange_weak::u32::seqcst_acquire:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

asm_test::compare_exchange_weak::u32::seqcst_relaxed:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

asm_test::compare_exchange_weak::u32::acquire_acquire:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

asm_test::compare_exchange_weak::u32::acquire_relaxed:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

asm_test::compare_exchange_weak::u32::relaxed_acquire:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

asm_test::compare_exchange_weak::u32::relaxed_relaxed:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

asm_test::compare_exchange_weak::u32::release_acquire:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

asm_test::compare_exchange_weak::u32::release_relaxed:
        entry             a1, 32
        mov.n             a8, a3
        rsil              a14, 15
        l32i.n            a3, a2, 0
        bne               a3, a8, 0f
        s32i.n            a4, a2, 0
        movi.n            a2, 0
        wsr.ps            a14
        rsync
        retw.n
0:
        movi.n            a2, 1
        wsr.ps            a14
        rsync
        retw.n

asm_test::compare_exchange_weak::bool::acqrel_seqcst:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a9, a2, 0
        bne               a9, a3, 0f
        s8i               a4, a2, 0
0:
        wsr.ps            a14
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

asm_test::or::u8::acqrel_all:
        entry             a1, 32
        rsil              a14, 15
        movi              a8, 255
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u8::seqcst_all:
        entry             a1, 32
        rsil              a14, 15
        movi              a8, 255
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u8::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u8::acquire_all:
        entry             a1, 32
        rsil              a14, 15
        movi              a8, 255
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u8::relaxed_all:
        entry             a1, 32
        rsil              a14, 15
        movi              a8, 255
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u8::release_all:
        entry             a1, 32
        rsil              a14, 15
        movi              a8, 255
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u8::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u8::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u8::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u8::release_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u8::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        or                a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u8::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        or                a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u8::acquire:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        or                a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u8::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        or                a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u8::release:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        or                a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::or::u16::acqrel_all:
        .byte             0xff
        .byte             0xff

asm_test::or::u16::acqrel_all:
        entry             a1, 32
        rsil              a14, 15
        l32r              a8, 4 <asm_test::or::u16::acqrel_all+0x4> (ff81006f <asm_test::or::u16::acqrel_all+0xff81006f>)
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::or::u16::seqcst_all:
        .byte             0xff
        .byte             0xff

asm_test::or::u16::seqcst_all:
        entry             a1, 32
        rsil              a14, 15
        l32r              a8, 4 <asm_test::or::u16::seqcst_all+0x4> (ff81006f <asm_test::or::u16::seqcst_all+0xff81006f>)
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u16::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::or::u16::acquire_all:
        .byte             0xff
        .byte             0xff

asm_test::or::u16::acquire_all:
        entry             a1, 32
        rsil              a14, 15
        l32r              a8, 4 <asm_test::or::u16::acquire_all+0x4> (ff81006f <asm_test::or::u16::acquire_all+0xff81006f>)
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::or::u16::relaxed_all:
        .byte             0xff
        .byte             0xff

asm_test::or::u16::relaxed_all:
        entry             a1, 32
        rsil              a14, 15
        l32r              a8, 4 <asm_test::or::u16::relaxed_all+0x4> (ff81006f <asm_test::or::u16::relaxed_all+0xff81006f>)
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::or::u16::release_all:
        .byte             0xff
        .byte             0xff

asm_test::or::u16::release_all:
        entry             a1, 32
        rsil              a14, 15
        l32r              a8, 4 <asm_test::or::u16::release_all+0x4> (ff81006f <asm_test::or::u16::release_all+0xff81006f>)
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u16::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u16::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u16::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u16::release_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u16::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        or                a8, a8, a3
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u16::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        or                a8, a8, a3
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u16::acquire:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        or                a8, a8, a3
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u16::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        or                a8, a8, a3
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u16::release:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        or                a8, a8, a3
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u32::acqrel_all:
        entry             a1, 32
        rsil              a14, 15
        movi.n            a8, -1
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u32::seqcst_all:
        entry             a1, 32
        rsil              a14, 15
        movi.n            a8, -1
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u32::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u32::acquire_all:
        entry             a1, 32
        rsil              a14, 15
        movi.n            a8, -1
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u32::relaxed_all:
        entry             a1, 32
        rsil              a14, 15
        movi.n            a8, -1
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u32::release_all:
        entry             a1, 32
        rsil              a14, 15
        movi.n            a8, -1
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u32::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u32::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u32::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u32::release_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u32::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        or                a8, a8, a3
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u32::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        or                a8, a8, a3
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u32::acquire:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        or                a8, a8, a3
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u32::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        or                a8, a8, a3
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::u32::release:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        or                a8, a8, a3
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::bool::acqrel_true:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 1
        or                a8, a8, a9
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::bool::seqcst_true:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 1
        or                a8, a8, a9
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::bool::acqrel_false:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::bool::acquire_true:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 1
        or                a8, a8, a9
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::bool::relaxed_true:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 1
        or                a8, a8, a9
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::bool::release_true:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 1
        or                a8, a8, a9
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::bool::seqcst_false:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::bool::acquire_false:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::bool::relaxed_false:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::bool::release_false:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::bool::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        or                a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::bool::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        or                a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::bool::acquire:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        or                a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::bool::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        or                a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::or::bool::release:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        or                a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::add::u8::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::add::u8::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::add::u8::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::add::u8::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::add::u8::release_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::add::u8::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        add.n             a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::add::u8::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        add.n             a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::add::u8::acquire:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        add.n             a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::add::u8::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        add.n             a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::add::u8::release:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        add.n             a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::add::u16::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::add::u16::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::add::u16::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::add::u16::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::add::u16::release_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::add::u16::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        add.n             a8, a8, a3
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::add::u16::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        add.n             a8, a8, a3
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::add::u16::acquire:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        add.n             a8, a8, a3
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::add::u16::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        add.n             a8, a8, a3
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::add::u16::release:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        add.n             a8, a8, a3
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::add::u32::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::add::u32::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::add::u32::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::add::u32::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::add::u32::release_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::add::u32::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        add.n             a8, a8, a3
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::add::u32::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        add.n             a8, a8, a3
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::add::u32::acquire:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        add.n             a8, a8, a3
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::add::u32::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        add.n             a8, a8, a3
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::add::u32::release:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        add.n             a8, a8, a3
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u8::acqrel_all:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u8::seqcst_all:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u8::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        movi.n            a8, 0
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u8::acquire_all:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u8::relaxed_all:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u8::release_all:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u8::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        movi.n            a8, 0
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u8::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        movi.n            a8, 0
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u8::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        movi.n            a8, 0
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u8::release_zero:
        entry             a1, 32
        rsil              a14, 15
        movi.n            a8, 0
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u8::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        and               a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u8::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        and               a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u8::acquire:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        and               a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u8::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        and               a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u8::release:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        and               a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u16::acqrel_all:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u16::seqcst_all:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u16::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        movi.n            a8, 0
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u16::acquire_all:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u16::relaxed_all:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u16::release_all:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u16::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        movi.n            a8, 0
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u16::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        movi.n            a8, 0
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u16::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        movi.n            a8, 0
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u16::release_zero:
        entry             a1, 32
        rsil              a14, 15
        movi.n            a8, 0
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u16::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        and               a8, a8, a3
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u16::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        and               a8, a8, a3
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u16::acquire:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        and               a8, a8, a3
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u16::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        and               a8, a8, a3
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u16::release:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        and               a8, a8, a3
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u32::acqrel_all:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u32::seqcst_all:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u32::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        movi.n            a8, 0
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u32::acquire_all:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u32::relaxed_all:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u32::release_all:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u32::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        movi.n            a8, 0
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u32::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        movi.n            a8, 0
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u32::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        movi.n            a8, 0
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u32::release_zero:
        entry             a1, 32
        rsil              a14, 15
        movi.n            a8, 0
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u32::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        and               a8, a8, a3
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u32::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        and               a8, a8, a3
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u32::acquire:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        and               a8, a8, a3
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u32::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        and               a8, a8, a3
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::u32::release:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        and               a8, a8, a3
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::bool::acqrel_true:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 1
        and               a8, a8, a9
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::bool::seqcst_true:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 1
        and               a8, a8, a9
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::bool::acqrel_false:
        entry             a1, 32
        rsil              a14, 15
        movi.n            a8, 0
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::bool::acquire_true:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 1
        and               a8, a8, a9
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::bool::relaxed_true:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 1
        and               a8, a8, a9
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::bool::release_true:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 1
        and               a8, a8, a9
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::bool::seqcst_false:
        entry             a1, 32
        rsil              a14, 15
        movi.n            a8, 0
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::bool::acquire_false:
        entry             a1, 32
        rsil              a14, 15
        movi.n            a8, 0
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::bool::relaxed_false:
        entry             a1, 32
        rsil              a14, 15
        movi.n            a8, 0
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::bool::release_false:
        entry             a1, 32
        rsil              a14, 15
        movi.n            a8, 0
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::bool::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        and               a8, a3, a8
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::bool::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        and               a8, a3, a8
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::bool::acquire:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        and               a8, a3, a8
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::bool::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        and               a8, a3, a8
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::and::bool::release:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        and               a8, a3, a8
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::neg::u8::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        neg               a8, a8
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::neg::u8::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        neg               a8, a8
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::neg::u8::acquire:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        neg               a8, a8
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::neg::u8::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        neg               a8, a8
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::neg::u8::release:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        neg               a8, a8
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::neg::u16::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        neg               a8, a8
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::neg::u16::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        neg               a8, a8
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::neg::u16::acquire:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        neg               a8, a8
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::neg::u16::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        neg               a8, a8
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::neg::u16::release:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        neg               a8, a8
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::neg::u32::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        neg               a8, a8
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::neg::u32::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        neg               a8, a8
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::neg::u32::acquire:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        neg               a8, a8
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::neg::u32::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        neg               a8, a8
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::neg::u32::release:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        neg               a8, a8
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::not::u8::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, -1
        xor               a8, a8, a9
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::not::u8::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, -1
        xor               a8, a8, a9
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::not::u8::acquire:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, -1
        xor               a8, a8, a9
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::not::u8::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, -1
        xor               a8, a8, a9
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::not::u8::release:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, -1
        xor               a8, a8, a9
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::not::u16::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        movi.n            a9, -1
        xor               a8, a8, a9
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::not::u16::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        movi.n            a9, -1
        xor               a8, a8, a9
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::not::u16::acquire:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        movi.n            a9, -1
        xor               a8, a8, a9
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::not::u16::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        movi.n            a9, -1
        xor               a8, a8, a9
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::not::u16::release:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        movi.n            a9, -1
        xor               a8, a8, a9
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::not::u32::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        movi.n            a9, -1
        xor               a8, a8, a9
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::not::u32::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        movi.n            a9, -1
        xor               a8, a8, a9
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::not::u32::acquire:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        movi.n            a9, -1
        xor               a8, a8, a9
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::not::u32::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        movi.n            a9, -1
        xor               a8, a8, a9
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::not::u32::release:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        movi.n            a9, -1
        xor               a8, a8, a9
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::not::bool::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 1
        xor               a8, a8, a9
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::not::bool::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 1
        xor               a8, a8, a9
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::not::bool::acquire:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 1
        xor               a8, a8, a9
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::not::bool::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 1
        xor               a8, a8, a9
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::not::bool::release:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 1
        xor               a8, a8, a9
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::sub::u8::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::sub::u8::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::sub::u8::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::sub::u8::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::sub::u8::release_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::sub::u8::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        sub               a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::sub::u8::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        sub               a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::sub::u8::acquire:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        sub               a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::sub::u8::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        sub               a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::sub::u8::release:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        sub               a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::sub::u16::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::sub::u16::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::sub::u16::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::sub::u16::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::sub::u16::release_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::sub::u16::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        sub               a8, a8, a3
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::sub::u16::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        sub               a8, a8, a3
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::sub::u16::acquire:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        sub               a8, a8, a3
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::sub::u16::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        sub               a8, a8, a3
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::sub::u16::release:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        sub               a8, a8, a3
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::sub::u32::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::sub::u32::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::sub::u32::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::sub::u32::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::sub::u32::release_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::sub::u32::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        sub               a8, a8, a3
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::sub::u32::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        sub               a8, a8, a3
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::sub::u32::acquire:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        sub               a8, a8, a3
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::sub::u32::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        sub               a8, a8, a3
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::sub::u32::release:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        sub               a8, a8, a3
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::u8::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::u8::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::u8::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::u8::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::u8::release_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::u8::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        xor               a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::u8::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        xor               a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::u8::acquire:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        xor               a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::u8::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        xor               a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::u8::release:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        xor               a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::u16::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::u16::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::u16::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::u16::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::u16::release_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::u16::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        xor               a8, a8, a3
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::u16::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        xor               a8, a8, a3
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::u16::acquire:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        xor               a8, a8, a3
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::u16::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        xor               a8, a8, a3
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::u16::release:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        xor               a8, a8, a3
        s16i              a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::u32::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::u32::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::u32::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::u32::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::u32::release_zero:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::u32::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        xor               a8, a8, a3
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::u32::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        xor               a8, a8, a3
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::u32::acquire:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        xor               a8, a8, a3
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::u32::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        xor               a8, a8, a3
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::u32::release:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        xor               a8, a8, a3
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::bool::acqrel_true:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 1
        xor               a8, a8, a9
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::bool::seqcst_true:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 1
        xor               a8, a8, a9
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::bool::acqrel_false:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::bool::acquire_true:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 1
        xor               a8, a8, a9
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::bool::relaxed_true:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 1
        xor               a8, a8, a9
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::bool::release_true:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 1
        xor               a8, a8, a9
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::bool::seqcst_false:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::bool::acquire_false:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::bool::relaxed_false:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::bool::release_false:
        entry             a1, 32
        rsil              a14, 15
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::bool::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        xor               a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::bool::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        xor               a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::bool::acquire:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        xor               a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::bool::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        xor               a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::xor::bool::release:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        xor               a8, a8, a3
        s8i               a8, a2, 0
        wsr.ps            a14
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
        rsil              a14, 15
        l8ui              a8, a2, 0
        s8i               a3, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::u8::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        s8i               a3, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::u8::acquire:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        s8i               a3, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::u8::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        s8i               a3, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::u8::release:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        s8i               a3, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::f32::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        s32i.n            a3, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::f32::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        s32i.n            a3, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::f32::acquire:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        s32i.n            a3, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::f32::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        s32i.n            a3, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::f32::release:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        s32i.n            a3, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::u16::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        s16i              a3, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::u16::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        s16i              a3, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::u16::acquire:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        s16i              a3, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::u16::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        s16i              a3, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::u16::release:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        s16i              a3, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::u32::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        s32i.n            a3, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::u32::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        s32i.n            a3, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::u32::acquire:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        s32i.n            a3, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::u32::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        s32i.n            a3, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::u32::release:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        s32i.n            a3, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::swap::bool::acqrel_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::swap::bool::seqcst_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::swap::bool::acqrel_false:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 0
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        beq               a9, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::swap::bool::acquire_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::swap::bool::relaxed_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::swap::bool::release_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::swap::bool::seqcst_false:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 0
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        beq               a9, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::swap::bool::acquire_false:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 0
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        beq               a9, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::swap::bool::relaxed_false:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 0
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        beq               a9, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::swap::bool::release_false:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 0
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        beq               a9, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::swap::bool::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        s8i               a3, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::swap::bool::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        s8i               a3, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::swap::bool::acquire:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        s8i               a3, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::swap::bool::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        s8i               a3, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::swap::bool::release:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        s8i               a3, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
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

asm_test::bit_set::u8::acqrel:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 7
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        rsil              a14, 15
        l8ui              a10, a8, 0
        or                a11, a10, a9
        s8i               a11, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a10, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_set::u8::seqcst:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 7
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        rsil              a14, 15
        l8ui              a10, a8, 0
        or                a11, a10, a9
        s8i               a11, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a10, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_set::u8::acquire:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 7
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        rsil              a14, 15
        l8ui              a10, a8, 0
        or                a11, a10, a9
        s8i               a11, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a10, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_set::u8::relaxed:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 7
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        rsil              a14, 15
        l8ui              a10, a8, 0
        or                a11, a10, a9
        s8i               a11, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a10, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_set::u8::release:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 7
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        rsil              a14, 15
        l8ui              a10, a8, 0
        or                a11, a10, a9
        s8i               a11, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a10, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_set::u16::acqrel:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 15
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        rsil              a14, 15
        l16ui             a10, a8, 0
        or                a11, a10, a9
        s16i              a11, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a10, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_set::u16::seqcst:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 15
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        rsil              a14, 15
        l16ui             a10, a8, 0
        or                a11, a10, a9
        s16i              a11, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a10, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_set::u16::acquire:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 15
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        rsil              a14, 15
        l16ui             a10, a8, 0
        or                a11, a10, a9
        s16i              a11, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a10, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_set::u16::relaxed:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 15
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        rsil              a14, 15
        l16ui             a10, a8, 0
        or                a11, a10, a9
        s16i              a11, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a10, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_set::u16::release:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 15
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        rsil              a14, 15
        l16ui             a10, a8, 0
        or                a11, a10, a9
        s16i              a11, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a10, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_set::u32::acqrel:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 31
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        rsil              a14, 15
        l32i.n            a10, a8, 0
        or                a11, a10, a9
        s32i.n            a11, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a10, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_set::u32::seqcst:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 31
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        rsil              a14, 15
        l32i.n            a10, a8, 0
        or                a11, a10, a9
        s32i.n            a11, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a10, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_set::u32::acquire:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 31
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        rsil              a14, 15
        l32i.n            a10, a8, 0
        or                a11, a10, a9
        s32i.n            a11, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a10, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_set::u32::relaxed:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 31
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        rsil              a14, 15
        l32i.n            a10, a8, 0
        or                a11, a10, a9
        s32i.n            a11, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a10, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_set::u32::release:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 31
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        rsil              a14, 15
        l32i.n            a10, a8, 0
        or                a11, a10, a9
        s32i.n            a11, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a10, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_or::u8::acqrel_all:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi              a9, 255
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u8::seqcst_all:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi              a9, 255
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u8::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_or::u8::acquire_all:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi              a9, 255
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u8::relaxed_all:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi              a9, 255
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u8::release_all:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi              a9, 255
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u8::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_or::u8::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_or::u8::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_or::u8::release_zero:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_or::u8::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        or                a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u8::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        or                a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u8::acquire:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        or                a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u8::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        or                a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u8::release:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        or                a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

.literal.asm_test::fetch_or::u16::acqrel_all:
        .byte             0xff
        .byte             0xff

asm_test::fetch_or::u16::acqrel_all:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        l32r              a9, 8 <asm_test::fetch_or::u16::acqrel_all+0x8> (ffff9100 <asm_test::fetch_or::u16::acqrel_all+0xffff9100>)
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

.literal.asm_test::fetch_or::u16::seqcst_all:
        .byte             0xff
        .byte             0xff

asm_test::fetch_or::u16::seqcst_all:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        l32r              a9, 8 <asm_test::fetch_or::u16::seqcst_all+0x8> (ffff9100 <asm_test::fetch_or::u16::seqcst_all+0xffff9100>)
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u16::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

.literal.asm_test::fetch_or::u16::acquire_all:
        .byte             0xff
        .byte             0xff

asm_test::fetch_or::u16::acquire_all:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        l32r              a9, 8 <asm_test::fetch_or::u16::acquire_all+0x8> (ffff9100 <asm_test::fetch_or::u16::acquire_all+0xffff9100>)
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

.literal.asm_test::fetch_or::u16::relaxed_all:
        .byte             0xff
        .byte             0xff

asm_test::fetch_or::u16::relaxed_all:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        l32r              a9, 8 <asm_test::fetch_or::u16::relaxed_all+0x8> (ffff9100 <asm_test::fetch_or::u16::relaxed_all+0xffff9100>)
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

.literal.asm_test::fetch_or::u16::release_all:
        .byte             0xff
        .byte             0xff

asm_test::fetch_or::u16::release_all:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        l32r              a9, 8 <asm_test::fetch_or::u16::release_all+0x8> (ffff9100 <asm_test::fetch_or::u16::release_all+0xffff9100>)
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u16::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_or::u16::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_or::u16::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_or::u16::release_zero:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_or::u16::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        or                a9, a8, a3
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u16::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        or                a9, a8, a3
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u16::acquire:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        or                a9, a8, a3
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u16::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        or                a9, a8, a3
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u16::release:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        or                a9, a8, a3
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u32::acqrel_all:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        movi.n            a9, -1
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u32::seqcst_all:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        movi.n            a9, -1
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u32::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_or::u32::acquire_all:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        movi.n            a9, -1
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u32::relaxed_all:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        movi.n            a9, -1
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u32::release_all:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        movi.n            a9, -1
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u32::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_or::u32::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_or::u32::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_or::u32::release_zero:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_or::u32::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        or                a9, a8, a3
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u32::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        or                a9, a8, a3
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u32::acquire:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        or                a9, a8, a3
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u32::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        or                a9, a8, a3
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::u32::release:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        or                a9, a8, a3
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_or::bool::acqrel_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        or                a10, a9, a2
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_or::bool::seqcst_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        or                a10, a9, a2
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_or::bool::acqrel_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_or::bool::acquire_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        or                a10, a9, a2
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_or::bool::relaxed_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        or                a10, a9, a2
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_or::bool::release_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        or                a10, a9, a2
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_or::bool::seqcst_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_or::bool::acquire_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_or::bool::relaxed_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_or::bool::release_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_or::bool::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        or                a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_or::bool::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        or                a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_or::bool::acquire:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        or                a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_or::bool::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        or                a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_or::bool::release:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        or                a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::bit_clear::u8::acqrel:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 7
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        movi.n            a10, -1
        xor               a10, a9, a10
        rsil              a14, 15
        l8ui              a11, a8, 0
        and               a10, a11, a10
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a11, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_clear::u8::seqcst:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 7
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        movi.n            a10, -1
        xor               a10, a9, a10
        rsil              a14, 15
        l8ui              a11, a8, 0
        and               a10, a11, a10
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a11, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_clear::u8::acquire:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 7
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        movi.n            a10, -1
        xor               a10, a9, a10
        rsil              a14, 15
        l8ui              a11, a8, 0
        and               a10, a11, a10
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a11, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_clear::u8::relaxed:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 7
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        movi.n            a10, -1
        xor               a10, a9, a10
        rsil              a14, 15
        l8ui              a11, a8, 0
        and               a10, a11, a10
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a11, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_clear::u8::release:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 7
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        movi.n            a10, -1
        xor               a10, a9, a10
        rsil              a14, 15
        l8ui              a11, a8, 0
        and               a10, a11, a10
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a11, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_clear::u16::acqrel:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 15
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        movi.n            a10, -1
        xor               a10, a9, a10
        rsil              a14, 15
        l16ui             a11, a8, 0
        and               a10, a11, a10
        s16i              a10, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a11, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_clear::u16::seqcst:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 15
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        movi.n            a10, -1
        xor               a10, a9, a10
        rsil              a14, 15
        l16ui             a11, a8, 0
        and               a10, a11, a10
        s16i              a10, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a11, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_clear::u16::acquire:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 15
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        movi.n            a10, -1
        xor               a10, a9, a10
        rsil              a14, 15
        l16ui             a11, a8, 0
        and               a10, a11, a10
        s16i              a10, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a11, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_clear::u16::relaxed:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 15
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        movi.n            a10, -1
        xor               a10, a9, a10
        rsil              a14, 15
        l16ui             a11, a8, 0
        and               a10, a11, a10
        s16i              a10, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a11, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_clear::u16::release:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 15
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        movi.n            a10, -1
        xor               a10, a9, a10
        rsil              a14, 15
        l16ui             a11, a8, 0
        and               a10, a11, a10
        s16i              a10, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a11, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_clear::u32::acqrel:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 31
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        movi.n            a10, -1
        xor               a10, a9, a10
        rsil              a14, 15
        l32i.n            a11, a8, 0
        and               a10, a11, a10
        s32i.n            a10, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a11, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_clear::u32::seqcst:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 31
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        movi.n            a10, -1
        xor               a10, a9, a10
        rsil              a14, 15
        l32i.n            a11, a8, 0
        and               a10, a11, a10
        s32i.n            a10, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a11, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_clear::u32::acquire:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 31
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        movi.n            a10, -1
        xor               a10, a9, a10
        rsil              a14, 15
        l32i.n            a11, a8, 0
        and               a10, a11, a10
        s32i.n            a10, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a11, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_clear::u32::relaxed:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 31
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        movi.n            a10, -1
        xor               a10, a9, a10
        rsil              a14, 15
        l32i.n            a11, a8, 0
        and               a10, a11, a10
        s32i.n            a10, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a11, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::bit_clear::u32::release:
        entry             a1, 32
        mov.n             a8, a2
        movi.n            a9, 31
        and               a9, a3, a9
        movi.n            a2, 1
        ssl               a9
        sll               a9, a2
        movi.n            a10, -1
        xor               a10, a9, a10
        rsil              a14, 15
        l32i.n            a11, a8, 0
        and               a10, a11, a10
        s32i.n            a10, a8, 0
        wsr.ps            a14
        rsync
        and               a9, a11, a9
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

.literal.asm_test::fetch_abs::f32::acqrel:
        .byte             0xff
        .byte             0xff
        .byte             0xff
        .byte             0x7f

asm_test::fetch_abs::f32::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        l32r              a9, fffc0008 <asm_test::fetch_abs::f32::acqrel+0xfffc0008>
        and               a9, a8, a9
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

.literal.asm_test::fetch_abs::f32::seqcst:
        .byte             0xff
        .byte             0xff
        .byte             0xff
        .byte             0x7f

asm_test::fetch_abs::f32::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        l32r              a9, fffc0008 <asm_test::fetch_abs::f32::seqcst+0xfffc0008>
        and               a9, a8, a9
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

.literal.asm_test::fetch_abs::f32::acquire:
        .byte             0xff
        .byte             0xff
        .byte             0xff
        .byte             0x7f

asm_test::fetch_abs::f32::acquire:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        l32r              a9, fffc0008 <asm_test::fetch_abs::f32::acquire+0xfffc0008>
        and               a9, a8, a9
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

.literal.asm_test::fetch_abs::f32::relaxed:
        .byte             0xff
        .byte             0xff
        .byte             0xff
        .byte             0x7f

asm_test::fetch_abs::f32::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        l32r              a9, fffc0008 <asm_test::fetch_abs::f32::relaxed+0xfffc0008>
        and               a9, a8, a9
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

.literal.asm_test::fetch_abs::f32::release:
        .byte             0xff
        .byte             0xff
        .byte             0xff
        .byte             0x7f

asm_test::fetch_abs::f32::release:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        l32r              a9, fffc0008 <asm_test::fetch_abs::f32::release+0xfffc0008>
        and               a9, a8, a9
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_add::u8::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_add::u8::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_add::u8::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_add::u8::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_add::u8::release_zero:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_add::u8::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        add.n             a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_add::u8::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        add.n             a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_add::u8::acquire:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        add.n             a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_add::u8::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        add.n             a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_add::u8::release:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        add.n             a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

.literal.asm_test::fetch_add::f32::acqrel_zero:
        ill

asm_test::fetch_add::f32::acqrel_zero:
        entry             a1, 32
        l32i.n            a7, a2, 0
        rsil              a14, 15
        l32i.n            a8, a2, 0
        beq               a8, a7, 1f
0:
        mov.n             a7, a8
        wsr.ps            a14
        rsync
        rsil              a14, 15
        l32i.n            a8, a2, 0
        bne               a8, a7, 0b
1:
        movi.n            a11, 0
        l32r              a8, 1c <asm_test::fetch_add::f32::acqrel_zero+0x1c> (810b0cef <asm_test::fetch_add::f32::acqrel_zero+0x810b0cef>)
        mov.n             a10, a7
        mov.n             a6, a14
        callx8            a8
        s32i.n            a10, a2, 0
        mov.n             a14, a6
        wsr.ps            a14
        rsync
        mov.n             a2, a7
        retw.n

.literal.asm_test::fetch_add::f32::seqcst_zero:
        ill

asm_test::fetch_add::f32::seqcst_zero:
        entry             a1, 32
        l32i.n            a7, a2, 0
        rsil              a14, 15
        l32i.n            a8, a2, 0
        beq               a8, a7, 1f
0:
        mov.n             a7, a8
        wsr.ps            a14
        rsync
        rsil              a14, 15
        l32i.n            a8, a2, 0
        bne               a8, a7, 0b
1:
        movi.n            a11, 0
        l32r              a8, 1c <asm_test::fetch_add::f32::seqcst_zero+0x1c> (810b0cef <asm_test::fetch_add::f32::seqcst_zero+0x810b0cef>)
        mov.n             a10, a7
        mov.n             a6, a14
        callx8            a8
        s32i.n            a10, a2, 0
        mov.n             a14, a6
        wsr.ps            a14
        rsync
        mov.n             a2, a7
        retw.n

.literal.asm_test::fetch_add::f32::acquire_zero:
        ill

asm_test::fetch_add::f32::acquire_zero:
        entry             a1, 32
        l32i.n            a7, a2, 0
        rsil              a14, 15
        l32i.n            a8, a2, 0
        beq               a8, a7, 1f
0:
        mov.n             a7, a8
        wsr.ps            a14
        rsync
        rsil              a14, 15
        l32i.n            a8, a2, 0
        bne               a8, a7, 0b
1:
        movi.n            a11, 0
        l32r              a8, 1c <asm_test::fetch_add::f32::acquire_zero+0x1c> (810b0cef <asm_test::fetch_add::f32::acquire_zero+0x810b0cef>)
        mov.n             a10, a7
        mov.n             a6, a14
        callx8            a8
        s32i.n            a10, a2, 0
        mov.n             a14, a6
        wsr.ps            a14
        rsync
        mov.n             a2, a7
        retw.n

.literal.asm_test::fetch_add::f32::relaxed_zero:
        ill

asm_test::fetch_add::f32::relaxed_zero:
        entry             a1, 32
        l32i.n            a7, a2, 0
        rsil              a14, 15
        l32i.n            a8, a2, 0
        beq               a8, a7, 1f
0:
        mov.n             a7, a8
        wsr.ps            a14
        rsync
        rsil              a14, 15
        l32i.n            a8, a2, 0
        bne               a8, a7, 0b
1:
        movi.n            a11, 0
        l32r              a8, 1c <asm_test::fetch_add::f32::relaxed_zero+0x1c> (810b0cef <asm_test::fetch_add::f32::relaxed_zero+0x810b0cef>)
        mov.n             a10, a7
        mov.n             a6, a14
        callx8            a8
        s32i.n            a10, a2, 0
        mov.n             a14, a6
        wsr.ps            a14
        rsync
        mov.n             a2, a7
        retw.n

.literal.asm_test::fetch_add::f32::release_zero:
        ill

asm_test::fetch_add::f32::release_zero:
        entry             a1, 32
        l32i.n            a7, a2, 0
        rsil              a14, 15
        l32i.n            a8, a2, 0
        beq               a8, a7, 1f
0:
        mov.n             a7, a8
        wsr.ps            a14
        rsync
        rsil              a14, 15
        l32i.n            a8, a2, 0
        bne               a8, a7, 0b
1:
        movi.n            a11, 0
        l32r              a8, 1c <asm_test::fetch_add::f32::release_zero+0x1c> (810b0cef <asm_test::fetch_add::f32::release_zero+0x810b0cef>)
        mov.n             a10, a7
        mov.n             a6, a14
        callx8            a8
        s32i.n            a10, a2, 0
        mov.n             a14, a6
        wsr.ps            a14
        rsync
        mov.n             a2, a7
        retw.n

.literal.asm_test::fetch_add::f32::acqrel:
        ill

asm_test::fetch_add::f32::acqrel:
        entry             a1, 32
        mov.n             a10, a3
        l32i.n            a7, a2, 0
        rsil              a14, 15
        l32i.n            a8, a2, 0
        beq               a8, a7, 2f
0:
        mov.n             a7, a8
        wsr.ps            a14
        rsync
        rsil              a14, 15
        l32i.n            a8, a2, 0
1:
        bne               a8, a7, 0b
2:
        l32r              a8, 1b (81ef9877 <asm_test::fetch_add::f32::acqrel+0x81ef9877>)
        mov.n             a11, a7
        mov.n             a6, a14
        callx8            a8
        s32i.n            a10, a2, 0
        mov.n             a14, a6
        wsr.ps            a14
        rsync
        mov.n             a2, a7
        retw.n

.literal.asm_test::fetch_add::f32::seqcst:
        ill

asm_test::fetch_add::f32::seqcst:
        entry             a1, 32
        mov.n             a10, a3
        l32i.n            a7, a2, 0
        rsil              a14, 15
        l32i.n            a8, a2, 0
        beq               a8, a7, 2f
0:
        mov.n             a7, a8
        wsr.ps            a14
        rsync
        rsil              a14, 15
        l32i.n            a8, a2, 0
1:
        bne               a8, a7, 0b
2:
        l32r              a8, 1b (81ef9877 <asm_test::fetch_add::f32::seqcst+0x81ef9877>)
        mov.n             a11, a7
        mov.n             a6, a14
        callx8            a8
        s32i.n            a10, a2, 0
        mov.n             a14, a6
        wsr.ps            a14
        rsync
        mov.n             a2, a7
        retw.n

.literal.asm_test::fetch_add::f32::acquire:
        ill

asm_test::fetch_add::f32::acquire:
        entry             a1, 32
        mov.n             a10, a3
        l32i.n            a7, a2, 0
        rsil              a14, 15
        l32i.n            a8, a2, 0
        beq               a8, a7, 2f
0:
        mov.n             a7, a8
        wsr.ps            a14
        rsync
        rsil              a14, 15
        l32i.n            a8, a2, 0
1:
        bne               a8, a7, 0b
2:
        l32r              a8, 1b (81ef9877 <asm_test::fetch_add::f32::acquire+0x81ef9877>)
        mov.n             a11, a7
        mov.n             a6, a14
        callx8            a8
        s32i.n            a10, a2, 0
        mov.n             a14, a6
        wsr.ps            a14
        rsync
        mov.n             a2, a7
        retw.n

.literal.asm_test::fetch_add::f32::relaxed:
        ill

asm_test::fetch_add::f32::relaxed:
        entry             a1, 32
        mov.n             a10, a3
        l32i.n            a7, a2, 0
        rsil              a14, 15
        l32i.n            a8, a2, 0
        beq               a8, a7, 2f
0:
        mov.n             a7, a8
        wsr.ps            a14
        rsync
        rsil              a14, 15
        l32i.n            a8, a2, 0
1:
        bne               a8, a7, 0b
2:
        l32r              a8, 1b (81ef9877 <asm_test::fetch_add::f32::relaxed+0x81ef9877>)
        mov.n             a11, a7
        mov.n             a6, a14
        callx8            a8
        s32i.n            a10, a2, 0
        mov.n             a14, a6
        wsr.ps            a14
        rsync
        mov.n             a2, a7
        retw.n

.literal.asm_test::fetch_add::f32::release:
        ill

asm_test::fetch_add::f32::release:
        entry             a1, 32
        mov.n             a10, a3
        l32i.n            a7, a2, 0
        rsil              a14, 15
        l32i.n            a8, a2, 0
        beq               a8, a7, 2f
0:
        mov.n             a7, a8
        wsr.ps            a14
        rsync
        rsil              a14, 15
        l32i.n            a8, a2, 0
1:
        bne               a8, a7, 0b
2:
        l32r              a8, 1b (81ef9877 <asm_test::fetch_add::f32::release+0x81ef9877>)
        mov.n             a11, a7
        mov.n             a6, a14
        callx8            a8
        s32i.n            a10, a2, 0
        mov.n             a14, a6
        wsr.ps            a14
        rsync
        mov.n             a2, a7
        retw.n

asm_test::fetch_add::u16::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_add::u16::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_add::u16::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_add::u16::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_add::u16::release_zero:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_add::u16::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        add.n             a9, a8, a3
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_add::u16::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        add.n             a9, a8, a3
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_add::u16::acquire:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        add.n             a9, a8, a3
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_add::u16::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        add.n             a9, a8, a3
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_add::u16::release:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        add.n             a9, a8, a3
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_add::u32::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_add::u32::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_add::u32::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_add::u32::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_add::u32::release_zero:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_add::u32::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        add.n             a9, a8, a3
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_add::u32::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        add.n             a9, a8, a3
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_add::u32::acquire:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        add.n             a9, a8, a3
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_add::u32::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        add.n             a9, a8, a3
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_add::u32::release:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        add.n             a9, a8, a3
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u8::acqrel_all:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_and::u8::seqcst_all:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_and::u8::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 0
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u8::acquire_all:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_and::u8::relaxed_all:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_and::u8::release_all:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_and::u8::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 0
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u8::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 0
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u8::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 0
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u8::release_zero:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, 0
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u8::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        and               a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u8::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        and               a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u8::acquire:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        and               a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u8::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        and               a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u8::release:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        and               a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u16::acqrel_all:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_and::u16::seqcst_all:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_and::u16::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        movi.n            a9, 0
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u16::acquire_all:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_and::u16::relaxed_all:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_and::u16::release_all:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_and::u16::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        movi.n            a9, 0
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u16::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        movi.n            a9, 0
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u16::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        movi.n            a9, 0
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u16::release_zero:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        movi.n            a9, 0
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u16::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        and               a9, a8, a3
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u16::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        and               a9, a8, a3
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u16::acquire:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        and               a9, a8, a3
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u16::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        and               a9, a8, a3
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u16::release:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        and               a9, a8, a3
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u32::acqrel_all:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_and::u32::seqcst_all:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_and::u32::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        movi.n            a9, 0
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u32::acquire_all:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_and::u32::relaxed_all:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_and::u32::release_all:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_and::u32::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        movi.n            a9, 0
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u32::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        movi.n            a9, 0
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u32::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        movi.n            a9, 0
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u32::release_zero:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        movi.n            a9, 0
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u32::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        and               a9, a8, a3
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u32::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        and               a9, a8, a3
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u32::acquire:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        and               a9, a8, a3
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u32::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        and               a9, a8, a3
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::u32::release:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        and               a9, a8, a3
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_and::bool::acqrel_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        and               a10, a9, a2
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_and::bool::seqcst_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        and               a10, a9, a2
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_and::bool::acqrel_false:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 0
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        beq               a9, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_and::bool::acquire_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        and               a10, a9, a2
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_and::bool::relaxed_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        and               a10, a9, a2
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_and::bool::release_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        and               a10, a9, a2
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_and::bool::seqcst_false:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 0
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        beq               a9, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_and::bool::acquire_false:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 0
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        beq               a9, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_and::bool::relaxed_false:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 0
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        beq               a9, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_and::bool::release_false:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 0
        s8i               a2, a8, 0
        wsr.ps            a14
        rsync
        beq               a9, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_and::bool::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        and               a9, a3, a8
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_and::bool::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        and               a9, a3, a8
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_and::bool::acquire:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        and               a9, a3, a8
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_and::bool::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        and               a9, a3, a8
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_and::bool::release:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        and               a9, a3, a8
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_max::i8::acqrel:
        entry             a1, 32
        sext              a9, a3, 7
        rsil              a14, 15
        l8ui              a8, a2, 0
        sext              a10, a8, 7
        max               a9, a9, a10
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_max::i8::seqcst:
        entry             a1, 32
        sext              a9, a3, 7
        rsil              a14, 15
        l8ui              a8, a2, 0
        sext              a10, a8, 7
        max               a9, a9, a10
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_max::i8::acquire:
        entry             a1, 32
        sext              a9, a3, 7
        rsil              a14, 15
        l8ui              a8, a2, 0
        sext              a10, a8, 7
        max               a9, a9, a10
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_max::i8::relaxed:
        entry             a1, 32
        sext              a9, a3, 7
        rsil              a14, 15
        l8ui              a8, a2, 0
        sext              a10, a8, 7
        max               a9, a9, a10
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_max::i8::release:
        entry             a1, 32
        sext              a9, a3, 7
        rsil              a14, 15
        l8ui              a8, a2, 0
        sext              a10, a8, 7
        max               a9, a9, a10
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

.literal.asm_test::fetch_max::f32::acqrel:

asm_test::fetch_max::f32::acqrel:
        entry             a1, 32
        l32i.n            a7, a2, 0
        rsil              a14, 15
        l32i.n            a8, a2, 0
        beq               a8, a7, 1f
0:
        mov.n             a7, a8
        wsr.ps            a14
        rsync
        rsil              a14, 15
        l32i.n            a8, a2, 0
        bne               a8, a7, 0b
1:
        mov.n             a6, a14
        l32r              a8, 1c <asm_test::fetch_max::f32::acqrel+0x1c> (810e6def <asm_test::fetch_max::f32::acqrel+0x810e6def>)
        mov.n             a10, a3
        mov.n             a11, a7
        callx8            a8
        movi.n            a8, -1
        mov.n             a5, a7
        bge               a8, a10, 3f
2:
        mov.n             a5, a3
3:
        l32r              a8, 2b (ff81035d <asm_test::fetch_max::f32::acqrel+0xff81035d>)
        mov.n             a10, a7
        mov.n             a11, a7
        callx8            a8
        movi.n            a8, 0
        bne               a10, a8, 4f
        mov.n             a3, a5
4:
        s32i.n            a3, a2, 0
        mov.n             a14, a6
        wsr.ps            a14
        rsync
        mov.n             a2, a7
        retw.n

.literal.asm_test::fetch_max::f32::seqcst:

asm_test::fetch_max::f32::seqcst:
        entry             a1, 32
        l32i.n            a7, a2, 0
        rsil              a14, 15
        l32i.n            a8, a2, 0
        beq               a8, a7, 1f
0:
        mov.n             a7, a8
        wsr.ps            a14
        rsync
        rsil              a14, 15
        l32i.n            a8, a2, 0
        bne               a8, a7, 0b
1:
        mov.n             a6, a14
        l32r              a8, 1c <asm_test::fetch_max::f32::seqcst+0x1c> (810e6def <asm_test::fetch_max::f32::seqcst+0x810e6def>)
        mov.n             a10, a3
        mov.n             a11, a7
        callx8            a8
        movi.n            a8, -1
        mov.n             a5, a7
        bge               a8, a10, 3f
2:
        mov.n             a5, a3
3:
        l32r              a8, 2b (ff81035d <asm_test::fetch_max::f32::seqcst+0xff81035d>)
        mov.n             a10, a7
        mov.n             a11, a7
        callx8            a8
        movi.n            a8, 0
        bne               a10, a8, 4f
        mov.n             a3, a5
4:
        s32i.n            a3, a2, 0
        mov.n             a14, a6
        wsr.ps            a14
        rsync
        mov.n             a2, a7
        retw.n

.literal.asm_test::fetch_max::f32::acquire:

asm_test::fetch_max::f32::acquire:
        entry             a1, 32
        l32i.n            a7, a2, 0
        rsil              a14, 15
        l32i.n            a8, a2, 0
        beq               a8, a7, 1f
0:
        mov.n             a7, a8
        wsr.ps            a14
        rsync
        rsil              a14, 15
        l32i.n            a8, a2, 0
        bne               a8, a7, 0b
1:
        mov.n             a6, a14
        l32r              a8, 1c <asm_test::fetch_max::f32::acquire+0x1c> (810e6def <asm_test::fetch_max::f32::acquire+0x810e6def>)
        mov.n             a10, a3
        mov.n             a11, a7
        callx8            a8
        movi.n            a8, -1
        mov.n             a5, a7
        bge               a8, a10, 3f
2:
        mov.n             a5, a3
3:
        l32r              a8, 2b (ff81035d <asm_test::fetch_max::f32::acquire+0xff81035d>)
        mov.n             a10, a7
        mov.n             a11, a7
        callx8            a8
        movi.n            a8, 0
        bne               a10, a8, 4f
        mov.n             a3, a5
4:
        s32i.n            a3, a2, 0
        mov.n             a14, a6
        wsr.ps            a14
        rsync
        mov.n             a2, a7
        retw.n

.literal.asm_test::fetch_max::f32::relaxed:

asm_test::fetch_max::f32::relaxed:
        entry             a1, 32
        l32i.n            a7, a2, 0
        rsil              a14, 15
        l32i.n            a8, a2, 0
        beq               a8, a7, 1f
0:
        mov.n             a7, a8
        wsr.ps            a14
        rsync
        rsil              a14, 15
        l32i.n            a8, a2, 0
        bne               a8, a7, 0b
1:
        mov.n             a6, a14
        l32r              a8, 1c <asm_test::fetch_max::f32::relaxed+0x1c> (810e6def <asm_test::fetch_max::f32::relaxed+0x810e6def>)
        mov.n             a10, a3
        mov.n             a11, a7
        callx8            a8
        movi.n            a8, -1
        mov.n             a5, a7
        bge               a8, a10, 3f
2:
        mov.n             a5, a3
3:
        l32r              a8, 2b (ff81035d <asm_test::fetch_max::f32::relaxed+0xff81035d>)
        mov.n             a10, a7
        mov.n             a11, a7
        callx8            a8
        movi.n            a8, 0
        bne               a10, a8, 4f
        mov.n             a3, a5
4:
        s32i.n            a3, a2, 0
        mov.n             a14, a6
        wsr.ps            a14
        rsync
        mov.n             a2, a7
        retw.n

.literal.asm_test::fetch_max::f32::release:

asm_test::fetch_max::f32::release:
        entry             a1, 32
        l32i.n            a7, a2, 0
        rsil              a14, 15
        l32i.n            a8, a2, 0
        beq               a8, a7, 1f
0:
        mov.n             a7, a8
        wsr.ps            a14
        rsync
        rsil              a14, 15
        l32i.n            a8, a2, 0
        bne               a8, a7, 0b
1:
        mov.n             a6, a14
        l32r              a8, 1c <asm_test::fetch_max::f32::release+0x1c> (810e6def <asm_test::fetch_max::f32::release+0x810e6def>)
        mov.n             a10, a3
        mov.n             a11, a7
        callx8            a8
        movi.n            a8, -1
        mov.n             a5, a7
        bge               a8, a10, 3f
2:
        mov.n             a5, a3
3:
        l32r              a8, 2b (ff81035d <asm_test::fetch_max::f32::release+0xff81035d>)
        mov.n             a10, a7
        mov.n             a11, a7
        callx8            a8
        movi.n            a8, 0
        bne               a10, a8, 4f
        mov.n             a3, a5
4:
        s32i.n            a3, a2, 0
        mov.n             a14, a6
        wsr.ps            a14
        rsync
        mov.n             a2, a7
        retw.n

asm_test::fetch_max::i16::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l16si             a8, a2, 0
        sext              a9, a3, 15
        max               a9, a9, a8
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_max::i16::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l16si             a8, a2, 0
        sext              a9, a3, 15
        max               a9, a9, a8
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_max::i16::acquire:
        entry             a1, 32
        rsil              a14, 15
        l16si             a8, a2, 0
        sext              a9, a3, 15
        max               a9, a9, a8
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_max::i16::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l16si             a8, a2, 0
        sext              a9, a3, 15
        max               a9, a9, a8
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_max::i16::release:
        entry             a1, 32
        rsil              a14, 15
        l16si             a8, a2, 0
        sext              a9, a3, 15
        max               a9, a9, a8
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_max::i32::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        max               a9, a3, a8
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_max::i32::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        max               a9, a3, a8
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_max::i32::acquire:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        max               a9, a3, a8
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_max::i32::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        max               a9, a3, a8
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_max::i32::release:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        max               a9, a3, a8
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i8::acqrel:
        entry             a1, 32
        sext              a9, a3, 7
        rsil              a14, 15
        l8ui              a8, a2, 0
        sext              a10, a8, 7
        min               a9, a9, a10
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i8::seqcst:
        entry             a1, 32
        sext              a9, a3, 7
        rsil              a14, 15
        l8ui              a8, a2, 0
        sext              a10, a8, 7
        min               a9, a9, a10
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i8::acquire:
        entry             a1, 32
        sext              a9, a3, 7
        rsil              a14, 15
        l8ui              a8, a2, 0
        sext              a10, a8, 7
        min               a9, a9, a10
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i8::relaxed:
        entry             a1, 32
        sext              a9, a3, 7
        rsil              a14, 15
        l8ui              a8, a2, 0
        sext              a10, a8, 7
        min               a9, a9, a10
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i8::release:
        entry             a1, 32
        sext              a9, a3, 7
        rsil              a14, 15
        l8ui              a8, a2, 0
        sext              a10, a8, 7
        min               a9, a9, a10
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

.literal.asm_test::fetch_min::f32::acqrel:

asm_test::fetch_min::f32::acqrel:
        entry             a1, 32
        l32i.n            a7, a2, 0
        rsil              a14, 15
        l32i.n            a8, a2, 0
        beq               a8, a7, 1f
0:
        mov.n             a7, a8
        wsr.ps            a14
        rsync
        rsil              a14, 15
        l32i.n            a8, a2, 0
        bne               a8, a7, 0b
1:
        mov.n             a6, a14
        l32r              a8, 1c <asm_test::fetch_min::f32::acqrel+0x1c> (810e6def <asm_test::fetch_min::f32::acqrel+0x810e6def>)
        mov.n             a10, a3
        mov.n             a11, a7
        callx8            a8
        movi.n            a8, 1
        mov.n             a5, a3
        blt               a10, a8, 3f
2:
        mov.n             a5, a7
3:
        l32r              a8, 2b (ff81075d <asm_test::fetch_min::f32::acqrel+0xff81075d>)
        mov.n             a10, a7
        mov.n             a11, a7
        callx8            a8
        movi.n            a8, 0
        bne               a10, a8, 4f
        mov.n             a3, a5
4:
        s32i.n            a3, a2, 0
        mov.n             a14, a6
        wsr.ps            a14
        rsync
        mov.n             a2, a7
        retw.n

.literal.asm_test::fetch_min::f32::seqcst:

asm_test::fetch_min::f32::seqcst:
        entry             a1, 32
        l32i.n            a7, a2, 0
        rsil              a14, 15
        l32i.n            a8, a2, 0
        beq               a8, a7, 1f
0:
        mov.n             a7, a8
        wsr.ps            a14
        rsync
        rsil              a14, 15
        l32i.n            a8, a2, 0
        bne               a8, a7, 0b
1:
        mov.n             a6, a14
        l32r              a8, 1c <asm_test::fetch_min::f32::seqcst+0x1c> (810e6def <asm_test::fetch_min::f32::seqcst+0x810e6def>)
        mov.n             a10, a3
        mov.n             a11, a7
        callx8            a8
        movi.n            a8, 1
        mov.n             a5, a3
        blt               a10, a8, 3f
2:
        mov.n             a5, a7
3:
        l32r              a8, 2b (ff81075d <asm_test::fetch_min::f32::seqcst+0xff81075d>)
        mov.n             a10, a7
        mov.n             a11, a7
        callx8            a8
        movi.n            a8, 0
        bne               a10, a8, 4f
        mov.n             a3, a5
4:
        s32i.n            a3, a2, 0
        mov.n             a14, a6
        wsr.ps            a14
        rsync
        mov.n             a2, a7
        retw.n

.literal.asm_test::fetch_min::f32::acquire:

asm_test::fetch_min::f32::acquire:
        entry             a1, 32
        l32i.n            a7, a2, 0
        rsil              a14, 15
        l32i.n            a8, a2, 0
        beq               a8, a7, 1f
0:
        mov.n             a7, a8
        wsr.ps            a14
        rsync
        rsil              a14, 15
        l32i.n            a8, a2, 0
        bne               a8, a7, 0b
1:
        mov.n             a6, a14
        l32r              a8, 1c <asm_test::fetch_min::f32::acquire+0x1c> (810e6def <asm_test::fetch_min::f32::acquire+0x810e6def>)
        mov.n             a10, a3
        mov.n             a11, a7
        callx8            a8
        movi.n            a8, 1
        mov.n             a5, a3
        blt               a10, a8, 3f
2:
        mov.n             a5, a7
3:
        l32r              a8, 2b (ff81075d <asm_test::fetch_min::f32::acquire+0xff81075d>)
        mov.n             a10, a7
        mov.n             a11, a7
        callx8            a8
        movi.n            a8, 0
        bne               a10, a8, 4f
        mov.n             a3, a5
4:
        s32i.n            a3, a2, 0
        mov.n             a14, a6
        wsr.ps            a14
        rsync
        mov.n             a2, a7
        retw.n

.literal.asm_test::fetch_min::f32::relaxed:

asm_test::fetch_min::f32::relaxed:
        entry             a1, 32
        l32i.n            a7, a2, 0
        rsil              a14, 15
        l32i.n            a8, a2, 0
        beq               a8, a7, 1f
0:
        mov.n             a7, a8
        wsr.ps            a14
        rsync
        rsil              a14, 15
        l32i.n            a8, a2, 0
        bne               a8, a7, 0b
1:
        mov.n             a6, a14
        l32r              a8, 1c <asm_test::fetch_min::f32::relaxed+0x1c> (810e6def <asm_test::fetch_min::f32::relaxed+0x810e6def>)
        mov.n             a10, a3
        mov.n             a11, a7
        callx8            a8
        movi.n            a8, 1
        mov.n             a5, a3
        blt               a10, a8, 3f
2:
        mov.n             a5, a7
3:
        l32r              a8, 2b (ff81075d <asm_test::fetch_min::f32::relaxed+0xff81075d>)
        mov.n             a10, a7
        mov.n             a11, a7
        callx8            a8
        movi.n            a8, 0
        bne               a10, a8, 4f
        mov.n             a3, a5
4:
        s32i.n            a3, a2, 0
        mov.n             a14, a6
        wsr.ps            a14
        rsync
        mov.n             a2, a7
        retw.n

.literal.asm_test::fetch_min::f32::release:

asm_test::fetch_min::f32::release:
        entry             a1, 32
        l32i.n            a7, a2, 0
        rsil              a14, 15
        l32i.n            a8, a2, 0
        beq               a8, a7, 1f
0:
        mov.n             a7, a8
        wsr.ps            a14
        rsync
        rsil              a14, 15
        l32i.n            a8, a2, 0
        bne               a8, a7, 0b
1:
        mov.n             a6, a14
        l32r              a8, 1c <asm_test::fetch_min::f32::release+0x1c> (810e6def <asm_test::fetch_min::f32::release+0x810e6def>)
        mov.n             a10, a3
        mov.n             a11, a7
        callx8            a8
        movi.n            a8, 1
        mov.n             a5, a3
        blt               a10, a8, 3f
2:
        mov.n             a5, a7
3:
        l32r              a8, 2b (ff81075d <asm_test::fetch_min::f32::release+0xff81075d>)
        mov.n             a10, a7
        mov.n             a11, a7
        callx8            a8
        movi.n            a8, 0
        bne               a10, a8, 4f
        mov.n             a3, a5
4:
        s32i.n            a3, a2, 0
        mov.n             a14, a6
        wsr.ps            a14
        rsync
        mov.n             a2, a7
        retw.n

asm_test::fetch_min::i16::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l16si             a8, a2, 0
        sext              a9, a3, 15
        min               a9, a9, a8
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i16::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l16si             a8, a2, 0
        sext              a9, a3, 15
        min               a9, a9, a8
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i16::acquire:
        entry             a1, 32
        rsil              a14, 15
        l16si             a8, a2, 0
        sext              a9, a3, 15
        min               a9, a9, a8
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i16::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l16si             a8, a2, 0
        sext              a9, a3, 15
        min               a9, a9, a8
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i16::release:
        entry             a1, 32
        rsil              a14, 15
        l16si             a8, a2, 0
        sext              a9, a3, 15
        min               a9, a9, a8
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i32::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        min               a9, a3, a8
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i32::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        min               a9, a3, a8
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i32::acquire:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        min               a9, a3, a8
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i32::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        min               a9, a3, a8
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_min::i32::release:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        min               a9, a3, a8
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u8::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        neg               a9, a8
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u8::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        neg               a9, a8
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u8::acquire:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        neg               a9, a8
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u8::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        neg               a9, a8
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u8::release:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        neg               a9, a8
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

.literal.asm_test::fetch_neg::f32::acqrel:
        ill
        .byte             0x80

asm_test::fetch_neg::f32::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        l32r              a9, fffc0008 <asm_test::fetch_neg::f32::acqrel+0xfffc0008>
        xor               a9, a8, a9
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

.literal.asm_test::fetch_neg::f32::seqcst:
        ill
        .byte             0x80

asm_test::fetch_neg::f32::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        l32r              a9, fffc0008 <asm_test::fetch_neg::f32::seqcst+0xfffc0008>
        xor               a9, a8, a9
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

.literal.asm_test::fetch_neg::f32::acquire:
        ill
        .byte             0x80

asm_test::fetch_neg::f32::acquire:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        l32r              a9, fffc0008 <asm_test::fetch_neg::f32::acquire+0xfffc0008>
        xor               a9, a8, a9
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

.literal.asm_test::fetch_neg::f32::relaxed:
        ill
        .byte             0x80

asm_test::fetch_neg::f32::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        l32r              a9, fffc0008 <asm_test::fetch_neg::f32::relaxed+0xfffc0008>
        xor               a9, a8, a9
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

.literal.asm_test::fetch_neg::f32::release:
        ill
        .byte             0x80

asm_test::fetch_neg::f32::release:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        l32r              a9, fffc0008 <asm_test::fetch_neg::f32::release+0xfffc0008>
        xor               a9, a8, a9
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u16::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        neg               a9, a8
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u16::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        neg               a9, a8
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u16::acquire:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        neg               a9, a8
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u16::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        neg               a9, a8
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u16::release:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        neg               a9, a8
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u32::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        neg               a9, a8
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u32::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        neg               a9, a8
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u32::acquire:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        neg               a9, a8
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u32::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        neg               a9, a8
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_neg::u32::release:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        neg               a9, a8
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u8::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, -1
        xor               a9, a8, a9
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u8::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, -1
        xor               a9, a8, a9
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u8::acquire:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, -1
        xor               a9, a8, a9
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u8::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, -1
        xor               a9, a8, a9
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u8::release:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        movi.n            a9, -1
        xor               a9, a8, a9
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u16::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        movi.n            a9, -1
        xor               a9, a8, a9
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u16::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        movi.n            a9, -1
        xor               a9, a8, a9
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u16::acquire:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        movi.n            a9, -1
        xor               a9, a8, a9
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u16::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        movi.n            a9, -1
        xor               a9, a8, a9
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u16::release:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        movi.n            a9, -1
        xor               a9, a8, a9
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u32::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        movi.n            a9, -1
        xor               a9, a8, a9
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u32::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        movi.n            a9, -1
        xor               a9, a8, a9
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u32::acquire:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        movi.n            a9, -1
        xor               a9, a8, a9
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u32::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        movi.n            a9, -1
        xor               a9, a8, a9
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::u32::release:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        movi.n            a9, -1
        xor               a9, a8, a9
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_not::bool::acqrel:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        xor               a10, a9, a2
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_not::bool::seqcst:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        xor               a10, a9, a2
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_not::bool::acquire:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        xor               a10, a9, a2
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_not::bool::relaxed:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        xor               a10, a9, a2
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_not::bool::release:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        xor               a10, a9, a2
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_sub::u8::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_sub::u8::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_sub::u8::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_sub::u8::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_sub::u8::release_zero:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_sub::u8::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        sub               a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::u8::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        sub               a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::u8::acquire:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        sub               a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::u8::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        sub               a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::u8::release:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        sub               a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::f32::acqrel_zero:
        entry             a1, 32
        l32i.n            a8, a2, 0
        rsil              a14, 15
        l32i.n            a9, a2, 0
        beq               a9, a8, 1f
0:
        mov.n             a8, a9
        wsr.ps            a14
        rsync
        rsil              a14, 15
        l32i.n            a9, a2, 0
        bne               a9, a8, 0b
1:
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::f32::seqcst_zero:
        entry             a1, 32
        l32i.n            a8, a2, 0
        rsil              a14, 15
        l32i.n            a9, a2, 0
        beq               a9, a8, 1f
0:
        mov.n             a8, a9
        wsr.ps            a14
        rsync
        rsil              a14, 15
        l32i.n            a9, a2, 0
        bne               a9, a8, 0b
1:
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::f32::acquire_zero:
        entry             a1, 32
        l32i.n            a8, a2, 0
        rsil              a14, 15
        l32i.n            a9, a2, 0
        beq               a9, a8, 1f
0:
        mov.n             a8, a9
        wsr.ps            a14
        rsync
        rsil              a14, 15
        l32i.n            a9, a2, 0
        bne               a9, a8, 0b
1:
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::f32::relaxed_zero:
        entry             a1, 32
        l32i.n            a8, a2, 0
        rsil              a14, 15
        l32i.n            a9, a2, 0
        beq               a9, a8, 1f
0:
        mov.n             a8, a9
        wsr.ps            a14
        rsync
        rsil              a14, 15
        l32i.n            a9, a2, 0
        bne               a9, a8, 0b
1:
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::f32::release_zero:
        entry             a1, 32
        l32i.n            a8, a2, 0
        rsil              a14, 15
        l32i.n            a9, a2, 0
        beq               a9, a8, 1f
0:
        mov.n             a8, a9
        wsr.ps            a14
        rsync
        rsil              a14, 15
        l32i.n            a9, a2, 0
        bne               a9, a8, 0b
1:
        s32i.n            a8, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

.literal.asm_test::fetch_sub::f32::acqrel:
        ill

asm_test::fetch_sub::f32::acqrel:
        entry             a1, 32
        mov.n             a11, a3
        l32i.n            a7, a2, 0
        rsil              a14, 15
        l32i.n            a8, a2, 0
        beq               a8, a7, 2f
0:
        mov.n             a7, a8
        wsr.ps            a14
        rsync
        rsil              a14, 15
        l32i.n            a8, a2, 0
1:
        bne               a8, a7, 0b
2:
        l32r              a8, 1b (81ef9877 <asm_test::fetch_sub::f32::acqrel+0x81ef9877>)
        mov.n             a10, a7
        mov.n             a6, a14
        callx8            a8
        s32i.n            a10, a2, 0
        mov.n             a14, a6
        wsr.ps            a14
        rsync
        mov.n             a2, a7
        retw.n

.literal.asm_test::fetch_sub::f32::seqcst:
        ill

asm_test::fetch_sub::f32::seqcst:
        entry             a1, 32
        mov.n             a11, a3
        l32i.n            a7, a2, 0
        rsil              a14, 15
        l32i.n            a8, a2, 0
        beq               a8, a7, 2f
0:
        mov.n             a7, a8
        wsr.ps            a14
        rsync
        rsil              a14, 15
        l32i.n            a8, a2, 0
1:
        bne               a8, a7, 0b
2:
        l32r              a8, 1b (81ef9877 <asm_test::fetch_sub::f32::seqcst+0x81ef9877>)
        mov.n             a10, a7
        mov.n             a6, a14
        callx8            a8
        s32i.n            a10, a2, 0
        mov.n             a14, a6
        wsr.ps            a14
        rsync
        mov.n             a2, a7
        retw.n

.literal.asm_test::fetch_sub::f32::acquire:
        ill

asm_test::fetch_sub::f32::acquire:
        entry             a1, 32
        mov.n             a11, a3
        l32i.n            a7, a2, 0
        rsil              a14, 15
        l32i.n            a8, a2, 0
        beq               a8, a7, 2f
0:
        mov.n             a7, a8
        wsr.ps            a14
        rsync
        rsil              a14, 15
        l32i.n            a8, a2, 0
1:
        bne               a8, a7, 0b
2:
        l32r              a8, 1b (81ef9877 <asm_test::fetch_sub::f32::acquire+0x81ef9877>)
        mov.n             a10, a7
        mov.n             a6, a14
        callx8            a8
        s32i.n            a10, a2, 0
        mov.n             a14, a6
        wsr.ps            a14
        rsync
        mov.n             a2, a7
        retw.n

.literal.asm_test::fetch_sub::f32::relaxed:
        ill

asm_test::fetch_sub::f32::relaxed:
        entry             a1, 32
        mov.n             a11, a3
        l32i.n            a7, a2, 0
        rsil              a14, 15
        l32i.n            a8, a2, 0
        beq               a8, a7, 2f
0:
        mov.n             a7, a8
        wsr.ps            a14
        rsync
        rsil              a14, 15
        l32i.n            a8, a2, 0
1:
        bne               a8, a7, 0b
2:
        l32r              a8, 1b (81ef9877 <asm_test::fetch_sub::f32::relaxed+0x81ef9877>)
        mov.n             a10, a7
        mov.n             a6, a14
        callx8            a8
        s32i.n            a10, a2, 0
        mov.n             a14, a6
        wsr.ps            a14
        rsync
        mov.n             a2, a7
        retw.n

.literal.asm_test::fetch_sub::f32::release:
        ill

asm_test::fetch_sub::f32::release:
        entry             a1, 32
        mov.n             a11, a3
        l32i.n            a7, a2, 0
        rsil              a14, 15
        l32i.n            a8, a2, 0
        beq               a8, a7, 2f
0:
        mov.n             a7, a8
        wsr.ps            a14
        rsync
        rsil              a14, 15
        l32i.n            a8, a2, 0
1:
        bne               a8, a7, 0b
2:
        l32r              a8, 1b (81ef9877 <asm_test::fetch_sub::f32::release+0x81ef9877>)
        mov.n             a10, a7
        mov.n             a6, a14
        callx8            a8
        s32i.n            a10, a2, 0
        mov.n             a14, a6
        wsr.ps            a14
        rsync
        mov.n             a2, a7
        retw.n

asm_test::fetch_sub::u16::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_sub::u16::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_sub::u16::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_sub::u16::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_sub::u16::release_zero:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_sub::u16::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        sub               a9, a8, a3
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::u16::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        sub               a9, a8, a3
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::u16::acquire:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        sub               a9, a8, a3
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::u16::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        sub               a9, a8, a3
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::u16::release:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        sub               a9, a8, a3
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::u32::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_sub::u32::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_sub::u32::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_sub::u32::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_sub::u32::release_zero:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_sub::u32::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        sub               a9, a8, a3
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::u32::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        sub               a9, a8, a3
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::u32::acquire:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        sub               a9, a8, a3
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::u32::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        sub               a9, a8, a3
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_sub::u32::release:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        sub               a9, a8, a3
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u8::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_xor::u8::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_xor::u8::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_xor::u8::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_xor::u8::release_zero:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_xor::u8::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        xor               a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u8::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        xor               a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u8::acquire:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        xor               a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u8::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        xor               a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u8::release:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        xor               a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u16::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_xor::u16::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_xor::u16::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_xor::u16::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_xor::u16::release_zero:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_xor::u16::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        xor               a9, a8, a3
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u16::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        xor               a9, a8, a3
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u16::acquire:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        xor               a9, a8, a3
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u16::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        xor               a9, a8, a3
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u16::release:
        entry             a1, 32
        rsil              a14, 15
        l16ui             a8, a2, 0
        xor               a9, a8, a3
        s16i              a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u32::acqrel_zero:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_xor::u32::seqcst_zero:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_xor::u32::acquire_zero:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_xor::u32::relaxed_zero:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_xor::u32::release_zero:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a2, a2, 0
        wsr.ps            a14
        rsync
        retw.n

asm_test::fetch_xor::u32::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        xor               a9, a8, a3
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u32::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        xor               a9, a8, a3
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u32::acquire:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        xor               a9, a8, a3
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u32::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        xor               a9, a8, a3
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::u32::release:
        entry             a1, 32
        rsil              a14, 15
        l32i.n            a8, a2, 0
        xor               a9, a8, a3
        s32i.n            a9, a2, 0
        wsr.ps            a14
        rsync
        mov.n             a2, a8
        retw.n

asm_test::fetch_xor::bool::acqrel_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        xor               a10, a9, a2
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_xor::bool::seqcst_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        xor               a10, a9, a2
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_xor::bool::acqrel_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_xor::bool::acquire_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        xor               a10, a9, a2
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_xor::bool::relaxed_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        xor               a10, a9, a2
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_xor::bool::release_true:
        entry             a1, 32
        mov.n             a8, a2
        rsil              a14, 15
        l8ui              a9, a8, 0
        movi.n            a2, 1
        xor               a10, a9, a2
        s8i               a10, a8, 0
        wsr.ps            a14
        rsync
        movi.n            a8, 0
        bne               a9, a8, 0f
        mov.n             a2, a8
0:
        retw.n

asm_test::fetch_xor::bool::seqcst_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_xor::bool::acquire_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_xor::bool::relaxed_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_xor::bool::release_false:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_xor::bool::acqrel:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        xor               a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_xor::bool::seqcst:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        xor               a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_xor::bool::acquire:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        xor               a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_xor::bool::relaxed:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        xor               a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        retw.n

asm_test::fetch_xor::bool::release:
        entry             a1, 32
        rsil              a14, 15
        l8ui              a8, a2, 0
        xor               a9, a8, a3
        s8i               a9, a2, 0
        wsr.ps            a14
        rsync
        movi.n            a2, 0
        beq               a8, a2, 0f
        movi.n            a2, 1
0:
        retw.n

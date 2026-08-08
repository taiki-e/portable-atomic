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

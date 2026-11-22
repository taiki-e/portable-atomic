asm_test::fence::acqrel:
        dmb               sy
        bx                lr

asm_test::fence::seqcst:
        dmb               sy
        bx                lr

asm_test::fence::acquire:
        dmb               sy
        bx                lr

asm_test::fence::release:
        dmb               sy
        bx                lr

asm_test::load::u8::seqcst:
        ldrb              r0, [r0]
        dmb               sy
        bx                lr

asm_test::load::u8::acquire:
        ldrb              r0, [r0]
        dmb               sy
        bx                lr

asm_test::load::u8::relaxed:
        ldrb              r0, [r0]
        bx                lr

asm_test::load::u16::seqcst:
        ldrh              r0, [r0]
        dmb               sy
        bx                lr

asm_test::load::u16::acquire:
        ldrh              r0, [r0]
        dmb               sy
        bx                lr

asm_test::load::u16::relaxed:
        ldrh              r0, [r0]
        bx                lr

asm_test::load::u32::seqcst:
        ldr               r0, [r0]
        dmb               sy
        bx                lr

asm_test::load::u32::acquire:
        ldr               r0, [r0]
        dmb               sy
        bx                lr

asm_test::load::u32::relaxed:
        ldr               r0, [r0]
        bx                lr

asm_test::store::u8::seqcst:
        dmb               sy
        strb              r1, [r0]
        dmb               sy
        bx                lr

asm_test::store::u8::relaxed:
        strb              r1, [r0]
        bx                lr

asm_test::store::u8::release:
        dmb               sy
        strb              r1, [r0]
        bx                lr

asm_test::store::u16::seqcst:
        dmb               sy
        strh              r1, [r0]
        dmb               sy
        bx                lr

asm_test::store::u16::relaxed:
        strh              r1, [r0]
        bx                lr

asm_test::store::u16::release:
        dmb               sy
        strh              r1, [r0]
        bx                lr

asm_test::store::u32::seqcst:
        dmb               sy
        str               r1, [r0]
        dmb               sy
        bx                lr

asm_test::store::u32::relaxed:
        str               r1, [r0]
        bx                lr

asm_test::store::u32::release:
        dmb               sy
        str               r1, [r0]
        bx                lr

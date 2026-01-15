asm_test::fetch_nand::u8::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_nand::u8::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_nand::u8::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_nand::u8::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_nand::u8::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_nand::u16::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_nand::u16::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_nand::u16::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_nand::u16::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_nand::u16::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_nand::u32::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_nand::u32::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_nand::u32::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_nand::u32::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_nand::u32::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_umax::u8::acqrel:
        push              {r4, r5, r6, lr}
        ldrb              r3, [r0]
        and               r5, r1, #255
        mov               r4, r0
0:
        and               r6, r3, #255
        mov               r0, r4
        cmp               r5, r6
        mov               r1, r3
        mov               r2, r6
        movhi             r2, r5
1:
        bl                1f
        mov               r3, r0
        sub               r0, r0, r6
        rsbs              r1, r0, #0
        adc               r0, r0, r1
        cmp               r0, #1
        bne               0b
        mov               r0, r3
        pop               {r4, r5, r6, lr}
        bx                lr

asm_test::fetch_umax::u8::seqcst:
        push              {r4, r5, r6, lr}
        ldrb              r3, [r0]
        and               r5, r1, #255
        mov               r4, r0
0:
        and               r6, r3, #255
        mov               r0, r4
        cmp               r5, r6
        mov               r1, r3
        mov               r2, r6
        movhi             r2, r5
1:
        bl                1f
        mov               r3, r0
        sub               r0, r0, r6
        rsbs              r1, r0, #0
        adc               r0, r0, r1
        cmp               r0, #1
        bne               0b
        mov               r0, r3
        pop               {r4, r5, r6, lr}
        bx                lr

asm_test::fetch_umax::u8::acquire:
        push              {r4, r5, r6, lr}
        ldrb              r3, [r0]
        and               r5, r1, #255
        mov               r4, r0
0:
        and               r6, r3, #255
        mov               r0, r4
        cmp               r5, r6
        mov               r1, r3
        mov               r2, r6
        movhi             r2, r5
1:
        bl                1f
        mov               r3, r0
        sub               r0, r0, r6
        rsbs              r1, r0, #0
        adc               r0, r0, r1
        cmp               r0, #1
        bne               0b
        mov               r0, r3
        pop               {r4, r5, r6, lr}
        bx                lr

asm_test::fetch_umax::u8::relaxed:
        push              {r4, r5, r6, lr}
        ldrb              r3, [r0]
        and               r5, r1, #255
        mov               r4, r0
0:
        and               r6, r3, #255
        mov               r0, r4
        cmp               r5, r6
        mov               r1, r3
        mov               r2, r6
        movhi             r2, r5
1:
        bl                1f
        mov               r3, r0
        sub               r0, r0, r6
        rsbs              r1, r0, #0
        adc               r0, r0, r1
        cmp               r0, #1
        bne               0b
        mov               r0, r3
        pop               {r4, r5, r6, lr}
        bx                lr

asm_test::fetch_umax::u8::release:
        push              {r4, r5, r6, lr}
        ldrb              r3, [r0]
        and               r5, r1, #255
        mov               r4, r0
0:
        and               r6, r3, #255
        mov               r0, r4
        cmp               r5, r6
        mov               r1, r3
        mov               r2, r6
        movhi             r2, r5
1:
        bl                1f
        mov               r3, r0
        sub               r0, r0, r6
        rsbs              r1, r0, #0
        adc               r0, r0, r1
        cmp               r0, #1
        bne               0b
        mov               r0, r3
        pop               {r4, r5, r6, lr}
        bx                lr

asm_test::fetch_umax::u16::acqrel:
        push              {r4, r5, r6, r7, r11, lr}
        mov               r5, #255
        ldrh              r3, [r0]
        orr               r5, r5, #65280
        mov               r4, r0
        and               r6, r1, r5
0:
        and               r7, r3, r5
        mov               r0, r4
        cmp               r6, r7
        mov               r1, r3
        mov               r2, r7
        movhi             r2, r6
1:
        bl                1f
        mov               r3, r0
        sub               r0, r0, r7
        rsbs              r1, r0, #0
        adc               r0, r0, r1
        cmp               r0, #1
        bne               0b
        mov               r0, r3
        pop               {r4, r5, r6, r7, r11, lr}
        bx                lr

asm_test::fetch_umax::u16::seqcst:
        push              {r4, r5, r6, r7, r11, lr}
        mov               r5, #255
        ldrh              r3, [r0]
        orr               r5, r5, #65280
        mov               r4, r0
        and               r6, r1, r5
0:
        and               r7, r3, r5
        mov               r0, r4
        cmp               r6, r7
        mov               r1, r3
        mov               r2, r7
        movhi             r2, r6
1:
        bl                1f
        mov               r3, r0
        sub               r0, r0, r7
        rsbs              r1, r0, #0
        adc               r0, r0, r1
        cmp               r0, #1
        bne               0b
        mov               r0, r3
        pop               {r4, r5, r6, r7, r11, lr}
        bx                lr

asm_test::fetch_umax::u16::acquire:
        push              {r4, r5, r6, r7, r11, lr}
        mov               r5, #255
        ldrh              r3, [r0]
        orr               r5, r5, #65280
        mov               r4, r0
        and               r6, r1, r5
0:
        and               r7, r3, r5
        mov               r0, r4
        cmp               r6, r7
        mov               r1, r3
        mov               r2, r7
        movhi             r2, r6
1:
        bl                1f
        mov               r3, r0
        sub               r0, r0, r7
        rsbs              r1, r0, #0
        adc               r0, r0, r1
        cmp               r0, #1
        bne               0b
        mov               r0, r3
        pop               {r4, r5, r6, r7, r11, lr}
        bx                lr

asm_test::fetch_umax::u16::relaxed:
        push              {r4, r5, r6, r7, r11, lr}
        mov               r5, #255
        ldrh              r3, [r0]
        orr               r5, r5, #65280
        mov               r4, r0
        and               r6, r1, r5
0:
        and               r7, r3, r5
        mov               r0, r4
        cmp               r6, r7
        mov               r1, r3
        mov               r2, r7
        movhi             r2, r6
1:
        bl                1f
        mov               r3, r0
        sub               r0, r0, r7
        rsbs              r1, r0, #0
        adc               r0, r0, r1
        cmp               r0, #1
        bne               0b
        mov               r0, r3
        pop               {r4, r5, r6, r7, r11, lr}
        bx                lr

asm_test::fetch_umax::u16::release:
        push              {r4, r5, r6, r7, r11, lr}
        mov               r5, #255
        ldrh              r3, [r0]
        orr               r5, r5, #65280
        mov               r4, r0
        and               r6, r1, r5
0:
        and               r7, r3, r5
        mov               r0, r4
        cmp               r6, r7
        mov               r1, r3
        mov               r2, r7
        movhi             r2, r6
1:
        bl                1f
        mov               r3, r0
        sub               r0, r0, r7
        rsbs              r1, r0, #0
        adc               r0, r0, r1
        cmp               r0, #1
        bne               0b
        mov               r0, r3
        pop               {r4, r5, r6, r7, r11, lr}
        bx                lr

asm_test::fetch_umax::u32::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_umax::u32::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_umax::u32::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_umax::u32::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_umax::u32::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_umin::u8::acqrel:
        push              {r4, r5, r6, lr}
        ldrb              r3, [r0]
        and               r5, r1, #255
        mov               r4, r0
0:
        and               r6, r3, #255
        mov               r0, r4
        cmp               r5, r6
        mov               r1, r3
        mov               r2, r6
        movlo             r2, r5
1:
        bl                1f
        mov               r3, r0
        sub               r0, r0, r6
        rsbs              r1, r0, #0
        adc               r0, r0, r1
        cmp               r0, #1
        bne               0b
        mov               r0, r3
        pop               {r4, r5, r6, lr}
        bx                lr

asm_test::fetch_umin::u8::seqcst:
        push              {r4, r5, r6, lr}
        ldrb              r3, [r0]
        and               r5, r1, #255
        mov               r4, r0
0:
        and               r6, r3, #255
        mov               r0, r4
        cmp               r5, r6
        mov               r1, r3
        mov               r2, r6
        movlo             r2, r5
1:
        bl                1f
        mov               r3, r0
        sub               r0, r0, r6
        rsbs              r1, r0, #0
        adc               r0, r0, r1
        cmp               r0, #1
        bne               0b
        mov               r0, r3
        pop               {r4, r5, r6, lr}
        bx                lr

asm_test::fetch_umin::u8::acquire:
        push              {r4, r5, r6, lr}
        ldrb              r3, [r0]
        and               r5, r1, #255
        mov               r4, r0
0:
        and               r6, r3, #255
        mov               r0, r4
        cmp               r5, r6
        mov               r1, r3
        mov               r2, r6
        movlo             r2, r5
1:
        bl                1f
        mov               r3, r0
        sub               r0, r0, r6
        rsbs              r1, r0, #0
        adc               r0, r0, r1
        cmp               r0, #1
        bne               0b
        mov               r0, r3
        pop               {r4, r5, r6, lr}
        bx                lr

asm_test::fetch_umin::u8::relaxed:
        push              {r4, r5, r6, lr}
        ldrb              r3, [r0]
        and               r5, r1, #255
        mov               r4, r0
0:
        and               r6, r3, #255
        mov               r0, r4
        cmp               r5, r6
        mov               r1, r3
        mov               r2, r6
        movlo             r2, r5
1:
        bl                1f
        mov               r3, r0
        sub               r0, r0, r6
        rsbs              r1, r0, #0
        adc               r0, r0, r1
        cmp               r0, #1
        bne               0b
        mov               r0, r3
        pop               {r4, r5, r6, lr}
        bx                lr

asm_test::fetch_umin::u8::release:
        push              {r4, r5, r6, lr}
        ldrb              r3, [r0]
        and               r5, r1, #255
        mov               r4, r0
0:
        and               r6, r3, #255
        mov               r0, r4
        cmp               r5, r6
        mov               r1, r3
        mov               r2, r6
        movlo             r2, r5
1:
        bl                1f
        mov               r3, r0
        sub               r0, r0, r6
        rsbs              r1, r0, #0
        adc               r0, r0, r1
        cmp               r0, #1
        bne               0b
        mov               r0, r3
        pop               {r4, r5, r6, lr}
        bx                lr

asm_test::fetch_umin::u16::acqrel:
        push              {r4, r5, r6, r7, r11, lr}
        mov               r5, #255
        ldrh              r3, [r0]
        orr               r5, r5, #65280
        mov               r4, r0
        and               r6, r1, r5
0:
        and               r7, r3, r5
        mov               r0, r4
        cmp               r6, r7
        mov               r1, r3
        mov               r2, r7
        movlo             r2, r6
1:
        bl                1f
        mov               r3, r0
        sub               r0, r0, r7
        rsbs              r1, r0, #0
        adc               r0, r0, r1
        cmp               r0, #1
        bne               0b
        mov               r0, r3
        pop               {r4, r5, r6, r7, r11, lr}
        bx                lr

asm_test::fetch_umin::u16::seqcst:
        push              {r4, r5, r6, r7, r11, lr}
        mov               r5, #255
        ldrh              r3, [r0]
        orr               r5, r5, #65280
        mov               r4, r0
        and               r6, r1, r5
0:
        and               r7, r3, r5
        mov               r0, r4
        cmp               r6, r7
        mov               r1, r3
        mov               r2, r7
        movlo             r2, r6
1:
        bl                1f
        mov               r3, r0
        sub               r0, r0, r7
        rsbs              r1, r0, #0
        adc               r0, r0, r1
        cmp               r0, #1
        bne               0b
        mov               r0, r3
        pop               {r4, r5, r6, r7, r11, lr}
        bx                lr

asm_test::fetch_umin::u16::acquire:
        push              {r4, r5, r6, r7, r11, lr}
        mov               r5, #255
        ldrh              r3, [r0]
        orr               r5, r5, #65280
        mov               r4, r0
        and               r6, r1, r5
0:
        and               r7, r3, r5
        mov               r0, r4
        cmp               r6, r7
        mov               r1, r3
        mov               r2, r7
        movlo             r2, r6
1:
        bl                1f
        mov               r3, r0
        sub               r0, r0, r7
        rsbs              r1, r0, #0
        adc               r0, r0, r1
        cmp               r0, #1
        bne               0b
        mov               r0, r3
        pop               {r4, r5, r6, r7, r11, lr}
        bx                lr

asm_test::fetch_umin::u16::relaxed:
        push              {r4, r5, r6, r7, r11, lr}
        mov               r5, #255
        ldrh              r3, [r0]
        orr               r5, r5, #65280
        mov               r4, r0
        and               r6, r1, r5
0:
        and               r7, r3, r5
        mov               r0, r4
        cmp               r6, r7
        mov               r1, r3
        mov               r2, r7
        movlo             r2, r6
1:
        bl                1f
        mov               r3, r0
        sub               r0, r0, r7
        rsbs              r1, r0, #0
        adc               r0, r0, r1
        cmp               r0, #1
        bne               0b
        mov               r0, r3
        pop               {r4, r5, r6, r7, r11, lr}
        bx                lr

asm_test::fetch_umin::u16::release:
        push              {r4, r5, r6, r7, r11, lr}
        mov               r5, #255
        ldrh              r3, [r0]
        orr               r5, r5, #65280
        mov               r4, r0
        and               r6, r1, r5
0:
        and               r7, r3, r5
        mov               r0, r4
        cmp               r6, r7
        mov               r1, r3
        mov               r2, r7
        movlo             r2, r6
1:
        bl                1f
        mov               r3, r0
        sub               r0, r0, r7
        rsbs              r1, r0, #0
        adc               r0, r0, r1
        cmp               r0, #1
        bne               0b
        mov               r0, r3
        pop               {r4, r5, r6, r7, r11, lr}
        bx                lr

asm_test::fetch_umin::u32::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_umin::u32::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_umin::u32::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_umin::u32::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_umin::u32::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange::u8::acqrel_seqcst:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        and               r0, r4, #255
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u8::seqcst_seqcst:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        and               r0, r4, #255
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u8::acqrel_acquire:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        and               r0, r4, #255
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u8::acqrel_relaxed:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        and               r0, r4, #255
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u8::acquire_seqcst:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        and               r0, r4, #255
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u8::relaxed_seqcst:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        and               r0, r4, #255
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u8::release_seqcst:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        and               r0, r4, #255
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u8::seqcst_acquire:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        and               r0, r4, #255
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u8::seqcst_relaxed:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        and               r0, r4, #255
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u8::acquire_acquire:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        and               r0, r4, #255
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u8::acquire_relaxed:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        and               r0, r4, #255
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u8::relaxed_acquire:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        and               r0, r4, #255
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u8::relaxed_relaxed:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        and               r0, r4, #255
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u8::release_acquire:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        and               r0, r4, #255
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u8::release_relaxed:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        and               r0, r4, #255
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u16::acqrel_seqcst:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        mov               r0, #255
        orr               r0, r0, #65280
        and               r0, r4, r0
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u16::seqcst_seqcst:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        mov               r0, #255
        orr               r0, r0, #65280
        and               r0, r4, r0
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u16::acqrel_acquire:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        mov               r0, #255
        orr               r0, r0, #65280
        and               r0, r4, r0
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u16::acqrel_relaxed:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        mov               r0, #255
        orr               r0, r0, #65280
        and               r0, r4, r0
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u16::acquire_seqcst:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        mov               r0, #255
        orr               r0, r0, #65280
        and               r0, r4, r0
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u16::relaxed_seqcst:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        mov               r0, #255
        orr               r0, r0, #65280
        and               r0, r4, r0
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u16::release_seqcst:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        mov               r0, #255
        orr               r0, r0, #65280
        and               r0, r4, r0
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u16::seqcst_acquire:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        mov               r0, #255
        orr               r0, r0, #65280
        and               r0, r4, r0
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u16::seqcst_relaxed:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        mov               r0, #255
        orr               r0, r0, #65280
        and               r0, r4, r0
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u16::acquire_acquire:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        mov               r0, #255
        orr               r0, r0, #65280
        and               r0, r4, r0
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u16::acquire_relaxed:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        mov               r0, #255
        orr               r0, r0, #65280
        and               r0, r4, r0
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u16::relaxed_acquire:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        mov               r0, #255
        orr               r0, r0, #65280
        and               r0, r4, r0
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u16::relaxed_relaxed:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        mov               r0, #255
        orr               r0, r0, #65280
        and               r0, r4, r0
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u16::release_acquire:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        mov               r0, #255
        orr               r0, r0, #65280
        and               r0, r4, r0
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u16::release_relaxed:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        mov               r0, #255
        orr               r0, r0, #65280
        and               r0, r4, r0
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u32::acqrel_seqcst:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        sub               r0, r0, r4
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u32::seqcst_seqcst:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        sub               r0, r0, r4
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u32::acqrel_acquire:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        sub               r0, r0, r4
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u32::acqrel_relaxed:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        sub               r0, r0, r4
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u32::acquire_seqcst:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        sub               r0, r0, r4
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u32::relaxed_seqcst:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        sub               r0, r0, r4
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u32::release_seqcst:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        sub               r0, r0, r4
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u32::seqcst_acquire:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        sub               r0, r0, r4
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u32::seqcst_relaxed:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        sub               r0, r0, r4
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u32::acquire_acquire:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        sub               r0, r0, r4
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u32::acquire_relaxed:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        sub               r0, r0, r4
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u32::relaxed_acquire:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        sub               r0, r0, r4
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u32::relaxed_relaxed:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        sub               r0, r0, r4
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u32::release_acquire:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        sub               r0, r0, r4
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange::u32::release_relaxed:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        sub               r0, r0, r4
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u8::acqrel_seqcst:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        and               r0, r4, #255
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u8::seqcst_seqcst:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        and               r0, r4, #255
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u8::acqrel_acquire:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        and               r0, r4, #255
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u8::acqrel_relaxed:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        and               r0, r4, #255
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u8::acquire_seqcst:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        and               r0, r4, #255
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u8::relaxed_seqcst:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        and               r0, r4, #255
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u8::release_seqcst:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        and               r0, r4, #255
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u8::seqcst_acquire:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        and               r0, r4, #255
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u8::seqcst_relaxed:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        and               r0, r4, #255
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u8::acquire_acquire:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        and               r0, r4, #255
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u8::acquire_relaxed:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        and               r0, r4, #255
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u8::relaxed_acquire:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        and               r0, r4, #255
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u8::relaxed_relaxed:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        and               r0, r4, #255
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u8::release_acquire:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        and               r0, r4, #255
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u8::release_relaxed:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        and               r0, r4, #255
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u16::acqrel_seqcst:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        mov               r0, #255
        orr               r0, r0, #65280
        and               r0, r4, r0
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u16::seqcst_seqcst:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        mov               r0, #255
        orr               r0, r0, #65280
        and               r0, r4, r0
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u16::acqrel_acquire:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        mov               r0, #255
        orr               r0, r0, #65280
        and               r0, r4, r0
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u16::acqrel_relaxed:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        mov               r0, #255
        orr               r0, r0, #65280
        and               r0, r4, r0
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u16::acquire_seqcst:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        mov               r0, #255
        orr               r0, r0, #65280
        and               r0, r4, r0
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u16::relaxed_seqcst:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        mov               r0, #255
        orr               r0, r0, #65280
        and               r0, r4, r0
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u16::release_seqcst:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        mov               r0, #255
        orr               r0, r0, #65280
        and               r0, r4, r0
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u16::seqcst_acquire:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        mov               r0, #255
        orr               r0, r0, #65280
        and               r0, r4, r0
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u16::seqcst_relaxed:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        mov               r0, #255
        orr               r0, r0, #65280
        and               r0, r4, r0
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u16::acquire_acquire:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        mov               r0, #255
        orr               r0, r0, #65280
        and               r0, r4, r0
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u16::acquire_relaxed:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        mov               r0, #255
        orr               r0, r0, #65280
        and               r0, r4, r0
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u16::relaxed_acquire:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        mov               r0, #255
        orr               r0, r0, #65280
        and               r0, r4, r0
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u16::relaxed_relaxed:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        mov               r0, #255
        orr               r0, r0, #65280
        and               r0, r4, r0
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u16::release_acquire:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        mov               r0, #255
        orr               r0, r0, #65280
        and               r0, r4, r0
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u16::release_relaxed:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        mov               r0, #255
        orr               r0, r0, #65280
        and               r0, r4, r0
        sub               r0, r1, r0
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u32::acqrel_seqcst:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        sub               r0, r0, r4
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u32::seqcst_seqcst:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        sub               r0, r0, r4
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u32::acqrel_acquire:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        sub               r0, r0, r4
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u32::acqrel_relaxed:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        sub               r0, r0, r4
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u32::acquire_seqcst:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        sub               r0, r0, r4
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u32::relaxed_seqcst:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        sub               r0, r0, r4
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u32::release_seqcst:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        sub               r0, r0, r4
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u32::seqcst_acquire:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        sub               r0, r0, r4
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u32::seqcst_relaxed:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        sub               r0, r0, r4
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u32::acquire_acquire:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        sub               r0, r0, r4
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u32::acquire_relaxed:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        sub               r0, r0, r4
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u32::relaxed_acquire:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        sub               r0, r0, r4
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u32::relaxed_relaxed:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        sub               r0, r0, r4
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u32::release_acquire:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        sub               r0, r0, r4
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::compare_exchange_weak::u32::release_relaxed:
        push              {r4, lr}
        mov               r4, r1
0:
        bl                0f
        mov               r1, r0
        sub               r0, r0, r4
        rsbs              r2, r0, #0
        adc               r0, r0, r2
        eor               r0, r0, #1
        pop               {r4, lr}
        bx                lr

asm_test::or::u8::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::or::u8::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::or::u8::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::or::u8::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::or::u8::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::or::u16::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::or::u16::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::or::u16::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::or::u16::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::or::u16::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::or::u32::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::or::u32::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::or::u32::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::or::u32::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::or::u32::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::add::u8::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::add::u8::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::add::u8::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::add::u8::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::add::u8::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::add::u16::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::add::u16::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::add::u16::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::add::u16::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::add::u16::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::add::u32::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::add::u32::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::add::u32::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::add::u32::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::add::u32::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::and::u8::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::and::u8::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::and::u8::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::and::u8::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::and::u8::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::and::u16::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::and::u16::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::and::u16::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::and::u16::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::and::u16::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::and::u32::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::and::u32::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::and::u32::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::and::u32::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::and::u32::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::neg::u8::acqrel:
        push              {r4, r5, r11, lr}
        ldrb              r5, [r0]
        mov               r4, r0
0:
        rsb               r2, r5, #0
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, #255
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r11, lr}
        bx                lr

asm_test::neg::u8::seqcst:
        push              {r4, r5, r11, lr}
        ldrb              r5, [r0]
        mov               r4, r0
0:
        rsb               r2, r5, #0
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, #255
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r11, lr}
        bx                lr

asm_test::neg::u8::acquire:
        push              {r4, r5, r11, lr}
        ldrb              r5, [r0]
        mov               r4, r0
0:
        rsb               r2, r5, #0
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, #255
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r11, lr}
        bx                lr

asm_test::neg::u8::relaxed:
        push              {r4, r5, r11, lr}
        ldrb              r5, [r0]
        mov               r4, r0
0:
        rsb               r2, r5, #0
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, #255
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r11, lr}
        bx                lr

asm_test::neg::u8::release:
        push              {r4, r5, r11, lr}
        ldrb              r5, [r0]
        mov               r4, r0
0:
        rsb               r2, r5, #0
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, #255
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r11, lr}
        bx                lr

asm_test::neg::u16::acqrel:
        push              {r4, r5, r6, lr}
        mov               r6, #255
        ldrh              r5, [r0]
        orr               r6, r6, #65280
        mov               r4, r0
0:
        rsb               r2, r5, #0
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, r6
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r6, lr}
        bx                lr

asm_test::neg::u16::seqcst:
        push              {r4, r5, r6, lr}
        mov               r6, #255
        ldrh              r5, [r0]
        orr               r6, r6, #65280
        mov               r4, r0
0:
        rsb               r2, r5, #0
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, r6
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r6, lr}
        bx                lr

asm_test::neg::u16::acquire:
        push              {r4, r5, r6, lr}
        mov               r6, #255
        ldrh              r5, [r0]
        orr               r6, r6, #65280
        mov               r4, r0
0:
        rsb               r2, r5, #0
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, r6
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r6, lr}
        bx                lr

asm_test::neg::u16::relaxed:
        push              {r4, r5, r6, lr}
        mov               r6, #255
        ldrh              r5, [r0]
        orr               r6, r6, #65280
        mov               r4, r0
0:
        rsb               r2, r5, #0
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, r6
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r6, lr}
        bx                lr

asm_test::neg::u16::release:
        push              {r4, r5, r6, lr}
        mov               r6, #255
        ldrh              r5, [r0]
        orr               r6, r6, #65280
        mov               r4, r0
0:
        rsb               r2, r5, #0
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, r6
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r6, lr}
        bx                lr

asm_test::neg::u32::acqrel:
        push              {r4, r5, r11, lr}
        ldr               r5, [r0]
        mov               r4, r0
0:
        rsb               r2, r5, #0
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        sub               r1, r0, r5
        mov               r5, r0
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r11, lr}
        bx                lr

asm_test::neg::u32::seqcst:
        push              {r4, r5, r11, lr}
        ldr               r5, [r0]
        mov               r4, r0
0:
        rsb               r2, r5, #0
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        sub               r1, r0, r5
        mov               r5, r0
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r11, lr}
        bx                lr

asm_test::neg::u32::acquire:
        push              {r4, r5, r11, lr}
        ldr               r5, [r0]
        mov               r4, r0
0:
        rsb               r2, r5, #0
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        sub               r1, r0, r5
        mov               r5, r0
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r11, lr}
        bx                lr

asm_test::neg::u32::relaxed:
        push              {r4, r5, r11, lr}
        ldr               r5, [r0]
        mov               r4, r0
0:
        rsb               r2, r5, #0
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        sub               r1, r0, r5
        mov               r5, r0
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r11, lr}
        bx                lr

asm_test::neg::u32::release:
        push              {r4, r5, r11, lr}
        ldr               r5, [r0]
        mov               r4, r0
0:
        rsb               r2, r5, #0
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        sub               r1, r0, r5
        mov               r5, r0
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r11, lr}
        bx                lr

asm_test::not::u8::acqrel:
        push              {r11, lr}
        mvn               r1, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::not::u8::seqcst:
        push              {r11, lr}
        mvn               r1, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::not::u8::acquire:
        push              {r11, lr}
        mvn               r1, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::not::u8::relaxed:
        push              {r11, lr}
        mvn               r1, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::not::u8::release:
        push              {r11, lr}
        mvn               r1, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::not::u16::acqrel:
        push              {r11, lr}
        mvn               r1, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::not::u16::seqcst:
        push              {r11, lr}
        mvn               r1, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::not::u16::acquire:
        push              {r11, lr}
        mvn               r1, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::not::u16::relaxed:
        push              {r11, lr}
        mvn               r1, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::not::u16::release:
        push              {r11, lr}
        mvn               r1, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::not::u32::acqrel:
        push              {r11, lr}
        mvn               r1, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::not::u32::seqcst:
        push              {r11, lr}
        mvn               r1, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::not::u32::acquire:
        push              {r11, lr}
        mvn               r1, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::not::u32::relaxed:
        push              {r11, lr}
        mvn               r1, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::not::u32::release:
        push              {r11, lr}
        mvn               r1, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::sub::u8::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::sub::u8::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::sub::u8::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::sub::u8::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::sub::u8::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::sub::u16::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::sub::u16::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::sub::u16::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::sub::u16::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::sub::u16::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::sub::u32::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::sub::u32::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::sub::u32::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::sub::u32::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::sub::u32::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::xor::u8::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::xor::u8::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::xor::u8::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::xor::u8::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::xor::u8::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::xor::u16::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::xor::u16::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::xor::u16::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::xor::u16::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::xor::u16::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::xor::u32::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::xor::u32::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::xor::u32::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::xor::u32::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::xor::u32::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::load::u8::seqcst:
        push              {r11, lr}
        mov               r1, #0
        mov               r2, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::load::u8::acquire:
        push              {r11, lr}
        mov               r1, #0
        mov               r2, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::load::u8::relaxed:
        ldrb              r0, [r0]
        bx                lr

asm_test::load::u16::seqcst:
        push              {r11, lr}
        mov               r1, #0
        mov               r2, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::load::u16::acquire:
        push              {r11, lr}
        mov               r1, #0
        mov               r2, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::load::u16::relaxed:
        ldrh              r0, [r0]
        bx                lr

asm_test::load::u32::seqcst:
        push              {r11, lr}
        mov               r1, #0
        mov               r2, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::load::u32::acquire:
        push              {r11, lr}
        mov               r1, #0
        mov               r2, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::load::u32::relaxed:
        ldr               r0, [r0]
        bx                lr

asm_test::swap::u8::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::swap::u8::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::swap::u8::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::swap::u8::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::swap::u8::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::swap::u16::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::swap::u16::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::swap::u16::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::swap::u16::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::swap::u16::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::swap::u32::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::swap::u32::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::swap::u32::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::swap::u32::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::swap::u32::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::store::u8::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::store::u8::relaxed:
        strb              r1, [r0]
        bx                lr

asm_test::store::u8::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::store::u16::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::store::u16::relaxed:
        strh              r1, [r0]
        bx                lr

asm_test::store::u16::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::store::u32::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::store::u32::relaxed:
        str               r1, [r0]
        bx                lr

asm_test::store::u32::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_or::u8::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_or::u8::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_or::u8::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_or::u8::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_or::u8::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_or::u16::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_or::u16::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_or::u16::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_or::u16::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_or::u16::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_or::u32::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_or::u32::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_or::u32::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_or::u32::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_or::u32::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_add::u8::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_add::u8::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_add::u8::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_add::u8::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_add::u8::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_add::u16::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_add::u16::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_add::u16::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_add::u16::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_add::u16::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_add::u32::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_add::u32::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_add::u32::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_add::u32::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_add::u32::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_and::u8::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_and::u8::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_and::u8::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_and::u8::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_and::u8::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_and::u16::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_and::u16::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_and::u16::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_and::u16::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_and::u16::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_and::u32::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_and::u32::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_and::u32::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_and::u32::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_and::u32::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_max::i8::acqrel:
        push              {r4, r5, r6, lr}
        ldrb              r5, [r0]
        mov               r4, r0
        lsl               r6, r1, #24
0:
        lsl               r0, r5, #24
        asr               r1, r6, #24
        cmp               r1, r0, asr #24
        asr               r2, r0, #24
        asrgt             r2, r6, #24
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, #255
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r6, lr}
        bx                lr

asm_test::fetch_max::i8::seqcst:
        push              {r4, r5, r6, lr}
        ldrb              r5, [r0]
        mov               r4, r0
        lsl               r6, r1, #24
0:
        lsl               r0, r5, #24
        asr               r1, r6, #24
        cmp               r1, r0, asr #24
        asr               r2, r0, #24
        asrgt             r2, r6, #24
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, #255
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r6, lr}
        bx                lr

asm_test::fetch_max::i8::acquire:
        push              {r4, r5, r6, lr}
        ldrb              r5, [r0]
        mov               r4, r0
        lsl               r6, r1, #24
0:
        lsl               r0, r5, #24
        asr               r1, r6, #24
        cmp               r1, r0, asr #24
        asr               r2, r0, #24
        asrgt             r2, r6, #24
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, #255
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r6, lr}
        bx                lr

asm_test::fetch_max::i8::relaxed:
        push              {r4, r5, r6, lr}
        ldrb              r5, [r0]
        mov               r4, r0
        lsl               r6, r1, #24
0:
        lsl               r0, r5, #24
        asr               r1, r6, #24
        cmp               r1, r0, asr #24
        asr               r2, r0, #24
        asrgt             r2, r6, #24
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, #255
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r6, lr}
        bx                lr

asm_test::fetch_max::i8::release:
        push              {r4, r5, r6, lr}
        ldrb              r5, [r0]
        mov               r4, r0
        lsl               r6, r1, #24
0:
        lsl               r0, r5, #24
        asr               r1, r6, #24
        cmp               r1, r0, asr #24
        asr               r2, r0, #24
        asrgt             r2, r6, #24
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, #255
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r6, lr}
        bx                lr

asm_test::fetch_max::i16::acqrel:
        push              {r4, r5, r6, r7, r11, lr}
        mov               r7, #255
        ldrh              r5, [r0]
        orr               r7, r7, #65280
        mov               r4, r0
        lsl               r6, r1, #16
0:
        lsl               r0, r5, #16
        asr               r1, r6, #16
        cmp               r1, r0, asr #16
        asr               r2, r0, #16
        asrgt             r2, r6, #16
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, r7
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r6, r7, r11, lr}
        bx                lr

asm_test::fetch_max::i16::seqcst:
        push              {r4, r5, r6, r7, r11, lr}
        mov               r7, #255
        ldrh              r5, [r0]
        orr               r7, r7, #65280
        mov               r4, r0
        lsl               r6, r1, #16
0:
        lsl               r0, r5, #16
        asr               r1, r6, #16
        cmp               r1, r0, asr #16
        asr               r2, r0, #16
        asrgt             r2, r6, #16
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, r7
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r6, r7, r11, lr}
        bx                lr

asm_test::fetch_max::i16::acquire:
        push              {r4, r5, r6, r7, r11, lr}
        mov               r7, #255
        ldrh              r5, [r0]
        orr               r7, r7, #65280
        mov               r4, r0
        lsl               r6, r1, #16
0:
        lsl               r0, r5, #16
        asr               r1, r6, #16
        cmp               r1, r0, asr #16
        asr               r2, r0, #16
        asrgt             r2, r6, #16
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, r7
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r6, r7, r11, lr}
        bx                lr

asm_test::fetch_max::i16::relaxed:
        push              {r4, r5, r6, r7, r11, lr}
        mov               r7, #255
        ldrh              r5, [r0]
        orr               r7, r7, #65280
        mov               r4, r0
        lsl               r6, r1, #16
0:
        lsl               r0, r5, #16
        asr               r1, r6, #16
        cmp               r1, r0, asr #16
        asr               r2, r0, #16
        asrgt             r2, r6, #16
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, r7
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r6, r7, r11, lr}
        bx                lr

asm_test::fetch_max::i16::release:
        push              {r4, r5, r6, r7, r11, lr}
        mov               r7, #255
        ldrh              r5, [r0]
        orr               r7, r7, #65280
        mov               r4, r0
        lsl               r6, r1, #16
0:
        lsl               r0, r5, #16
        asr               r1, r6, #16
        cmp               r1, r0, asr #16
        asr               r2, r0, #16
        asrgt             r2, r6, #16
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, r7
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r6, r7, r11, lr}
        bx                lr

asm_test::fetch_max::i32::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_max::i32::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_max::i32::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_max::i32::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_max::i32::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_min::i8::acqrel:
        push              {r4, r5, r6, lr}
        ldrb              r5, [r0]
        mov               r4, r0
        lsl               r6, r1, #24
0:
        lsl               r0, r5, #24
        asr               r1, r6, #24
        cmp               r1, r0, asr #24
        asr               r2, r0, #24
        asrlt             r2, r6, #24
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, #255
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r6, lr}
        bx                lr

asm_test::fetch_min::i8::seqcst:
        push              {r4, r5, r6, lr}
        ldrb              r5, [r0]
        mov               r4, r0
        lsl               r6, r1, #24
0:
        lsl               r0, r5, #24
        asr               r1, r6, #24
        cmp               r1, r0, asr #24
        asr               r2, r0, #24
        asrlt             r2, r6, #24
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, #255
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r6, lr}
        bx                lr

asm_test::fetch_min::i8::acquire:
        push              {r4, r5, r6, lr}
        ldrb              r5, [r0]
        mov               r4, r0
        lsl               r6, r1, #24
0:
        lsl               r0, r5, #24
        asr               r1, r6, #24
        cmp               r1, r0, asr #24
        asr               r2, r0, #24
        asrlt             r2, r6, #24
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, #255
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r6, lr}
        bx                lr

asm_test::fetch_min::i8::relaxed:
        push              {r4, r5, r6, lr}
        ldrb              r5, [r0]
        mov               r4, r0
        lsl               r6, r1, #24
0:
        lsl               r0, r5, #24
        asr               r1, r6, #24
        cmp               r1, r0, asr #24
        asr               r2, r0, #24
        asrlt             r2, r6, #24
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, #255
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r6, lr}
        bx                lr

asm_test::fetch_min::i8::release:
        push              {r4, r5, r6, lr}
        ldrb              r5, [r0]
        mov               r4, r0
        lsl               r6, r1, #24
0:
        lsl               r0, r5, #24
        asr               r1, r6, #24
        cmp               r1, r0, asr #24
        asr               r2, r0, #24
        asrlt             r2, r6, #24
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, #255
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r6, lr}
        bx                lr

asm_test::fetch_min::i16::acqrel:
        push              {r4, r5, r6, r7, r11, lr}
        mov               r7, #255
        ldrh              r5, [r0]
        orr               r7, r7, #65280
        mov               r4, r0
        lsl               r6, r1, #16
0:
        lsl               r0, r5, #16
        asr               r1, r6, #16
        cmp               r1, r0, asr #16
        asr               r2, r0, #16
        asrlt             r2, r6, #16
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, r7
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r6, r7, r11, lr}
        bx                lr

asm_test::fetch_min::i16::seqcst:
        push              {r4, r5, r6, r7, r11, lr}
        mov               r7, #255
        ldrh              r5, [r0]
        orr               r7, r7, #65280
        mov               r4, r0
        lsl               r6, r1, #16
0:
        lsl               r0, r5, #16
        asr               r1, r6, #16
        cmp               r1, r0, asr #16
        asr               r2, r0, #16
        asrlt             r2, r6, #16
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, r7
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r6, r7, r11, lr}
        bx                lr

asm_test::fetch_min::i16::acquire:
        push              {r4, r5, r6, r7, r11, lr}
        mov               r7, #255
        ldrh              r5, [r0]
        orr               r7, r7, #65280
        mov               r4, r0
        lsl               r6, r1, #16
0:
        lsl               r0, r5, #16
        asr               r1, r6, #16
        cmp               r1, r0, asr #16
        asr               r2, r0, #16
        asrlt             r2, r6, #16
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, r7
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r6, r7, r11, lr}
        bx                lr

asm_test::fetch_min::i16::relaxed:
        push              {r4, r5, r6, r7, r11, lr}
        mov               r7, #255
        ldrh              r5, [r0]
        orr               r7, r7, #65280
        mov               r4, r0
        lsl               r6, r1, #16
0:
        lsl               r0, r5, #16
        asr               r1, r6, #16
        cmp               r1, r0, asr #16
        asr               r2, r0, #16
        asrlt             r2, r6, #16
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, r7
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r6, r7, r11, lr}
        bx                lr

asm_test::fetch_min::i16::release:
        push              {r4, r5, r6, r7, r11, lr}
        mov               r7, #255
        ldrh              r5, [r0]
        orr               r7, r7, #65280
        mov               r4, r0
        lsl               r6, r1, #16
0:
        lsl               r0, r5, #16
        asr               r1, r6, #16
        cmp               r1, r0, asr #16
        asr               r2, r0, #16
        asrlt             r2, r6, #16
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, r7
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r6, r7, r11, lr}
        bx                lr

asm_test::fetch_min::i32::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_min::i32::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_min::i32::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_min::i32::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_min::i32::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_neg::u8::acqrel:
        push              {r4, r5, r11, lr}
        ldrb              r5, [r0]
        mov               r4, r0
0:
        rsb               r2, r5, #0
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, #255
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r11, lr}
        bx                lr

asm_test::fetch_neg::u8::seqcst:
        push              {r4, r5, r11, lr}
        ldrb              r5, [r0]
        mov               r4, r0
0:
        rsb               r2, r5, #0
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, #255
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r11, lr}
        bx                lr

asm_test::fetch_neg::u8::acquire:
        push              {r4, r5, r11, lr}
        ldrb              r5, [r0]
        mov               r4, r0
0:
        rsb               r2, r5, #0
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, #255
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r11, lr}
        bx                lr

asm_test::fetch_neg::u8::relaxed:
        push              {r4, r5, r11, lr}
        ldrb              r5, [r0]
        mov               r4, r0
0:
        rsb               r2, r5, #0
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, #255
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r11, lr}
        bx                lr

asm_test::fetch_neg::u8::release:
        push              {r4, r5, r11, lr}
        ldrb              r5, [r0]
        mov               r4, r0
0:
        rsb               r2, r5, #0
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, #255
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r11, lr}
        bx                lr

asm_test::fetch_neg::u16::acqrel:
        push              {r4, r5, r6, lr}
        mov               r6, #255
        ldrh              r5, [r0]
        orr               r6, r6, #65280
        mov               r4, r0
0:
        rsb               r2, r5, #0
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, r6
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r6, lr}
        bx                lr

asm_test::fetch_neg::u16::seqcst:
        push              {r4, r5, r6, lr}
        mov               r6, #255
        ldrh              r5, [r0]
        orr               r6, r6, #65280
        mov               r4, r0
0:
        rsb               r2, r5, #0
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, r6
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r6, lr}
        bx                lr

asm_test::fetch_neg::u16::acquire:
        push              {r4, r5, r6, lr}
        mov               r6, #255
        ldrh              r5, [r0]
        orr               r6, r6, #65280
        mov               r4, r0
0:
        rsb               r2, r5, #0
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, r6
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r6, lr}
        bx                lr

asm_test::fetch_neg::u16::relaxed:
        push              {r4, r5, r6, lr}
        mov               r6, #255
        ldrh              r5, [r0]
        orr               r6, r6, #65280
        mov               r4, r0
0:
        rsb               r2, r5, #0
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, r6
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r6, lr}
        bx                lr

asm_test::fetch_neg::u16::release:
        push              {r4, r5, r6, lr}
        mov               r6, #255
        ldrh              r5, [r0]
        orr               r6, r6, #65280
        mov               r4, r0
0:
        rsb               r2, r5, #0
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        and               r1, r5, r6
        mov               r5, r0
        sub               r1, r0, r1
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r6, lr}
        bx                lr

asm_test::fetch_neg::u32::acqrel:
        push              {r4, r5, r11, lr}
        ldr               r5, [r0]
        mov               r4, r0
0:
        rsb               r2, r5, #0
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        sub               r1, r0, r5
        mov               r5, r0
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r11, lr}
        bx                lr

asm_test::fetch_neg::u32::seqcst:
        push              {r4, r5, r11, lr}
        ldr               r5, [r0]
        mov               r4, r0
0:
        rsb               r2, r5, #0
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        sub               r1, r0, r5
        mov               r5, r0
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r11, lr}
        bx                lr

asm_test::fetch_neg::u32::acquire:
        push              {r4, r5, r11, lr}
        ldr               r5, [r0]
        mov               r4, r0
0:
        rsb               r2, r5, #0
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        sub               r1, r0, r5
        mov               r5, r0
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r11, lr}
        bx                lr

asm_test::fetch_neg::u32::relaxed:
        push              {r4, r5, r11, lr}
        ldr               r5, [r0]
        mov               r4, r0
0:
        rsb               r2, r5, #0
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        sub               r1, r0, r5
        mov               r5, r0
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r11, lr}
        bx                lr

asm_test::fetch_neg::u32::release:
        push              {r4, r5, r11, lr}
        ldr               r5, [r0]
        mov               r4, r0
0:
        rsb               r2, r5, #0
        mov               r0, r4
        mov               r1, r5
1:
        bl                1f
        sub               r1, r0, r5
        mov               r5, r0
        rsbs              r2, r1, #0
        adc               r1, r1, r2
        cmp               r1, #1
        bne               0b
        pop               {r4, r5, r11, lr}
        bx                lr

asm_test::fetch_not::u8::acqrel:
        push              {r11, lr}
        mvn               r1, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_not::u8::seqcst:
        push              {r11, lr}
        mvn               r1, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_not::u8::acquire:
        push              {r11, lr}
        mvn               r1, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_not::u8::relaxed:
        push              {r11, lr}
        mvn               r1, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_not::u8::release:
        push              {r11, lr}
        mvn               r1, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_not::u16::acqrel:
        push              {r11, lr}
        mvn               r1, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_not::u16::seqcst:
        push              {r11, lr}
        mvn               r1, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_not::u16::acquire:
        push              {r11, lr}
        mvn               r1, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_not::u16::relaxed:
        push              {r11, lr}
        mvn               r1, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_not::u16::release:
        push              {r11, lr}
        mvn               r1, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_not::u32::acqrel:
        push              {r11, lr}
        mvn               r1, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_not::u32::seqcst:
        push              {r11, lr}
        mvn               r1, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_not::u32::acquire:
        push              {r11, lr}
        mvn               r1, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_not::u32::relaxed:
        push              {r11, lr}
        mvn               r1, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_not::u32::release:
        push              {r11, lr}
        mvn               r1, #0
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_sub::u8::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_sub::u8::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_sub::u8::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_sub::u8::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_sub::u8::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_sub::u16::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_sub::u16::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_sub::u16::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_sub::u16::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_sub::u16::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_sub::u32::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_sub::u32::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_sub::u32::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_sub::u32::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_sub::u32::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_xor::u8::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_xor::u8::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_xor::u8::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_xor::u8::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_xor::u8::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_xor::u16::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_xor::u16::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_xor::u16::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_xor::u16::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_xor::u16::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_xor::u32::acqrel:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_xor::u32::seqcst:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_xor::u32::acquire:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_xor::u32::relaxed:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fetch_xor::u32::release:
        push              {r11, lr}
0:
        bl                0f
        pop               {r11, lr}
        bx                lr


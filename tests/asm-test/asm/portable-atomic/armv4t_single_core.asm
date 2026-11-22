asm_test::fence::acqrel:
        push              {r11, lr}
        mov               r11, sp
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fence::seqcst:
        push              {r11, lr}
        mov               r11, sp
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fence::acquire:
        push              {r11, lr}
        mov               r11, sp
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::fence::release:
        push              {r11, lr}
        mov               r11, sp
0:
        bl                0f
        pop               {r11, lr}
        bx                lr

asm_test::bit_toggle::u8::acqrel:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #7
        mov               r12, #1
        ldrb              r2, [r0]
        eor               r3, r2, r12, lsl r1
        strb              r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_toggle::u8::seqcst:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #7
        mov               r12, #1
        ldrb              r2, [r0]
        eor               r3, r2, r12, lsl r1
        strb              r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_toggle::u8::acquire:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #7
        mov               r12, #1
        ldrb              r2, [r0]
        eor               r3, r2, r12, lsl r1
        strb              r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_toggle::u8::relaxed:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #7
        mov               r12, #1
        ldrb              r2, [r0]
        eor               r3, r2, r12, lsl r1
        strb              r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_toggle::u8::release:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #7
        mov               r12, #1
        ldrb              r2, [r0]
        eor               r3, r2, r12, lsl r1
        strb              r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_toggle::u16::acqrel:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #15
        mov               r12, #1
        ldrh              r2, [r0]
        eor               r3, r2, r12, lsl r1
        strh              r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_toggle::u16::seqcst:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #15
        mov               r12, #1
        ldrh              r2, [r0]
        eor               r3, r2, r12, lsl r1
        strh              r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_toggle::u16::acquire:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #15
        mov               r12, #1
        ldrh              r2, [r0]
        eor               r3, r2, r12, lsl r1
        strh              r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_toggle::u16::relaxed:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #15
        mov               r12, #1
        ldrh              r2, [r0]
        eor               r3, r2, r12, lsl r1
        strh              r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_toggle::u16::release:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #15
        mov               r12, #1
        ldrh              r2, [r0]
        eor               r3, r2, r12, lsl r1
        strh              r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_toggle::u32::acqrel:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #31
        mov               r12, #1
        ldr               r2, [r0]
        eor               r3, r2, r12, lsl r1
        str               r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_toggle::u32::seqcst:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #31
        mov               r12, #1
        ldr               r2, [r0]
        eor               r3, r2, r12, lsl r1
        str               r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_toggle::u32::acquire:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #31
        mov               r12, #1
        ldr               r2, [r0]
        eor               r3, r2, r12, lsl r1
        str               r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_toggle::u32::relaxed:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #31
        mov               r12, #1
        ldr               r2, [r0]
        eor               r3, r2, r12, lsl r1
        str               r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_toggle::u32::release:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #31
        mov               r12, #1
        ldr               r2, [r0]
        eor               r3, r2, r12, lsl r1
        str               r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::fetch_nand::u8::acqrel_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        mvn               r3, r1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_nand::u8::seqcst_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        mvn               r3, r1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_nand::u8::acqrel_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #255
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u8::acquire_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        mvn               r3, r1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_nand::u8::relaxed_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        mvn               r3, r1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_nand::u8::release_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        mvn               r3, r1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_nand::u8::seqcst_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #255
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u8::acquire_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #255
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u8::relaxed_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #255
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u8::release_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #255
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u8::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        and               r1, r2, r1
        mvn               r1, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_nand::u8::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        and               r1, r2, r1
        mvn               r1, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_nand::u8::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        and               r1, r2, r1
        mvn               r1, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_nand::u8::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        and               r1, r2, r1
        mvn               r1, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_nand::u8::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        and               r1, r2, r1
        mvn               r1, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_nand::u16::acqrel_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        mvn               r3, r1
        strh              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_nand::u16::seqcst_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        mvn               r3, r1
        strh              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_nand::u16::acqrel_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #255
        ldrh              r1, [r0]
        orr               r3, r3, #65280
        strh              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u16::acquire_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        mvn               r3, r1
        strh              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_nand::u16::relaxed_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        mvn               r3, r1
        strh              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_nand::u16::release_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        mvn               r3, r1
        strh              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_nand::u16::seqcst_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #255
        ldrh              r1, [r0]
        orr               r3, r3, #65280
        strh              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u16::acquire_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #255
        ldrh              r1, [r0]
        orr               r3, r3, #65280
        strh              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u16::relaxed_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #255
        ldrh              r1, [r0]
        orr               r3, r3, #65280
        strh              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u16::release_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #255
        ldrh              r1, [r0]
        orr               r3, r3, #65280
        strh              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u16::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        and               r1, r2, r1
        mvn               r1, r1
        strh              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_nand::u16::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        and               r1, r2, r1
        mvn               r1, r1
        strh              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_nand::u16::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        and               r1, r2, r1
        mvn               r1, r1
        strh              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_nand::u16::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        and               r1, r2, r1
        mvn               r1, r1
        strh              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_nand::u16::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        and               r1, r2, r1
        mvn               r1, r1
        strh              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_nand::u32::acqrel_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        mvn               r3, r1
        str               r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_nand::u32::seqcst_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        mvn               r3, r1
        str               r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_nand::u32::acqrel_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mvn               r3, #0
        ldr               r1, [r0]
        str               r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u32::acquire_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        mvn               r3, r1
        str               r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_nand::u32::relaxed_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        mvn               r3, r1
        str               r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_nand::u32::release_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        mvn               r3, r1
        str               r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_nand::u32::seqcst_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mvn               r3, #0
        ldr               r1, [r0]
        str               r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u32::acquire_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mvn               r3, #0
        ldr               r1, [r0]
        str               r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u32::relaxed_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mvn               r3, #0
        ldr               r1, [r0]
        str               r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u32::release_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mvn               r3, #0
        ldr               r1, [r0]
        str               r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u32::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        and               r1, r2, r1
        mvn               r1, r1
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_nand::u32::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        and               r1, r2, r1
        mvn               r1, r1
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_nand::u32::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        and               r1, r2, r1
        mvn               r1, r1
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_nand::u32::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        and               r1, r2, r1
        mvn               r1, r1
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_nand::u32::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        and               r1, r2, r1
        mvn               r1, r1
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_nand::bool::acqrel_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        eor               r3, r1, #1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_nand::bool::seqcst_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        eor               r3, r1, #1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_nand::bool::acqrel_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::bool::acquire_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        eor               r3, r1, #1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_nand::bool::relaxed_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        eor               r3, r1, #1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_nand::bool::release_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        eor               r3, r1, #1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_nand::bool::seqcst_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::bool::acquire_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::bool::relaxed_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::bool::release_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::bool::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        cmp               r1, #0
        ldrb              r2, [r0]
        beq               0f
        eor               r1, r2, #1
        strb              r1, [r0]
        and               r0, r2, #1
        msr               CPSR_c, r3
        bx                lr
0:
        mov               r1, #1
        strb              r1, [r0]
        and               r0, r2, #1
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_nand::bool::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        cmp               r1, #0
        ldrb              r2, [r0]
        beq               0f
        eor               r1, r2, #1
        strb              r1, [r0]
        and               r0, r2, #1
        msr               CPSR_c, r3
        bx                lr
0:
        mov               r1, #1
        strb              r1, [r0]
        and               r0, r2, #1
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_nand::bool::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        cmp               r1, #0
        ldrb              r2, [r0]
        beq               0f
        eor               r1, r2, #1
        strb              r1, [r0]
        and               r0, r2, #1
        msr               CPSR_c, r3
        bx                lr
0:
        mov               r1, #1
        strb              r1, [r0]
        and               r0, r2, #1
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_nand::bool::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        cmp               r1, #0
        ldrb              r2, [r0]
        beq               0f
        eor               r1, r2, #1
        strb              r1, [r0]
        and               r0, r2, #1
        msr               CPSR_c, r3
        bx                lr
0:
        mov               r1, #1
        strb              r1, [r0]
        and               r0, r2, #1
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_nand::bool::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        cmp               r1, #0
        ldrb              r2, [r0]
        beq               0f
        eor               r1, r2, #1
        strb              r1, [r0]
        and               r0, r2, #1
        msr               CPSR_c, r3
        bx                lr
0:
        mov               r1, #1
        strb              r1, [r0]
        and               r0, r2, #1
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_umax::u8::acqrel:
        and               r2, r1, #255
        mrs               r3, apsr
        orr               r1, r3, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r2
        movhi             r2, r1
        strb              r2, [r0]
        mov               r0, r1
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_umax::u8::seqcst:
        and               r2, r1, #255
        mrs               r3, apsr
        orr               r1, r3, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r2
        movhi             r2, r1
        strb              r2, [r0]
        mov               r0, r1
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_umax::u8::acquire:
        and               r2, r1, #255
        mrs               r3, apsr
        orr               r1, r3, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r2
        movhi             r2, r1
        strb              r2, [r0]
        mov               r0, r1
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_umax::u8::relaxed:
        and               r2, r1, #255
        mrs               r3, apsr
        orr               r1, r3, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r2
        movhi             r2, r1
        strb              r2, [r0]
        mov               r0, r1
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_umax::u8::release:
        and               r2, r1, #255
        mrs               r3, apsr
        orr               r1, r3, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r2
        movhi             r2, r1
        strb              r2, [r0]
        mov               r0, r1
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_umax::u16::acqrel:
        mov               r2, #255
        orr               r2, r2, #65280
        and               r2, r1, r2
        mrs               r3, apsr
        orr               r1, r3, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        cmp               r1, r2
        movhi             r2, r1
        strh              r2, [r0]
        mov               r0, r1
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_umax::u16::seqcst:
        mov               r2, #255
        orr               r2, r2, #65280
        and               r2, r1, r2
        mrs               r3, apsr
        orr               r1, r3, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        cmp               r1, r2
        movhi             r2, r1
        strh              r2, [r0]
        mov               r0, r1
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_umax::u16::acquire:
        mov               r2, #255
        orr               r2, r2, #65280
        and               r2, r1, r2
        mrs               r3, apsr
        orr               r1, r3, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        cmp               r1, r2
        movhi             r2, r1
        strh              r2, [r0]
        mov               r0, r1
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_umax::u16::relaxed:
        mov               r2, #255
        orr               r2, r2, #65280
        and               r2, r1, r2
        mrs               r3, apsr
        orr               r1, r3, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        cmp               r1, r2
        movhi             r2, r1
        strh              r2, [r0]
        mov               r0, r1
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_umax::u16::release:
        mov               r2, #255
        orr               r2, r2, #65280
        and               r2, r1, r2
        mrs               r3, apsr
        orr               r1, r3, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        cmp               r1, r2
        movhi             r2, r1
        strh              r2, [r0]
        mov               r0, r1
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_umax::u32::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        cmp               r2, r1
        movhi             r1, r2
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_umax::u32::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        cmp               r2, r1
        movhi             r1, r2
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_umax::u32::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        cmp               r2, r1
        movhi             r1, r2
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_umax::u32::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        cmp               r2, r1
        movhi             r1, r2
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_umax::u32::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        cmp               r2, r1
        movhi             r1, r2
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_umin::u8::acqrel:
        and               r2, r1, #255
        mrs               r3, apsr
        orr               r1, r3, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r2
        movlo             r2, r1
        strb              r2, [r0]
        mov               r0, r1
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_umin::u8::seqcst:
        and               r2, r1, #255
        mrs               r3, apsr
        orr               r1, r3, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r2
        movlo             r2, r1
        strb              r2, [r0]
        mov               r0, r1
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_umin::u8::acquire:
        and               r2, r1, #255
        mrs               r3, apsr
        orr               r1, r3, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r2
        movlo             r2, r1
        strb              r2, [r0]
        mov               r0, r1
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_umin::u8::relaxed:
        and               r2, r1, #255
        mrs               r3, apsr
        orr               r1, r3, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r2
        movlo             r2, r1
        strb              r2, [r0]
        mov               r0, r1
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_umin::u8::release:
        and               r2, r1, #255
        mrs               r3, apsr
        orr               r1, r3, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r2
        movlo             r2, r1
        strb              r2, [r0]
        mov               r0, r1
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_umin::u16::acqrel:
        mov               r2, #255
        orr               r2, r2, #65280
        and               r2, r1, r2
        mrs               r3, apsr
        orr               r1, r3, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        cmp               r1, r2
        movlo             r2, r1
        strh              r2, [r0]
        mov               r0, r1
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_umin::u16::seqcst:
        mov               r2, #255
        orr               r2, r2, #65280
        and               r2, r1, r2
        mrs               r3, apsr
        orr               r1, r3, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        cmp               r1, r2
        movlo             r2, r1
        strh              r2, [r0]
        mov               r0, r1
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_umin::u16::acquire:
        mov               r2, #255
        orr               r2, r2, #65280
        and               r2, r1, r2
        mrs               r3, apsr
        orr               r1, r3, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        cmp               r1, r2
        movlo             r2, r1
        strh              r2, [r0]
        mov               r0, r1
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_umin::u16::relaxed:
        mov               r2, #255
        orr               r2, r2, #65280
        and               r2, r1, r2
        mrs               r3, apsr
        orr               r1, r3, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        cmp               r1, r2
        movlo             r2, r1
        strh              r2, [r0]
        mov               r0, r1
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_umin::u16::release:
        mov               r2, #255
        orr               r2, r2, #65280
        and               r2, r1, r2
        mrs               r3, apsr
        orr               r1, r3, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        cmp               r1, r2
        movlo             r2, r1
        strh              r2, [r0]
        mov               r0, r1
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_umin::u32::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        cmp               r2, r1
        movlo             r1, r2
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_umin::u32::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        cmp               r2, r1
        movlo             r1, r2
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_umin::u32::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        cmp               r2, r1
        movlo             r1, r2
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_umin::u32::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        cmp               r2, r1
        movlo             r1, r2
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_umin::u32::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        cmp               r2, r1
        movlo             r1, r2
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::compare_exchange::u8::acqrel_seqcst:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r3, #255
        cmp               r3, r1
        strbeq            r2, [r0]
        subs              r0, r3, r1
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange::u8::seqcst_seqcst:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r3, #255
        cmp               r3, r1
        strbeq            r2, [r0]
        subs              r0, r3, r1
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange::u8::acqrel_acquire:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r3, #255
        cmp               r3, r1
        strbeq            r2, [r0]
        subs              r0, r3, r1
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange::u8::acqrel_relaxed:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r3, #255
        cmp               r3, r1
        strbeq            r2, [r0]
        subs              r0, r3, r1
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange::u8::acquire_seqcst:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r3, #255
        cmp               r3, r1
        strbeq            r2, [r0]
        subs              r0, r3, r1
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange::u8::relaxed_seqcst:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r3, #255
        cmp               r3, r1
        strbeq            r2, [r0]
        subs              r0, r3, r1
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange::u8::release_seqcst:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r3, #255
        cmp               r3, r1
        strbeq            r2, [r0]
        subs              r0, r3, r1
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange::u8::seqcst_acquire:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r3, #255
        cmp               r3, r1
        strbeq            r2, [r0]
        subs              r0, r3, r1
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange::u8::seqcst_relaxed:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r3, #255
        cmp               r3, r1
        strbeq            r2, [r0]
        subs              r0, r3, r1
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange::u8::acquire_acquire:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r3, #255
        cmp               r3, r1
        strbeq            r2, [r0]
        subs              r0, r3, r1
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange::u8::acquire_relaxed:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r3, #255
        cmp               r3, r1
        strbeq            r2, [r0]
        subs              r0, r3, r1
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange::u8::relaxed_acquire:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r3, #255
        cmp               r3, r1
        strbeq            r2, [r0]
        subs              r0, r3, r1
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange::u8::relaxed_relaxed:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r3, #255
        cmp               r3, r1
        strbeq            r2, [r0]
        subs              r0, r3, r1
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange::u8::release_acquire:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r3, #255
        cmp               r3, r1
        strbeq            r2, [r0]
        subs              r0, r3, r1
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange::u8::release_relaxed:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r3, #255
        cmp               r3, r1
        strbeq            r2, [r0]
        subs              r0, r3, r1
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange::f32::acqrel_seqcst:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        cmp               r1, r3
        streq             r2, [r0]
        subs              r0, r1, r3
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange::f32::seqcst_seqcst:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        cmp               r1, r3
        streq             r2, [r0]
        subs              r0, r1, r3
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange::f32::acqrel_acquire:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        cmp               r1, r3
        streq             r2, [r0]
        subs              r0, r1, r3
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange::f32::acqrel_relaxed:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        cmp               r1, r3
        streq             r2, [r0]
        subs              r0, r1, r3
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange::f32::acquire_seqcst:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        cmp               r1, r3
        streq             r2, [r0]
        subs              r0, r1, r3
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange::f32::relaxed_seqcst:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        cmp               r1, r3
        streq             r2, [r0]
        subs              r0, r1, r3
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange::f32::release_seqcst:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        cmp               r1, r3
        streq             r2, [r0]
        subs              r0, r1, r3
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange::f32::seqcst_acquire:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        cmp               r1, r3
        streq             r2, [r0]
        subs              r0, r1, r3
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange::f32::seqcst_relaxed:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        cmp               r1, r3
        streq             r2, [r0]
        subs              r0, r1, r3
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange::f32::acquire_acquire:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        cmp               r1, r3
        streq             r2, [r0]
        subs              r0, r1, r3
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange::f32::acquire_relaxed:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        cmp               r1, r3
        streq             r2, [r0]
        subs              r0, r1, r3
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange::f32::relaxed_acquire:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        cmp               r1, r3
        streq             r2, [r0]
        subs              r0, r1, r3
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange::f32::relaxed_relaxed:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        cmp               r1, r3
        streq             r2, [r0]
        subs              r0, r1, r3
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange::f32::release_acquire:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        cmp               r1, r3
        streq             r2, [r0]
        subs              r0, r1, r3
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange::f32::release_relaxed:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        cmp               r1, r3
        streq             r2, [r0]
        subs              r0, r1, r3
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange::u16::acqrel_seqcst:
        push              {r11, lr}
        mov               r3, #255
        orr               r3, r3, #65280
        and               lr, r1, r3
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrh              r1, [r0]
        cmp               lr, r1
        strheq            r2, [r0]
        moveq             r3, #0
        msr               CPSR_c, r12
        mov               r0, r3
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange::u16::seqcst_seqcst:
        push              {r11, lr}
        mov               r3, #255
        orr               r3, r3, #65280
        and               lr, r1, r3
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrh              r1, [r0]
        cmp               lr, r1
        strheq            r2, [r0]
        moveq             r3, #0
        msr               CPSR_c, r12
        mov               r0, r3
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange::u16::acqrel_acquire:
        push              {r11, lr}
        mov               r3, #255
        orr               r3, r3, #65280
        and               lr, r1, r3
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrh              r1, [r0]
        cmp               lr, r1
        strheq            r2, [r0]
        moveq             r3, #0
        msr               CPSR_c, r12
        mov               r0, r3
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange::u16::acqrel_relaxed:
        push              {r11, lr}
        mov               r3, #255
        orr               r3, r3, #65280
        and               lr, r1, r3
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrh              r1, [r0]
        cmp               lr, r1
        strheq            r2, [r0]
        moveq             r3, #0
        msr               CPSR_c, r12
        mov               r0, r3
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange::u16::acquire_seqcst:
        push              {r11, lr}
        mov               r3, #255
        orr               r3, r3, #65280
        and               lr, r1, r3
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrh              r1, [r0]
        cmp               lr, r1
        strheq            r2, [r0]
        moveq             r3, #0
        msr               CPSR_c, r12
        mov               r0, r3
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange::u16::relaxed_seqcst:
        push              {r11, lr}
        mov               r3, #255
        orr               r3, r3, #65280
        and               lr, r1, r3
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrh              r1, [r0]
        cmp               lr, r1
        strheq            r2, [r0]
        moveq             r3, #0
        msr               CPSR_c, r12
        mov               r0, r3
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange::u16::release_seqcst:
        push              {r11, lr}
        mov               r3, #255
        orr               r3, r3, #65280
        and               lr, r1, r3
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrh              r1, [r0]
        cmp               lr, r1
        strheq            r2, [r0]
        moveq             r3, #0
        msr               CPSR_c, r12
        mov               r0, r3
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange::u16::seqcst_acquire:
        push              {r11, lr}
        mov               r3, #255
        orr               r3, r3, #65280
        and               lr, r1, r3
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrh              r1, [r0]
        cmp               lr, r1
        strheq            r2, [r0]
        moveq             r3, #0
        msr               CPSR_c, r12
        mov               r0, r3
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange::u16::seqcst_relaxed:
        push              {r11, lr}
        mov               r3, #255
        orr               r3, r3, #65280
        and               lr, r1, r3
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrh              r1, [r0]
        cmp               lr, r1
        strheq            r2, [r0]
        moveq             r3, #0
        msr               CPSR_c, r12
        mov               r0, r3
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange::u16::acquire_acquire:
        push              {r11, lr}
        mov               r3, #255
        orr               r3, r3, #65280
        and               lr, r1, r3
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrh              r1, [r0]
        cmp               lr, r1
        strheq            r2, [r0]
        moveq             r3, #0
        msr               CPSR_c, r12
        mov               r0, r3
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange::u16::acquire_relaxed:
        push              {r11, lr}
        mov               r3, #255
        orr               r3, r3, #65280
        and               lr, r1, r3
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrh              r1, [r0]
        cmp               lr, r1
        strheq            r2, [r0]
        moveq             r3, #0
        msr               CPSR_c, r12
        mov               r0, r3
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange::u16::relaxed_acquire:
        push              {r11, lr}
        mov               r3, #255
        orr               r3, r3, #65280
        and               lr, r1, r3
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrh              r1, [r0]
        cmp               lr, r1
        strheq            r2, [r0]
        moveq             r3, #0
        msr               CPSR_c, r12
        mov               r0, r3
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange::u16::relaxed_relaxed:
        push              {r11, lr}
        mov               r3, #255
        orr               r3, r3, #65280
        and               lr, r1, r3
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrh              r1, [r0]
        cmp               lr, r1
        strheq            r2, [r0]
        moveq             r3, #0
        msr               CPSR_c, r12
        mov               r0, r3
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange::u16::release_acquire:
        push              {r11, lr}
        mov               r3, #255
        orr               r3, r3, #65280
        and               lr, r1, r3
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrh              r1, [r0]
        cmp               lr, r1
        strheq            r2, [r0]
        moveq             r3, #0
        msr               CPSR_c, r12
        mov               r0, r3
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange::u16::release_relaxed:
        push              {r11, lr}
        mov               r3, #255
        orr               r3, r3, #65280
        and               lr, r1, r3
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrh              r1, [r0]
        cmp               lr, r1
        strheq            r2, [r0]
        moveq             r3, #0
        msr               CPSR_c, r12
        mov               r0, r3
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange::u32::acqrel_seqcst:
        push              {r11, lr}
        mov               r3, r0
        mrs               lr, apsr
        orr               r0, lr, #128
        msr               CPSR_c, r0
        mov               r12, r1
        ldr               r1, [r3]
        mov               r0, #1
        cmp               r12, r1
        streq             r2, [r3]
        moveq             r0, #0
        msr               CPSR_c, lr
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange::u32::seqcst_seqcst:
        push              {r11, lr}
        mov               r3, r0
        mrs               lr, apsr
        orr               r0, lr, #128
        msr               CPSR_c, r0
        mov               r12, r1
        ldr               r1, [r3]
        mov               r0, #1
        cmp               r12, r1
        streq             r2, [r3]
        moveq             r0, #0
        msr               CPSR_c, lr
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange::u32::acqrel_acquire:
        push              {r11, lr}
        mov               r3, r0
        mrs               lr, apsr
        orr               r0, lr, #128
        msr               CPSR_c, r0
        mov               r12, r1
        ldr               r1, [r3]
        mov               r0, #1
        cmp               r12, r1
        streq             r2, [r3]
        moveq             r0, #0
        msr               CPSR_c, lr
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange::u32::acqrel_relaxed:
        push              {r11, lr}
        mov               r3, r0
        mrs               lr, apsr
        orr               r0, lr, #128
        msr               CPSR_c, r0
        mov               r12, r1
        ldr               r1, [r3]
        mov               r0, #1
        cmp               r12, r1
        streq             r2, [r3]
        moveq             r0, #0
        msr               CPSR_c, lr
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange::u32::acquire_seqcst:
        push              {r11, lr}
        mov               r3, r0
        mrs               lr, apsr
        orr               r0, lr, #128
        msr               CPSR_c, r0
        mov               r12, r1
        ldr               r1, [r3]
        mov               r0, #1
        cmp               r12, r1
        streq             r2, [r3]
        moveq             r0, #0
        msr               CPSR_c, lr
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange::u32::relaxed_seqcst:
        push              {r11, lr}
        mov               r3, r0
        mrs               lr, apsr
        orr               r0, lr, #128
        msr               CPSR_c, r0
        mov               r12, r1
        ldr               r1, [r3]
        mov               r0, #1
        cmp               r12, r1
        streq             r2, [r3]
        moveq             r0, #0
        msr               CPSR_c, lr
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange::u32::release_seqcst:
        push              {r11, lr}
        mov               r3, r0
        mrs               lr, apsr
        orr               r0, lr, #128
        msr               CPSR_c, r0
        mov               r12, r1
        ldr               r1, [r3]
        mov               r0, #1
        cmp               r12, r1
        streq             r2, [r3]
        moveq             r0, #0
        msr               CPSR_c, lr
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange::u32::seqcst_acquire:
        push              {r11, lr}
        mov               r3, r0
        mrs               lr, apsr
        orr               r0, lr, #128
        msr               CPSR_c, r0
        mov               r12, r1
        ldr               r1, [r3]
        mov               r0, #1
        cmp               r12, r1
        streq             r2, [r3]
        moveq             r0, #0
        msr               CPSR_c, lr
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange::u32::seqcst_relaxed:
        push              {r11, lr}
        mov               r3, r0
        mrs               lr, apsr
        orr               r0, lr, #128
        msr               CPSR_c, r0
        mov               r12, r1
        ldr               r1, [r3]
        mov               r0, #1
        cmp               r12, r1
        streq             r2, [r3]
        moveq             r0, #0
        msr               CPSR_c, lr
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange::u32::acquire_acquire:
        push              {r11, lr}
        mov               r3, r0
        mrs               lr, apsr
        orr               r0, lr, #128
        msr               CPSR_c, r0
        mov               r12, r1
        ldr               r1, [r3]
        mov               r0, #1
        cmp               r12, r1
        streq             r2, [r3]
        moveq             r0, #0
        msr               CPSR_c, lr
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange::u32::acquire_relaxed:
        push              {r11, lr}
        mov               r3, r0
        mrs               lr, apsr
        orr               r0, lr, #128
        msr               CPSR_c, r0
        mov               r12, r1
        ldr               r1, [r3]
        mov               r0, #1
        cmp               r12, r1
        streq             r2, [r3]
        moveq             r0, #0
        msr               CPSR_c, lr
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange::u32::relaxed_acquire:
        push              {r11, lr}
        mov               r3, r0
        mrs               lr, apsr
        orr               r0, lr, #128
        msr               CPSR_c, r0
        mov               r12, r1
        ldr               r1, [r3]
        mov               r0, #1
        cmp               r12, r1
        streq             r2, [r3]
        moveq             r0, #0
        msr               CPSR_c, lr
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange::u32::relaxed_relaxed:
        push              {r11, lr}
        mov               r3, r0
        mrs               lr, apsr
        orr               r0, lr, #128
        msr               CPSR_c, r0
        mov               r12, r1
        ldr               r1, [r3]
        mov               r0, #1
        cmp               r12, r1
        streq             r2, [r3]
        moveq             r0, #0
        msr               CPSR_c, lr
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange::u32::release_acquire:
        push              {r11, lr}
        mov               r3, r0
        mrs               lr, apsr
        orr               r0, lr, #128
        msr               CPSR_c, r0
        mov               r12, r1
        ldr               r1, [r3]
        mov               r0, #1
        cmp               r12, r1
        streq             r2, [r3]
        moveq             r0, #0
        msr               CPSR_c, lr
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange::u32::release_relaxed:
        push              {r11, lr}
        mov               r3, r0
        mrs               lr, apsr
        orr               r0, lr, #128
        msr               CPSR_c, r0
        mov               r12, r1
        ldr               r1, [r3]
        mov               r0, #1
        cmp               r12, r1
        streq             r2, [r3]
        moveq             r0, #0
        msr               CPSR_c, lr
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange::bool::acqrel_seqcst:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr
0:
        strb              r2, [r0]
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::seqcst_seqcst:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr
0:
        strb              r2, [r0]
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::acqrel_acquire:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr
0:
        strb              r2, [r0]
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::acqrel_relaxed:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr
0:
        strb              r2, [r0]
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::acquire_seqcst:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr
0:
        strb              r2, [r0]
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::relaxed_seqcst:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr
0:
        strb              r2, [r0]
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::release_seqcst:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr
0:
        strb              r2, [r0]
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::seqcst_acquire:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr
0:
        strb              r2, [r0]
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::seqcst_relaxed:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr
0:
        strb              r2, [r0]
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::acquire_acquire:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr
0:
        strb              r2, [r0]
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::acquire_relaxed:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr
0:
        strb              r2, [r0]
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::relaxed_acquire:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr
0:
        strb              r2, [r0]
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::relaxed_relaxed:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr
0:
        strb              r2, [r0]
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::release_acquire:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr
0:
        strb              r2, [r0]
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::release_relaxed:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr
0:
        strb              r2, [r0]
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::acqrel_seqcst_true_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::seqcst_seqcst_true_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::acqrel_acquire_true_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::acqrel_relaxed_true_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::acqrel_seqcst_false_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, #0
        beq               0f
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr
0:
        mov               r3, #1
        strb              r3, [r0]
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::acqrel_seqcst_true_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, #1
        beq               0f
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr
0:
        mov               r3, #0
        strb              r3, [r0]
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::acquire_seqcst_true_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::relaxed_seqcst_true_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::release_seqcst_true_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::seqcst_acquire_true_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::seqcst_relaxed_true_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::seqcst_seqcst_false_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, #0
        beq               0f
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr
0:
        mov               r3, #1
        strb              r3, [r0]
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::seqcst_seqcst_true_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, #1
        beq               0f
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr
0:
        mov               r3, #0
        strb              r3, [r0]
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::acqrel_acquire_false_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, #0
        beq               0f
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr
0:
        mov               r3, #1
        strb              r3, [r0]
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::acqrel_acquire_true_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, #1
        beq               0f
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr
0:
        mov               r3, #0
        strb              r3, [r0]
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::acqrel_relaxed_false_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, #0
        beq               0f
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr
0:
        mov               r3, #1
        strb              r3, [r0]
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::acqrel_relaxed_true_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, #1
        beq               0f
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr
0:
        mov               r3, #0
        strb              r3, [r0]
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::acqrel_seqcst_false_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::acquire_acquire_true_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::acquire_relaxed_true_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::acquire_seqcst_false_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, #0
        beq               0f
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr
0:
        mov               r3, #1
        strb              r3, [r0]
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::acquire_seqcst_true_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, #1
        beq               0f
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr
0:
        mov               r3, #0
        strb              r3, [r0]
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::relaxed_acquire_true_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::relaxed_relaxed_true_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::relaxed_seqcst_false_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, #0
        beq               0f
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr
0:
        mov               r3, #1
        strb              r3, [r0]
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::relaxed_seqcst_true_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, #1
        beq               0f
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr
0:
        mov               r3, #0
        strb              r3, [r0]
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::release_acquire_true_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::release_relaxed_true_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::release_seqcst_false_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, #0
        beq               0f
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr
0:
        mov               r3, #1
        strb              r3, [r0]
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::release_seqcst_true_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, #1
        beq               0f
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr
0:
        mov               r3, #0
        strb              r3, [r0]
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::seqcst_acquire_false_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, #0
        beq               0f
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr
0:
        mov               r3, #1
        strb              r3, [r0]
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::seqcst_acquire_true_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, #1
        beq               0f
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr
0:
        mov               r3, #0
        strb              r3, [r0]
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::seqcst_relaxed_false_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, #0
        beq               0f
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr
0:
        mov               r3, #1
        strb              r3, [r0]
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::seqcst_relaxed_true_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, #1
        beq               0f
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr
0:
        mov               r3, #0
        strb              r3, [r0]
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::seqcst_seqcst_false_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::acqrel_acquire_false_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::acqrel_relaxed_false_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::acquire_acquire_false_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, #0
        beq               0f
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr
0:
        mov               r3, #1
        strb              r3, [r0]
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::acquire_acquire_true_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, #1
        beq               0f
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr
0:
        mov               r3, #0
        strb              r3, [r0]
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::acquire_relaxed_false_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, #0
        beq               0f
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr
0:
        mov               r3, #1
        strb              r3, [r0]
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::acquire_relaxed_true_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, #1
        beq               0f
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr
0:
        mov               r3, #0
        strb              r3, [r0]
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::acquire_seqcst_false_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::relaxed_acquire_false_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, #0
        beq               0f
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr
0:
        mov               r3, #1
        strb              r3, [r0]
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::relaxed_acquire_true_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, #1
        beq               0f
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr
0:
        mov               r3, #0
        strb              r3, [r0]
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::relaxed_relaxed_false_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, #0
        beq               0f
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr
0:
        mov               r3, #1
        strb              r3, [r0]
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::relaxed_relaxed_true_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, #1
        beq               0f
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr
0:
        mov               r3, #0
        strb              r3, [r0]
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::relaxed_seqcst_false_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::release_acquire_false_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, #0
        beq               0f
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr
0:
        mov               r3, #1
        strb              r3, [r0]
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::release_acquire_true_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, #1
        beq               0f
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr
0:
        mov               r3, #0
        strb              r3, [r0]
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::release_relaxed_false_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, #0
        beq               0f
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr
0:
        mov               r3, #1
        strb              r3, [r0]
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::release_relaxed_true_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, #1
        beq               0f
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr
0:
        mov               r3, #0
        strb              r3, [r0]
        msr               CPSR_c, r2
        subs              r0, r1, #1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::release_seqcst_false_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::seqcst_acquire_false_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::seqcst_relaxed_false_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::acquire_acquire_false_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::acquire_relaxed_false_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::relaxed_acquire_false_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::relaxed_relaxed_false_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::release_acquire_false_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange::bool::release_relaxed_false_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        msr               CPSR_c, r2
        cmp               r1, #0
        mov               r0, r1
        movne             r0, #1
        bx                lr

asm_test::compare_exchange_weak::u8::acqrel_seqcst:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r3, #255
        cmp               r3, r1
        strbeq            r2, [r0]
        subs              r0, r3, r1
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange_weak::u8::seqcst_seqcst:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r3, #255
        cmp               r3, r1
        strbeq            r2, [r0]
        subs              r0, r3, r1
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange_weak::u8::acqrel_acquire:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r3, #255
        cmp               r3, r1
        strbeq            r2, [r0]
        subs              r0, r3, r1
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange_weak::u8::acqrel_relaxed:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r3, #255
        cmp               r3, r1
        strbeq            r2, [r0]
        subs              r0, r3, r1
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange_weak::u8::acquire_seqcst:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r3, #255
        cmp               r3, r1
        strbeq            r2, [r0]
        subs              r0, r3, r1
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange_weak::u8::relaxed_seqcst:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r3, #255
        cmp               r3, r1
        strbeq            r2, [r0]
        subs              r0, r3, r1
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange_weak::u8::release_seqcst:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r3, #255
        cmp               r3, r1
        strbeq            r2, [r0]
        subs              r0, r3, r1
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange_weak::u8::seqcst_acquire:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r3, #255
        cmp               r3, r1
        strbeq            r2, [r0]
        subs              r0, r3, r1
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange_weak::u8::seqcst_relaxed:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r3, #255
        cmp               r3, r1
        strbeq            r2, [r0]
        subs              r0, r3, r1
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange_weak::u8::acquire_acquire:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r3, #255
        cmp               r3, r1
        strbeq            r2, [r0]
        subs              r0, r3, r1
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange_weak::u8::acquire_relaxed:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r3, #255
        cmp               r3, r1
        strbeq            r2, [r0]
        subs              r0, r3, r1
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange_weak::u8::relaxed_acquire:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r3, #255
        cmp               r3, r1
        strbeq            r2, [r0]
        subs              r0, r3, r1
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange_weak::u8::relaxed_relaxed:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r3, #255
        cmp               r3, r1
        strbeq            r2, [r0]
        subs              r0, r3, r1
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange_weak::u8::release_acquire:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r3, #255
        cmp               r3, r1
        strbeq            r2, [r0]
        subs              r0, r3, r1
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange_weak::u8::release_relaxed:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r3, #255
        cmp               r3, r1
        strbeq            r2, [r0]
        subs              r0, r3, r1
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange_weak::f32::acqrel_seqcst:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        cmp               r1, r3
        streq             r2, [r0]
        subs              r0, r1, r3
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange_weak::f32::seqcst_seqcst:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        cmp               r1, r3
        streq             r2, [r0]
        subs              r0, r1, r3
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange_weak::f32::acqrel_acquire:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        cmp               r1, r3
        streq             r2, [r0]
        subs              r0, r1, r3
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange_weak::f32::acqrel_relaxed:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        cmp               r1, r3
        streq             r2, [r0]
        subs              r0, r1, r3
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange_weak::f32::acquire_seqcst:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        cmp               r1, r3
        streq             r2, [r0]
        subs              r0, r1, r3
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange_weak::f32::relaxed_seqcst:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        cmp               r1, r3
        streq             r2, [r0]
        subs              r0, r1, r3
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange_weak::f32::release_seqcst:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        cmp               r1, r3
        streq             r2, [r0]
        subs              r0, r1, r3
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange_weak::f32::seqcst_acquire:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        cmp               r1, r3
        streq             r2, [r0]
        subs              r0, r1, r3
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange_weak::f32::seqcst_relaxed:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        cmp               r1, r3
        streq             r2, [r0]
        subs              r0, r1, r3
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange_weak::f32::acquire_acquire:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        cmp               r1, r3
        streq             r2, [r0]
        subs              r0, r1, r3
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange_weak::f32::acquire_relaxed:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        cmp               r1, r3
        streq             r2, [r0]
        subs              r0, r1, r3
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange_weak::f32::relaxed_acquire:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        cmp               r1, r3
        streq             r2, [r0]
        subs              r0, r1, r3
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange_weak::f32::relaxed_relaxed:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        cmp               r1, r3
        streq             r2, [r0]
        subs              r0, r1, r3
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange_weak::f32::release_acquire:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        cmp               r1, r3
        streq             r2, [r0]
        subs              r0, r1, r3
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange_weak::f32::release_relaxed:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        cmp               r1, r3
        streq             r2, [r0]
        subs              r0, r1, r3
        movne             r0, #1
        msr               CPSR_c, r12
        bx                lr

asm_test::compare_exchange_weak::u16::acqrel_seqcst:
        push              {r11, lr}
        mov               r3, #255
        orr               r3, r3, #65280
        and               lr, r1, r3
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrh              r1, [r0]
        cmp               lr, r1
        strheq            r2, [r0]
        moveq             r3, #0
        msr               CPSR_c, r12
        mov               r0, r3
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange_weak::u16::seqcst_seqcst:
        push              {r11, lr}
        mov               r3, #255
        orr               r3, r3, #65280
        and               lr, r1, r3
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrh              r1, [r0]
        cmp               lr, r1
        strheq            r2, [r0]
        moveq             r3, #0
        msr               CPSR_c, r12
        mov               r0, r3
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange_weak::u16::acqrel_acquire:
        push              {r11, lr}
        mov               r3, #255
        orr               r3, r3, #65280
        and               lr, r1, r3
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrh              r1, [r0]
        cmp               lr, r1
        strheq            r2, [r0]
        moveq             r3, #0
        msr               CPSR_c, r12
        mov               r0, r3
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange_weak::u16::acqrel_relaxed:
        push              {r11, lr}
        mov               r3, #255
        orr               r3, r3, #65280
        and               lr, r1, r3
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrh              r1, [r0]
        cmp               lr, r1
        strheq            r2, [r0]
        moveq             r3, #0
        msr               CPSR_c, r12
        mov               r0, r3
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange_weak::u16::acquire_seqcst:
        push              {r11, lr}
        mov               r3, #255
        orr               r3, r3, #65280
        and               lr, r1, r3
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrh              r1, [r0]
        cmp               lr, r1
        strheq            r2, [r0]
        moveq             r3, #0
        msr               CPSR_c, r12
        mov               r0, r3
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange_weak::u16::relaxed_seqcst:
        push              {r11, lr}
        mov               r3, #255
        orr               r3, r3, #65280
        and               lr, r1, r3
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrh              r1, [r0]
        cmp               lr, r1
        strheq            r2, [r0]
        moveq             r3, #0
        msr               CPSR_c, r12
        mov               r0, r3
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange_weak::u16::release_seqcst:
        push              {r11, lr}
        mov               r3, #255
        orr               r3, r3, #65280
        and               lr, r1, r3
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrh              r1, [r0]
        cmp               lr, r1
        strheq            r2, [r0]
        moveq             r3, #0
        msr               CPSR_c, r12
        mov               r0, r3
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange_weak::u16::seqcst_acquire:
        push              {r11, lr}
        mov               r3, #255
        orr               r3, r3, #65280
        and               lr, r1, r3
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrh              r1, [r0]
        cmp               lr, r1
        strheq            r2, [r0]
        moveq             r3, #0
        msr               CPSR_c, r12
        mov               r0, r3
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange_weak::u16::seqcst_relaxed:
        push              {r11, lr}
        mov               r3, #255
        orr               r3, r3, #65280
        and               lr, r1, r3
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrh              r1, [r0]
        cmp               lr, r1
        strheq            r2, [r0]
        moveq             r3, #0
        msr               CPSR_c, r12
        mov               r0, r3
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange_weak::u16::acquire_acquire:
        push              {r11, lr}
        mov               r3, #255
        orr               r3, r3, #65280
        and               lr, r1, r3
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrh              r1, [r0]
        cmp               lr, r1
        strheq            r2, [r0]
        moveq             r3, #0
        msr               CPSR_c, r12
        mov               r0, r3
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange_weak::u16::acquire_relaxed:
        push              {r11, lr}
        mov               r3, #255
        orr               r3, r3, #65280
        and               lr, r1, r3
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrh              r1, [r0]
        cmp               lr, r1
        strheq            r2, [r0]
        moveq             r3, #0
        msr               CPSR_c, r12
        mov               r0, r3
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange_weak::u16::relaxed_acquire:
        push              {r11, lr}
        mov               r3, #255
        orr               r3, r3, #65280
        and               lr, r1, r3
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrh              r1, [r0]
        cmp               lr, r1
        strheq            r2, [r0]
        moveq             r3, #0
        msr               CPSR_c, r12
        mov               r0, r3
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange_weak::u16::relaxed_relaxed:
        push              {r11, lr}
        mov               r3, #255
        orr               r3, r3, #65280
        and               lr, r1, r3
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrh              r1, [r0]
        cmp               lr, r1
        strheq            r2, [r0]
        moveq             r3, #0
        msr               CPSR_c, r12
        mov               r0, r3
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange_weak::u16::release_acquire:
        push              {r11, lr}
        mov               r3, #255
        orr               r3, r3, #65280
        and               lr, r1, r3
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrh              r1, [r0]
        cmp               lr, r1
        strheq            r2, [r0]
        moveq             r3, #0
        msr               CPSR_c, r12
        mov               r0, r3
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange_weak::u16::release_relaxed:
        push              {r11, lr}
        mov               r3, #255
        orr               r3, r3, #65280
        and               lr, r1, r3
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrh              r1, [r0]
        cmp               lr, r1
        strheq            r2, [r0]
        moveq             r3, #0
        msr               CPSR_c, r12
        mov               r0, r3
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange_weak::u32::acqrel_seqcst:
        push              {r11, lr}
        mov               r3, r0
        mrs               lr, apsr
        orr               r0, lr, #128
        msr               CPSR_c, r0
        mov               r12, r1
        ldr               r1, [r3]
        mov               r0, #1
        cmp               r12, r1
        streq             r2, [r3]
        moveq             r0, #0
        msr               CPSR_c, lr
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange_weak::u32::seqcst_seqcst:
        push              {r11, lr}
        mov               r3, r0
        mrs               lr, apsr
        orr               r0, lr, #128
        msr               CPSR_c, r0
        mov               r12, r1
        ldr               r1, [r3]
        mov               r0, #1
        cmp               r12, r1
        streq             r2, [r3]
        moveq             r0, #0
        msr               CPSR_c, lr
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange_weak::u32::acqrel_acquire:
        push              {r11, lr}
        mov               r3, r0
        mrs               lr, apsr
        orr               r0, lr, #128
        msr               CPSR_c, r0
        mov               r12, r1
        ldr               r1, [r3]
        mov               r0, #1
        cmp               r12, r1
        streq             r2, [r3]
        moveq             r0, #0
        msr               CPSR_c, lr
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange_weak::u32::acqrel_relaxed:
        push              {r11, lr}
        mov               r3, r0
        mrs               lr, apsr
        orr               r0, lr, #128
        msr               CPSR_c, r0
        mov               r12, r1
        ldr               r1, [r3]
        mov               r0, #1
        cmp               r12, r1
        streq             r2, [r3]
        moveq             r0, #0
        msr               CPSR_c, lr
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange_weak::u32::acquire_seqcst:
        push              {r11, lr}
        mov               r3, r0
        mrs               lr, apsr
        orr               r0, lr, #128
        msr               CPSR_c, r0
        mov               r12, r1
        ldr               r1, [r3]
        mov               r0, #1
        cmp               r12, r1
        streq             r2, [r3]
        moveq             r0, #0
        msr               CPSR_c, lr
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange_weak::u32::relaxed_seqcst:
        push              {r11, lr}
        mov               r3, r0
        mrs               lr, apsr
        orr               r0, lr, #128
        msr               CPSR_c, r0
        mov               r12, r1
        ldr               r1, [r3]
        mov               r0, #1
        cmp               r12, r1
        streq             r2, [r3]
        moveq             r0, #0
        msr               CPSR_c, lr
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange_weak::u32::release_seqcst:
        push              {r11, lr}
        mov               r3, r0
        mrs               lr, apsr
        orr               r0, lr, #128
        msr               CPSR_c, r0
        mov               r12, r1
        ldr               r1, [r3]
        mov               r0, #1
        cmp               r12, r1
        streq             r2, [r3]
        moveq             r0, #0
        msr               CPSR_c, lr
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange_weak::u32::seqcst_acquire:
        push              {r11, lr}
        mov               r3, r0
        mrs               lr, apsr
        orr               r0, lr, #128
        msr               CPSR_c, r0
        mov               r12, r1
        ldr               r1, [r3]
        mov               r0, #1
        cmp               r12, r1
        streq             r2, [r3]
        moveq             r0, #0
        msr               CPSR_c, lr
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange_weak::u32::seqcst_relaxed:
        push              {r11, lr}
        mov               r3, r0
        mrs               lr, apsr
        orr               r0, lr, #128
        msr               CPSR_c, r0
        mov               r12, r1
        ldr               r1, [r3]
        mov               r0, #1
        cmp               r12, r1
        streq             r2, [r3]
        moveq             r0, #0
        msr               CPSR_c, lr
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange_weak::u32::acquire_acquire:
        push              {r11, lr}
        mov               r3, r0
        mrs               lr, apsr
        orr               r0, lr, #128
        msr               CPSR_c, r0
        mov               r12, r1
        ldr               r1, [r3]
        mov               r0, #1
        cmp               r12, r1
        streq             r2, [r3]
        moveq             r0, #0
        msr               CPSR_c, lr
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange_weak::u32::acquire_relaxed:
        push              {r11, lr}
        mov               r3, r0
        mrs               lr, apsr
        orr               r0, lr, #128
        msr               CPSR_c, r0
        mov               r12, r1
        ldr               r1, [r3]
        mov               r0, #1
        cmp               r12, r1
        streq             r2, [r3]
        moveq             r0, #0
        msr               CPSR_c, lr
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange_weak::u32::relaxed_acquire:
        push              {r11, lr}
        mov               r3, r0
        mrs               lr, apsr
        orr               r0, lr, #128
        msr               CPSR_c, r0
        mov               r12, r1
        ldr               r1, [r3]
        mov               r0, #1
        cmp               r12, r1
        streq             r2, [r3]
        moveq             r0, #0
        msr               CPSR_c, lr
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange_weak::u32::relaxed_relaxed:
        push              {r11, lr}
        mov               r3, r0
        mrs               lr, apsr
        orr               r0, lr, #128
        msr               CPSR_c, r0
        mov               r12, r1
        ldr               r1, [r3]
        mov               r0, #1
        cmp               r12, r1
        streq             r2, [r3]
        moveq             r0, #0
        msr               CPSR_c, lr
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange_weak::u32::release_acquire:
        push              {r11, lr}
        mov               r3, r0
        mrs               lr, apsr
        orr               r0, lr, #128
        msr               CPSR_c, r0
        mov               r12, r1
        ldr               r1, [r3]
        mov               r0, #1
        cmp               r12, r1
        streq             r2, [r3]
        moveq             r0, #0
        msr               CPSR_c, lr
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange_weak::u32::release_relaxed:
        push              {r11, lr}
        mov               r3, r0
        mrs               lr, apsr
        orr               r0, lr, #128
        msr               CPSR_c, r0
        mov               r12, r1
        ldr               r1, [r3]
        mov               r0, #1
        cmp               r12, r1
        streq             r2, [r3]
        moveq             r0, #0
        msr               CPSR_c, lr
        pop               {r11, lr}
        bx                lr

asm_test::compare_exchange_weak::bool::acqrel_seqcst:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr
0:
        strb              r2, [r0]
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr

asm_test::compare_exchange_weak::bool::seqcst_seqcst:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr
0:
        strb              r2, [r0]
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr

asm_test::compare_exchange_weak::bool::acqrel_acquire:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr
0:
        strb              r2, [r0]
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr

asm_test::compare_exchange_weak::bool::acqrel_relaxed:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr
0:
        strb              r2, [r0]
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr

asm_test::compare_exchange_weak::bool::acquire_seqcst:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr
0:
        strb              r2, [r0]
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr

asm_test::compare_exchange_weak::bool::relaxed_seqcst:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr
0:
        strb              r2, [r0]
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr

asm_test::compare_exchange_weak::bool::release_seqcst:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr
0:
        strb              r2, [r0]
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr

asm_test::compare_exchange_weak::bool::seqcst_acquire:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr
0:
        strb              r2, [r0]
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr

asm_test::compare_exchange_weak::bool::seqcst_relaxed:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr
0:
        strb              r2, [r0]
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr

asm_test::compare_exchange_weak::bool::acquire_acquire:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr
0:
        strb              r2, [r0]
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr

asm_test::compare_exchange_weak::bool::acquire_relaxed:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr
0:
        strb              r2, [r0]
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr

asm_test::compare_exchange_weak::bool::relaxed_acquire:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr
0:
        strb              r2, [r0]
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr

asm_test::compare_exchange_weak::bool::relaxed_relaxed:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr
0:
        strb              r2, [r0]
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr

asm_test::compare_exchange_weak::bool::release_acquire:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr
0:
        strb              r2, [r0]
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr

asm_test::compare_exchange_weak::bool::release_relaxed:
        mov               r3, r1
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr
0:
        strb              r2, [r0]
        msr               CPSR_c, r12
        subs              r0, r1, r3
        movne             r0, #1
        bx                lr

asm_test::or::u8::acqrel_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r1, #255
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::or::u8::seqcst_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r1, #255
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::or::u8::acqrel_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::or::u8::acquire_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r1, #255
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::or::u8::relaxed_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r1, #255
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::or::u8::release_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r1, #255
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::or::u8::seqcst_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::or::u8::acquire_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::or::u8::relaxed_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::or::u8::release_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::or::u8::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        orr               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::or::u8::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        orr               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::or::u8::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        orr               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::or::u8::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        orr               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::or::u8::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        orr               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::or::u16::acqrel_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r1, #255
        orr               r1, r1, #65280
        strh              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::or::u16::seqcst_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r1, #255
        orr               r1, r1, #65280
        strh              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::or::u16::acqrel_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::or::u16::acquire_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r1, #255
        orr               r1, r1, #65280
        strh              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::or::u16::relaxed_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r1, #255
        orr               r1, r1, #65280
        strh              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::or::u16::release_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r1, #255
        orr               r1, r1, #65280
        strh              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::or::u16::seqcst_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::or::u16::acquire_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::or::u16::relaxed_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::or::u16::release_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::or::u16::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        orr               r1, r2, r1
        strh              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::or::u16::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        orr               r1, r2, r1
        strh              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::or::u16::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        orr               r1, r2, r1
        strh              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::or::u16::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        orr               r1, r2, r1
        strh              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::or::u16::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        orr               r1, r2, r1
        strh              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::or::u32::acqrel_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mvn               r1, #0
        str               r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::or::u32::seqcst_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mvn               r1, #0
        str               r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::or::u32::acqrel_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::or::u32::acquire_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mvn               r1, #0
        str               r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::or::u32::relaxed_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mvn               r1, #0
        str               r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::or::u32::release_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mvn               r1, #0
        str               r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::or::u32::seqcst_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::or::u32::acquire_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::or::u32::relaxed_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::or::u32::release_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::or::u32::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        orr               r1, r2, r1
        str               r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::or::u32::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        orr               r1, r2, r1
        str               r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::or::u32::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        orr               r1, r2, r1
        str               r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::or::u32::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        orr               r1, r2, r1
        str               r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::or::u32::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        orr               r1, r2, r1
        str               r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::or::bool::acqrel_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        orr               r1, r1, #1
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::or::bool::seqcst_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        orr               r1, r1, #1
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::or::bool::acqrel_false:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::or::bool::acquire_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        orr               r1, r1, #1
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::or::bool::relaxed_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        orr               r1, r1, #1
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::or::bool::release_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        orr               r1, r1, #1
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::or::bool::seqcst_false:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::or::bool::acquire_false:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::or::bool::relaxed_false:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::or::bool::release_false:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::or::bool::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        orr               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::or::bool::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        orr               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::or::bool::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        orr               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::or::bool::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        orr               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::or::bool::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        orr               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::add::u8::acqrel_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::add::u8::seqcst_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::add::u8::acquire_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::add::u8::relaxed_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::add::u8::release_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::add::u8::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        add               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::add::u8::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        add               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::add::u8::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        add               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::add::u8::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        add               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::add::u8::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        add               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::add::u16::acqrel_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::add::u16::seqcst_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::add::u16::acquire_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::add::u16::relaxed_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::add::u16::release_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::add::u16::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        add               r1, r2, r1
        strh              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::add::u16::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        add               r1, r2, r1
        strh              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::add::u16::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        add               r1, r2, r1
        strh              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::add::u16::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        add               r1, r2, r1
        strh              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::add::u16::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        add               r1, r2, r1
        strh              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::add::u32::acqrel_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::add::u32::seqcst_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::add::u32::acquire_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::add::u32::relaxed_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::add::u32::release_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::add::u32::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        add               r1, r2, r1
        str               r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::add::u32::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        add               r1, r2, r1
        str               r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::add::u32::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        add               r1, r2, r1
        str               r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::add::u32::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        add               r1, r2, r1
        str               r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::add::u32::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        add               r1, r2, r1
        str               r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::and::u8::acqrel_all:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::and::u8::seqcst_all:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::and::u8::acqrel_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r1, #0
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::and::u8::acquire_all:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::and::u8::relaxed_all:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::and::u8::release_all:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::and::u8::seqcst_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r1, #0
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::and::u8::acquire_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r1, #0
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::and::u8::relaxed_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r1, #0
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::and::u8::release_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r1, #0
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::and::u8::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        and               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::and::u8::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        and               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::and::u8::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        and               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::and::u8::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        and               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::and::u8::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        and               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::and::u16::acqrel_all:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::and::u16::seqcst_all:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::and::u16::acqrel_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r1, #0
        strh              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::and::u16::acquire_all:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::and::u16::relaxed_all:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::and::u16::release_all:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::and::u16::seqcst_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r1, #0
        strh              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::and::u16::acquire_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r1, #0
        strh              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::and::u16::relaxed_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r1, #0
        strh              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::and::u16::release_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r1, #0
        strh              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::and::u16::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        and               r1, r2, r1
        strh              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::and::u16::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        and               r1, r2, r1
        strh              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::and::u16::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        and               r1, r2, r1
        strh              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::and::u16::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        and               r1, r2, r1
        strh              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::and::u16::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        and               r1, r2, r1
        strh              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::and::u32::acqrel_all:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::and::u32::seqcst_all:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::and::u32::acqrel_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r1, #0
        str               r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::and::u32::acquire_all:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::and::u32::relaxed_all:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::and::u32::release_all:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::and::u32::seqcst_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r1, #0
        str               r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::and::u32::acquire_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r1, #0
        str               r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::and::u32::relaxed_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r1, #0
        str               r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::and::u32::release_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r1, #0
        str               r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::and::u32::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        and               r1, r2, r1
        str               r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::and::u32::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        and               r1, r2, r1
        str               r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::and::u32::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        and               r1, r2, r1
        str               r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::and::u32::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        and               r1, r2, r1
        str               r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::and::u32::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        and               r1, r2, r1
        str               r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::and::bool::acqrel_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r1, r1, #1
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::and::bool::seqcst_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r1, r1, #1
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::and::bool::acqrel_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r1, #0
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::and::bool::acquire_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r1, r1, #1
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::and::bool::relaxed_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r1, r1, #1
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::and::bool::release_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r1, r1, #1
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::and::bool::seqcst_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r1, #0
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::and::bool::acquire_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r1, #0
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::and::bool::relaxed_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r1, #0
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::and::bool::release_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r1, #0
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::and::bool::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        and               r1, r1, r2
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::and::bool::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        and               r1, r1, r2
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::and::bool::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        and               r1, r1, r2
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::and::bool::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        and               r1, r1, r2
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::and::bool::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        and               r1, r1, r2
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::neg::u8::acqrel:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        rsb               r1, r1, #0
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::neg::u8::seqcst:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        rsb               r1, r1, #0
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::neg::u8::acquire:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        rsb               r1, r1, #0
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::neg::u8::relaxed:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        rsb               r1, r1, #0
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::neg::u8::release:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        rsb               r1, r1, #0
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::neg::u16::acqrel:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        rsb               r1, r1, #0
        strh              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::neg::u16::seqcst:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        rsb               r1, r1, #0
        strh              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::neg::u16::acquire:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        rsb               r1, r1, #0
        strh              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::neg::u16::relaxed:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        rsb               r1, r1, #0
        strh              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::neg::u16::release:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        rsb               r1, r1, #0
        strh              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::neg::u32::acqrel:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        rsb               r1, r1, #0
        str               r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::neg::u32::seqcst:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        rsb               r1, r1, #0
        str               r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::neg::u32::acquire:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        rsb               r1, r1, #0
        str               r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::neg::u32::relaxed:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        rsb               r1, r1, #0
        str               r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::neg::u32::release:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        rsb               r1, r1, #0
        str               r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::not::u8::acqrel:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        mvn               r1, r1
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::not::u8::seqcst:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        mvn               r1, r1
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::not::u8::acquire:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        mvn               r1, r1
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::not::u8::relaxed:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        mvn               r1, r1
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::not::u8::release:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        mvn               r1, r1
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::not::u16::acqrel:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        mvn               r1, r1
        strh              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::not::u16::seqcst:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        mvn               r1, r1
        strh              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::not::u16::acquire:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        mvn               r1, r1
        strh              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::not::u16::relaxed:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        mvn               r1, r1
        strh              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::not::u16::release:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        mvn               r1, r1
        strh              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::not::u32::acqrel:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        mvn               r1, r1
        str               r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::not::u32::seqcst:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        mvn               r1, r1
        str               r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::not::u32::acquire:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        mvn               r1, r1
        str               r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::not::u32::relaxed:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        mvn               r1, r1
        str               r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::not::u32::release:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        mvn               r1, r1
        str               r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::not::bool::acqrel:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        eor               r1, r1, #1
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::not::bool::seqcst:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        eor               r1, r1, #1
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::not::bool::acquire:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        eor               r1, r1, #1
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::not::bool::relaxed:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        eor               r1, r1, #1
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::not::bool::release:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        eor               r1, r1, #1
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::sub::u8::acqrel_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::sub::u8::seqcst_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::sub::u8::acquire_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::sub::u8::relaxed_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::sub::u8::release_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::sub::u8::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        sub               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::sub::u8::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        sub               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::sub::u8::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        sub               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::sub::u8::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        sub               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::sub::u8::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        sub               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::sub::u16::acqrel_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::sub::u16::seqcst_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::sub::u16::acquire_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::sub::u16::relaxed_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::sub::u16::release_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::sub::u16::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        sub               r1, r2, r1
        strh              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::sub::u16::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        sub               r1, r2, r1
        strh              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::sub::u16::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        sub               r1, r2, r1
        strh              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::sub::u16::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        sub               r1, r2, r1
        strh              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::sub::u16::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        sub               r1, r2, r1
        strh              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::sub::u32::acqrel_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::sub::u32::seqcst_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::sub::u32::acquire_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::sub::u32::relaxed_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::sub::u32::release_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::sub::u32::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        sub               r1, r2, r1
        str               r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::sub::u32::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        sub               r1, r2, r1
        str               r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::sub::u32::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        sub               r1, r2, r1
        str               r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::sub::u32::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        sub               r1, r2, r1
        str               r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::sub::u32::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        sub               r1, r2, r1
        str               r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::xor::u8::acqrel_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::xor::u8::seqcst_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::xor::u8::acquire_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::xor::u8::relaxed_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::xor::u8::release_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::xor::u8::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        eor               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::xor::u8::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        eor               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::xor::u8::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        eor               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::xor::u8::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        eor               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::xor::u8::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        eor               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::xor::u16::acqrel_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::xor::u16::seqcst_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::xor::u16::acquire_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::xor::u16::relaxed_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::xor::u16::release_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::xor::u16::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        eor               r1, r2, r1
        strh              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::xor::u16::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        eor               r1, r2, r1
        strh              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::xor::u16::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        eor               r1, r2, r1
        strh              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::xor::u16::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        eor               r1, r2, r1
        strh              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::xor::u16::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        eor               r1, r2, r1
        strh              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::xor::u32::acqrel_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::xor::u32::seqcst_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::xor::u32::acquire_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::xor::u32::relaxed_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::xor::u32::release_zero:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::xor::u32::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        eor               r1, r2, r1
        str               r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::xor::u32::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        eor               r1, r2, r1
        str               r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::xor::u32::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        eor               r1, r2, r1
        str               r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::xor::u32::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        eor               r1, r2, r1
        str               r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::xor::u32::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        eor               r1, r2, r1
        str               r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::xor::bool::acqrel_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        eor               r1, r1, #1
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::xor::bool::seqcst_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        eor               r1, r1, #1
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::xor::bool::acqrel_false:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::xor::bool::acquire_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        eor               r1, r1, #1
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::xor::bool::relaxed_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        eor               r1, r1, #1
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::xor::bool::release_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        eor               r1, r1, #1
        strb              r1, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::xor::bool::seqcst_false:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::xor::bool::acquire_false:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::xor::bool::relaxed_false:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::xor::bool::release_false:
        mrs               r1, apsr
        orr               r0, r1, #128
        msr               CPSR_c, r0
        msr               CPSR_c, r1
        bx                lr

asm_test::xor::bool::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        eor               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::xor::bool::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        eor               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::xor::bool::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        eor               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::xor::bool::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        eor               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::xor::bool::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        eor               r1, r2, r1
        strb              r1, [r0]
        msr               CPSR_c, r3
        bx                lr

asm_test::load::u8::seqcst:
        ldrb              r0, [r0]
        bx                lr

asm_test::load::u8::acquire:
        ldrb              r0, [r0]
        bx                lr

asm_test::load::u8::relaxed:
        ldrb              r0, [r0]
        bx                lr

asm_test::load::f32::seqcst:
        ldr               r0, [r0]
        bx                lr

asm_test::load::f32::acquire:
        ldr               r0, [r0]
        bx                lr

asm_test::load::f32::relaxed:
        ldr               r0, [r0]
        bx                lr

asm_test::load::u16::seqcst:
        ldrh              r0, [r0]
        bx                lr

asm_test::load::u16::acquire:
        ldrh              r0, [r0]
        bx                lr

asm_test::load::u16::relaxed:
        ldrh              r0, [r0]
        bx                lr

asm_test::load::u32::seqcst:
        ldr               r0, [r0]
        bx                lr

asm_test::load::u32::acquire:
        ldr               r0, [r0]
        bx                lr

asm_test::load::u32::relaxed:
        ldr               r0, [r0]
        bx                lr

asm_test::load::bool::seqcst:
        ldrb              r0, [r0]
        and               r0, r0, #1
        bx                lr

asm_test::load::bool::acquire:
        ldrb              r0, [r0]
        and               r0, r0, #1
        bx                lr

asm_test::load::bool::relaxed:
        ldrb              r0, [r0]
        and               r0, r0, #1
        bx                lr

asm_test::swap::u8::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        strb              r1, [r0]
        msr               CPSR_c, r3
        mov               r0, r2
        bx                lr

asm_test::swap::u8::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        strb              r1, [r0]
        msr               CPSR_c, r3
        mov               r0, r2
        bx                lr

asm_test::swap::u8::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        strb              r1, [r0]
        msr               CPSR_c, r3
        mov               r0, r2
        bx                lr

asm_test::swap::u8::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        strb              r1, [r0]
        msr               CPSR_c, r3
        mov               r0, r2
        bx                lr

asm_test::swap::u8::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        strb              r1, [r0]
        msr               CPSR_c, r3
        mov               r0, r2
        bx                lr

asm_test::swap::f32::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        str               r1, [r0]
        msr               CPSR_c, r3
        mov               r0, r2
        bx                lr

asm_test::swap::f32::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        str               r1, [r0]
        msr               CPSR_c, r3
        mov               r0, r2
        bx                lr

asm_test::swap::f32::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        str               r1, [r0]
        msr               CPSR_c, r3
        mov               r0, r2
        bx                lr

asm_test::swap::f32::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        str               r1, [r0]
        msr               CPSR_c, r3
        mov               r0, r2
        bx                lr

asm_test::swap::f32::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        str               r1, [r0]
        msr               CPSR_c, r3
        mov               r0, r2
        bx                lr

asm_test::swap::u16::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        strh              r1, [r0]
        msr               CPSR_c, r3
        mov               r0, r2
        bx                lr

asm_test::swap::u16::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        strh              r1, [r0]
        msr               CPSR_c, r3
        mov               r0, r2
        bx                lr

asm_test::swap::u16::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        strh              r1, [r0]
        msr               CPSR_c, r3
        mov               r0, r2
        bx                lr

asm_test::swap::u16::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        strh              r1, [r0]
        msr               CPSR_c, r3
        mov               r0, r2
        bx                lr

asm_test::swap::u16::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        strh              r1, [r0]
        msr               CPSR_c, r3
        mov               r0, r2
        bx                lr

asm_test::swap::u32::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        str               r1, [r0]
        msr               CPSR_c, r3
        mov               r0, r2
        bx                lr

asm_test::swap::u32::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        str               r1, [r0]
        msr               CPSR_c, r3
        mov               r0, r2
        bx                lr

asm_test::swap::u32::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        str               r1, [r0]
        msr               CPSR_c, r3
        mov               r0, r2
        bx                lr

asm_test::swap::u32::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        str               r1, [r0]
        msr               CPSR_c, r3
        mov               r0, r2
        bx                lr

asm_test::swap::u32::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        str               r1, [r0]
        msr               CPSR_c, r3
        mov               r0, r2
        bx                lr

asm_test::swap::bool::acqrel_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::swap::bool::seqcst_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::swap::bool::acqrel_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #0
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::swap::bool::acquire_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::swap::bool::relaxed_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::swap::bool::release_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #1
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::swap::bool::seqcst_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #0
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::swap::bool::acquire_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #0
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::swap::bool::relaxed_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #0
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::swap::bool::release_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #0
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::swap::bool::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        strb              r1, [r0]
        msr               CPSR_c, r3
        mov               r0, r2
        bx                lr

asm_test::swap::bool::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        strb              r1, [r0]
        msr               CPSR_c, r3
        mov               r0, r2
        bx                lr

asm_test::swap::bool::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        strb              r1, [r0]
        msr               CPSR_c, r3
        mov               r0, r2
        bx                lr

asm_test::swap::bool::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        strb              r1, [r0]
        msr               CPSR_c, r3
        mov               r0, r2
        bx                lr

asm_test::swap::bool::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        strb              r1, [r0]
        msr               CPSR_c, r3
        mov               r0, r2
        bx                lr

asm_test::store::u8::seqcst:
        strb              r1, [r0]
        bx                lr

asm_test::store::u8::relaxed:
        strb              r1, [r0]
        bx                lr

asm_test::store::u8::release:
        strb              r1, [r0]
        bx                lr

asm_test::store::f32::seqcst:
        str               r1, [r0]
        bx                lr

asm_test::store::f32::relaxed:
        str               r1, [r0]
        bx                lr

asm_test::store::f32::release:
        str               r1, [r0]
        bx                lr

asm_test::store::u16::seqcst:
        strh              r1, [r0]
        bx                lr

asm_test::store::u16::relaxed:
        strh              r1, [r0]
        bx                lr

asm_test::store::u16::release:
        strh              r1, [r0]
        bx                lr

asm_test::store::u32::seqcst:
        str               r1, [r0]
        bx                lr

asm_test::store::u32::relaxed:
        str               r1, [r0]
        bx                lr

asm_test::store::u32::release:
        str               r1, [r0]
        bx                lr

asm_test::store::bool::seqcst:
        strb              r1, [r0]
        bx                lr

asm_test::store::bool::relaxed:
        strb              r1, [r0]
        bx                lr

asm_test::store::bool::release:
        strb              r1, [r0]
        bx                lr

asm_test::bit_set::u8::acqrel:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #7
        mov               r12, #1
        ldrb              r2, [r0]
        orr               r3, r2, r12, lsl r1
        strb              r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_set::u8::seqcst:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #7
        mov               r12, #1
        ldrb              r2, [r0]
        orr               r3, r2, r12, lsl r1
        strb              r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_set::u8::acquire:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #7
        mov               r12, #1
        ldrb              r2, [r0]
        orr               r3, r2, r12, lsl r1
        strb              r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_set::u8::relaxed:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #7
        mov               r12, #1
        ldrb              r2, [r0]
        orr               r3, r2, r12, lsl r1
        strb              r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_set::u8::release:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #7
        mov               r12, #1
        ldrb              r2, [r0]
        orr               r3, r2, r12, lsl r1
        strb              r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_set::u16::acqrel:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #15
        mov               r12, #1
        ldrh              r2, [r0]
        orr               r3, r2, r12, lsl r1
        strh              r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_set::u16::seqcst:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #15
        mov               r12, #1
        ldrh              r2, [r0]
        orr               r3, r2, r12, lsl r1
        strh              r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_set::u16::acquire:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #15
        mov               r12, #1
        ldrh              r2, [r0]
        orr               r3, r2, r12, lsl r1
        strh              r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_set::u16::relaxed:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #15
        mov               r12, #1
        ldrh              r2, [r0]
        orr               r3, r2, r12, lsl r1
        strh              r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_set::u16::release:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #15
        mov               r12, #1
        ldrh              r2, [r0]
        orr               r3, r2, r12, lsl r1
        strh              r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_set::u32::acqrel:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #31
        mov               r12, #1
        ldr               r2, [r0]
        orr               r3, r2, r12, lsl r1
        str               r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_set::u32::seqcst:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #31
        mov               r12, #1
        ldr               r2, [r0]
        orr               r3, r2, r12, lsl r1
        str               r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_set::u32::acquire:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #31
        mov               r12, #1
        ldr               r2, [r0]
        orr               r3, r2, r12, lsl r1
        str               r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_set::u32::relaxed:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #31
        mov               r12, #1
        ldr               r2, [r0]
        orr               r3, r2, r12, lsl r1
        str               r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_set::u32::release:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #31
        mov               r12, #1
        ldr               r2, [r0]
        orr               r3, r2, r12, lsl r1
        str               r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::fetch_or::u8::acqrel_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #255
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_or::u8::seqcst_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #255
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_or::u8::acqrel_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_or::u8::acquire_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #255
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_or::u8::relaxed_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #255
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_or::u8::release_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #255
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_or::u8::seqcst_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_or::u8::acquire_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_or::u8::relaxed_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_or::u8::release_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_or::u8::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        orr               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_or::u8::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        orr               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_or::u8::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        orr               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_or::u8::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        orr               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_or::u8::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        orr               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_or::u16::acqrel_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #255
        ldrh              r1, [r0]
        orr               r3, r3, #65280
        strh              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_or::u16::seqcst_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #255
        ldrh              r1, [r0]
        orr               r3, r3, #65280
        strh              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_or::u16::acqrel_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_or::u16::acquire_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #255
        ldrh              r1, [r0]
        orr               r3, r3, #65280
        strh              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_or::u16::relaxed_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #255
        ldrh              r1, [r0]
        orr               r3, r3, #65280
        strh              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_or::u16::release_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #255
        ldrh              r1, [r0]
        orr               r3, r3, #65280
        strh              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_or::u16::seqcst_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_or::u16::acquire_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_or::u16::relaxed_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_or::u16::release_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_or::u16::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        orr               r1, r2, r1
        strh              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_or::u16::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        orr               r1, r2, r1
        strh              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_or::u16::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        orr               r1, r2, r1
        strh              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_or::u16::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        orr               r1, r2, r1
        strh              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_or::u16::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        orr               r1, r2, r1
        strh              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_or::u32::acqrel_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mvn               r3, #0
        ldr               r1, [r0]
        str               r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_or::u32::seqcst_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mvn               r3, #0
        ldr               r1, [r0]
        str               r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_or::u32::acqrel_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_or::u32::acquire_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mvn               r3, #0
        ldr               r1, [r0]
        str               r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_or::u32::relaxed_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mvn               r3, #0
        ldr               r1, [r0]
        str               r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_or::u32::release_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mvn               r3, #0
        ldr               r1, [r0]
        str               r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_or::u32::seqcst_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_or::u32::acquire_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_or::u32::relaxed_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_or::u32::release_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_or::u32::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        orr               r1, r2, r1
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_or::u32::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        orr               r1, r2, r1
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_or::u32::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        orr               r1, r2, r1
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_or::u32::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        orr               r1, r2, r1
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_or::u32::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        orr               r1, r2, r1
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_or::bool::acqrel_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        orr               r3, r1, #1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_or::bool::seqcst_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        orr               r3, r1, #1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_or::bool::acqrel_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_or::bool::acquire_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        orr               r3, r1, #1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_or::bool::relaxed_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        orr               r3, r1, #1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_or::bool::release_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        orr               r3, r1, #1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_or::bool::seqcst_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_or::bool::acquire_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_or::bool::relaxed_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_or::bool::release_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_or::bool::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        orr               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_or::bool::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        orr               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_or::bool::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        orr               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_or::bool::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        orr               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_or::bool::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        orr               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::bit_clear::u8::acqrel:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #7
        mov               r12, #1
        ldrb              r2, [r0]
        bic               r3, r2, r12, lsl r1
        strb              r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_clear::u8::seqcst:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #7
        mov               r12, #1
        ldrb              r2, [r0]
        bic               r3, r2, r12, lsl r1
        strb              r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_clear::u8::acquire:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #7
        mov               r12, #1
        ldrb              r2, [r0]
        bic               r3, r2, r12, lsl r1
        strb              r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_clear::u8::relaxed:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #7
        mov               r12, #1
        ldrb              r2, [r0]
        bic               r3, r2, r12, lsl r1
        strb              r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_clear::u8::release:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #7
        mov               r12, #1
        ldrb              r2, [r0]
        bic               r3, r2, r12, lsl r1
        strb              r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_clear::u16::acqrel:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #15
        mov               r12, #1
        ldrh              r2, [r0]
        bic               r3, r2, r12, lsl r1
        strh              r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_clear::u16::seqcst:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #15
        mov               r12, #1
        ldrh              r2, [r0]
        bic               r3, r2, r12, lsl r1
        strh              r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_clear::u16::acquire:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #15
        mov               r12, #1
        ldrh              r2, [r0]
        bic               r3, r2, r12, lsl r1
        strh              r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_clear::u16::relaxed:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #15
        mov               r12, #1
        ldrh              r2, [r0]
        bic               r3, r2, r12, lsl r1
        strh              r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_clear::u16::release:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #15
        mov               r12, #1
        ldrh              r2, [r0]
        bic               r3, r2, r12, lsl r1
        strh              r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_clear::u32::acqrel:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #31
        mov               r12, #1
        ldr               r2, [r0]
        bic               r3, r2, r12, lsl r1
        str               r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_clear::u32::seqcst:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #31
        mov               r12, #1
        ldr               r2, [r0]
        bic               r3, r2, r12, lsl r1
        str               r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_clear::u32::acquire:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #31
        mov               r12, #1
        ldr               r2, [r0]
        bic               r3, r2, r12, lsl r1
        str               r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_clear::u32::relaxed:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #31
        mov               r12, #1
        ldr               r2, [r0]
        bic               r3, r2, r12, lsl r1
        str               r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::bit_clear::u32::release:
        push              {r11, lr}
        mrs               lr, apsr
        orr               r2, lr, #128
        msr               CPSR_c, r2
        and               r1, r1, #31
        mov               r12, #1
        ldr               r2, [r0]
        bic               r3, r2, r12, lsl r1
        str               r3, [r0]
        ands              r0, r2, r12, lsl r1
        msr               CPSR_c, lr
        movne             r0, #1
        pop               {r11, lr}
        bx                lr

asm_test::fetch_abs::f32::acqrel:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        bic               r3, r1, #-2147483648
        str               r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_abs::f32::seqcst:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        bic               r3, r1, #-2147483648
        str               r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_abs::f32::acquire:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        bic               r3, r1, #-2147483648
        str               r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_abs::f32::relaxed:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        bic               r3, r1, #-2147483648
        str               r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_abs::f32::release:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        bic               r3, r1, #-2147483648
        str               r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_add::u8::acqrel_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_add::u8::seqcst_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_add::u8::acquire_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_add::u8::relaxed_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_add::u8::release_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_add::u8::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        add               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_add::u8::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        add               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_add::u8::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        add               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_add::u8::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        add               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_add::u8::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        add               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_add::f32::acqrel_zero:
        push              {r4, r5, r6, r10, r11, lr}
        add               r11, sp, #16
        ldr               r5, [r0]
        mov               r4, r0
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               CPSR_c, r6
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
        mov               r1, #0
2:
        bl                2f
        str               r0, [r4]
        mov               r0, r5
        msr               CPSR_c, r6
        pop               {r4, r5, r6, r10, r11, lr}
        bx                lr

asm_test::fetch_add::f32::seqcst_zero:
        push              {r4, r5, r6, r10, r11, lr}
        add               r11, sp, #16
        ldr               r5, [r0]
        mov               r4, r0
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               CPSR_c, r6
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
        mov               r1, #0
2:
        bl                2f
        str               r0, [r4]
        mov               r0, r5
        msr               CPSR_c, r6
        pop               {r4, r5, r6, r10, r11, lr}
        bx                lr

asm_test::fetch_add::f32::acquire_zero:
        push              {r4, r5, r6, r10, r11, lr}
        add               r11, sp, #16
        ldr               r5, [r0]
        mov               r4, r0
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               CPSR_c, r6
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
        mov               r1, #0
2:
        bl                2f
        str               r0, [r4]
        mov               r0, r5
        msr               CPSR_c, r6
        pop               {r4, r5, r6, r10, r11, lr}
        bx                lr

asm_test::fetch_add::f32::relaxed_zero:
        push              {r4, r5, r6, r10, r11, lr}
        add               r11, sp, #16
        ldr               r5, [r0]
        mov               r4, r0
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               CPSR_c, r6
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
        mov               r1, #0
2:
        bl                2f
        str               r0, [r4]
        mov               r0, r5
        msr               CPSR_c, r6
        pop               {r4, r5, r6, r10, r11, lr}
        bx                lr

asm_test::fetch_add::f32::release_zero:
        push              {r4, r5, r6, r10, r11, lr}
        add               r11, sp, #16
        ldr               r5, [r0]
        mov               r4, r0
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               CPSR_c, r6
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
        mov               r1, #0
2:
        bl                2f
        str               r0, [r4]
        mov               r0, r5
        msr               CPSR_c, r6
        pop               {r4, r5, r6, r10, r11, lr}
        bx                lr

asm_test::fetch_add::f32::acqrel:
        push              {r4, r5, r6, r10, r11, lr}
        add               r11, sp, #16
        ldr               r5, [r0]
        mov               r4, r0
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               CPSR_c, r6
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r1
        mov               r1, r5
2:
        bl                2f
        str               r0, [r4]
        mov               r0, r5
        msr               CPSR_c, r6
        pop               {r4, r5, r6, r10, r11, lr}
        bx                lr

asm_test::fetch_add::f32::seqcst:
        push              {r4, r5, r6, r10, r11, lr}
        add               r11, sp, #16
        ldr               r5, [r0]
        mov               r4, r0
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               CPSR_c, r6
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r1
        mov               r1, r5
2:
        bl                2f
        str               r0, [r4]
        mov               r0, r5
        msr               CPSR_c, r6
        pop               {r4, r5, r6, r10, r11, lr}
        bx                lr

asm_test::fetch_add::f32::acquire:
        push              {r4, r5, r6, r10, r11, lr}
        add               r11, sp, #16
        ldr               r5, [r0]
        mov               r4, r0
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               CPSR_c, r6
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r1
        mov               r1, r5
2:
        bl                2f
        str               r0, [r4]
        mov               r0, r5
        msr               CPSR_c, r6
        pop               {r4, r5, r6, r10, r11, lr}
        bx                lr

asm_test::fetch_add::f32::relaxed:
        push              {r4, r5, r6, r10, r11, lr}
        add               r11, sp, #16
        ldr               r5, [r0]
        mov               r4, r0
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               CPSR_c, r6
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r1
        mov               r1, r5
2:
        bl                2f
        str               r0, [r4]
        mov               r0, r5
        msr               CPSR_c, r6
        pop               {r4, r5, r6, r10, r11, lr}
        bx                lr

asm_test::fetch_add::f32::release:
        push              {r4, r5, r6, r10, r11, lr}
        add               r11, sp, #16
        ldr               r5, [r0]
        mov               r4, r0
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               CPSR_c, r6
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r1
        mov               r1, r5
2:
        bl                2f
        str               r0, [r4]
        mov               r0, r5
        msr               CPSR_c, r6
        pop               {r4, r5, r6, r10, r11, lr}
        bx                lr

asm_test::fetch_add::u16::acqrel_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_add::u16::seqcst_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_add::u16::acquire_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_add::u16::relaxed_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_add::u16::release_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_add::u16::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        add               r1, r2, r1
        strh              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_add::u16::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        add               r1, r2, r1
        strh              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_add::u16::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        add               r1, r2, r1
        strh              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_add::u16::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        add               r1, r2, r1
        strh              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_add::u16::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        add               r1, r2, r1
        strh              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_add::u32::acqrel_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_add::u32::seqcst_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_add::u32::acquire_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_add::u32::relaxed_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_add::u32::release_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_add::u32::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        add               r1, r2, r1
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_add::u32::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        add               r1, r2, r1
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_add::u32::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        add               r1, r2, r1
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_add::u32::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        add               r1, r2, r1
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_add::u32::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        add               r1, r2, r1
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_and::u8::acqrel_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_and::u8::seqcst_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_and::u8::acqrel_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #0
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::u8::acquire_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_and::u8::relaxed_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_and::u8::release_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_and::u8::seqcst_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #0
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::u8::acquire_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #0
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::u8::relaxed_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #0
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::u8::release_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #0
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::u8::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        and               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_and::u8::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        and               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_and::u8::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        and               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_and::u8::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        and               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_and::u8::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        and               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_and::u16::acqrel_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_and::u16::seqcst_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_and::u16::acqrel_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #0
        ldrh              r1, [r0]
        strh              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::u16::acquire_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_and::u16::relaxed_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_and::u16::release_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_and::u16::seqcst_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #0
        ldrh              r1, [r0]
        strh              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::u16::acquire_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #0
        ldrh              r1, [r0]
        strh              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::u16::relaxed_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #0
        ldrh              r1, [r0]
        strh              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::u16::release_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #0
        ldrh              r1, [r0]
        strh              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::u16::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        and               r1, r2, r1
        strh              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_and::u16::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        and               r1, r2, r1
        strh              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_and::u16::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        and               r1, r2, r1
        strh              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_and::u16::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        and               r1, r2, r1
        strh              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_and::u16::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        and               r1, r2, r1
        strh              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_and::u32::acqrel_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_and::u32::seqcst_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_and::u32::acqrel_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #0
        ldr               r1, [r0]
        str               r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::u32::acquire_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_and::u32::relaxed_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_and::u32::release_all:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_and::u32::seqcst_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #0
        ldr               r1, [r0]
        str               r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::u32::acquire_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #0
        ldr               r1, [r0]
        str               r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::u32::relaxed_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #0
        ldr               r1, [r0]
        str               r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::u32::release_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #0
        ldr               r1, [r0]
        str               r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::u32::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        and               r1, r2, r1
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_and::u32::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        and               r1, r2, r1
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_and::u32::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        and               r1, r2, r1
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_and::u32::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        and               r1, r2, r1
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_and::u32::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        and               r1, r2, r1
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_and::bool::acqrel_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r1, #1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_and::bool::seqcst_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r1, #1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_and::bool::acqrel_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #0
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::bool::acquire_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r1, #1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_and::bool::relaxed_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r1, #1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_and::bool::release_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        and               r3, r1, #1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_and::bool::seqcst_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #0
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::bool::acquire_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #0
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::bool::relaxed_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #0
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::bool::release_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        mov               r3, #0
        ldrb              r1, [r0]
        strb              r3, [r0]
        msr               CPSR_c, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::bool::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        and               r1, r1, r2
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_and::bool::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        and               r1, r1, r2
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_and::bool::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        and               r1, r1, r2
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_and::bool::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        and               r1, r1, r2
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_and::bool::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        and               r1, r1, r2
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_max::i8::acqrel:
        lsl               r2, r1, #24
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrsb             r3, [r0]
        cmp               r3, r2, asr #24
        mov               r1, r3
        asrle             r1, r2, #24
        strb              r1, [r0]
        mov               r0, r3
        msr               CPSR_c, r12
        bx                lr

asm_test::fetch_max::i8::seqcst:
        lsl               r2, r1, #24
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrsb             r3, [r0]
        cmp               r3, r2, asr #24
        mov               r1, r3
        asrle             r1, r2, #24
        strb              r1, [r0]
        mov               r0, r3
        msr               CPSR_c, r12
        bx                lr

asm_test::fetch_max::i8::acquire:
        lsl               r2, r1, #24
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrsb             r3, [r0]
        cmp               r3, r2, asr #24
        mov               r1, r3
        asrle             r1, r2, #24
        strb              r1, [r0]
        mov               r0, r3
        msr               CPSR_c, r12
        bx                lr

asm_test::fetch_max::i8::relaxed:
        lsl               r2, r1, #24
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrsb             r3, [r0]
        cmp               r3, r2, asr #24
        mov               r1, r3
        asrle             r1, r2, #24
        strb              r1, [r0]
        mov               r0, r3
        msr               CPSR_c, r12
        bx                lr

asm_test::fetch_max::i8::release:
        lsl               r2, r1, #24
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrsb             r3, [r0]
        cmp               r3, r2, asr #24
        mov               r1, r3
        asrle             r1, r2, #24
        strb              r1, [r0]
        mov               r0, r3
        msr               CPSR_c, r12
        bx                lr

asm_test::fetch_max::f32::acqrel:
        push              {r4, r5, r6, r10, r11, lr}
        add               r11, sp, #16
        ldr               r5, [r0]
        mov               r4, r0
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               CPSR_c, r6
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        mov               r0, r5
        msr               CPSR_c, r6
        pop               {r4, r5, r6, r10, r11, lr}
        bx                lr

asm_test::fetch_max::f32::seqcst:
        push              {r4, r5, r6, r10, r11, lr}
        add               r11, sp, #16
        ldr               r5, [r0]
        mov               r4, r0
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               CPSR_c, r6
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        mov               r0, r5
        msr               CPSR_c, r6
        pop               {r4, r5, r6, r10, r11, lr}
        bx                lr

asm_test::fetch_max::f32::acquire:
        push              {r4, r5, r6, r10, r11, lr}
        add               r11, sp, #16
        ldr               r5, [r0]
        mov               r4, r0
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               CPSR_c, r6
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        mov               r0, r5
        msr               CPSR_c, r6
        pop               {r4, r5, r6, r10, r11, lr}
        bx                lr

asm_test::fetch_max::f32::relaxed:
        push              {r4, r5, r6, r10, r11, lr}
        add               r11, sp, #16
        ldr               r5, [r0]
        mov               r4, r0
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               CPSR_c, r6
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        mov               r0, r5
        msr               CPSR_c, r6
        pop               {r4, r5, r6, r10, r11, lr}
        bx                lr

asm_test::fetch_max::f32::release:
        push              {r4, r5, r6, r10, r11, lr}
        add               r11, sp, #16
        ldr               r5, [r0]
        mov               r4, r0
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               CPSR_c, r6
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        mov               r0, r5
        msr               CPSR_c, r6
        pop               {r4, r5, r6, r10, r11, lr}
        bx                lr

asm_test::fetch_max::i16::acqrel:
        lsl               r2, r1, #16
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrsh             r3, [r0]
        cmp               r3, r2, asr #16
        mov               r1, r3
        asrle             r1, r2, #16
        strh              r1, [r0]
        mov               r0, r3
        msr               CPSR_c, r12
        bx                lr

asm_test::fetch_max::i16::seqcst:
        lsl               r2, r1, #16
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrsh             r3, [r0]
        cmp               r3, r2, asr #16
        mov               r1, r3
        asrle             r1, r2, #16
        strh              r1, [r0]
        mov               r0, r3
        msr               CPSR_c, r12
        bx                lr

asm_test::fetch_max::i16::acquire:
        lsl               r2, r1, #16
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrsh             r3, [r0]
        cmp               r3, r2, asr #16
        mov               r1, r3
        asrle             r1, r2, #16
        strh              r1, [r0]
        mov               r0, r3
        msr               CPSR_c, r12
        bx                lr

asm_test::fetch_max::i16::relaxed:
        lsl               r2, r1, #16
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrsh             r3, [r0]
        cmp               r3, r2, asr #16
        mov               r1, r3
        asrle             r1, r2, #16
        strh              r1, [r0]
        mov               r0, r3
        msr               CPSR_c, r12
        bx                lr

asm_test::fetch_max::i16::release:
        lsl               r2, r1, #16
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrsh             r3, [r0]
        cmp               r3, r2, asr #16
        mov               r1, r3
        asrle             r1, r2, #16
        strh              r1, [r0]
        mov               r0, r3
        msr               CPSR_c, r12
        bx                lr

asm_test::fetch_max::i32::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        cmp               r2, r1
        movgt             r1, r2
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_max::i32::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        cmp               r2, r1
        movgt             r1, r2
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_max::i32::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        cmp               r2, r1
        movgt             r1, r2
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_max::i32::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        cmp               r2, r1
        movgt             r1, r2
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_max::i32::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        cmp               r2, r1
        movgt             r1, r2
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_min::i8::acqrel:
        lsl               r2, r1, #24
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrsb             r3, [r0]
        cmp               r3, r2, asr #24
        mov               r1, r3
        asrge             r1, r2, #24
        strb              r1, [r0]
        mov               r0, r3
        msr               CPSR_c, r12
        bx                lr

asm_test::fetch_min::i8::seqcst:
        lsl               r2, r1, #24
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrsb             r3, [r0]
        cmp               r3, r2, asr #24
        mov               r1, r3
        asrge             r1, r2, #24
        strb              r1, [r0]
        mov               r0, r3
        msr               CPSR_c, r12
        bx                lr

asm_test::fetch_min::i8::acquire:
        lsl               r2, r1, #24
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrsb             r3, [r0]
        cmp               r3, r2, asr #24
        mov               r1, r3
        asrge             r1, r2, #24
        strb              r1, [r0]
        mov               r0, r3
        msr               CPSR_c, r12
        bx                lr

asm_test::fetch_min::i8::relaxed:
        lsl               r2, r1, #24
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrsb             r3, [r0]
        cmp               r3, r2, asr #24
        mov               r1, r3
        asrge             r1, r2, #24
        strb              r1, [r0]
        mov               r0, r3
        msr               CPSR_c, r12
        bx                lr

asm_test::fetch_min::i8::release:
        lsl               r2, r1, #24
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrsb             r3, [r0]
        cmp               r3, r2, asr #24
        mov               r1, r3
        asrge             r1, r2, #24
        strb              r1, [r0]
        mov               r0, r3
        msr               CPSR_c, r12
        bx                lr

asm_test::fetch_min::f32::acqrel:
        push              {r4, r5, r6, r10, r11, lr}
        add               r11, sp, #16
        ldr               r5, [r0]
        mov               r4, r0
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               CPSR_c, r6
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        mov               r0, r5
        msr               CPSR_c, r6
        pop               {r4, r5, r6, r10, r11, lr}
        bx                lr

asm_test::fetch_min::f32::seqcst:
        push              {r4, r5, r6, r10, r11, lr}
        add               r11, sp, #16
        ldr               r5, [r0]
        mov               r4, r0
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               CPSR_c, r6
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        mov               r0, r5
        msr               CPSR_c, r6
        pop               {r4, r5, r6, r10, r11, lr}
        bx                lr

asm_test::fetch_min::f32::acquire:
        push              {r4, r5, r6, r10, r11, lr}
        add               r11, sp, #16
        ldr               r5, [r0]
        mov               r4, r0
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               CPSR_c, r6
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        mov               r0, r5
        msr               CPSR_c, r6
        pop               {r4, r5, r6, r10, r11, lr}
        bx                lr

asm_test::fetch_min::f32::relaxed:
        push              {r4, r5, r6, r10, r11, lr}
        add               r11, sp, #16
        ldr               r5, [r0]
        mov               r4, r0
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               CPSR_c, r6
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        mov               r0, r5
        msr               CPSR_c, r6
        pop               {r4, r5, r6, r10, r11, lr}
        bx                lr

asm_test::fetch_min::f32::release:
        push              {r4, r5, r6, r10, r11, lr}
        add               r11, sp, #16
        ldr               r5, [r0]
        mov               r4, r0
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               CPSR_c, r6
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        mov               r0, r5
        msr               CPSR_c, r6
        pop               {r4, r5, r6, r10, r11, lr}
        bx                lr

asm_test::fetch_min::i16::acqrel:
        lsl               r2, r1, #16
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrsh             r3, [r0]
        cmp               r3, r2, asr #16
        mov               r1, r3
        asrge             r1, r2, #16
        strh              r1, [r0]
        mov               r0, r3
        msr               CPSR_c, r12
        bx                lr

asm_test::fetch_min::i16::seqcst:
        lsl               r2, r1, #16
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrsh             r3, [r0]
        cmp               r3, r2, asr #16
        mov               r1, r3
        asrge             r1, r2, #16
        strh              r1, [r0]
        mov               r0, r3
        msr               CPSR_c, r12
        bx                lr

asm_test::fetch_min::i16::acquire:
        lsl               r2, r1, #16
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrsh             r3, [r0]
        cmp               r3, r2, asr #16
        mov               r1, r3
        asrge             r1, r2, #16
        strh              r1, [r0]
        mov               r0, r3
        msr               CPSR_c, r12
        bx                lr

asm_test::fetch_min::i16::relaxed:
        lsl               r2, r1, #16
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrsh             r3, [r0]
        cmp               r3, r2, asr #16
        mov               r1, r3
        asrge             r1, r2, #16
        strh              r1, [r0]
        mov               r0, r3
        msr               CPSR_c, r12
        bx                lr

asm_test::fetch_min::i16::release:
        lsl               r2, r1, #16
        mrs               r12, apsr
        orr               r1, r12, #128
        msr               CPSR_c, r1
        ldrsh             r3, [r0]
        cmp               r3, r2, asr #16
        mov               r1, r3
        asrge             r1, r2, #16
        strh              r1, [r0]
        mov               r0, r3
        msr               CPSR_c, r12
        bx                lr

asm_test::fetch_min::i32::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        cmp               r2, r1
        movlt             r1, r2
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_min::i32::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        cmp               r2, r1
        movlt             r1, r2
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_min::i32::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        cmp               r2, r1
        movlt             r1, r2
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_min::i32::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        cmp               r2, r1
        movlt             r1, r2
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_min::i32::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        cmp               r2, r1
        movlt             r1, r2
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_neg::u8::acqrel:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        rsb               r3, r1, #0
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_neg::u8::seqcst:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        rsb               r3, r1, #0
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_neg::u8::acquire:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        rsb               r3, r1, #0
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_neg::u8::relaxed:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        rsb               r3, r1, #0
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_neg::u8::release:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        rsb               r3, r1, #0
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_neg::f32::acqrel:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        eor               r3, r1, #-2147483648
        str               r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_neg::f32::seqcst:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        eor               r3, r1, #-2147483648
        str               r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_neg::f32::acquire:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        eor               r3, r1, #-2147483648
        str               r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_neg::f32::relaxed:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        eor               r3, r1, #-2147483648
        str               r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_neg::f32::release:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        eor               r3, r1, #-2147483648
        str               r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_neg::u16::acqrel:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        rsb               r3, r1, #0
        strh              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_neg::u16::seqcst:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        rsb               r3, r1, #0
        strh              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_neg::u16::acquire:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        rsb               r3, r1, #0
        strh              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_neg::u16::relaxed:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        rsb               r3, r1, #0
        strh              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_neg::u16::release:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        rsb               r3, r1, #0
        strh              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_neg::u32::acqrel:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        rsb               r3, r1, #0
        str               r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_neg::u32::seqcst:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        rsb               r3, r1, #0
        str               r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_neg::u32::acquire:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        rsb               r3, r1, #0
        str               r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_neg::u32::relaxed:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        rsb               r3, r1, #0
        str               r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_neg::u32::release:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        rsb               r3, r1, #0
        str               r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_not::u8::acqrel:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        mvn               r3, r1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_not::u8::seqcst:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        mvn               r3, r1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_not::u8::acquire:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        mvn               r3, r1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_not::u8::relaxed:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        mvn               r3, r1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_not::u8::release:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        mvn               r3, r1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_not::u16::acqrel:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        mvn               r3, r1
        strh              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_not::u16::seqcst:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        mvn               r3, r1
        strh              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_not::u16::acquire:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        mvn               r3, r1
        strh              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_not::u16::relaxed:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        mvn               r3, r1
        strh              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_not::u16::release:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r1, [r0]
        mvn               r3, r1
        strh              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_not::u32::acqrel:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        mvn               r3, r1
        str               r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_not::u32::seqcst:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        mvn               r3, r1
        str               r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_not::u32::acquire:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        mvn               r3, r1
        str               r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_not::u32::relaxed:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        mvn               r3, r1
        str               r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_not::u32::release:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r1, [r0]
        mvn               r3, r1
        str               r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_not::bool::acqrel:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        eor               r3, r1, #1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_not::bool::seqcst:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        eor               r3, r1, #1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_not::bool::acquire:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        eor               r3, r1, #1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_not::bool::relaxed:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        eor               r3, r1, #1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_not::bool::release:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        eor               r3, r1, #1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_sub::u8::acqrel_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_sub::u8::seqcst_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_sub::u8::acquire_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_sub::u8::relaxed_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_sub::u8::release_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_sub::u8::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        sub               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_sub::u8::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        sub               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_sub::u8::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        sub               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_sub::u8::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        sub               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_sub::u8::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        sub               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_sub::f32::acqrel_zero:
        ldr               r1, [r0]
        mrs               r2, apsr
        orr               r3, r2, #128
        msr               CPSR_c, r3
        ldr               r3, [r0]
        cmp               r1, r3
        beq               1f
0:
        mov               r1, r3
        msr               CPSR_c, r2
        mrs               r2, apsr
        orr               r3, r2, #128
        msr               CPSR_c, r3
        ldr               r3, [r0]
        cmp               r1, r3
        bne               0b
1:
        str               r1, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_sub::f32::seqcst_zero:
        ldr               r1, [r0]
        mrs               r2, apsr
        orr               r3, r2, #128
        msr               CPSR_c, r3
        ldr               r3, [r0]
        cmp               r1, r3
        beq               1f
0:
        mov               r1, r3
        msr               CPSR_c, r2
        mrs               r2, apsr
        orr               r3, r2, #128
        msr               CPSR_c, r3
        ldr               r3, [r0]
        cmp               r1, r3
        bne               0b
1:
        str               r1, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_sub::f32::acquire_zero:
        ldr               r1, [r0]
        mrs               r2, apsr
        orr               r3, r2, #128
        msr               CPSR_c, r3
        ldr               r3, [r0]
        cmp               r1, r3
        beq               1f
0:
        mov               r1, r3
        msr               CPSR_c, r2
        mrs               r2, apsr
        orr               r3, r2, #128
        msr               CPSR_c, r3
        ldr               r3, [r0]
        cmp               r1, r3
        bne               0b
1:
        str               r1, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_sub::f32::relaxed_zero:
        ldr               r1, [r0]
        mrs               r2, apsr
        orr               r3, r2, #128
        msr               CPSR_c, r3
        ldr               r3, [r0]
        cmp               r1, r3
        beq               1f
0:
        mov               r1, r3
        msr               CPSR_c, r2
        mrs               r2, apsr
        orr               r3, r2, #128
        msr               CPSR_c, r3
        ldr               r3, [r0]
        cmp               r1, r3
        bne               0b
1:
        str               r1, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_sub::f32::release_zero:
        ldr               r1, [r0]
        mrs               r2, apsr
        orr               r3, r2, #128
        msr               CPSR_c, r3
        ldr               r3, [r0]
        cmp               r1, r3
        beq               1f
0:
        mov               r1, r3
        msr               CPSR_c, r2
        mrs               r2, apsr
        orr               r3, r2, #128
        msr               CPSR_c, r3
        ldr               r3, [r0]
        cmp               r1, r3
        bne               0b
1:
        str               r1, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_sub::f32::acqrel:
        push              {r4, r5, r6, r10, r11, lr}
        add               r11, sp, #16
        ldr               r5, [r0]
        mov               r4, r0
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               CPSR_c, r6
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        mov               r0, r5
        msr               CPSR_c, r6
        pop               {r4, r5, r6, r10, r11, lr}
        bx                lr

asm_test::fetch_sub::f32::seqcst:
        push              {r4, r5, r6, r10, r11, lr}
        add               r11, sp, #16
        ldr               r5, [r0]
        mov               r4, r0
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               CPSR_c, r6
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        mov               r0, r5
        msr               CPSR_c, r6
        pop               {r4, r5, r6, r10, r11, lr}
        bx                lr

asm_test::fetch_sub::f32::acquire:
        push              {r4, r5, r6, r10, r11, lr}
        add               r11, sp, #16
        ldr               r5, [r0]
        mov               r4, r0
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               CPSR_c, r6
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        mov               r0, r5
        msr               CPSR_c, r6
        pop               {r4, r5, r6, r10, r11, lr}
        bx                lr

asm_test::fetch_sub::f32::relaxed:
        push              {r4, r5, r6, r10, r11, lr}
        add               r11, sp, #16
        ldr               r5, [r0]
        mov               r4, r0
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               CPSR_c, r6
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        mov               r0, r5
        msr               CPSR_c, r6
        pop               {r4, r5, r6, r10, r11, lr}
        bx                lr

asm_test::fetch_sub::f32::release:
        push              {r4, r5, r6, r10, r11, lr}
        add               r11, sp, #16
        ldr               r5, [r0]
        mov               r4, r0
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               CPSR_c, r6
        mrs               r6, apsr
        orr               r0, r6, #128
        msr               CPSR_c, r0
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        mov               r0, r5
        msr               CPSR_c, r6
        pop               {r4, r5, r6, r10, r11, lr}
        bx                lr

asm_test::fetch_sub::u16::acqrel_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_sub::u16::seqcst_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_sub::u16::acquire_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_sub::u16::relaxed_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_sub::u16::release_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_sub::u16::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        sub               r1, r2, r1
        strh              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_sub::u16::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        sub               r1, r2, r1
        strh              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_sub::u16::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        sub               r1, r2, r1
        strh              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_sub::u16::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        sub               r1, r2, r1
        strh              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_sub::u16::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        sub               r1, r2, r1
        strh              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_sub::u32::acqrel_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_sub::u32::seqcst_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_sub::u32::acquire_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_sub::u32::relaxed_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_sub::u32::release_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_sub::u32::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        sub               r1, r2, r1
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_sub::u32::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        sub               r1, r2, r1
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_sub::u32::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        sub               r1, r2, r1
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_sub::u32::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        sub               r1, r2, r1
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_sub::u32::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        sub               r1, r2, r1
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_xor::u8::acqrel_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_xor::u8::seqcst_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_xor::u8::acquire_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_xor::u8::relaxed_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_xor::u8::release_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_xor::u8::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        eor               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_xor::u8::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        eor               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_xor::u8::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        eor               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_xor::u8::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        eor               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_xor::u8::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        eor               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_xor::u16::acqrel_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_xor::u16::seqcst_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_xor::u16::acquire_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_xor::u16::relaxed_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_xor::u16::release_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrh              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_xor::u16::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        eor               r1, r2, r1
        strh              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_xor::u16::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        eor               r1, r2, r1
        strh              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_xor::u16::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        eor               r1, r2, r1
        strh              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_xor::u16::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        eor               r1, r2, r1
        strh              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_xor::u16::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrh              r2, [r0]
        eor               r1, r2, r1
        strh              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_xor::u32::acqrel_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_xor::u32::seqcst_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_xor::u32::acquire_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_xor::u32::relaxed_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_xor::u32::release_zero:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldr               r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_xor::u32::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        eor               r1, r2, r1
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_xor::u32::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        eor               r1, r2, r1
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_xor::u32::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        eor               r1, r2, r1
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_xor::u32::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        eor               r1, r2, r1
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_xor::u32::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldr               r2, [r0]
        eor               r1, r2, r1
        str               r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_xor::bool::acqrel_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        eor               r3, r1, #1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_xor::bool::seqcst_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        eor               r3, r1, #1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_xor::bool::acqrel_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_xor::bool::acquire_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        eor               r3, r1, #1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_xor::bool::relaxed_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        eor               r3, r1, #1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_xor::bool::release_true:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r1, [r0]
        eor               r3, r1, #1
        strb              r3, [r0]
        mov               r0, r1
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_xor::bool::seqcst_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_xor::bool::acquire_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_xor::bool::relaxed_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_xor::bool::release_false:
        mrs               r2, apsr
        orr               r1, r2, #128
        msr               CPSR_c, r1
        ldrb              r0, [r0]
        msr               CPSR_c, r2
        bx                lr

asm_test::fetch_xor::bool::acqrel:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        eor               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_xor::bool::seqcst:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        eor               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_xor::bool::acquire:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        eor               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_xor::bool::relaxed:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        eor               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

asm_test::fetch_xor::bool::release:
        mrs               r3, apsr
        orr               r2, r3, #128
        msr               CPSR_c, r2
        ldrb              r2, [r0]
        eor               r1, r2, r1
        strb              r1, [r0]
        mov               r0, r2
        msr               CPSR_c, r3
        bx                lr

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

asm_test::bit_toggle::u8::acqrel:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0x7
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldrb              r3, [r2]
        mov               r4, r3
        eors              r4, r0
        strb              r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_toggle::u8::seqcst:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0x7
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldrb              r3, [r2]
        mov               r4, r3
        eors              r4, r0
        strb              r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_toggle::u8::acquire:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0x7
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldrb              r3, [r2]
        mov               r4, r3
        eors              r4, r0
        strb              r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_toggle::u8::relaxed:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0x7
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldrb              r3, [r2]
        mov               r4, r3
        eors              r4, r0
        strb              r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_toggle::u8::release:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0x7
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldrb              r3, [r2]
        mov               r4, r3
        eors              r4, r0
        strb              r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_toggle::u16::acqrel:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0xf
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldrh              r3, [r2]
        mov               r4, r3
        eors              r4, r0
        strh              r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_toggle::u16::seqcst:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0xf
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldrh              r3, [r2]
        mov               r4, r3
        eors              r4, r0
        strh              r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_toggle::u16::acquire:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0xf
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldrh              r3, [r2]
        mov               r4, r3
        eors              r4, r0
        strh              r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_toggle::u16::relaxed:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0xf
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldrh              r3, [r2]
        mov               r4, r3
        eors              r4, r0
        strh              r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_toggle::u16::release:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0xf
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldrh              r3, [r2]
        mov               r4, r3
        eors              r4, r0
        strh              r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_toggle::u32::acqrel:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0x1f
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldr               r3, [r2]
        mov               r4, r3
        eors              r4, r0
        str               r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_toggle::u32::seqcst:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0x1f
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldr               r3, [r2]
        mov               r4, r3
        eors              r4, r0
        str               r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_toggle::u32::acquire:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0x1f
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldr               r3, [r2]
        mov               r4, r3
        eors              r4, r0
        str               r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_toggle::u32::relaxed:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0x1f
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldr               r3, [r2]
        mov               r4, r3
        eors              r4, r0
        str               r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_toggle::u32::release:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0x1f
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldr               r3, [r2]
        mov               r4, r3
        eors              r4, r0
        str               r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::fetch_nand::u8::acqrel_all:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        mvns              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u8::seqcst_all:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        mvns              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u8::acqrel_zero:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0xff
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u8::acquire_all:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        mvns              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u8::relaxed_all:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        mvns              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u8::release_all:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        mvns              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u8::seqcst_zero:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0xff
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u8::acquire_zero:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0xff
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u8::relaxed_zero:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0xff
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u8::release_zero:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0xff
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u8::acqrel:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        ands              r1, r2
        mvns              r1, r1
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_nand::u8::seqcst:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        ands              r1, r2
        mvns              r1, r1
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_nand::u8::acquire:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        ands              r1, r2
        mvns              r1, r1
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_nand::u8::relaxed:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        ands              r1, r2
        mvns              r1, r1
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_nand::u8::release:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        ands              r1, r2
        mvns              r1, r1
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_nand::u16::acqrel_all:
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        mvns              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u16::seqcst_all:
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        mvns              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u16::acqrel_zero:
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        ldr               r3, [pc, #0x8]          @ 0f
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr
0:
        .word             0x0000ffff

asm_test::fetch_nand::u16::acquire_all:
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        mvns              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u16::relaxed_all:
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        mvns              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u16::release_all:
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        mvns              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u16::seqcst_zero:
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        ldr               r3, [pc, #0x8]          @ 0f
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr
0:
        .word             0x0000ffff

asm_test::fetch_nand::u16::acquire_zero:
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        ldr               r3, [pc, #0x8]          @ 0f
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr
0:
        .word             0x0000ffff

asm_test::fetch_nand::u16::relaxed_zero:
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        ldr               r3, [pc, #0x8]          @ 0f
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr
0:
        .word             0x0000ffff

asm_test::fetch_nand::u16::release_zero:
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        ldr               r3, [pc, #0x8]          @ 0f
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr
0:
        .word             0x0000ffff

asm_test::fetch_nand::u16::acqrel:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        ands              r1, r2
        mvns              r1, r1
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_nand::u16::seqcst:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        ands              r1, r2
        mvns              r1, r1
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_nand::u16::acquire:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        ands              r1, r2
        mvns              r1, r1
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_nand::u16::relaxed:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        ands              r1, r2
        mvns              r1, r1
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_nand::u16::release:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        ands              r1, r2
        mvns              r1, r1
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_nand::u32::acqrel_all:
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        mvns              r3, r1
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u32::seqcst_all:
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        mvns              r3, r1
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u32::acqrel_zero:
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        movs              r3, #0x0
        mvns              r3, r3
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u32::acquire_all:
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        mvns              r3, r1
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u32::relaxed_all:
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        mvns              r3, r1
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u32::release_all:
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        mvns              r3, r1
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u32::seqcst_zero:
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        movs              r3, #0x0
        mvns              r3, r3
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u32::acquire_zero:
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        movs              r3, #0x0
        mvns              r3, r3
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u32::relaxed_zero:
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        movs              r3, #0x0
        mvns              r3, r3
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u32::release_zero:
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        movs              r3, #0x0
        mvns              r3, r3
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::u32::acqrel:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        ands              r1, r2
        mvns              r1, r1
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_nand::u32::seqcst:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        ands              r1, r2
        mvns              r1, r1
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_nand::u32::acquire:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        ands              r1, r2
        mvns              r1, r1
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_nand::u32::relaxed:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        ands              r1, r2
        mvns              r1, r1
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_nand::u32::release:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        ands              r1, r2
        mvns              r1, r1
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_nand::bool::acqrel_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        eors              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::bool::seqcst_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        eors              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::bool::acqrel_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::bool::acquire_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        eors              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::bool::relaxed_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        eors              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::bool::release_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        eors              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::bool::seqcst_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::bool::acquire_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::bool::relaxed_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::bool::release_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_nand::bool::acqrel:
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldrb              r0, [r0]
        cmp               r1, #0x0
        beq               0f
        movs              r1, #0x1
        eors              r1, r0
        strb              r1, [r2]
        msr               primask, r3
        movs              r1, #0x1
        ands              r0, r1
        bx                lr
0:
        movs              r1, #0x1
        strb              r1, [r2]
        msr               primask, r3
        movs              r1, #0x1
        ands              r0, r1
        bx                lr

asm_test::fetch_nand::bool::seqcst:
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldrb              r0, [r0]
        cmp               r1, #0x0
        beq               0f
        movs              r1, #0x1
        eors              r1, r0
        strb              r1, [r2]
        msr               primask, r3
        movs              r1, #0x1
        ands              r0, r1
        bx                lr
0:
        movs              r1, #0x1
        strb              r1, [r2]
        msr               primask, r3
        movs              r1, #0x1
        ands              r0, r1
        bx                lr

asm_test::fetch_nand::bool::acquire:
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldrb              r0, [r0]
        cmp               r1, #0x0
        beq               0f
        movs              r1, #0x1
        eors              r1, r0
        strb              r1, [r2]
        msr               primask, r3
        movs              r1, #0x1
        ands              r0, r1
        bx                lr
0:
        movs              r1, #0x1
        strb              r1, [r2]
        msr               primask, r3
        movs              r1, #0x1
        ands              r0, r1
        bx                lr

asm_test::fetch_nand::bool::relaxed:
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldrb              r0, [r0]
        cmp               r1, #0x0
        beq               0f
        movs              r1, #0x1
        eors              r1, r0
        strb              r1, [r2]
        msr               primask, r3
        movs              r1, #0x1
        ands              r0, r1
        bx                lr
0:
        movs              r1, #0x1
        strb              r1, [r2]
        msr               primask, r3
        movs              r1, #0x1
        ands              r0, r1
        bx                lr

asm_test::fetch_nand::bool::release:
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldrb              r0, [r0]
        cmp               r1, #0x0
        beq               0f
        movs              r1, #0x1
        eors              r1, r0
        strb              r1, [r2]
        msr               primask, r3
        movs              r1, #0x1
        ands              r0, r1
        bx                lr
0:
        movs              r1, #0x1
        strb              r1, [r2]
        msr               primask, r3
        movs              r1, #0x1
        ands              r0, r1
        bx                lr

asm_test::fetch_umax::u8::acqrel:
        push              {r4, lr}
        uxtb              r3, r1
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        mov               r4, r1
        bhi               0f
        mov               r4, r3
0:
        strb              r4, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r4, pc}

asm_test::fetch_umax::u8::seqcst:
        push              {r4, lr}
        uxtb              r3, r1
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        mov               r4, r1
        bhi               0f
        mov               r4, r3
0:
        strb              r4, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r4, pc}

asm_test::fetch_umax::u8::acquire:
        push              {r4, lr}
        uxtb              r3, r1
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        mov               r4, r1
        bhi               0f
        mov               r4, r3
0:
        strb              r4, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r4, pc}

asm_test::fetch_umax::u8::relaxed:
        push              {r4, lr}
        uxtb              r3, r1
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        mov               r4, r1
        bhi               0f
        mov               r4, r3
0:
        strb              r4, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r4, pc}

asm_test::fetch_umax::u8::release:
        push              {r4, lr}
        uxtb              r3, r1
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        mov               r4, r1
        bhi               0f
        mov               r4, r3
0:
        strb              r4, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r4, pc}

asm_test::fetch_umax::u16::acqrel:
        push              {r4, lr}
        uxth              r3, r1
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        cmp               r1, r3
        mov               r4, r1
        bhi               0f
        mov               r4, r3
0:
        strh              r4, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r4, pc}

asm_test::fetch_umax::u16::seqcst:
        push              {r4, lr}
        uxth              r3, r1
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        cmp               r1, r3
        mov               r4, r1
        bhi               0f
        mov               r4, r3
0:
        strh              r4, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r4, pc}

asm_test::fetch_umax::u16::acquire:
        push              {r4, lr}
        uxth              r3, r1
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        cmp               r1, r3
        mov               r4, r1
        bhi               0f
        mov               r4, r3
0:
        strh              r4, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r4, pc}

asm_test::fetch_umax::u16::relaxed:
        push              {r4, lr}
        uxth              r3, r1
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        cmp               r1, r3
        mov               r4, r1
        bhi               0f
        mov               r4, r3
0:
        strh              r4, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r4, pc}

asm_test::fetch_umax::u16::release:
        push              {r4, lr}
        uxth              r3, r1
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        cmp               r1, r3
        mov               r4, r1
        bhi               0f
        mov               r4, r3
0:
        strh              r4, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r4, pc}

asm_test::fetch_umax::u32::acqrel:
        push              {r4, lr}
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r0, r1
        mov               r4, r0
        bhi               0f
        mov               r4, r1
0:
        str               r4, [r2]
        msr               primask, r3
        pop               {r4, pc}

asm_test::fetch_umax::u32::seqcst:
        push              {r4, lr}
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r0, r1
        mov               r4, r0
        bhi               0f
        mov               r4, r1
0:
        str               r4, [r2]
        msr               primask, r3
        pop               {r4, pc}

asm_test::fetch_umax::u32::acquire:
        push              {r4, lr}
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r0, r1
        mov               r4, r0
        bhi               0f
        mov               r4, r1
0:
        str               r4, [r2]
        msr               primask, r3
        pop               {r4, pc}

asm_test::fetch_umax::u32::relaxed:
        push              {r4, lr}
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r0, r1
        mov               r4, r0
        bhi               0f
        mov               r4, r1
0:
        str               r4, [r2]
        msr               primask, r3
        pop               {r4, pc}

asm_test::fetch_umax::u32::release:
        push              {r4, lr}
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r0, r1
        mov               r4, r0
        bhi               0f
        mov               r4, r1
0:
        str               r4, [r2]
        msr               primask, r3
        pop               {r4, pc}

asm_test::fetch_umin::u8::acqrel:
        push              {r4, lr}
        uxtb              r3, r1
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        mov               r4, r1
        blo               0f
        mov               r4, r3
0:
        strb              r4, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r4, pc}

asm_test::fetch_umin::u8::seqcst:
        push              {r4, lr}
        uxtb              r3, r1
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        mov               r4, r1
        blo               0f
        mov               r4, r3
0:
        strb              r4, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r4, pc}

asm_test::fetch_umin::u8::acquire:
        push              {r4, lr}
        uxtb              r3, r1
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        mov               r4, r1
        blo               0f
        mov               r4, r3
0:
        strb              r4, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r4, pc}

asm_test::fetch_umin::u8::relaxed:
        push              {r4, lr}
        uxtb              r3, r1
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        mov               r4, r1
        blo               0f
        mov               r4, r3
0:
        strb              r4, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r4, pc}

asm_test::fetch_umin::u8::release:
        push              {r4, lr}
        uxtb              r3, r1
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        mov               r4, r1
        blo               0f
        mov               r4, r3
0:
        strb              r4, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r4, pc}

asm_test::fetch_umin::u16::acqrel:
        push              {r4, lr}
        uxth              r3, r1
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        cmp               r1, r3
        mov               r4, r1
        blo               0f
        mov               r4, r3
0:
        strh              r4, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r4, pc}

asm_test::fetch_umin::u16::seqcst:
        push              {r4, lr}
        uxth              r3, r1
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        cmp               r1, r3
        mov               r4, r1
        blo               0f
        mov               r4, r3
0:
        strh              r4, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r4, pc}

asm_test::fetch_umin::u16::acquire:
        push              {r4, lr}
        uxth              r3, r1
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        cmp               r1, r3
        mov               r4, r1
        blo               0f
        mov               r4, r3
0:
        strh              r4, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r4, pc}

asm_test::fetch_umin::u16::relaxed:
        push              {r4, lr}
        uxth              r3, r1
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        cmp               r1, r3
        mov               r4, r1
        blo               0f
        mov               r4, r3
0:
        strh              r4, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r4, pc}

asm_test::fetch_umin::u16::release:
        push              {r4, lr}
        uxth              r3, r1
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        cmp               r1, r3
        mov               r4, r1
        blo               0f
        mov               r4, r3
0:
        strh              r4, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r4, pc}

asm_test::fetch_umin::u32::acqrel:
        push              {r4, lr}
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r0, r1
        mov               r4, r0
        blo               0f
        mov               r4, r1
0:
        str               r4, [r2]
        msr               primask, r3
        pop               {r4, pc}

asm_test::fetch_umin::u32::seqcst:
        push              {r4, lr}
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r0, r1
        mov               r4, r0
        blo               0f
        mov               r4, r1
0:
        str               r4, [r2]
        msr               primask, r3
        pop               {r4, pc}

asm_test::fetch_umin::u32::acquire:
        push              {r4, lr}
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r0, r1
        mov               r4, r0
        blo               0f
        mov               r4, r1
0:
        str               r4, [r2]
        msr               primask, r3
        pop               {r4, pc}

asm_test::fetch_umin::u32::relaxed:
        push              {r4, lr}
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r0, r1
        mov               r4, r0
        blo               0f
        mov               r4, r1
0:
        str               r4, [r2]
        msr               primask, r3
        pop               {r4, pc}

asm_test::fetch_umin::u32::release:
        push              {r4, lr}
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r0, r1
        mov               r4, r0
        blo               0f
        mov               r4, r1
0:
        str               r4, [r2]
        msr               primask, r3
        pop               {r4, pc}

asm_test::compare_exchange::u8::acqrel_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r3, r1
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r3, r1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::u8::seqcst_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r3, r1
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r3, r1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::u8::acqrel_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r3, r1
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r3, r1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::u8::acqrel_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r3, r1
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r3, r1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::u8::acquire_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r3, r1
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r3, r1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::u8::relaxed_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r3, r1
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r3, r1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::u8::release_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r3, r1
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r3, r1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::u8::seqcst_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r3, r1
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r3, r1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::u8::seqcst_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r3, r1
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r3, r1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::u8::acquire_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r3, r1
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r3, r1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::u8::acquire_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r3, r1
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r3, r1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::u8::relaxed_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r3, r1
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r3, r1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::u8::relaxed_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r3, r1
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r3, r1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::u8::release_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r3, r1
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r3, r1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::u8::release_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r3, r1
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r3, r1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::f32::acqrel_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::f32::seqcst_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::f32::acqrel_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::f32::acqrel_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::f32::acquire_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::f32::relaxed_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::f32::release_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::f32::seqcst_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::f32::seqcst_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::f32::acquire_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::f32::acquire_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::f32::relaxed_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::f32::relaxed_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::f32::release_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::f32::release_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::u16::acqrel_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r3, r1
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange::u16::seqcst_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r3, r1
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange::u16::acqrel_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r3, r1
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange::u16::acqrel_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r3, r1
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange::u16::acquire_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r3, r1
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange::u16::relaxed_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r3, r1
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange::u16::release_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r3, r1
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange::u16::seqcst_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r3, r1
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange::u16::seqcst_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r3, r1
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange::u16::acquire_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r3, r1
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange::u16::acquire_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r3, r1
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange::u16::relaxed_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r3, r1
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange::u16::relaxed_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r3, r1
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange::u16::release_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r3, r1
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange::u16::release_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r3, r1
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange::u32::acqrel_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r3, r1
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange::u32::seqcst_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r3, r1
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange::u32::acqrel_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r3, r1
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange::u32::acqrel_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r3, r1
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange::u32::acquire_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r3, r1
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange::u32::relaxed_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r3, r1
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange::u32::release_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r3, r1
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange::u32::seqcst_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r3, r1
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange::u32::seqcst_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r3, r1
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange::u32::acquire_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r3, r1
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange::u32::acquire_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r3, r1
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange::u32::relaxed_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r3, r1
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange::u32::relaxed_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r3, r1
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange::u32::release_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r3, r1
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange::u32::release_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r3, r1
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange::bool::acqrel_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}
0:
        strb              r2, [r0]
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::bool::seqcst_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}
0:
        strb              r2, [r0]
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::bool::acqrel_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}
0:
        strb              r2, [r0]
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::bool::acqrel_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}
0:
        strb              r2, [r0]
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::bool::acquire_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}
0:
        strb              r2, [r0]
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::bool::relaxed_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}
0:
        strb              r2, [r0]
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::bool::release_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}
0:
        strb              r2, [r0]
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::bool::seqcst_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}
0:
        strb              r2, [r0]
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::bool::seqcst_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}
0:
        strb              r2, [r0]
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::bool::acquire_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}
0:
        strb              r2, [r0]
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::bool::acquire_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}
0:
        strb              r2, [r0]
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::bool::relaxed_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}
0:
        strb              r2, [r0]
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::bool::relaxed_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}
0:
        strb              r2, [r0]
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::bool::release_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}
0:
        strb              r2, [r0]
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::bool::release_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}
0:
        strb              r2, [r0]
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange::bool::acqrel_seqcst_true_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::seqcst_seqcst_true_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::acqrel_acquire_true_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::acqrel_relaxed_true_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::acqrel_seqcst_false_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, #0x0
        beq               0f
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr
0:
        movs              r3, #0x1
        strb              r3, [r0]
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::acqrel_seqcst_true_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, #0x1
        beq               0f
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr
0:
        movs              r3, #0x0
        strb              r3, [r0]
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::acquire_seqcst_true_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::relaxed_seqcst_true_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::release_seqcst_true_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::seqcst_acquire_true_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::seqcst_relaxed_true_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::seqcst_seqcst_false_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, #0x0
        beq               0f
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr
0:
        movs              r3, #0x1
        strb              r3, [r0]
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::seqcst_seqcst_true_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, #0x1
        beq               0f
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr
0:
        movs              r3, #0x0
        strb              r3, [r0]
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::acqrel_acquire_false_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, #0x0
        beq               0f
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr
0:
        movs              r3, #0x1
        strb              r3, [r0]
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::acqrel_acquire_true_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, #0x1
        beq               0f
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr
0:
        movs              r3, #0x0
        strb              r3, [r0]
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::acqrel_relaxed_false_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, #0x0
        beq               0f
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr
0:
        movs              r3, #0x1
        strb              r3, [r0]
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::acqrel_relaxed_true_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, #0x1
        beq               0f
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr
0:
        movs              r3, #0x0
        strb              r3, [r0]
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::acqrel_seqcst_false_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::acquire_acquire_true_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::acquire_relaxed_true_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::acquire_seqcst_false_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, #0x0
        beq               0f
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr
0:
        movs              r3, #0x1
        strb              r3, [r0]
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::acquire_seqcst_true_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, #0x1
        beq               0f
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr
0:
        movs              r3, #0x0
        strb              r3, [r0]
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::relaxed_acquire_true_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::relaxed_relaxed_true_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::relaxed_seqcst_false_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, #0x0
        beq               0f
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr
0:
        movs              r3, #0x1
        strb              r3, [r0]
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::relaxed_seqcst_true_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, #0x1
        beq               0f
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr
0:
        movs              r3, #0x0
        strb              r3, [r0]
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::release_acquire_true_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::release_relaxed_true_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::release_seqcst_false_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, #0x0
        beq               0f
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr
0:
        movs              r3, #0x1
        strb              r3, [r0]
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::release_seqcst_true_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, #0x1
        beq               0f
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr
0:
        movs              r3, #0x0
        strb              r3, [r0]
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::seqcst_acquire_false_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, #0x0
        beq               0f
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr
0:
        movs              r3, #0x1
        strb              r3, [r0]
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::seqcst_acquire_true_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, #0x1
        beq               0f
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr
0:
        movs              r3, #0x0
        strb              r3, [r0]
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::seqcst_relaxed_false_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, #0x0
        beq               0f
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr
0:
        movs              r3, #0x1
        strb              r3, [r0]
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::seqcst_relaxed_true_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, #0x1
        beq               0f
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr
0:
        movs              r3, #0x0
        strb              r3, [r0]
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::seqcst_seqcst_false_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::acqrel_acquire_false_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::acqrel_relaxed_false_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::acquire_acquire_false_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, #0x0
        beq               0f
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr
0:
        movs              r3, #0x1
        strb              r3, [r0]
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::acquire_acquire_true_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, #0x1
        beq               0f
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr
0:
        movs              r3, #0x0
        strb              r3, [r0]
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::acquire_relaxed_false_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, #0x0
        beq               0f
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr
0:
        movs              r3, #0x1
        strb              r3, [r0]
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::acquire_relaxed_true_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, #0x1
        beq               0f
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr
0:
        movs              r3, #0x0
        strb              r3, [r0]
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::acquire_seqcst_false_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::relaxed_acquire_false_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, #0x0
        beq               0f
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr
0:
        movs              r3, #0x1
        strb              r3, [r0]
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::relaxed_acquire_true_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, #0x1
        beq               0f
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr
0:
        movs              r3, #0x0
        strb              r3, [r0]
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::relaxed_relaxed_false_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, #0x0
        beq               0f
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr
0:
        movs              r3, #0x1
        strb              r3, [r0]
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::relaxed_relaxed_true_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, #0x1
        beq               0f
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr
0:
        movs              r3, #0x0
        strb              r3, [r0]
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::relaxed_seqcst_false_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::release_acquire_false_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, #0x0
        beq               0f
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr
0:
        movs              r3, #0x1
        strb              r3, [r0]
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::release_acquire_true_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, #0x1
        beq               0f
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr
0:
        movs              r3, #0x0
        strb              r3, [r0]
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::release_relaxed_false_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, #0x0
        beq               0f
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr
0:
        movs              r3, #0x1
        strb              r3, [r0]
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::release_relaxed_true_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, #0x1
        beq               0f
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr
0:
        movs              r3, #0x0
        strb              r3, [r0]
        msr               primask, r2
        subs              r0, r1, #0x1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::release_seqcst_false_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::seqcst_acquire_false_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::seqcst_relaxed_false_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::acquire_acquire_false_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::acquire_relaxed_false_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::relaxed_acquire_false_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::relaxed_relaxed_false_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::release_acquire_false_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange::bool::release_relaxed_false_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        msr               primask, r2
        subs              r2, r1, #0x1
        mov               r0, r1
        sbcs              r0, r2
        bx                lr

asm_test::compare_exchange_weak::u8::acqrel_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r3, r1
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r3, r1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::u8::seqcst_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r3, r1
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r3, r1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::u8::acqrel_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r3, r1
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r3, r1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::u8::acqrel_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r3, r1
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r3, r1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::u8::acquire_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r3, r1
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r3, r1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::u8::relaxed_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r3, r1
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r3, r1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::u8::release_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r3, r1
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r3, r1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::u8::seqcst_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r3, r1
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r3, r1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::u8::seqcst_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r3, r1
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r3, r1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::u8::acquire_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r3, r1
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r3, r1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::u8::acquire_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r3, r1
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r3, r1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::u8::relaxed_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r3, r1
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r3, r1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::u8::relaxed_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r3, r1
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r3, r1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::u8::release_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r3, r1
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r3, r1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::u8::release_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r3, r1
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r3, r1
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::f32::acqrel_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::f32::seqcst_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::f32::acqrel_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::f32::acqrel_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::f32::acquire_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::f32::relaxed_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::f32::release_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::f32::seqcst_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::f32::seqcst_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::f32::acquire_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::f32::acquire_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::f32::relaxed_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::f32::relaxed_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::f32::release_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::f32::release_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::u16::acqrel_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r3, r1
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange_weak::u16::seqcst_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r3, r1
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange_weak::u16::acqrel_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r3, r1
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange_weak::u16::acqrel_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r3, r1
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange_weak::u16::acquire_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r3, r1
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange_weak::u16::relaxed_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r3, r1
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange_weak::u16::release_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r3, r1
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange_weak::u16::seqcst_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r3, r1
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange_weak::u16::seqcst_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r3, r1
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange_weak::u16::acquire_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r3, r1
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange_weak::u16::acquire_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r3, r1
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange_weak::u16::relaxed_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r3, r1
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange_weak::u16::relaxed_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r3, r1
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange_weak::u16::release_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r3, r1
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange_weak::u16::release_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r3, r1
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange_weak::u32::acqrel_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r3, r1
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange_weak::u32::seqcst_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r3, r1
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange_weak::u32::acqrel_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r3, r1
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange_weak::u32::acqrel_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r3, r1
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange_weak::u32::acquire_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r3, r1
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange_weak::u32::relaxed_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r3, r1
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange_weak::u32::release_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r3, r1
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange_weak::u32::seqcst_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r3, r1
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange_weak::u32::seqcst_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r3, r1
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange_weak::u32::acquire_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r3, r1
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange_weak::u32::acquire_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r3, r1
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange_weak::u32::relaxed_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r3, r1
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange_weak::u32::relaxed_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r3, r1
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange_weak::u32::release_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r3, r1
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange_weak::u32::release_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r3, r1
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, pc}

asm_test::compare_exchange_weak::bool::acqrel_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}
0:
        strb              r2, [r0]
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::bool::seqcst_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}
0:
        strb              r2, [r0]
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::bool::acqrel_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}
0:
        strb              r2, [r0]
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::bool::acqrel_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}
0:
        strb              r2, [r0]
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::bool::acquire_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}
0:
        strb              r2, [r0]
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::bool::relaxed_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}
0:
        strb              r2, [r0]
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::bool::release_seqcst:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}
0:
        strb              r2, [r0]
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::bool::seqcst_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}
0:
        strb              r2, [r0]
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::bool::seqcst_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}
0:
        strb              r2, [r0]
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::bool::acquire_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}
0:
        strb              r2, [r0]
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::bool::acquire_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}
0:
        strb              r2, [r0]
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::bool::relaxed_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}
0:
        strb              r2, [r0]
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::bool::relaxed_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}
0:
        strb              r2, [r0]
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::bool::release_acquire:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}
0:
        strb              r2, [r0]
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::compare_exchange_weak::bool::release_relaxed:
        push              {r4, lr}
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        cmp               r1, r3
        beq               0f
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}
0:
        strb              r2, [r0]
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, pc}

asm_test::or::u8::acqrel_all:
        mrs               r1, primask
        cpsid             i
        movs              r2, #0xff
        strb              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::or::u8::seqcst_all:
        mrs               r1, primask
        cpsid             i
        movs              r2, #0xff
        strb              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::or::u8::acqrel_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::or::u8::acquire_all:
        mrs               r1, primask
        cpsid             i
        movs              r2, #0xff
        strb              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::or::u8::relaxed_all:
        mrs               r1, primask
        cpsid             i
        movs              r2, #0xff
        strb              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::or::u8::release_all:
        mrs               r1, primask
        cpsid             i
        movs              r2, #0xff
        strb              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::or::u8::seqcst_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::or::u8::acquire_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::or::u8::relaxed_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::or::u8::release_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::or::u8::acqrel:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        orrs              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::or::u8::seqcst:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        orrs              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::or::u8::acquire:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        orrs              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::or::u8::relaxed:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        orrs              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::or::u8::release:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        orrs              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::or::u16::acqrel_all:
        mrs               r1, primask
        cpsid             i
        ldr               r2, [pc, #0x8]          @ 0f
        strh              r2, [r0]
        msr               primask, r1
        bx                lr
0:
        .word             0x0000ffff

asm_test::or::u16::seqcst_all:
        mrs               r1, primask
        cpsid             i
        ldr               r2, [pc, #0x8]          @ 0f
        strh              r2, [r0]
        msr               primask, r1
        bx                lr
0:
        .word             0x0000ffff

asm_test::or::u16::acqrel_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::or::u16::acquire_all:
        mrs               r1, primask
        cpsid             i
        ldr               r2, [pc, #0x8]          @ 0f
        strh              r2, [r0]
        msr               primask, r1
        bx                lr
0:
        .word             0x0000ffff

asm_test::or::u16::relaxed_all:
        mrs               r1, primask
        cpsid             i
        ldr               r2, [pc, #0x8]          @ 0f
        strh              r2, [r0]
        msr               primask, r1
        bx                lr
0:
        .word             0x0000ffff

asm_test::or::u16::release_all:
        mrs               r1, primask
        cpsid             i
        ldr               r2, [pc, #0x8]          @ 0f
        strh              r2, [r0]
        msr               primask, r1
        bx                lr
0:
        .word             0x0000ffff

asm_test::or::u16::seqcst_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::or::u16::acquire_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::or::u16::relaxed_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::or::u16::release_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::or::u16::acqrel:
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        orrs              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::or::u16::seqcst:
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        orrs              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::or::u16::acquire:
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        orrs              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::or::u16::relaxed:
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        orrs              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::or::u16::release:
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        orrs              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::or::u32::acqrel_all:
        movs              r1, #0x0
        mvns              r1, r1
        mrs               r2, primask
        cpsid             i
        str               r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::or::u32::seqcst_all:
        movs              r1, #0x0
        mvns              r1, r1
        mrs               r2, primask
        cpsid             i
        str               r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::or::u32::acqrel_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::or::u32::acquire_all:
        movs              r1, #0x0
        mvns              r1, r1
        mrs               r2, primask
        cpsid             i
        str               r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::or::u32::relaxed_all:
        movs              r1, #0x0
        mvns              r1, r1
        mrs               r2, primask
        cpsid             i
        str               r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::or::u32::release_all:
        movs              r1, #0x0
        mvns              r1, r1
        mrs               r2, primask
        cpsid             i
        str               r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::or::u32::seqcst_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::or::u32::acquire_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::or::u32::relaxed_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::or::u32::release_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::or::u32::acqrel:
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        orrs              r3, r1
        str               r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::or::u32::seqcst:
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        orrs              r3, r1
        str               r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::or::u32::acquire:
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        orrs              r3, r1
        str               r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::or::u32::relaxed:
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        orrs              r3, r1
        str               r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::or::u32::release:
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        orrs              r3, r1
        str               r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::or::bool::acqrel_true:
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        movs              r3, #0x1
        orrs              r3, r2
        strb              r3, [r0]
        msr               primask, r1
        bx                lr

asm_test::or::bool::seqcst_true:
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        movs              r3, #0x1
        orrs              r3, r2
        strb              r3, [r0]
        msr               primask, r1
        bx                lr

asm_test::or::bool::acqrel_false:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::or::bool::acquire_true:
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        movs              r3, #0x1
        orrs              r3, r2
        strb              r3, [r0]
        msr               primask, r1
        bx                lr

asm_test::or::bool::relaxed_true:
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        movs              r3, #0x1
        orrs              r3, r2
        strb              r3, [r0]
        msr               primask, r1
        bx                lr

asm_test::or::bool::release_true:
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        movs              r3, #0x1
        orrs              r3, r2
        strb              r3, [r0]
        msr               primask, r1
        bx                lr

asm_test::or::bool::seqcst_false:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::or::bool::acquire_false:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::or::bool::relaxed_false:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::or::bool::release_false:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::or::bool::acqrel:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        orrs              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::or::bool::seqcst:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        orrs              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::or::bool::acquire:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        orrs              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::or::bool::relaxed:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        orrs              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::or::bool::release:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        orrs              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::add::u8::acqrel_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::add::u8::seqcst_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::add::u8::acquire_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::add::u8::relaxed_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::add::u8::release_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::add::u8::acqrel:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        adds              r1, r3, r1
        strb              r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::add::u8::seqcst:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        adds              r1, r3, r1
        strb              r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::add::u8::acquire:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        adds              r1, r3, r1
        strb              r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::add::u8::relaxed:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        adds              r1, r3, r1
        strb              r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::add::u8::release:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        adds              r1, r3, r1
        strb              r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::add::u16::acqrel_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::add::u16::seqcst_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::add::u16::acquire_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::add::u16::relaxed_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::add::u16::release_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::add::u16::acqrel:
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        adds              r1, r3, r1
        strh              r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::add::u16::seqcst:
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        adds              r1, r3, r1
        strh              r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::add::u16::acquire:
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        adds              r1, r3, r1
        strh              r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::add::u16::relaxed:
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        adds              r1, r3, r1
        strh              r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::add::u16::release:
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        adds              r1, r3, r1
        strh              r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::add::u32::acqrel_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::add::u32::seqcst_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::add::u32::acquire_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::add::u32::relaxed_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::add::u32::release_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::add::u32::acqrel:
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        adds              r1, r3, r1
        str               r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::add::u32::seqcst:
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        adds              r1, r3, r1
        str               r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::add::u32::acquire:
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        adds              r1, r3, r1
        str               r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::add::u32::relaxed:
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        adds              r1, r3, r1
        str               r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::add::u32::release:
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        adds              r1, r3, r1
        str               r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::and::u8::acqrel_all:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::and::u8::seqcst_all:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::and::u8::acqrel_zero:
        mrs               r1, primask
        cpsid             i
        movs              r2, #0x0
        strb              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::and::u8::acquire_all:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::and::u8::relaxed_all:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::and::u8::release_all:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::and::u8::seqcst_zero:
        mrs               r1, primask
        cpsid             i
        movs              r2, #0x0
        strb              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::and::u8::acquire_zero:
        mrs               r1, primask
        cpsid             i
        movs              r2, #0x0
        strb              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::and::u8::relaxed_zero:
        mrs               r1, primask
        cpsid             i
        movs              r2, #0x0
        strb              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::and::u8::release_zero:
        mrs               r1, primask
        cpsid             i
        movs              r2, #0x0
        strb              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::and::u8::acqrel:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        ands              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::and::u8::seqcst:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        ands              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::and::u8::acquire:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        ands              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::and::u8::relaxed:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        ands              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::and::u8::release:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        ands              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::and::u16::acqrel_all:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::and::u16::seqcst_all:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::and::u16::acqrel_zero:
        mrs               r1, primask
        cpsid             i
        movs              r2, #0x0
        strh              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::and::u16::acquire_all:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::and::u16::relaxed_all:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::and::u16::release_all:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::and::u16::seqcst_zero:
        mrs               r1, primask
        cpsid             i
        movs              r2, #0x0
        strh              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::and::u16::acquire_zero:
        mrs               r1, primask
        cpsid             i
        movs              r2, #0x0
        strh              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::and::u16::relaxed_zero:
        mrs               r1, primask
        cpsid             i
        movs              r2, #0x0
        strh              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::and::u16::release_zero:
        mrs               r1, primask
        cpsid             i
        movs              r2, #0x0
        strh              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::and::u16::acqrel:
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        ands              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::and::u16::seqcst:
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        ands              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::and::u16::acquire:
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        ands              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::and::u16::relaxed:
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        ands              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::and::u16::release:
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        ands              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::and::u32::acqrel_all:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::and::u32::seqcst_all:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::and::u32::acqrel_zero:
        mrs               r1, primask
        cpsid             i
        movs              r2, #0x0
        str               r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::and::u32::acquire_all:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::and::u32::relaxed_all:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::and::u32::release_all:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::and::u32::seqcst_zero:
        mrs               r1, primask
        cpsid             i
        movs              r2, #0x0
        str               r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::and::u32::acquire_zero:
        mrs               r1, primask
        cpsid             i
        movs              r2, #0x0
        str               r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::and::u32::relaxed_zero:
        mrs               r1, primask
        cpsid             i
        movs              r2, #0x0
        str               r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::and::u32::release_zero:
        mrs               r1, primask
        cpsid             i
        movs              r2, #0x0
        str               r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::and::u32::acqrel:
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        ands              r3, r1
        str               r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::and::u32::seqcst:
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        ands              r3, r1
        str               r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::and::u32::acquire:
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        ands              r3, r1
        str               r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::and::u32::relaxed:
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        ands              r3, r1
        str               r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::and::u32::release:
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        ands              r3, r1
        str               r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::and::bool::acqrel_true:
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        movs              r3, #0x1
        ands              r3, r2
        strb              r3, [r0]
        msr               primask, r1
        bx                lr

asm_test::and::bool::seqcst_true:
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        movs              r3, #0x1
        ands              r3, r2
        strb              r3, [r0]
        msr               primask, r1
        bx                lr

asm_test::and::bool::acqrel_false:
        mrs               r1, primask
        cpsid             i
        movs              r2, #0x0
        strb              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::and::bool::acquire_true:
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        movs              r3, #0x1
        ands              r3, r2
        strb              r3, [r0]
        msr               primask, r1
        bx                lr

asm_test::and::bool::relaxed_true:
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        movs              r3, #0x1
        ands              r3, r2
        strb              r3, [r0]
        msr               primask, r1
        bx                lr

asm_test::and::bool::release_true:
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        movs              r3, #0x1
        ands              r3, r2
        strb              r3, [r0]
        msr               primask, r1
        bx                lr

asm_test::and::bool::seqcst_false:
        mrs               r1, primask
        cpsid             i
        movs              r2, #0x0
        strb              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::and::bool::acquire_false:
        mrs               r1, primask
        cpsid             i
        movs              r2, #0x0
        strb              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::and::bool::relaxed_false:
        mrs               r1, primask
        cpsid             i
        movs              r2, #0x0
        strb              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::and::bool::release_false:
        mrs               r1, primask
        cpsid             i
        movs              r2, #0x0
        strb              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::and::bool::acqrel:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        ands              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::and::bool::seqcst:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        ands              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::and::bool::acquire:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        ands              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::and::bool::relaxed:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        ands              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::and::bool::release:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        ands              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::neg::u8::acqrel:
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        rsbs              r2, r2, #0
        strb              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::neg::u8::seqcst:
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        rsbs              r2, r2, #0
        strb              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::neg::u8::acquire:
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        rsbs              r2, r2, #0
        strb              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::neg::u8::relaxed:
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        rsbs              r2, r2, #0
        strb              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::neg::u8::release:
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        rsbs              r2, r2, #0
        strb              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::neg::u16::acqrel:
        mrs               r1, primask
        cpsid             i
        ldrh              r2, [r0]
        rsbs              r2, r2, #0
        strh              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::neg::u16::seqcst:
        mrs               r1, primask
        cpsid             i
        ldrh              r2, [r0]
        rsbs              r2, r2, #0
        strh              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::neg::u16::acquire:
        mrs               r1, primask
        cpsid             i
        ldrh              r2, [r0]
        rsbs              r2, r2, #0
        strh              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::neg::u16::relaxed:
        mrs               r1, primask
        cpsid             i
        ldrh              r2, [r0]
        rsbs              r2, r2, #0
        strh              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::neg::u16::release:
        mrs               r1, primask
        cpsid             i
        ldrh              r2, [r0]
        rsbs              r2, r2, #0
        strh              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::neg::u32::acqrel:
        mrs               r1, primask
        cpsid             i
        ldr               r2, [r0]
        rsbs              r2, r2, #0
        str               r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::neg::u32::seqcst:
        mrs               r1, primask
        cpsid             i
        ldr               r2, [r0]
        rsbs              r2, r2, #0
        str               r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::neg::u32::acquire:
        mrs               r1, primask
        cpsid             i
        ldr               r2, [r0]
        rsbs              r2, r2, #0
        str               r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::neg::u32::relaxed:
        mrs               r1, primask
        cpsid             i
        ldr               r2, [r0]
        rsbs              r2, r2, #0
        str               r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::neg::u32::release:
        mrs               r1, primask
        cpsid             i
        ldr               r2, [r0]
        rsbs              r2, r2, #0
        str               r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::not::u8::acqrel:
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        mvns              r2, r2
        strb              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::not::u8::seqcst:
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        mvns              r2, r2
        strb              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::not::u8::acquire:
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        mvns              r2, r2
        strb              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::not::u8::relaxed:
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        mvns              r2, r2
        strb              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::not::u8::release:
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        mvns              r2, r2
        strb              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::not::u16::acqrel:
        mrs               r1, primask
        cpsid             i
        ldrh              r2, [r0]
        mvns              r2, r2
        strh              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::not::u16::seqcst:
        mrs               r1, primask
        cpsid             i
        ldrh              r2, [r0]
        mvns              r2, r2
        strh              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::not::u16::acquire:
        mrs               r1, primask
        cpsid             i
        ldrh              r2, [r0]
        mvns              r2, r2
        strh              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::not::u16::relaxed:
        mrs               r1, primask
        cpsid             i
        ldrh              r2, [r0]
        mvns              r2, r2
        strh              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::not::u16::release:
        mrs               r1, primask
        cpsid             i
        ldrh              r2, [r0]
        mvns              r2, r2
        strh              r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::not::u32::acqrel:
        mrs               r1, primask
        cpsid             i
        ldr               r2, [r0]
        mvns              r2, r2
        str               r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::not::u32::seqcst:
        mrs               r1, primask
        cpsid             i
        ldr               r2, [r0]
        mvns              r2, r2
        str               r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::not::u32::acquire:
        mrs               r1, primask
        cpsid             i
        ldr               r2, [r0]
        mvns              r2, r2
        str               r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::not::u32::relaxed:
        mrs               r1, primask
        cpsid             i
        ldr               r2, [r0]
        mvns              r2, r2
        str               r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::not::u32::release:
        mrs               r1, primask
        cpsid             i
        ldr               r2, [r0]
        mvns              r2, r2
        str               r2, [r0]
        msr               primask, r1
        bx                lr

asm_test::not::bool::acqrel:
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        movs              r3, #0x1
        eors              r3, r2
        strb              r3, [r0]
        msr               primask, r1
        bx                lr

asm_test::not::bool::seqcst:
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        movs              r3, #0x1
        eors              r3, r2
        strb              r3, [r0]
        msr               primask, r1
        bx                lr

asm_test::not::bool::acquire:
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        movs              r3, #0x1
        eors              r3, r2
        strb              r3, [r0]
        msr               primask, r1
        bx                lr

asm_test::not::bool::relaxed:
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        movs              r3, #0x1
        eors              r3, r2
        strb              r3, [r0]
        msr               primask, r1
        bx                lr

asm_test::not::bool::release:
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        movs              r3, #0x1
        eors              r3, r2
        strb              r3, [r0]
        msr               primask, r1
        bx                lr

asm_test::sub::u8::acqrel_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::sub::u8::seqcst_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::sub::u8::acquire_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::sub::u8::relaxed_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::sub::u8::release_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::sub::u8::acqrel:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        subs              r1, r3, r1
        strb              r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::sub::u8::seqcst:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        subs              r1, r3, r1
        strb              r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::sub::u8::acquire:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        subs              r1, r3, r1
        strb              r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::sub::u8::relaxed:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        subs              r1, r3, r1
        strb              r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::sub::u8::release:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        subs              r1, r3, r1
        strb              r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::sub::u16::acqrel_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::sub::u16::seqcst_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::sub::u16::acquire_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::sub::u16::relaxed_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::sub::u16::release_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::sub::u16::acqrel:
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        subs              r1, r3, r1
        strh              r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::sub::u16::seqcst:
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        subs              r1, r3, r1
        strh              r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::sub::u16::acquire:
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        subs              r1, r3, r1
        strh              r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::sub::u16::relaxed:
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        subs              r1, r3, r1
        strh              r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::sub::u16::release:
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        subs              r1, r3, r1
        strh              r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::sub::u32::acqrel_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::sub::u32::seqcst_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::sub::u32::acquire_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::sub::u32::relaxed_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::sub::u32::release_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::sub::u32::acqrel:
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        subs              r1, r3, r1
        str               r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::sub::u32::seqcst:
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        subs              r1, r3, r1
        str               r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::sub::u32::acquire:
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        subs              r1, r3, r1
        str               r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::sub::u32::relaxed:
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        subs              r1, r3, r1
        str               r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::sub::u32::release:
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        subs              r1, r3, r1
        str               r1, [r0]
        msr               primask, r2
        bx                lr

asm_test::xor::u8::acqrel_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::xor::u8::seqcst_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::xor::u8::acquire_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::xor::u8::relaxed_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::xor::u8::release_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::xor::u8::acqrel:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        eors              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::xor::u8::seqcst:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        eors              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::xor::u8::acquire:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        eors              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::xor::u8::relaxed:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        eors              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::xor::u8::release:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        eors              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::xor::u16::acqrel_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::xor::u16::seqcst_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::xor::u16::acquire_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::xor::u16::relaxed_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::xor::u16::release_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::xor::u16::acqrel:
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        eors              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::xor::u16::seqcst:
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        eors              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::xor::u16::acquire:
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        eors              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::xor::u16::relaxed:
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        eors              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::xor::u16::release:
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        eors              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::xor::u32::acqrel_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::xor::u32::seqcst_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::xor::u32::acquire_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::xor::u32::relaxed_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::xor::u32::release_zero:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::xor::u32::acqrel:
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        eors              r3, r1
        str               r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::xor::u32::seqcst:
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        eors              r3, r1
        str               r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::xor::u32::acquire:
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        eors              r3, r1
        str               r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::xor::u32::relaxed:
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        eors              r3, r1
        str               r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::xor::u32::release:
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        eors              r3, r1
        str               r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::xor::bool::acqrel_true:
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        movs              r3, #0x1
        eors              r3, r2
        strb              r3, [r0]
        msr               primask, r1
        bx                lr

asm_test::xor::bool::seqcst_true:
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        movs              r3, #0x1
        eors              r3, r2
        strb              r3, [r0]
        msr               primask, r1
        bx                lr

asm_test::xor::bool::acqrel_false:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::xor::bool::acquire_true:
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        movs              r3, #0x1
        eors              r3, r2
        strb              r3, [r0]
        msr               primask, r1
        bx                lr

asm_test::xor::bool::relaxed_true:
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        movs              r3, #0x1
        eors              r3, r2
        strb              r3, [r0]
        msr               primask, r1
        bx                lr

asm_test::xor::bool::release_true:
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        movs              r3, #0x1
        eors              r3, r2
        strb              r3, [r0]
        msr               primask, r1
        bx                lr

asm_test::xor::bool::seqcst_false:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::xor::bool::acquire_false:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::xor::bool::relaxed_false:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::xor::bool::release_false:
        mrs               r0, primask
        cpsid             i
        msr               primask, r0
        bx                lr

asm_test::xor::bool::acqrel:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        eors              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::xor::bool::seqcst:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        eors              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::xor::bool::acquire:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        eors              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::xor::bool::relaxed:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        eors              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        bx                lr

asm_test::xor::bool::release:
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        eors              r3, r1
        strb              r3, [r0]
        msr               primask, r2
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

asm_test::load::f32::seqcst:
        ldr               r0, [r0]
        dmb               sy
        bx                lr

asm_test::load::f32::acquire:
        ldr               r0, [r0]
        dmb               sy
        bx                lr

asm_test::load::f32::relaxed:
        ldr               r0, [r0]
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

asm_test::load::bool::seqcst:
        ldrb              r0, [r0]
        dmb               sy
        bx                lr

asm_test::load::bool::acquire:
        ldrb              r0, [r0]
        dmb               sy
        bx                lr

asm_test::load::bool::relaxed:
        ldrb              r0, [r0]
        bx                lr

asm_test::swap::u8::acqrel:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::swap::u8::seqcst:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::swap::u8::acquire:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::swap::u8::relaxed:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::swap::u8::release:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::swap::f32::acqrel:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::swap::f32::seqcst:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::swap::f32::acquire:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::swap::f32::relaxed:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::swap::f32::release:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::swap::u16::acqrel:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::swap::u16::seqcst:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::swap::u16::acquire:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::swap::u16::relaxed:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::swap::u16::release:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::swap::u32::acqrel:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::swap::u32::seqcst:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::swap::u32::acquire:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::swap::u32::relaxed:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::swap::u32::release:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::swap::bool::acqrel_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::swap::bool::seqcst_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::swap::bool::acqrel_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x0
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::swap::bool::acquire_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::swap::bool::relaxed_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::swap::bool::release_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::swap::bool::seqcst_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x0
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::swap::bool::acquire_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x0
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::swap::bool::relaxed_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x0
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::swap::bool::release_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x0
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::swap::bool::acqrel:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::swap::bool::seqcst:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::swap::bool::acquire:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::swap::bool::relaxed:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::swap::bool::release:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
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

asm_test::store::f32::seqcst:
        dmb               sy
        str               r1, [r0]
        dmb               sy
        bx                lr

asm_test::store::f32::relaxed:
        str               r1, [r0]
        bx                lr

asm_test::store::f32::release:
        dmb               sy
        str               r1, [r0]
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

asm_test::store::bool::seqcst:
        dmb               sy
        strb              r1, [r0]
        dmb               sy
        bx                lr

asm_test::store::bool::relaxed:
        strb              r1, [r0]
        bx                lr

asm_test::store::bool::release:
        dmb               sy
        strb              r1, [r0]
        bx                lr

asm_test::bit_set::u8::acqrel:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0x7
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldrb              r3, [r2]
        mov               r4, r3
        orrs              r4, r0
        strb              r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_set::u8::seqcst:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0x7
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldrb              r3, [r2]
        mov               r4, r3
        orrs              r4, r0
        strb              r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_set::u8::acquire:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0x7
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldrb              r3, [r2]
        mov               r4, r3
        orrs              r4, r0
        strb              r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_set::u8::relaxed:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0x7
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldrb              r3, [r2]
        mov               r4, r3
        orrs              r4, r0
        strb              r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_set::u8::release:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0x7
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldrb              r3, [r2]
        mov               r4, r3
        orrs              r4, r0
        strb              r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_set::u16::acqrel:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0xf
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldrh              r3, [r2]
        mov               r4, r3
        orrs              r4, r0
        strh              r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_set::u16::seqcst:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0xf
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldrh              r3, [r2]
        mov               r4, r3
        orrs              r4, r0
        strh              r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_set::u16::acquire:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0xf
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldrh              r3, [r2]
        mov               r4, r3
        orrs              r4, r0
        strh              r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_set::u16::relaxed:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0xf
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldrh              r3, [r2]
        mov               r4, r3
        orrs              r4, r0
        strh              r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_set::u16::release:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0xf
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldrh              r3, [r2]
        mov               r4, r3
        orrs              r4, r0
        strh              r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_set::u32::acqrel:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0x1f
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldr               r3, [r2]
        mov               r4, r3
        orrs              r4, r0
        str               r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_set::u32::seqcst:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0x1f
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldr               r3, [r2]
        mov               r4, r3
        orrs              r4, r0
        str               r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_set::u32::acquire:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0x1f
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldr               r3, [r2]
        mov               r4, r3
        orrs              r4, r0
        str               r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_set::u32::relaxed:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0x1f
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldr               r3, [r2]
        mov               r4, r3
        orrs              r4, r0
        str               r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_set::u32::release:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0x1f
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldr               r3, [r2]
        mov               r4, r3
        orrs              r4, r0
        str               r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::fetch_or::u8::acqrel_all:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0xff
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_or::u8::seqcst_all:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0xff
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_or::u8::acqrel_zero:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_or::u8::acquire_all:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0xff
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_or::u8::relaxed_all:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0xff
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_or::u8::release_all:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0xff
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_or::u8::seqcst_zero:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_or::u8::acquire_zero:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_or::u8::relaxed_zero:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_or::u8::release_zero:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_or::u8::acqrel:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        orrs              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_or::u8::seqcst:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        orrs              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_or::u8::acquire:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        orrs              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_or::u8::relaxed:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        orrs              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_or::u8::release:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        orrs              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_or::u16::acqrel_all:
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        ldr               r3, [pc, #0x8]          @ 0f
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr
0:
        .word             0x0000ffff

asm_test::fetch_or::u16::seqcst_all:
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        ldr               r3, [pc, #0x8]          @ 0f
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr
0:
        .word             0x0000ffff

asm_test::fetch_or::u16::acqrel_zero:
        mrs               r1, primask
        cpsid             i
        ldrh              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_or::u16::acquire_all:
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        ldr               r3, [pc, #0x8]          @ 0f
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr
0:
        .word             0x0000ffff

asm_test::fetch_or::u16::relaxed_all:
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        ldr               r3, [pc, #0x8]          @ 0f
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr
0:
        .word             0x0000ffff

asm_test::fetch_or::u16::release_all:
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        ldr               r3, [pc, #0x8]          @ 0f
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr
0:
        .word             0x0000ffff

asm_test::fetch_or::u16::seqcst_zero:
        mrs               r1, primask
        cpsid             i
        ldrh              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_or::u16::acquire_zero:
        mrs               r1, primask
        cpsid             i
        ldrh              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_or::u16::relaxed_zero:
        mrs               r1, primask
        cpsid             i
        ldrh              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_or::u16::release_zero:
        mrs               r1, primask
        cpsid             i
        ldrh              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_or::u16::acqrel:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        orrs              r1, r2
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_or::u16::seqcst:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        orrs              r1, r2
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_or::u16::acquire:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        orrs              r1, r2
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_or::u16::relaxed:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        orrs              r1, r2
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_or::u16::release:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        orrs              r1, r2
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_or::u32::acqrel_all:
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        movs              r3, #0x0
        mvns              r3, r3
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_or::u32::seqcst_all:
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        movs              r3, #0x0
        mvns              r3, r3
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_or::u32::acqrel_zero:
        mrs               r1, primask
        cpsid             i
        ldr               r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_or::u32::acquire_all:
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        movs              r3, #0x0
        mvns              r3, r3
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_or::u32::relaxed_all:
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        movs              r3, #0x0
        mvns              r3, r3
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_or::u32::release_all:
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        movs              r3, #0x0
        mvns              r3, r3
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_or::u32::seqcst_zero:
        mrs               r1, primask
        cpsid             i
        ldr               r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_or::u32::acquire_zero:
        mrs               r1, primask
        cpsid             i
        ldr               r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_or::u32::relaxed_zero:
        mrs               r1, primask
        cpsid             i
        ldr               r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_or::u32::release_zero:
        mrs               r1, primask
        cpsid             i
        ldr               r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_or::u32::acqrel:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        orrs              r1, r2
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_or::u32::seqcst:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        orrs              r1, r2
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_or::u32::acquire:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        orrs              r1, r2
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_or::u32::relaxed:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        orrs              r1, r2
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_or::u32::release:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        orrs              r1, r2
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_or::bool::acqrel_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        orrs              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_or::bool::seqcst_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        orrs              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_or::bool::acqrel_false:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_or::bool::acquire_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        orrs              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_or::bool::relaxed_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        orrs              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_or::bool::release_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        orrs              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_or::bool::seqcst_false:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_or::bool::acquire_false:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_or::bool::relaxed_false:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_or::bool::release_false:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_or::bool::acqrel:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        orrs              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_or::bool::seqcst:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        orrs              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_or::bool::acquire:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        orrs              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_or::bool::relaxed:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        orrs              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_or::bool::release:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        orrs              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::bit_clear::u8::acqrel:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0x7
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldrb              r3, [r2]
        mov               r4, r3
        bics              r4, r0
        strb              r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_clear::u8::seqcst:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0x7
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldrb              r3, [r2]
        mov               r4, r3
        bics              r4, r0
        strb              r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_clear::u8::acquire:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0x7
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldrb              r3, [r2]
        mov               r4, r3
        bics              r4, r0
        strb              r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_clear::u8::relaxed:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0x7
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldrb              r3, [r2]
        mov               r4, r3
        bics              r4, r0
        strb              r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_clear::u8::release:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0x7
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldrb              r3, [r2]
        mov               r4, r3
        bics              r4, r0
        strb              r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_clear::u16::acqrel:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0xf
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldrh              r3, [r2]
        mov               r4, r3
        bics              r4, r0
        strh              r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_clear::u16::seqcst:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0xf
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldrh              r3, [r2]
        mov               r4, r3
        bics              r4, r0
        strh              r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_clear::u16::acquire:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0xf
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldrh              r3, [r2]
        mov               r4, r3
        bics              r4, r0
        strh              r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_clear::u16::relaxed:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0xf
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldrh              r3, [r2]
        mov               r4, r3
        bics              r4, r0
        strh              r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_clear::u16::release:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0xf
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldrh              r3, [r2]
        mov               r4, r3
        bics              r4, r0
        strh              r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_clear::u32::acqrel:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0x1f
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldr               r3, [r2]
        mov               r4, r3
        bics              r4, r0
        str               r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_clear::u32::seqcst:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0x1f
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldr               r3, [r2]
        mov               r4, r3
        bics              r4, r0
        str               r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_clear::u32::acquire:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0x1f
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldr               r3, [r2]
        mov               r4, r3
        bics              r4, r0
        str               r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_clear::u32::relaxed:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0x1f
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldr               r3, [r2]
        mov               r4, r3
        bics              r4, r0
        str               r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::bit_clear::u32::release:
        push              {r4, lr}
        mov               r2, r0
        movs              r3, #0x1f
        ands              r3, r1
        movs              r0, #0x1
        lsls              r0, r3
        mrs               r1, primask
        cpsid             i
        ldr               r3, [r2]
        mov               r4, r3
        bics              r4, r0
        str               r4, [r2]
        msr               primask, r1
        ands              r0, r3
        subs              r1, r0, #0x1
        sbcs              r0, r1
        pop               {r4, pc}

asm_test::fetch_abs::f32::acqrel:
        push              {r4, lr}
        movs              r1, #0x1
        lsls              r2, r1, #0x1f
        mrs               r3, primask
        cpsid             i
        ldr               r1, [r0]
        mov               r4, r1
        bics              r4, r2
        str               r4, [r0]
        msr               primask, r3
        mov               r0, r1
        pop               {r4, pc}

asm_test::fetch_abs::f32::seqcst:
        push              {r4, lr}
        movs              r1, #0x1
        lsls              r2, r1, #0x1f
        mrs               r3, primask
        cpsid             i
        ldr               r1, [r0]
        mov               r4, r1
        bics              r4, r2
        str               r4, [r0]
        msr               primask, r3
        mov               r0, r1
        pop               {r4, pc}

asm_test::fetch_abs::f32::acquire:
        push              {r4, lr}
        movs              r1, #0x1
        lsls              r2, r1, #0x1f
        mrs               r3, primask
        cpsid             i
        ldr               r1, [r0]
        mov               r4, r1
        bics              r4, r2
        str               r4, [r0]
        msr               primask, r3
        mov               r0, r1
        pop               {r4, pc}

asm_test::fetch_abs::f32::relaxed:
        push              {r4, lr}
        movs              r1, #0x1
        lsls              r2, r1, #0x1f
        mrs               r3, primask
        cpsid             i
        ldr               r1, [r0]
        mov               r4, r1
        bics              r4, r2
        str               r4, [r0]
        msr               primask, r3
        mov               r0, r1
        pop               {r4, pc}

asm_test::fetch_abs::f32::release:
        push              {r4, lr}
        movs              r1, #0x1
        lsls              r2, r1, #0x1f
        mrs               r3, primask
        cpsid             i
        ldr               r1, [r0]
        mov               r4, r1
        bics              r4, r2
        str               r4, [r0]
        msr               primask, r3
        mov               r0, r1
        pop               {r4, pc}

asm_test::fetch_add::u8::acqrel_zero:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_add::u8::seqcst_zero:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_add::u8::acquire_zero:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_add::u8::relaxed_zero:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_add::u8::release_zero:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_add::u8::acqrel:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        adds              r1, r2, r1
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_add::u8::seqcst:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        adds              r1, r2, r1
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_add::u8::acquire:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        adds              r1, r2, r1
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_add::u8::relaxed:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        adds              r1, r2, r1
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_add::u8::release:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        adds              r1, r2, r1
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_add::f32::acqrel_zero:
        push              {r4, r5, r6, r7, lr}
        add               r7, sp, #0xc
        sub               sp, #0x4
        mov               r4, r0
        ldr               r5, [r0]
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               primask, r6
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        movs              r1, #0x0
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        msr               primask, r6
        mov               r0, r5
        add               sp, #0x4
        pop               {r4, r5, r6, r7, pc}

asm_test::fetch_add::f32::seqcst_zero:
        push              {r4, r5, r6, r7, lr}
        add               r7, sp, #0xc
        sub               sp, #0x4
        mov               r4, r0
        ldr               r5, [r0]
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               primask, r6
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        movs              r1, #0x0
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        msr               primask, r6
        mov               r0, r5
        add               sp, #0x4
        pop               {r4, r5, r6, r7, pc}

asm_test::fetch_add::f32::acquire_zero:
        push              {r4, r5, r6, r7, lr}
        add               r7, sp, #0xc
        sub               sp, #0x4
        mov               r4, r0
        ldr               r5, [r0]
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               primask, r6
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        movs              r1, #0x0
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        msr               primask, r6
        mov               r0, r5
        add               sp, #0x4
        pop               {r4, r5, r6, r7, pc}

asm_test::fetch_add::f32::relaxed_zero:
        push              {r4, r5, r6, r7, lr}
        add               r7, sp, #0xc
        sub               sp, #0x4
        mov               r4, r0
        ldr               r5, [r0]
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               primask, r6
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        movs              r1, #0x0
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        msr               primask, r6
        mov               r0, r5
        add               sp, #0x4
        pop               {r4, r5, r6, r7, pc}

asm_test::fetch_add::f32::release_zero:
        push              {r4, r5, r6, r7, lr}
        add               r7, sp, #0xc
        sub               sp, #0x4
        mov               r4, r0
        ldr               r5, [r0]
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               primask, r6
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        movs              r1, #0x0
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        msr               primask, r6
        mov               r0, r5
        add               sp, #0x4
        pop               {r4, r5, r6, r7, pc}

asm_test::fetch_add::f32::acqrel:
        push              {r4, r5, r6, r7, lr}
        add               r7, sp, #0xc
        sub               sp, #0x4
        mov               r4, r0
        ldr               r5, [r0]
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               primask, r6
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r1
        mov               r1, r5
2:
        bl                2f
        str               r0, [r4]
        msr               primask, r6
        mov               r0, r5
        add               sp, #0x4
        pop               {r4, r5, r6, r7, pc}

asm_test::fetch_add::f32::seqcst:
        push              {r4, r5, r6, r7, lr}
        add               r7, sp, #0xc
        sub               sp, #0x4
        mov               r4, r0
        ldr               r5, [r0]
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               primask, r6
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r1
        mov               r1, r5
2:
        bl                2f
        str               r0, [r4]
        msr               primask, r6
        mov               r0, r5
        add               sp, #0x4
        pop               {r4, r5, r6, r7, pc}

asm_test::fetch_add::f32::acquire:
        push              {r4, r5, r6, r7, lr}
        add               r7, sp, #0xc
        sub               sp, #0x4
        mov               r4, r0
        ldr               r5, [r0]
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               primask, r6
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r1
        mov               r1, r5
2:
        bl                2f
        str               r0, [r4]
        msr               primask, r6
        mov               r0, r5
        add               sp, #0x4
        pop               {r4, r5, r6, r7, pc}

asm_test::fetch_add::f32::relaxed:
        push              {r4, r5, r6, r7, lr}
        add               r7, sp, #0xc
        sub               sp, #0x4
        mov               r4, r0
        ldr               r5, [r0]
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               primask, r6
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r1
        mov               r1, r5
2:
        bl                2f
        str               r0, [r4]
        msr               primask, r6
        mov               r0, r5
        add               sp, #0x4
        pop               {r4, r5, r6, r7, pc}

asm_test::fetch_add::f32::release:
        push              {r4, r5, r6, r7, lr}
        add               r7, sp, #0xc
        sub               sp, #0x4
        mov               r4, r0
        ldr               r5, [r0]
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               primask, r6
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r1
        mov               r1, r5
2:
        bl                2f
        str               r0, [r4]
        msr               primask, r6
        mov               r0, r5
        add               sp, #0x4
        pop               {r4, r5, r6, r7, pc}

asm_test::fetch_add::u16::acqrel_zero:
        mrs               r1, primask
        cpsid             i
        ldrh              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_add::u16::seqcst_zero:
        mrs               r1, primask
        cpsid             i
        ldrh              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_add::u16::acquire_zero:
        mrs               r1, primask
        cpsid             i
        ldrh              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_add::u16::relaxed_zero:
        mrs               r1, primask
        cpsid             i
        ldrh              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_add::u16::release_zero:
        mrs               r1, primask
        cpsid             i
        ldrh              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_add::u16::acqrel:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        adds              r1, r2, r1
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_add::u16::seqcst:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        adds              r1, r2, r1
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_add::u16::acquire:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        adds              r1, r2, r1
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_add::u16::relaxed:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        adds              r1, r2, r1
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_add::u16::release:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        adds              r1, r2, r1
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_add::u32::acqrel_zero:
        mrs               r1, primask
        cpsid             i
        ldr               r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_add::u32::seqcst_zero:
        mrs               r1, primask
        cpsid             i
        ldr               r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_add::u32::acquire_zero:
        mrs               r1, primask
        cpsid             i
        ldr               r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_add::u32::relaxed_zero:
        mrs               r1, primask
        cpsid             i
        ldr               r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_add::u32::release_zero:
        mrs               r1, primask
        cpsid             i
        ldr               r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_add::u32::acqrel:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        adds              r1, r2, r1
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_add::u32::seqcst:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        adds              r1, r2, r1
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_add::u32::acquire:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        adds              r1, r2, r1
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_add::u32::relaxed:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        adds              r1, r2, r1
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_add::u32::release:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        adds              r1, r2, r1
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_and::u8::acqrel_all:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_and::u8::seqcst_all:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_and::u8::acqrel_zero:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x0
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::u8::acquire_all:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_and::u8::relaxed_all:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_and::u8::release_all:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_and::u8::seqcst_zero:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x0
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::u8::acquire_zero:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x0
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::u8::relaxed_zero:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x0
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::u8::release_zero:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x0
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::u8::acqrel:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        ands              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_and::u8::seqcst:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        ands              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_and::u8::acquire:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        ands              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_and::u8::relaxed:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        ands              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_and::u8::release:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        ands              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_and::u16::acqrel_all:
        mrs               r1, primask
        cpsid             i
        ldrh              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_and::u16::seqcst_all:
        mrs               r1, primask
        cpsid             i
        ldrh              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_and::u16::acqrel_zero:
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        movs              r3, #0x0
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::u16::acquire_all:
        mrs               r1, primask
        cpsid             i
        ldrh              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_and::u16::relaxed_all:
        mrs               r1, primask
        cpsid             i
        ldrh              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_and::u16::release_all:
        mrs               r1, primask
        cpsid             i
        ldrh              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_and::u16::seqcst_zero:
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        movs              r3, #0x0
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::u16::acquire_zero:
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        movs              r3, #0x0
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::u16::relaxed_zero:
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        movs              r3, #0x0
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::u16::release_zero:
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        movs              r3, #0x0
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::u16::acqrel:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        ands              r1, r2
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_and::u16::seqcst:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        ands              r1, r2
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_and::u16::acquire:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        ands              r1, r2
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_and::u16::relaxed:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        ands              r1, r2
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_and::u16::release:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        ands              r1, r2
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_and::u32::acqrel_all:
        mrs               r1, primask
        cpsid             i
        ldr               r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_and::u32::seqcst_all:
        mrs               r1, primask
        cpsid             i
        ldr               r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_and::u32::acqrel_zero:
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        movs              r3, #0x0
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::u32::acquire_all:
        mrs               r1, primask
        cpsid             i
        ldr               r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_and::u32::relaxed_all:
        mrs               r1, primask
        cpsid             i
        ldr               r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_and::u32::release_all:
        mrs               r1, primask
        cpsid             i
        ldr               r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_and::u32::seqcst_zero:
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        movs              r3, #0x0
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::u32::acquire_zero:
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        movs              r3, #0x0
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::u32::relaxed_zero:
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        movs              r3, #0x0
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::u32::release_zero:
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        movs              r3, #0x0
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::u32::acqrel:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        ands              r1, r2
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_and::u32::seqcst:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        ands              r1, r2
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_and::u32::acquire:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        ands              r1, r2
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_and::u32::relaxed:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        ands              r1, r2
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_and::u32::release:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        ands              r1, r2
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_and::bool::acqrel_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        ands              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::bool::seqcst_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        ands              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::bool::acqrel_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x0
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::bool::acquire_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        ands              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::bool::relaxed_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        ands              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::bool::release_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        ands              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::bool::seqcst_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x0
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::bool::acquire_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x0
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::bool::relaxed_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x0
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::bool::release_false:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x0
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_and::bool::acqrel:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        ands              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_and::bool::seqcst:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        ands              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_and::bool::acquire:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        ands              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_and::bool::relaxed:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        ands              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_and::bool::release:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        ands              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_max::i8::acqrel:
        push              {r4, lr}
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsb             r2, [r0, r2]
        sxtb              r1, r1
        cmp               r2, r1
        mov               r4, r2
        bgt               0f
        mov               r4, r1
0:
        strb              r4, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r4, pc}

asm_test::fetch_max::i8::seqcst:
        push              {r4, lr}
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsb             r2, [r0, r2]
        sxtb              r1, r1
        cmp               r2, r1
        mov               r4, r2
        bgt               0f
        mov               r4, r1
0:
        strb              r4, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r4, pc}

asm_test::fetch_max::i8::acquire:
        push              {r4, lr}
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsb             r2, [r0, r2]
        sxtb              r1, r1
        cmp               r2, r1
        mov               r4, r2
        bgt               0f
        mov               r4, r1
0:
        strb              r4, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r4, pc}

asm_test::fetch_max::i8::relaxed:
        push              {r4, lr}
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsb             r2, [r0, r2]
        sxtb              r1, r1
        cmp               r2, r1
        mov               r4, r2
        bgt               0f
        mov               r4, r1
0:
        strb              r4, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r4, pc}

asm_test::fetch_max::i8::release:
        push              {r4, lr}
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsb             r2, [r0, r2]
        sxtb              r1, r1
        cmp               r2, r1
        mov               r4, r2
        bgt               0f
        mov               r4, r1
0:
        strb              r4, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r4, pc}

asm_test::fetch_max::f32::acqrel:
        push              {r4, r5, r6, r7, lr}
        add               r7, sp, #0xc
        sub               sp, #0x4
        mov               r4, r0
        ldr               r5, [r0]
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               primask, r6
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        msr               primask, r6
        mov               r0, r5
        add               sp, #0x4
        pop               {r4, r5, r6, r7, pc}

asm_test::fetch_max::f32::seqcst:
        push              {r4, r5, r6, r7, lr}
        add               r7, sp, #0xc
        sub               sp, #0x4
        mov               r4, r0
        ldr               r5, [r0]
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               primask, r6
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        msr               primask, r6
        mov               r0, r5
        add               sp, #0x4
        pop               {r4, r5, r6, r7, pc}

asm_test::fetch_max::f32::acquire:
        push              {r4, r5, r6, r7, lr}
        add               r7, sp, #0xc
        sub               sp, #0x4
        mov               r4, r0
        ldr               r5, [r0]
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               primask, r6
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        msr               primask, r6
        mov               r0, r5
        add               sp, #0x4
        pop               {r4, r5, r6, r7, pc}

asm_test::fetch_max::f32::relaxed:
        push              {r4, r5, r6, r7, lr}
        add               r7, sp, #0xc
        sub               sp, #0x4
        mov               r4, r0
        ldr               r5, [r0]
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               primask, r6
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        msr               primask, r6
        mov               r0, r5
        add               sp, #0x4
        pop               {r4, r5, r6, r7, pc}

asm_test::fetch_max::f32::release:
        push              {r4, r5, r6, r7, lr}
        add               r7, sp, #0xc
        sub               sp, #0x4
        mov               r4, r0
        ldr               r5, [r0]
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               primask, r6
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        msr               primask, r6
        mov               r0, r5
        add               sp, #0x4
        pop               {r4, r5, r6, r7, pc}

asm_test::fetch_max::i16::acqrel:
        push              {r4, lr}
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsh             r2, [r0, r2]
        sxth              r1, r1
        cmp               r2, r1
        mov               r4, r2
        bgt               0f
        mov               r4, r1
0:
        strh              r4, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r4, pc}

asm_test::fetch_max::i16::seqcst:
        push              {r4, lr}
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsh             r2, [r0, r2]
        sxth              r1, r1
        cmp               r2, r1
        mov               r4, r2
        bgt               0f
        mov               r4, r1
0:
        strh              r4, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r4, pc}

asm_test::fetch_max::i16::acquire:
        push              {r4, lr}
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsh             r2, [r0, r2]
        sxth              r1, r1
        cmp               r2, r1
        mov               r4, r2
        bgt               0f
        mov               r4, r1
0:
        strh              r4, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r4, pc}

asm_test::fetch_max::i16::relaxed:
        push              {r4, lr}
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsh             r2, [r0, r2]
        sxth              r1, r1
        cmp               r2, r1
        mov               r4, r2
        bgt               0f
        mov               r4, r1
0:
        strh              r4, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r4, pc}

asm_test::fetch_max::i16::release:
        push              {r4, lr}
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsh             r2, [r0, r2]
        sxth              r1, r1
        cmp               r2, r1
        mov               r4, r2
        bgt               0f
        mov               r4, r1
0:
        strh              r4, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r4, pc}

asm_test::fetch_max::i32::acqrel:
        push              {r4, lr}
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r0, r1
        mov               r4, r0
        bgt               0f
        mov               r4, r1
0:
        str               r4, [r2]
        msr               primask, r3
        pop               {r4, pc}

asm_test::fetch_max::i32::seqcst:
        push              {r4, lr}
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r0, r1
        mov               r4, r0
        bgt               0f
        mov               r4, r1
0:
        str               r4, [r2]
        msr               primask, r3
        pop               {r4, pc}

asm_test::fetch_max::i32::acquire:
        push              {r4, lr}
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r0, r1
        mov               r4, r0
        bgt               0f
        mov               r4, r1
0:
        str               r4, [r2]
        msr               primask, r3
        pop               {r4, pc}

asm_test::fetch_max::i32::relaxed:
        push              {r4, lr}
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r0, r1
        mov               r4, r0
        bgt               0f
        mov               r4, r1
0:
        str               r4, [r2]
        msr               primask, r3
        pop               {r4, pc}

asm_test::fetch_max::i32::release:
        push              {r4, lr}
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r0, r1
        mov               r4, r0
        bgt               0f
        mov               r4, r1
0:
        str               r4, [r2]
        msr               primask, r3
        pop               {r4, pc}

asm_test::fetch_min::i8::acqrel:
        push              {r4, lr}
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsb             r2, [r0, r2]
        sxtb              r1, r1
        cmp               r2, r1
        mov               r4, r2
        blt               0f
        mov               r4, r1
0:
        strb              r4, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r4, pc}

asm_test::fetch_min::i8::seqcst:
        push              {r4, lr}
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsb             r2, [r0, r2]
        sxtb              r1, r1
        cmp               r2, r1
        mov               r4, r2
        blt               0f
        mov               r4, r1
0:
        strb              r4, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r4, pc}

asm_test::fetch_min::i8::acquire:
        push              {r4, lr}
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsb             r2, [r0, r2]
        sxtb              r1, r1
        cmp               r2, r1
        mov               r4, r2
        blt               0f
        mov               r4, r1
0:
        strb              r4, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r4, pc}

asm_test::fetch_min::i8::relaxed:
        push              {r4, lr}
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsb             r2, [r0, r2]
        sxtb              r1, r1
        cmp               r2, r1
        mov               r4, r2
        blt               0f
        mov               r4, r1
0:
        strb              r4, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r4, pc}

asm_test::fetch_min::i8::release:
        push              {r4, lr}
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsb             r2, [r0, r2]
        sxtb              r1, r1
        cmp               r2, r1
        mov               r4, r2
        blt               0f
        mov               r4, r1
0:
        strb              r4, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r4, pc}

asm_test::fetch_min::f32::acqrel:
        push              {r4, r5, r6, r7, lr}
        add               r7, sp, #0xc
        sub               sp, #0x4
        mov               r4, r0
        ldr               r5, [r0]
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               primask, r6
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        msr               primask, r6
        mov               r0, r5
        add               sp, #0x4
        pop               {r4, r5, r6, r7, pc}

asm_test::fetch_min::f32::seqcst:
        push              {r4, r5, r6, r7, lr}
        add               r7, sp, #0xc
        sub               sp, #0x4
        mov               r4, r0
        ldr               r5, [r0]
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               primask, r6
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        msr               primask, r6
        mov               r0, r5
        add               sp, #0x4
        pop               {r4, r5, r6, r7, pc}

asm_test::fetch_min::f32::acquire:
        push              {r4, r5, r6, r7, lr}
        add               r7, sp, #0xc
        sub               sp, #0x4
        mov               r4, r0
        ldr               r5, [r0]
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               primask, r6
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        msr               primask, r6
        mov               r0, r5
        add               sp, #0x4
        pop               {r4, r5, r6, r7, pc}

asm_test::fetch_min::f32::relaxed:
        push              {r4, r5, r6, r7, lr}
        add               r7, sp, #0xc
        sub               sp, #0x4
        mov               r4, r0
        ldr               r5, [r0]
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               primask, r6
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        msr               primask, r6
        mov               r0, r5
        add               sp, #0x4
        pop               {r4, r5, r6, r7, pc}

asm_test::fetch_min::f32::release:
        push              {r4, r5, r6, r7, lr}
        add               r7, sp, #0xc
        sub               sp, #0x4
        mov               r4, r0
        ldr               r5, [r0]
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               primask, r6
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        msr               primask, r6
        mov               r0, r5
        add               sp, #0x4
        pop               {r4, r5, r6, r7, pc}

asm_test::fetch_min::i16::acqrel:
        push              {r4, lr}
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsh             r2, [r0, r2]
        sxth              r1, r1
        cmp               r2, r1
        mov               r4, r2
        blt               0f
        mov               r4, r1
0:
        strh              r4, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r4, pc}

asm_test::fetch_min::i16::seqcst:
        push              {r4, lr}
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsh             r2, [r0, r2]
        sxth              r1, r1
        cmp               r2, r1
        mov               r4, r2
        blt               0f
        mov               r4, r1
0:
        strh              r4, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r4, pc}

asm_test::fetch_min::i16::acquire:
        push              {r4, lr}
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsh             r2, [r0, r2]
        sxth              r1, r1
        cmp               r2, r1
        mov               r4, r2
        blt               0f
        mov               r4, r1
0:
        strh              r4, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r4, pc}

asm_test::fetch_min::i16::relaxed:
        push              {r4, lr}
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsh             r2, [r0, r2]
        sxth              r1, r1
        cmp               r2, r1
        mov               r4, r2
        blt               0f
        mov               r4, r1
0:
        strh              r4, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r4, pc}

asm_test::fetch_min::i16::release:
        push              {r4, lr}
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsh             r2, [r0, r2]
        sxth              r1, r1
        cmp               r2, r1
        mov               r4, r2
        blt               0f
        mov               r4, r1
0:
        strh              r4, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r4, pc}

asm_test::fetch_min::i32::acqrel:
        push              {r4, lr}
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r0, r1
        mov               r4, r0
        blt               0f
        mov               r4, r1
0:
        str               r4, [r2]
        msr               primask, r3
        pop               {r4, pc}

asm_test::fetch_min::i32::seqcst:
        push              {r4, lr}
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r0, r1
        mov               r4, r0
        blt               0f
        mov               r4, r1
0:
        str               r4, [r2]
        msr               primask, r3
        pop               {r4, pc}

asm_test::fetch_min::i32::acquire:
        push              {r4, lr}
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r0, r1
        mov               r4, r0
        blt               0f
        mov               r4, r1
0:
        str               r4, [r2]
        msr               primask, r3
        pop               {r4, pc}

asm_test::fetch_min::i32::relaxed:
        push              {r4, lr}
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r0, r1
        mov               r4, r0
        blt               0f
        mov               r4, r1
0:
        str               r4, [r2]
        msr               primask, r3
        pop               {r4, pc}

asm_test::fetch_min::i32::release:
        push              {r4, lr}
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r0, r1
        mov               r4, r0
        blt               0f
        mov               r4, r1
0:
        str               r4, [r2]
        msr               primask, r3
        pop               {r4, pc}

asm_test::fetch_neg::u8::acqrel:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        rsbs              r3, r1, #0
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_neg::u8::seqcst:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        rsbs              r3, r1, #0
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_neg::u8::acquire:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        rsbs              r3, r1, #0
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_neg::u8::relaxed:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        rsbs              r3, r1, #0
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_neg::u8::release:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        rsbs              r3, r1, #0
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_neg::f32::acqrel:
        movs              r1, #0x1
        lsls              r2, r1, #0x1f
        mrs               r3, primask
        cpsid             i
        ldr               r1, [r0]
        eors              r2, r1
        str               r2, [r0]
        msr               primask, r3
        mov               r0, r1
        bx                lr

asm_test::fetch_neg::f32::seqcst:
        movs              r1, #0x1
        lsls              r2, r1, #0x1f
        mrs               r3, primask
        cpsid             i
        ldr               r1, [r0]
        eors              r2, r1
        str               r2, [r0]
        msr               primask, r3
        mov               r0, r1
        bx                lr

asm_test::fetch_neg::f32::acquire:
        movs              r1, #0x1
        lsls              r2, r1, #0x1f
        mrs               r3, primask
        cpsid             i
        ldr               r1, [r0]
        eors              r2, r1
        str               r2, [r0]
        msr               primask, r3
        mov               r0, r1
        bx                lr

asm_test::fetch_neg::f32::relaxed:
        movs              r1, #0x1
        lsls              r2, r1, #0x1f
        mrs               r3, primask
        cpsid             i
        ldr               r1, [r0]
        eors              r2, r1
        str               r2, [r0]
        msr               primask, r3
        mov               r0, r1
        bx                lr

asm_test::fetch_neg::f32::release:
        movs              r1, #0x1
        lsls              r2, r1, #0x1f
        mrs               r3, primask
        cpsid             i
        ldr               r1, [r0]
        eors              r2, r1
        str               r2, [r0]
        msr               primask, r3
        mov               r0, r1
        bx                lr

asm_test::fetch_neg::u16::acqrel:
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        rsbs              r3, r1, #0
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_neg::u16::seqcst:
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        rsbs              r3, r1, #0
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_neg::u16::acquire:
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        rsbs              r3, r1, #0
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_neg::u16::relaxed:
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        rsbs              r3, r1, #0
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_neg::u16::release:
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        rsbs              r3, r1, #0
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_neg::u32::acqrel:
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        rsbs              r3, r1, #0
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_neg::u32::seqcst:
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        rsbs              r3, r1, #0
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_neg::u32::acquire:
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        rsbs              r3, r1, #0
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_neg::u32::relaxed:
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        rsbs              r3, r1, #0
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_neg::u32::release:
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        rsbs              r3, r1, #0
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_not::u8::acqrel:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        mvns              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_not::u8::seqcst:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        mvns              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_not::u8::acquire:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        mvns              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_not::u8::relaxed:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        mvns              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_not::u8::release:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        mvns              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_not::u16::acqrel:
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        mvns              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_not::u16::seqcst:
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        mvns              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_not::u16::acquire:
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        mvns              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_not::u16::relaxed:
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        mvns              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_not::u16::release:
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        mvns              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_not::u32::acqrel:
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        mvns              r3, r1
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_not::u32::seqcst:
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        mvns              r3, r1
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_not::u32::acquire:
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        mvns              r3, r1
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_not::u32::relaxed:
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        mvns              r3, r1
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_not::u32::release:
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        mvns              r3, r1
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_not::bool::acqrel:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        eors              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_not::bool::seqcst:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        eors              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_not::bool::acquire:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        eors              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_not::bool::relaxed:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        eors              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_not::bool::release:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        eors              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_sub::u8::acqrel_zero:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_sub::u8::seqcst_zero:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_sub::u8::acquire_zero:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_sub::u8::relaxed_zero:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_sub::u8::release_zero:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_sub::u8::acqrel:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        subs              r1, r2, r1
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_sub::u8::seqcst:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        subs              r1, r2, r1
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_sub::u8::acquire:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        subs              r1, r2, r1
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_sub::u8::relaxed:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        subs              r1, r2, r1
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_sub::u8::release:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        subs              r1, r2, r1
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_sub::f32::acqrel_zero:
        ldr               r1, [r0]
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        cmp               r1, r3
        beq               1f
0:
        mov               r1, r3
        msr               primask, r2
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        cmp               r1, r3
        bne               0b
1:
        str               r1, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_sub::f32::seqcst_zero:
        ldr               r1, [r0]
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        cmp               r1, r3
        beq               1f
0:
        mov               r1, r3
        msr               primask, r2
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        cmp               r1, r3
        bne               0b
1:
        str               r1, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_sub::f32::acquire_zero:
        ldr               r1, [r0]
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        cmp               r1, r3
        beq               1f
0:
        mov               r1, r3
        msr               primask, r2
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        cmp               r1, r3
        bne               0b
1:
        str               r1, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_sub::f32::relaxed_zero:
        ldr               r1, [r0]
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        cmp               r1, r3
        beq               1f
0:
        mov               r1, r3
        msr               primask, r2
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        cmp               r1, r3
        bne               0b
1:
        str               r1, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_sub::f32::release_zero:
        ldr               r1, [r0]
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        cmp               r1, r3
        beq               1f
0:
        mov               r1, r3
        msr               primask, r2
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        cmp               r1, r3
        bne               0b
1:
        str               r1, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_sub::f32::acqrel:
        push              {r4, r5, r6, r7, lr}
        add               r7, sp, #0xc
        sub               sp, #0x4
        mov               r4, r0
        ldr               r5, [r0]
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               primask, r6
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        msr               primask, r6
        mov               r0, r5
        add               sp, #0x4
        pop               {r4, r5, r6, r7, pc}

asm_test::fetch_sub::f32::seqcst:
        push              {r4, r5, r6, r7, lr}
        add               r7, sp, #0xc
        sub               sp, #0x4
        mov               r4, r0
        ldr               r5, [r0]
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               primask, r6
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        msr               primask, r6
        mov               r0, r5
        add               sp, #0x4
        pop               {r4, r5, r6, r7, pc}

asm_test::fetch_sub::f32::acquire:
        push              {r4, r5, r6, r7, lr}
        add               r7, sp, #0xc
        sub               sp, #0x4
        mov               r4, r0
        ldr               r5, [r0]
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               primask, r6
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        msr               primask, r6
        mov               r0, r5
        add               sp, #0x4
        pop               {r4, r5, r6, r7, pc}

asm_test::fetch_sub::f32::relaxed:
        push              {r4, r5, r6, r7, lr}
        add               r7, sp, #0xc
        sub               sp, #0x4
        mov               r4, r0
        ldr               r5, [r0]
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               primask, r6
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        msr               primask, r6
        mov               r0, r5
        add               sp, #0x4
        pop               {r4, r5, r6, r7, pc}

asm_test::fetch_sub::f32::release:
        push              {r4, r5, r6, r7, lr}
        add               r7, sp, #0xc
        sub               sp, #0x4
        mov               r4, r0
        ldr               r5, [r0]
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r5, r0
        beq               1f
0:
        mov               r5, r0
        msr               primask, r6
        mrs               r6, primask
        cpsid             i
        ldr               r0, [r4]
        cmp               r5, r0
        bne               0b
1:
        mov               r0, r5
2:
        bl                2f
        str               r0, [r4]
        msr               primask, r6
        mov               r0, r5
        add               sp, #0x4
        pop               {r4, r5, r6, r7, pc}

asm_test::fetch_sub::u16::acqrel_zero:
        mrs               r1, primask
        cpsid             i
        ldrh              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_sub::u16::seqcst_zero:
        mrs               r1, primask
        cpsid             i
        ldrh              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_sub::u16::acquire_zero:
        mrs               r1, primask
        cpsid             i
        ldrh              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_sub::u16::relaxed_zero:
        mrs               r1, primask
        cpsid             i
        ldrh              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_sub::u16::release_zero:
        mrs               r1, primask
        cpsid             i
        ldrh              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_sub::u16::acqrel:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        subs              r1, r2, r1
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_sub::u16::seqcst:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        subs              r1, r2, r1
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_sub::u16::acquire:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        subs              r1, r2, r1
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_sub::u16::relaxed:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        subs              r1, r2, r1
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_sub::u16::release:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        subs              r1, r2, r1
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_sub::u32::acqrel_zero:
        mrs               r1, primask
        cpsid             i
        ldr               r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_sub::u32::seqcst_zero:
        mrs               r1, primask
        cpsid             i
        ldr               r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_sub::u32::acquire_zero:
        mrs               r1, primask
        cpsid             i
        ldr               r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_sub::u32::relaxed_zero:
        mrs               r1, primask
        cpsid             i
        ldr               r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_sub::u32::release_zero:
        mrs               r1, primask
        cpsid             i
        ldr               r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_sub::u32::acqrel:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        subs              r1, r2, r1
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_sub::u32::seqcst:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        subs              r1, r2, r1
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_sub::u32::acquire:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        subs              r1, r2, r1
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_sub::u32::relaxed:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        subs              r1, r2, r1
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_sub::u32::release:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        subs              r1, r2, r1
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_xor::u8::acqrel_zero:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_xor::u8::seqcst_zero:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_xor::u8::acquire_zero:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_xor::u8::relaxed_zero:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_xor::u8::release_zero:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_xor::u8::acqrel:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        eors              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_xor::u8::seqcst:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        eors              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_xor::u8::acquire:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        eors              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_xor::u8::relaxed:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        eors              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_xor::u8::release:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        eors              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_xor::u16::acqrel_zero:
        mrs               r1, primask
        cpsid             i
        ldrh              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_xor::u16::seqcst_zero:
        mrs               r1, primask
        cpsid             i
        ldrh              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_xor::u16::acquire_zero:
        mrs               r1, primask
        cpsid             i
        ldrh              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_xor::u16::relaxed_zero:
        mrs               r1, primask
        cpsid             i
        ldrh              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_xor::u16::release_zero:
        mrs               r1, primask
        cpsid             i
        ldrh              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_xor::u16::acqrel:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        eors              r1, r2
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_xor::u16::seqcst:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        eors              r1, r2
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_xor::u16::acquire:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        eors              r1, r2
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_xor::u16::relaxed:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        eors              r1, r2
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_xor::u16::release:
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        eors              r1, r2
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_xor::u32::acqrel_zero:
        mrs               r1, primask
        cpsid             i
        ldr               r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_xor::u32::seqcst_zero:
        mrs               r1, primask
        cpsid             i
        ldr               r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_xor::u32::acquire_zero:
        mrs               r1, primask
        cpsid             i
        ldr               r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_xor::u32::relaxed_zero:
        mrs               r1, primask
        cpsid             i
        ldr               r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_xor::u32::release_zero:
        mrs               r1, primask
        cpsid             i
        ldr               r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_xor::u32::acqrel:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        eors              r1, r2
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_xor::u32::seqcst:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        eors              r1, r2
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_xor::u32::acquire:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        eors              r1, r2
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_xor::u32::relaxed:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        eors              r1, r2
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_xor::u32::release:
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        eors              r1, r2
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_xor::bool::acqrel_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        eors              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_xor::bool::seqcst_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        eors              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_xor::bool::acqrel_false:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_xor::bool::acquire_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        eors              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_xor::bool::relaxed_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        eors              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_xor::bool::release_true:
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        movs              r3, #0x1
        eors              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        bx                lr

asm_test::fetch_xor::bool::seqcst_false:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_xor::bool::acquire_false:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_xor::bool::relaxed_false:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_xor::bool::release_false:
        mrs               r1, primask
        cpsid             i
        ldrb              r0, [r0]
        msr               primask, r1
        bx                lr

asm_test::fetch_xor::bool::acqrel:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        eors              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_xor::bool::seqcst:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        eors              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_xor::bool::acquire:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        eors              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_xor::bool::relaxed:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        eors              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

asm_test::fetch_xor::bool::release:
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        eors              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        bx                lr

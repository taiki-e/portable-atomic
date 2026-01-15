asm_test::fetch_nand::u8::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        ands              r1, r2
        mvns              r1, r1
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_nand::u8::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        ands              r1, r2
        mvns              r1, r1
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_nand::u8::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        ands              r1, r2
        mvns              r1, r1
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_nand::u8::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        ands              r1, r2
        mvns              r1, r1
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_nand::u8::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        ands              r1, r2
        mvns              r1, r1
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_nand::u16::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        ands              r1, r2
        mvns              r1, r1
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_nand::u16::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        ands              r1, r2
        mvns              r1, r1
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_nand::u16::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        ands              r1, r2
        mvns              r1, r1
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_nand::u16::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        ands              r1, r2
        mvns              r1, r1
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_nand::u16::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        ands              r1, r2
        mvns              r1, r1
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_nand::u32::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        ands              r1, r2
        mvns              r1, r1
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_nand::u32::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        ands              r1, r2
        mvns              r1, r1
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_nand::u32::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        ands              r1, r2
        mvns              r1, r1
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_nand::u32::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        ands              r1, r2
        mvns              r1, r1
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_nand::u32::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        ands              r1, r2
        mvns              r1, r1
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_umax::u8::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldrb              r0, [r0]
        uxtb              r1, r1
        cmp               r1, r0
        bhi               0f
        mov               r1, r0
0:
        strb              r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_umax::u8::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldrb              r0, [r0]
        uxtb              r1, r1
        cmp               r1, r0
        bhi               0f
        mov               r1, r0
0:
        strb              r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_umax::u8::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldrb              r0, [r0]
        uxtb              r1, r1
        cmp               r1, r0
        bhi               0f
        mov               r1, r0
0:
        strb              r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_umax::u8::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldrb              r0, [r0]
        uxtb              r1, r1
        cmp               r1, r0
        bhi               0f
        mov               r1, r0
0:
        strb              r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_umax::u8::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldrb              r0, [r0]
        uxtb              r1, r1
        cmp               r1, r0
        bhi               0f
        mov               r1, r0
0:
        strb              r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_umax::u16::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldrh              r0, [r0]
        uxth              r1, r1
        cmp               r1, r0
        bhi               0f
        mov               r1, r0
0:
        strh              r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_umax::u16::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldrh              r0, [r0]
        uxth              r1, r1
        cmp               r1, r0
        bhi               0f
        mov               r1, r0
0:
        strh              r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_umax::u16::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldrh              r0, [r0]
        uxth              r1, r1
        cmp               r1, r0
        bhi               0f
        mov               r1, r0
0:
        strh              r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_umax::u16::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldrh              r0, [r0]
        uxth              r1, r1
        cmp               r1, r0
        bhi               0f
        mov               r1, r0
0:
        strh              r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_umax::u16::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldrh              r0, [r0]
        uxth              r1, r1
        cmp               r1, r0
        bhi               0f
        mov               r1, r0
0:
        strh              r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_umax::u32::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r1, r0
        bhi               0f
        mov               r1, r0
0:
        str               r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_umax::u32::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r1, r0
        bhi               0f
        mov               r1, r0
0:
        str               r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_umax::u32::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r1, r0
        bhi               0f
        mov               r1, r0
0:
        str               r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_umax::u32::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r1, r0
        bhi               0f
        mov               r1, r0
0:
        str               r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_umax::u32::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r1, r0
        bhi               0f
        mov               r1, r0
0:
        str               r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_umin::u8::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldrb              r0, [r0]
        uxtb              r1, r1
        cmp               r1, r0
        blo               0f
        mov               r1, r0
0:
        strb              r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_umin::u8::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldrb              r0, [r0]
        uxtb              r1, r1
        cmp               r1, r0
        blo               0f
        mov               r1, r0
0:
        strb              r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_umin::u8::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldrb              r0, [r0]
        uxtb              r1, r1
        cmp               r1, r0
        blo               0f
        mov               r1, r0
0:
        strb              r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_umin::u8::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldrb              r0, [r0]
        uxtb              r1, r1
        cmp               r1, r0
        blo               0f
        mov               r1, r0
0:
        strb              r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_umin::u8::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldrb              r0, [r0]
        uxtb              r1, r1
        cmp               r1, r0
        blo               0f
        mov               r1, r0
0:
        strb              r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_umin::u16::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldrh              r0, [r0]
        uxth              r1, r1
        cmp               r1, r0
        blo               0f
        mov               r1, r0
0:
        strh              r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_umin::u16::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldrh              r0, [r0]
        uxth              r1, r1
        cmp               r1, r0
        blo               0f
        mov               r1, r0
0:
        strh              r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_umin::u16::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldrh              r0, [r0]
        uxth              r1, r1
        cmp               r1, r0
        blo               0f
        mov               r1, r0
0:
        strh              r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_umin::u16::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldrh              r0, [r0]
        uxth              r1, r1
        cmp               r1, r0
        blo               0f
        mov               r1, r0
0:
        strh              r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_umin::u16::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldrh              r0, [r0]
        uxth              r1, r1
        cmp               r1, r0
        blo               0f
        mov               r1, r0
0:
        strh              r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_umin::u32::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r1, r0
        blo               0f
        mov               r1, r0
0:
        str               r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_umin::u32::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r1, r0
        blo               0f
        mov               r1, r0
0:
        str               r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_umin::u32::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r1, r0
        blo               0f
        mov               r1, r0
0:
        str               r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_umin::u32::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r1, r0
        blo               0f
        mov               r1, r0
0:
        str               r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_umin::u32::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r1, r0
        blo               0f
        mov               r1, r0
0:
        str               r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::compare_exchange::u8::acqrel_seqcst:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r1, r3
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u8::seqcst_seqcst:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r1, r3
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u8::acqrel_acquire:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r1, r3
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u8::acqrel_relaxed:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r1, r3
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u8::acquire_seqcst:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r1, r3
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u8::relaxed_seqcst:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r1, r3
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u8::release_seqcst:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r1, r3
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u8::seqcst_acquire:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r1, r3
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u8::seqcst_relaxed:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r1, r3
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u8::acquire_acquire:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r1, r3
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u8::acquire_relaxed:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r1, r3
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u8::relaxed_acquire:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r1, r3
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u8::relaxed_relaxed:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r1, r3
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u8::release_acquire:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r1, r3
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u8::release_relaxed:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r1, r3
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u16::acqrel_seqcst:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r1, r3
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u16::seqcst_seqcst:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r1, r3
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u16::acqrel_acquire:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r1, r3
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u16::acqrel_relaxed:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r1, r3
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u16::acquire_seqcst:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r1, r3
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u16::relaxed_seqcst:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r1, r3
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u16::release_seqcst:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r1, r3
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u16::seqcst_acquire:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r1, r3
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u16::seqcst_relaxed:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r1, r3
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u16::acquire_acquire:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r1, r3
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u16::acquire_relaxed:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r1, r3
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u16::relaxed_acquire:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r1, r3
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u16::relaxed_relaxed:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r1, r3
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u16::release_acquire:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r1, r3
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u16::release_relaxed:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r1, r3
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u32::acqrel_seqcst:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u32::seqcst_seqcst:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u32::acqrel_acquire:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u32::acqrel_relaxed:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u32::acquire_seqcst:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u32::relaxed_seqcst:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u32::release_seqcst:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u32::seqcst_acquire:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u32::seqcst_relaxed:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u32::acquire_acquire:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u32::acquire_relaxed:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u32::relaxed_acquire:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u32::relaxed_relaxed:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u32::release_acquire:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange::u32::release_relaxed:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u8::acqrel_seqcst:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r1, r3
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u8::seqcst_seqcst:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r1, r3
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u8::acqrel_acquire:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r1, r3
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u8::acqrel_relaxed:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r1, r3
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u8::acquire_seqcst:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r1, r3
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u8::relaxed_seqcst:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r1, r3
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u8::release_seqcst:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r1, r3
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u8::seqcst_acquire:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r1, r3
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u8::seqcst_relaxed:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r1, r3
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u8::acquire_acquire:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r1, r3
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u8::acquire_relaxed:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r1, r3
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u8::relaxed_acquire:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r1, r3
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u8::relaxed_relaxed:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r1, r3
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u8::release_acquire:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r1, r3
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u8::release_relaxed:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrb              r1, [r0]
        uxtb              r3, r3
        cmp               r1, r3
        bne               0f
        strb              r2, [r0]
0:
        msr               primask, r4
        subs              r0, r1, r3
        subs              r2, r0, #0x1
        sbcs              r0, r2
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u16::acqrel_seqcst:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r1, r3
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u16::seqcst_seqcst:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r1, r3
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u16::acqrel_acquire:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r1, r3
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u16::acqrel_relaxed:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r1, r3
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u16::acquire_seqcst:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r1, r3
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u16::relaxed_seqcst:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r1, r3
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u16::release_seqcst:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r1, r3
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u16::seqcst_acquire:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r1, r3
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u16::seqcst_relaxed:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r1, r3
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u16::acquire_acquire:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r1, r3
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u16::acquire_relaxed:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r1, r3
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u16::relaxed_acquire:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r1, r3
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u16::relaxed_relaxed:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r1, r3
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u16::release_acquire:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r1, r3
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u16::release_relaxed:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldrh              r1, [r0]
        uxth              r3, r3
        cmp               r1, r3
        bne               0f
        strh              r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u32::acqrel_seqcst:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u32::seqcst_seqcst:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u32::acqrel_acquire:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u32::acqrel_relaxed:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u32::acquire_seqcst:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u32::relaxed_seqcst:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u32::release_seqcst:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u32::seqcst_acquire:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u32::seqcst_relaxed:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u32::acquire_acquire:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u32::acquire_relaxed:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u32::relaxed_acquire:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u32::relaxed_relaxed:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u32::release_acquire:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::compare_exchange_weak::u32::release_relaxed:
        push              {r4, r6, r7, lr}
        add               r7, sp, #0x8
        mov               r3, r1
        mrs               r4, primask
        cpsid             i
        ldr               r1, [r0]
        cmp               r1, r3
        bne               0f
        str               r2, [r0]
        movs              r0, #0x0
        msr               primask, r4
        pop               {r4, r6, r7, pc}
0:
        movs              r0, #0x1
        msr               primask, r4
        pop               {r4, r6, r7, pc}

asm_test::or::u8::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        orrs              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::or::u8::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        orrs              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::or::u8::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        orrs              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::or::u8::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        orrs              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::or::u8::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        orrs              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::or::u16::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        orrs              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::or::u16::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        orrs              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::or::u16::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        orrs              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::or::u16::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        orrs              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::or::u16::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        orrs              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::or::u32::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        orrs              r3, r1
        str               r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::or::u32::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        orrs              r3, r1
        str               r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::or::u32::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        orrs              r3, r1
        str               r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::or::u32::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        orrs              r3, r1
        str               r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::or::u32::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        orrs              r3, r1
        str               r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::add::u8::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        adds              r1, r3, r1
        strb              r1, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::add::u8::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        adds              r1, r3, r1
        strb              r1, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::add::u8::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        adds              r1, r3, r1
        strb              r1, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::add::u8::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        adds              r1, r3, r1
        strb              r1, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::add::u8::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        adds              r1, r3, r1
        strb              r1, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::add::u16::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        adds              r1, r3, r1
        strh              r1, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::add::u16::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        adds              r1, r3, r1
        strh              r1, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::add::u16::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        adds              r1, r3, r1
        strh              r1, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::add::u16::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        adds              r1, r3, r1
        strh              r1, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::add::u16::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        adds              r1, r3, r1
        strh              r1, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::add::u32::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        adds              r1, r3, r1
        str               r1, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::add::u32::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        adds              r1, r3, r1
        str               r1, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::add::u32::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        adds              r1, r3, r1
        str               r1, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::add::u32::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        adds              r1, r3, r1
        str               r1, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::add::u32::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        adds              r1, r3, r1
        str               r1, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::and::u8::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        ands              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::and::u8::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        ands              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::and::u8::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        ands              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::and::u8::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        ands              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::and::u8::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        ands              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::and::u16::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        ands              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::and::u16::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        ands              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::and::u16::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        ands              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::and::u16::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        ands              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::and::u16::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        ands              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::and::u32::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        ands              r3, r1
        str               r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::and::u32::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        ands              r3, r1
        str               r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::and::u32::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        ands              r3, r1
        str               r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::and::u32::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        ands              r3, r1
        str               r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::and::u32::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        ands              r3, r1
        str               r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::neg::u8::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        rsbs              r2, r2, #0
        strb              r2, [r0]
        msr               primask, r1
        pop               {r7, pc}

asm_test::neg::u8::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        rsbs              r2, r2, #0
        strb              r2, [r0]
        msr               primask, r1
        pop               {r7, pc}

asm_test::neg::u8::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        rsbs              r2, r2, #0
        strb              r2, [r0]
        msr               primask, r1
        pop               {r7, pc}

asm_test::neg::u8::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        rsbs              r2, r2, #0
        strb              r2, [r0]
        msr               primask, r1
        pop               {r7, pc}

asm_test::neg::u8::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        rsbs              r2, r2, #0
        strb              r2, [r0]
        msr               primask, r1
        pop               {r7, pc}

asm_test::neg::u16::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r1, primask
        cpsid             i
        ldrh              r2, [r0]
        rsbs              r2, r2, #0
        strh              r2, [r0]
        msr               primask, r1
        pop               {r7, pc}

asm_test::neg::u16::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r1, primask
        cpsid             i
        ldrh              r2, [r0]
        rsbs              r2, r2, #0
        strh              r2, [r0]
        msr               primask, r1
        pop               {r7, pc}

asm_test::neg::u16::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r1, primask
        cpsid             i
        ldrh              r2, [r0]
        rsbs              r2, r2, #0
        strh              r2, [r0]
        msr               primask, r1
        pop               {r7, pc}

asm_test::neg::u16::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r1, primask
        cpsid             i
        ldrh              r2, [r0]
        rsbs              r2, r2, #0
        strh              r2, [r0]
        msr               primask, r1
        pop               {r7, pc}

asm_test::neg::u16::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r1, primask
        cpsid             i
        ldrh              r2, [r0]
        rsbs              r2, r2, #0
        strh              r2, [r0]
        msr               primask, r1
        pop               {r7, pc}

asm_test::neg::u32::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r1, primask
        cpsid             i
        ldr               r2, [r0]
        rsbs              r2, r2, #0
        str               r2, [r0]
        msr               primask, r1
        pop               {r7, pc}

asm_test::neg::u32::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r1, primask
        cpsid             i
        ldr               r2, [r0]
        rsbs              r2, r2, #0
        str               r2, [r0]
        msr               primask, r1
        pop               {r7, pc}

asm_test::neg::u32::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r1, primask
        cpsid             i
        ldr               r2, [r0]
        rsbs              r2, r2, #0
        str               r2, [r0]
        msr               primask, r1
        pop               {r7, pc}

asm_test::neg::u32::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r1, primask
        cpsid             i
        ldr               r2, [r0]
        rsbs              r2, r2, #0
        str               r2, [r0]
        msr               primask, r1
        pop               {r7, pc}

asm_test::neg::u32::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r1, primask
        cpsid             i
        ldr               r2, [r0]
        rsbs              r2, r2, #0
        str               r2, [r0]
        msr               primask, r1
        pop               {r7, pc}

asm_test::not::u8::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        mvns              r2, r2
        strb              r2, [r0]
        msr               primask, r1
        pop               {r7, pc}

asm_test::not::u8::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        mvns              r2, r2
        strb              r2, [r0]
        msr               primask, r1
        pop               {r7, pc}

asm_test::not::u8::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        mvns              r2, r2
        strb              r2, [r0]
        msr               primask, r1
        pop               {r7, pc}

asm_test::not::u8::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        mvns              r2, r2
        strb              r2, [r0]
        msr               primask, r1
        pop               {r7, pc}

asm_test::not::u8::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r1, primask
        cpsid             i
        ldrb              r2, [r0]
        mvns              r2, r2
        strb              r2, [r0]
        msr               primask, r1
        pop               {r7, pc}

asm_test::not::u16::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r1, primask
        cpsid             i
        ldrh              r2, [r0]
        mvns              r2, r2
        strh              r2, [r0]
        msr               primask, r1
        pop               {r7, pc}

asm_test::not::u16::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r1, primask
        cpsid             i
        ldrh              r2, [r0]
        mvns              r2, r2
        strh              r2, [r0]
        msr               primask, r1
        pop               {r7, pc}

asm_test::not::u16::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r1, primask
        cpsid             i
        ldrh              r2, [r0]
        mvns              r2, r2
        strh              r2, [r0]
        msr               primask, r1
        pop               {r7, pc}

asm_test::not::u16::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r1, primask
        cpsid             i
        ldrh              r2, [r0]
        mvns              r2, r2
        strh              r2, [r0]
        msr               primask, r1
        pop               {r7, pc}

asm_test::not::u16::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r1, primask
        cpsid             i
        ldrh              r2, [r0]
        mvns              r2, r2
        strh              r2, [r0]
        msr               primask, r1
        pop               {r7, pc}

asm_test::not::u32::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r1, primask
        cpsid             i
        ldr               r2, [r0]
        mvns              r2, r2
        str               r2, [r0]
        msr               primask, r1
        pop               {r7, pc}

asm_test::not::u32::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r1, primask
        cpsid             i
        ldr               r2, [r0]
        mvns              r2, r2
        str               r2, [r0]
        msr               primask, r1
        pop               {r7, pc}

asm_test::not::u32::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r1, primask
        cpsid             i
        ldr               r2, [r0]
        mvns              r2, r2
        str               r2, [r0]
        msr               primask, r1
        pop               {r7, pc}

asm_test::not::u32::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r1, primask
        cpsid             i
        ldr               r2, [r0]
        mvns              r2, r2
        str               r2, [r0]
        msr               primask, r1
        pop               {r7, pc}

asm_test::not::u32::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r1, primask
        cpsid             i
        ldr               r2, [r0]
        mvns              r2, r2
        str               r2, [r0]
        msr               primask, r1
        pop               {r7, pc}

asm_test::sub::u8::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        subs              r1, r3, r1
        strb              r1, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::sub::u8::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        subs              r1, r3, r1
        strb              r1, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::sub::u8::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        subs              r1, r3, r1
        strb              r1, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::sub::u8::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        subs              r1, r3, r1
        strb              r1, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::sub::u8::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        subs              r1, r3, r1
        strb              r1, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::sub::u16::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        subs              r1, r3, r1
        strh              r1, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::sub::u16::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        subs              r1, r3, r1
        strh              r1, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::sub::u16::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        subs              r1, r3, r1
        strh              r1, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::sub::u16::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        subs              r1, r3, r1
        strh              r1, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::sub::u16::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        subs              r1, r3, r1
        strh              r1, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::sub::u32::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        subs              r1, r3, r1
        str               r1, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::sub::u32::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        subs              r1, r3, r1
        str               r1, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::sub::u32::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        subs              r1, r3, r1
        str               r1, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::sub::u32::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        subs              r1, r3, r1
        str               r1, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::sub::u32::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        subs              r1, r3, r1
        str               r1, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::xor::u8::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        eors              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::xor::u8::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        eors              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::xor::u8::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        eors              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::xor::u8::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        eors              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::xor::u8::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r3, [r0]
        eors              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::xor::u16::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        eors              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::xor::u16::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        eors              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::xor::u16::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        eors              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::xor::u16::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        eors              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::xor::u16::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r3, [r0]
        eors              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::xor::u32::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        eors              r3, r1
        str               r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::xor::u32::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        eors              r3, r1
        str               r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::xor::u32::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        eors              r3, r1
        str               r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::xor::u32::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        eors              r3, r1
        str               r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::xor::u32::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r3, [r0]
        eors              r3, r1
        str               r3, [r0]
        msr               primask, r2
        pop               {r7, pc}

asm_test::load::u8::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        ldrb              r0, [r0]
        dmb               sy
        pop               {r7, pc}

asm_test::load::u8::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        ldrb              r0, [r0]
        dmb               sy
        pop               {r7, pc}

asm_test::load::u8::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        ldrb              r0, [r0]
        pop               {r7, pc}

asm_test::load::u16::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        ldrh              r0, [r0]
        dmb               sy
        pop               {r7, pc}

asm_test::load::u16::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        ldrh              r0, [r0]
        dmb               sy
        pop               {r7, pc}

asm_test::load::u16::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        ldrh              r0, [r0]
        pop               {r7, pc}

asm_test::load::u32::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        ldr               r0, [r0]
        dmb               sy
        pop               {r7, pc}

asm_test::load::u32::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        ldr               r0, [r0]
        dmb               sy
        pop               {r7, pc}

asm_test::load::u32::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        ldr               r0, [r0]
        pop               {r7, pc}

asm_test::swap::u8::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::swap::u8::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::swap::u8::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::swap::u8::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::swap::u8::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::swap::u16::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::swap::u16::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::swap::u16::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::swap::u16::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::swap::u16::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::swap::u32::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::swap::u32::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::swap::u32::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::swap::u32::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::swap::u32::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::store::u8::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        dmb               sy
        strb              r1, [r0]
        dmb               sy
        pop               {r7, pc}

asm_test::store::u8::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        strb              r1, [r0]
        pop               {r7, pc}

asm_test::store::u8::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        dmb               sy
        strb              r1, [r0]
        pop               {r7, pc}

asm_test::store::u16::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        dmb               sy
        strh              r1, [r0]
        dmb               sy
        pop               {r7, pc}

asm_test::store::u16::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        strh              r1, [r0]
        pop               {r7, pc}

asm_test::store::u16::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        dmb               sy
        strh              r1, [r0]
        pop               {r7, pc}

asm_test::store::u32::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        dmb               sy
        str               r1, [r0]
        dmb               sy
        pop               {r7, pc}

asm_test::store::u32::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        str               r1, [r0]
        pop               {r7, pc}

asm_test::store::u32::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        dmb               sy
        str               r1, [r0]
        pop               {r7, pc}

asm_test::fetch_or::u8::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        orrs              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_or::u8::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        orrs              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_or::u8::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        orrs              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_or::u8::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        orrs              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_or::u8::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        orrs              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_or::u16::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        orrs              r1, r2
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_or::u16::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        orrs              r1, r2
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_or::u16::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        orrs              r1, r2
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_or::u16::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        orrs              r1, r2
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_or::u16::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        orrs              r1, r2
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_or::u32::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        orrs              r1, r2
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_or::u32::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        orrs              r1, r2
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_or::u32::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        orrs              r1, r2
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_or::u32::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        orrs              r1, r2
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_or::u32::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        orrs              r1, r2
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_add::u8::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        adds              r1, r2, r1
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_add::u8::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        adds              r1, r2, r1
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_add::u8::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        adds              r1, r2, r1
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_add::u8::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        adds              r1, r2, r1
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_add::u8::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        adds              r1, r2, r1
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_add::u16::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        adds              r1, r2, r1
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_add::u16::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        adds              r1, r2, r1
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_add::u16::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        adds              r1, r2, r1
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_add::u16::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        adds              r1, r2, r1
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_add::u16::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        adds              r1, r2, r1
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_add::u32::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        adds              r1, r2, r1
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_add::u32::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        adds              r1, r2, r1
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_add::u32::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        adds              r1, r2, r1
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_add::u32::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        adds              r1, r2, r1
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_add::u32::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        adds              r1, r2, r1
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_and::u8::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        ands              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_and::u8::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        ands              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_and::u8::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        ands              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_and::u8::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        ands              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_and::u8::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        ands              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_and::u16::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        ands              r1, r2
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_and::u16::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        ands              r1, r2
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_and::u16::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        ands              r1, r2
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_and::u16::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        ands              r1, r2
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_and::u16::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        ands              r1, r2
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_and::u32::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        ands              r1, r2
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_and::u32::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        ands              r1, r2
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_and::u32::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        ands              r1, r2
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_and::u32::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        ands              r1, r2
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_and::u32::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        ands              r1, r2
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_max::i8::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsb             r2, [r0, r2]
        sxtb              r1, r1
        cmp               r1, r2
        bgt               0f
        mov               r1, r2
0:
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_max::i8::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsb             r2, [r0, r2]
        sxtb              r1, r1
        cmp               r1, r2
        bgt               0f
        mov               r1, r2
0:
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_max::i8::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsb             r2, [r0, r2]
        sxtb              r1, r1
        cmp               r1, r2
        bgt               0f
        mov               r1, r2
0:
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_max::i8::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsb             r2, [r0, r2]
        sxtb              r1, r1
        cmp               r1, r2
        bgt               0f
        mov               r1, r2
0:
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_max::i8::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsb             r2, [r0, r2]
        sxtb              r1, r1
        cmp               r1, r2
        bgt               0f
        mov               r1, r2
0:
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_max::i16::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsh             r2, [r0, r2]
        sxth              r1, r1
        cmp               r1, r2
        bgt               0f
        mov               r1, r2
0:
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_max::i16::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsh             r2, [r0, r2]
        sxth              r1, r1
        cmp               r1, r2
        bgt               0f
        mov               r1, r2
0:
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_max::i16::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsh             r2, [r0, r2]
        sxth              r1, r1
        cmp               r1, r2
        bgt               0f
        mov               r1, r2
0:
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_max::i16::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsh             r2, [r0, r2]
        sxth              r1, r1
        cmp               r1, r2
        bgt               0f
        mov               r1, r2
0:
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_max::i16::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsh             r2, [r0, r2]
        sxth              r1, r1
        cmp               r1, r2
        bgt               0f
        mov               r1, r2
0:
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_max::i32::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r1, r0
        bgt               0f
        mov               r1, r0
0:
        str               r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_max::i32::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r1, r0
        bgt               0f
        mov               r1, r0
0:
        str               r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_max::i32::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r1, r0
        bgt               0f
        mov               r1, r0
0:
        str               r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_max::i32::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r1, r0
        bgt               0f
        mov               r1, r0
0:
        str               r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_max::i32::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r1, r0
        bgt               0f
        mov               r1, r0
0:
        str               r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_min::i8::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsb             r2, [r0, r2]
        sxtb              r1, r1
        cmp               r1, r2
        blt               0f
        mov               r1, r2
0:
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_min::i8::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsb             r2, [r0, r2]
        sxtb              r1, r1
        cmp               r1, r2
        blt               0f
        mov               r1, r2
0:
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_min::i8::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsb             r2, [r0, r2]
        sxtb              r1, r1
        cmp               r1, r2
        blt               0f
        mov               r1, r2
0:
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_min::i8::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsb             r2, [r0, r2]
        sxtb              r1, r1
        cmp               r1, r2
        blt               0f
        mov               r1, r2
0:
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_min::i8::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsb             r2, [r0, r2]
        sxtb              r1, r1
        cmp               r1, r2
        blt               0f
        mov               r1, r2
0:
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_min::i16::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsh             r2, [r0, r2]
        sxth              r1, r1
        cmp               r1, r2
        blt               0f
        mov               r1, r2
0:
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_min::i16::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsh             r2, [r0, r2]
        sxth              r1, r1
        cmp               r1, r2
        blt               0f
        mov               r1, r2
0:
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_min::i16::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsh             r2, [r0, r2]
        sxth              r1, r1
        cmp               r1, r2
        blt               0f
        mov               r1, r2
0:
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_min::i16::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsh             r2, [r0, r2]
        sxth              r1, r1
        cmp               r1, r2
        blt               0f
        mov               r1, r2
0:
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_min::i16::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        movs              r2, #0x0
        ldrsh             r2, [r0, r2]
        sxth              r1, r1
        cmp               r1, r2
        blt               0f
        mov               r1, r2
0:
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_min::i32::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r1, r0
        blt               0f
        mov               r1, r0
0:
        str               r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_min::i32::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r1, r0
        blt               0f
        mov               r1, r0
0:
        str               r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_min::i32::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r1, r0
        blt               0f
        mov               r1, r0
0:
        str               r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_min::i32::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r1, r0
        blt               0f
        mov               r1, r0
0:
        str               r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_min::i32::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mov               r2, r0
        mrs               r3, primask
        cpsid             i
        ldr               r0, [r0]
        cmp               r1, r0
        blt               0f
        mov               r1, r0
0:
        str               r1, [r2]
        msr               primask, r3
        pop               {r7, pc}

asm_test::fetch_neg::u8::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        rsbs              r3, r1, #0
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r7, pc}

asm_test::fetch_neg::u8::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        rsbs              r3, r1, #0
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r7, pc}

asm_test::fetch_neg::u8::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        rsbs              r3, r1, #0
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r7, pc}

asm_test::fetch_neg::u8::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        rsbs              r3, r1, #0
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r7, pc}

asm_test::fetch_neg::u8::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        rsbs              r3, r1, #0
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r7, pc}

asm_test::fetch_neg::u16::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        rsbs              r3, r1, #0
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r7, pc}

asm_test::fetch_neg::u16::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        rsbs              r3, r1, #0
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r7, pc}

asm_test::fetch_neg::u16::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        rsbs              r3, r1, #0
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r7, pc}

asm_test::fetch_neg::u16::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        rsbs              r3, r1, #0
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r7, pc}

asm_test::fetch_neg::u16::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        rsbs              r3, r1, #0
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r7, pc}

asm_test::fetch_neg::u32::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        rsbs              r3, r1, #0
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r7, pc}

asm_test::fetch_neg::u32::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        rsbs              r3, r1, #0
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r7, pc}

asm_test::fetch_neg::u32::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        rsbs              r3, r1, #0
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r7, pc}

asm_test::fetch_neg::u32::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        rsbs              r3, r1, #0
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r7, pc}

asm_test::fetch_neg::u32::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        rsbs              r3, r1, #0
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r7, pc}

asm_test::fetch_not::u8::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        mvns              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r7, pc}

asm_test::fetch_not::u8::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        mvns              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r7, pc}

asm_test::fetch_not::u8::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        mvns              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r7, pc}

asm_test::fetch_not::u8::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        mvns              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r7, pc}

asm_test::fetch_not::u8::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrb              r1, [r0]
        mvns              r3, r1
        strb              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r7, pc}

asm_test::fetch_not::u16::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        mvns              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r7, pc}

asm_test::fetch_not::u16::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        mvns              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r7, pc}

asm_test::fetch_not::u16::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        mvns              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r7, pc}

asm_test::fetch_not::u16::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        mvns              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r7, pc}

asm_test::fetch_not::u16::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldrh              r1, [r0]
        mvns              r3, r1
        strh              r3, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r7, pc}

asm_test::fetch_not::u32::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        mvns              r3, r1
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r7, pc}

asm_test::fetch_not::u32::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        mvns              r3, r1
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r7, pc}

asm_test::fetch_not::u32::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        mvns              r3, r1
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r7, pc}

asm_test::fetch_not::u32::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        mvns              r3, r1
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r7, pc}

asm_test::fetch_not::u32::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r2, primask
        cpsid             i
        ldr               r1, [r0]
        mvns              r3, r1
        str               r3, [r0]
        msr               primask, r2
        mov               r0, r1
        pop               {r7, pc}

asm_test::fetch_sub::u8::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        subs              r1, r2, r1
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_sub::u8::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        subs              r1, r2, r1
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_sub::u8::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        subs              r1, r2, r1
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_sub::u8::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        subs              r1, r2, r1
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_sub::u8::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        subs              r1, r2, r1
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_sub::u16::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        subs              r1, r2, r1
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_sub::u16::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        subs              r1, r2, r1
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_sub::u16::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        subs              r1, r2, r1
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_sub::u16::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        subs              r1, r2, r1
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_sub::u16::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        subs              r1, r2, r1
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_sub::u32::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        subs              r1, r2, r1
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_sub::u32::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        subs              r1, r2, r1
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_sub::u32::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        subs              r1, r2, r1
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_sub::u32::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        subs              r1, r2, r1
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_sub::u32::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        subs              r1, r2, r1
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_xor::u8::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        eors              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_xor::u8::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        eors              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_xor::u8::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        eors              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_xor::u8::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        eors              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_xor::u8::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrb              r2, [r0]
        eors              r1, r2
        strb              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_xor::u16::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        eors              r1, r2
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_xor::u16::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        eors              r1, r2
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_xor::u16::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        eors              r1, r2
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_xor::u16::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        eors              r1, r2
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_xor::u16::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldrh              r2, [r0]
        eors              r1, r2
        strh              r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_xor::u32::acqrel:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        eors              r1, r2
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_xor::u32::seqcst:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        eors              r1, r2
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_xor::u32::acquire:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        eors              r1, r2
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_xor::u32::relaxed:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        eors              r1, r2
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}

asm_test::fetch_xor::u32::release:
        push              {r7, lr}
        add               r7, sp, #0x0
        mrs               r3, primask
        cpsid             i
        ldr               r2, [r0]
        eors              r1, r2
        str               r1, [r0]
        msr               primask, r3
        mov               r0, r2
        pop               {r7, pc}


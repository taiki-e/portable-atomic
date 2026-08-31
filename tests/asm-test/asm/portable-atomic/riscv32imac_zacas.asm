asm_test::fence::acqrel:
        fence.tso
        ret

asm_test::fence::seqcst:
        fence             rw, rw
        ret

asm_test::fence::acquire:
        fence             r, rw
        ret

asm_test::fence::release:
        fence             rw, w
        ret

asm_test::bit_toggle::u8::acqrel:
        andi              a1, a1, 0x7
        li                a2, 0x1
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a1, a2
        amoxor.w.aqrl     a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_toggle::u8::seqcst:
        andi              a1, a1, 0x7
        li                a2, 0x1
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a1, a2
        amoxor.w.aqrl     a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_toggle::u8::acquire:
        andi              a1, a1, 0x7
        li                a2, 0x1
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a1, a2
        amoxor.w.aq       a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_toggle::u8::relaxed:
        andi              a1, a1, 0x7
        li                a2, 0x1
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a1, a2
        amoxor.w          a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_toggle::u8::release:
        andi              a1, a1, 0x7
        li                a2, 0x1
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a1, a2
        amoxor.w.rl       a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_toggle::u16::acqrel:
        andi              a1, a1, 0xf
        li                a2, 0x1
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a1, a2
        amoxor.w.aqrl     a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_toggle::u16::seqcst:
        andi              a1, a1, 0xf
        li                a2, 0x1
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a1, a2
        amoxor.w.aqrl     a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_toggle::u16::acquire:
        andi              a1, a1, 0xf
        li                a2, 0x1
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a1, a2
        amoxor.w.aq       a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_toggle::u16::relaxed:
        andi              a1, a1, 0xf
        li                a2, 0x1
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a1, a2
        amoxor.w          a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_toggle::u16::release:
        andi              a1, a1, 0xf
        li                a2, 0x1
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a1, a2
        amoxor.w.rl       a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_toggle::u32::acqrel:
        li                a2, 0x1
        sll               a1, a2, a1
        amoxor.w.aqrl     a0, a1, (a0)
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_toggle::u32::seqcst:
        li                a2, 0x1
        sll               a1, a2, a1
        amoxor.w.aqrl     a0, a1, (a0)
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_toggle::u32::acquire:
        li                a2, 0x1
        sll               a1, a2, a1
        amoxor.w.aq       a0, a1, (a0)
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_toggle::u32::relaxed:
        li                a2, 0x1
        sll               a1, a2, a1
        amoxor.w          a0, a1, (a0)
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_toggle::u32::release:
        li                a2, 0x1
        sll               a1, a2, a1
        amoxor.w.rl       a0, a1, (a0)
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_toggle::u64::acqrel:
        andi              a2, a1, 0x3f
        li                a3, 0x1
        addi              a4, a2, -0x20
        sll               a1, a3, a1
        srli              a6, a4, 0x1f
        sll               a2, a3, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        neg               a3, a6
        addi              a6, a6, -0x1
        and               a7, a3, a1
        and               t0, a6, a2
0:
        mv                a1, a4
        mv                a6, a5
        xor               a2, a4, a7
        xor               a3, a5, t0
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a6
        xor               a3, a4, a1
        or                a2, a2, a3
        bnez              a2, 0b
        and               a0, a1, a7
        and               a1, a6, t0
        or                a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_toggle::u64::seqcst:
        andi              a2, a1, 0x3f
        li                a3, 0x1
        addi              a4, a2, -0x20
        sll               a1, a3, a1
        srli              a6, a4, 0x1f
        sll               a2, a3, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        neg               a3, a6
        addi              a6, a6, -0x1
        and               a7, a3, a1
        and               t0, a6, a2
0:
        mv                a1, a4
        mv                a6, a5
        xor               a2, a4, a7
        xor               a3, a5, t0
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a6
        xor               a3, a4, a1
        or                a2, a2, a3
        bnez              a2, 0b
        and               a0, a1, a7
        and               a1, a6, t0
        or                a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_toggle::u64::acquire:
        andi              a2, a1, 0x3f
        li                a3, 0x1
        addi              a4, a2, -0x20
        sll               a1, a3, a1
        srli              a6, a4, 0x1f
        sll               a2, a3, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        neg               a3, a6
        addi              a6, a6, -0x1
        and               a7, a3, a1
        and               t0, a6, a2
0:
        mv                a1, a4
        mv                a6, a5
        xor               a2, a4, a7
        xor               a3, a5, t0
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a5, a6
        xor               a3, a4, a1
        or                a2, a2, a3
        bnez              a2, 0b
        and               a0, a1, a7
        and               a1, a6, t0
        or                a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_toggle::u64::relaxed:
        andi              a2, a1, 0x3f
        li                a3, 0x1
        addi              a4, a2, -0x20
        sll               a1, a3, a1
        srli              a6, a4, 0x1f
        sll               a2, a3, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        neg               a3, a6
        addi              a6, a6, -0x1
        and               a7, a3, a1
        and               t0, a6, a2
0:
        mv                a1, a4
        mv                a6, a5
        xor               a2, a4, a7
        xor               a3, a5, t0
        amocas.d          a4, a2, (a0)
        xor               a2, a5, a6
        xor               a3, a4, a1
        or                a2, a2, a3
        bnez              a2, 0b
        and               a0, a1, a7
        and               a1, a6, t0
        or                a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_toggle::u64::release:
        andi              a2, a1, 0x3f
        li                a3, 0x1
        addi              a4, a2, -0x20
        sll               a1, a3, a1
        srli              a6, a4, 0x1f
        sll               a2, a3, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        neg               a3, a6
        addi              a6, a6, -0x1
        and               a7, a3, a1
        and               t0, a6, a2
0:
        mv                a1, a4
        mv                a6, a5
        xor               a2, a4, a7
        xor               a3, a5, t0
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a5, a6
        xor               a3, a4, a1
        or                a2, a2, a3
        bnez              a2, 0b
        and               a0, a1, a7
        and               a1, a6, t0
        or                a0, a0, a1
        snez              a0, a0
        ret

asm_test::fetch_nand::u8::acqrel_all:
        li                a1, 0xff
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
0:
        lr.w.aq           a3, (a0)
        and               a4, a3, a1
        not               a4, a4
        xor               a4, a4, a3
        and               a4, a4, a1
        xor               a4, a4, a3
        sc.w.rl           a4, a4, (a0)
        bnez              a4, 0b
        srl               a0, a3, a2
        ret

asm_test::fetch_nand::u8::seqcst_all:
        li                a1, 0xff
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
0:
        lr.w.aqrl         a3, (a0)
        and               a4, a3, a1
        not               a4, a4
        xor               a4, a4, a3
        and               a4, a4, a1
        xor               a4, a4, a3
        sc.w.rl           a4, a4, (a0)
        bnez              a4, 0b
        srl               a0, a3, a2
        ret

asm_test::fetch_nand::u8::acqrel_zero:
        li                a1, 0xff
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
0:
        lr.w.aq           a3, (a0)
        and               a4, a3, zero
        not               a4, a4
        xor               a4, a4, a3
        and               a4, a4, a1
        xor               a4, a4, a3
        sc.w.rl           a4, a4, (a0)
        bnez              a4, 0b
        srl               a0, a3, a2
        ret

asm_test::fetch_nand::u8::acquire_all:
        li                a1, 0xff
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
0:
        lr.w.aq           a3, (a0)
        and               a4, a3, a1
        not               a4, a4
        xor               a4, a4, a3
        and               a4, a4, a1
        xor               a4, a4, a3
        sc.w              a4, a4, (a0)
        bnez              a4, 0b
        srl               a0, a3, a2
        ret

asm_test::fetch_nand::u8::relaxed_all:
        li                a1, 0xff
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
0:
        lr.w              a3, (a0)
        and               a4, a3, a1
        not               a4, a4
        xor               a4, a4, a3
        and               a4, a4, a1
        xor               a4, a4, a3
        sc.w              a4, a4, (a0)
        bnez              a4, 0b
        srl               a0, a3, a2
        ret

asm_test::fetch_nand::u8::release_all:
        li                a1, 0xff
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
0:
        lr.w              a3, (a0)
        and               a4, a3, a1
        not               a4, a4
        xor               a4, a4, a3
        and               a4, a4, a1
        xor               a4, a4, a3
        sc.w.rl           a4, a4, (a0)
        bnez              a4, 0b
        srl               a0, a3, a2
        ret

asm_test::fetch_nand::u8::seqcst_zero:
        li                a1, 0xff
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
0:
        lr.w.aqrl         a3, (a0)
        and               a4, a3, zero
        not               a4, a4
        xor               a4, a4, a3
        and               a4, a4, a1
        xor               a4, a4, a3
        sc.w.rl           a4, a4, (a0)
        bnez              a4, 0b
        srl               a0, a3, a2
        ret

asm_test::fetch_nand::u8::acquire_zero:
        li                a1, 0xff
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
0:
        lr.w.aq           a3, (a0)
        and               a4, a3, zero
        not               a4, a4
        xor               a4, a4, a3
        and               a4, a4, a1
        xor               a4, a4, a3
        sc.w              a4, a4, (a0)
        bnez              a4, 0b
        srl               a0, a3, a2
        ret

asm_test::fetch_nand::u8::relaxed_zero:
        li                a1, 0xff
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
0:
        lr.w              a3, (a0)
        and               a4, a3, zero
        not               a4, a4
        xor               a4, a4, a3
        and               a4, a4, a1
        xor               a4, a4, a3
        sc.w              a4, a4, (a0)
        bnez              a4, 0b
        srl               a0, a3, a2
        ret

asm_test::fetch_nand::u8::release_zero:
        li                a1, 0xff
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
0:
        lr.w              a3, (a0)
        and               a4, a3, zero
        not               a4, a4
        xor               a4, a4, a3
        and               a4, a4, a1
        xor               a4, a4, a3
        sc.w.rl           a4, a4, (a0)
        bnez              a4, 0b
        srl               a0, a3, a2
        ret

asm_test::fetch_nand::u8::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w.aq           a4, (a2)
        and               a5, a4, a1
        not               a5, a5
        xor               a5, a5, a4
        and               a5, a5, a3
        xor               a5, a5, a4
        sc.w.rl           a5, a5, (a2)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_nand::u8::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w.aqrl         a4, (a2)
        and               a5, a4, a1
        not               a5, a5
        xor               a5, a5, a4
        and               a5, a5, a3
        xor               a5, a5, a4
        sc.w.rl           a5, a5, (a2)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_nand::u8::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w.aq           a4, (a2)
        and               a5, a4, a1
        not               a5, a5
        xor               a5, a5, a4
        and               a5, a5, a3
        xor               a5, a5, a4
        sc.w              a5, a5, (a2)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_nand::u8::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w              a4, (a2)
        and               a5, a4, a1
        not               a5, a5
        xor               a5, a5, a4
        and               a5, a5, a3
        xor               a5, a5, a4
        sc.w              a5, a5, (a2)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_nand::u8::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w              a4, (a2)
        and               a5, a4, a1
        not               a5, a5
        xor               a5, a5, a4
        and               a5, a5, a3
        xor               a5, a5, a4
        sc.w.rl           a5, a5, (a2)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_nand::u16::acqrel_all:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x4
        sll               a1, a1, a2
0:
        lr.w.aq           a3, (a0)
        and               a4, a3, a1
        not               a4, a4
        xor               a4, a4, a3
        and               a4, a4, a1
        xor               a4, a4, a3
        sc.w.rl           a4, a4, (a0)
        bnez              a4, 0b
        srl               a0, a3, a2
        ret

asm_test::fetch_nand::u16::seqcst_all:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x4
        sll               a1, a1, a2
0:
        lr.w.aqrl         a3, (a0)
        and               a4, a3, a1
        not               a4, a4
        xor               a4, a4, a3
        and               a4, a4, a1
        xor               a4, a4, a3
        sc.w.rl           a4, a4, (a0)
        bnez              a4, 0b
        srl               a0, a3, a2
        ret

asm_test::fetch_nand::u16::acqrel_zero:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x4
        sll               a1, a1, a2
0:
        lr.w.aq           a3, (a0)
        and               a4, a3, zero
        not               a4, a4
        xor               a4, a4, a3
        and               a4, a4, a1
        xor               a4, a4, a3
        sc.w.rl           a4, a4, (a0)
        bnez              a4, 0b
        srl               a0, a3, a2
        ret

asm_test::fetch_nand::u16::acquire_all:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x4
        sll               a1, a1, a2
0:
        lr.w.aq           a3, (a0)
        and               a4, a3, a1
        not               a4, a4
        xor               a4, a4, a3
        and               a4, a4, a1
        xor               a4, a4, a3
        sc.w              a4, a4, (a0)
        bnez              a4, 0b
        srl               a0, a3, a2
        ret

asm_test::fetch_nand::u16::relaxed_all:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x4
        sll               a1, a1, a2
0:
        lr.w              a3, (a0)
        and               a4, a3, a1
        not               a4, a4
        xor               a4, a4, a3
        and               a4, a4, a1
        xor               a4, a4, a3
        sc.w              a4, a4, (a0)
        bnez              a4, 0b
        srl               a0, a3, a2
        ret

asm_test::fetch_nand::u16::release_all:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x4
        sll               a1, a1, a2
0:
        lr.w              a3, (a0)
        and               a4, a3, a1
        not               a4, a4
        xor               a4, a4, a3
        and               a4, a4, a1
        xor               a4, a4, a3
        sc.w.rl           a4, a4, (a0)
        bnez              a4, 0b
        srl               a0, a3, a2
        ret

asm_test::fetch_nand::u16::seqcst_zero:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x4
        sll               a1, a1, a2
0:
        lr.w.aqrl         a3, (a0)
        and               a4, a3, zero
        not               a4, a4
        xor               a4, a4, a3
        and               a4, a4, a1
        xor               a4, a4, a3
        sc.w.rl           a4, a4, (a0)
        bnez              a4, 0b
        srl               a0, a3, a2
        ret

asm_test::fetch_nand::u16::acquire_zero:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x4
        sll               a1, a1, a2
0:
        lr.w.aq           a3, (a0)
        and               a4, a3, zero
        not               a4, a4
        xor               a4, a4, a3
        and               a4, a4, a1
        xor               a4, a4, a3
        sc.w              a4, a4, (a0)
        bnez              a4, 0b
        srl               a0, a3, a2
        ret

asm_test::fetch_nand::u16::relaxed_zero:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x4
        sll               a1, a1, a2
0:
        lr.w              a3, (a0)
        and               a4, a3, zero
        not               a4, a4
        xor               a4, a4, a3
        and               a4, a4, a1
        xor               a4, a4, a3
        sc.w              a4, a4, (a0)
        bnez              a4, 0b
        srl               a0, a3, a2
        ret

asm_test::fetch_nand::u16::release_zero:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x4
        sll               a1, a1, a2
0:
        lr.w              a3, (a0)
        and               a4, a3, zero
        not               a4, a4
        xor               a4, a4, a3
        and               a4, a4, a1
        xor               a4, a4, a3
        sc.w.rl           a4, a4, (a0)
        bnez              a4, 0b
        srl               a0, a3, a2
        ret

asm_test::fetch_nand::u16::acqrel:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a1, a1, a0
0:
        lr.w.aq           a4, (a3)
        and               a5, a4, a1
        not               a5, a5
        xor               a5, a5, a4
        and               a5, a5, a2
        xor               a5, a5, a4
        sc.w.rl           a5, a5, (a3)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_nand::u16::seqcst:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a1, a1, a0
0:
        lr.w.aqrl         a4, (a3)
        and               a5, a4, a1
        not               a5, a5
        xor               a5, a5, a4
        and               a5, a5, a2
        xor               a5, a5, a4
        sc.w.rl           a5, a5, (a3)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_nand::u16::acquire:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a1, a1, a0
0:
        lr.w.aq           a4, (a3)
        and               a5, a4, a1
        not               a5, a5
        xor               a5, a5, a4
        and               a5, a5, a2
        xor               a5, a5, a4
        sc.w              a5, a5, (a3)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_nand::u16::relaxed:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a1, a1, a0
0:
        lr.w              a4, (a3)
        and               a5, a4, a1
        not               a5, a5
        xor               a5, a5, a4
        and               a5, a5, a2
        xor               a5, a5, a4
        sc.w              a5, a5, (a3)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_nand::u16::release:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a1, a1, a0
0:
        lr.w              a4, (a3)
        and               a5, a4, a1
        not               a5, a5
        xor               a5, a5, a4
        and               a5, a5, a2
        xor               a5, a5, a4
        sc.w.rl           a5, a5, (a3)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_nand::u32::acqrel_all:
        mv                a1, a0
        lw                a0, 0x0(a0)
0:
        mv                a2, a0
        not               a3, a0
        amocas.w.aqrl     a0, a3, (a1)
        bne               a0, a2, 0b
        ret

asm_test::fetch_nand::u32::seqcst_all:
        mv                a1, a0
        lw                a0, 0x0(a0)
0:
        mv                a2, a0
        not               a3, a0
        fence             rw, rw
        amocas.w.aqrl     a0, a3, (a1)
        bne               a0, a2, 0b
        ret

asm_test::fetch_nand::u32::acqrel_zero:
        mv                a1, a0
        lw                a0, 0x0(a0)
        li                a2, -0x1
0:
        mv                a3, a0
        amocas.w.aqrl     a0, a2, (a1)
        bne               a0, a3, 0b
        ret

asm_test::fetch_nand::u32::acquire_all:
        mv                a1, a0
        lw                a0, 0x0(a0)
0:
        mv                a2, a0
        not               a3, a0
        amocas.w.aq       a0, a3, (a1)
        bne               a0, a2, 0b
        ret

asm_test::fetch_nand::u32::relaxed_all:
        mv                a1, a0
        lw                a0, 0x0(a0)
0:
        mv                a2, a0
        not               a3, a0
        amocas.w          a0, a3, (a1)
        bne               a0, a2, 0b
        ret

asm_test::fetch_nand::u32::release_all:
        mv                a1, a0
        lw                a0, 0x0(a0)
0:
        mv                a2, a0
        not               a3, a0
        amocas.w.rl       a0, a3, (a1)
        bne               a0, a2, 0b
        ret

asm_test::fetch_nand::u32::seqcst_zero:
        mv                a1, a0
        lw                a0, 0x0(a0)
        li                a2, -0x1
0:
        mv                a3, a0
        fence             rw, rw
        amocas.w.aqrl     a0, a2, (a1)
        bne               a0, a3, 0b
        ret

asm_test::fetch_nand::u32::acquire_zero:
        mv                a1, a0
        lw                a0, 0x0(a0)
        li                a2, -0x1
0:
        mv                a3, a0
        amocas.w.aq       a0, a2, (a1)
        bne               a0, a3, 0b
        ret

asm_test::fetch_nand::u32::relaxed_zero:
        mv                a1, a0
        lw                a0, 0x0(a0)
        li                a2, -0x1
0:
        mv                a3, a0
        amocas.w          a0, a2, (a1)
        bne               a0, a3, 0b
        ret

asm_test::fetch_nand::u32::release_zero:
        mv                a1, a0
        lw                a0, 0x0(a0)
        li                a2, -0x1
0:
        mv                a3, a0
        amocas.w.rl       a0, a2, (a1)
        bne               a0, a3, 0b
        ret

asm_test::fetch_nand::u32::acqrel:
        mv                a2, a0
        lw                a0, 0x0(a0)
0:
        mv                a3, a0
        and               a4, a0, a1
        not               a4, a4
        amocas.w.aqrl     a0, a4, (a2)
        bne               a0, a3, 0b
        ret

asm_test::fetch_nand::u32::seqcst:
        mv                a2, a0
        lw                a0, 0x0(a0)
0:
        mv                a3, a0
        and               a4, a0, a1
        not               a4, a4
        fence             rw, rw
        amocas.w.aqrl     a0, a4, (a2)
        bne               a0, a3, 0b
        ret

asm_test::fetch_nand::u32::acquire:
        mv                a2, a0
        lw                a0, 0x0(a0)
0:
        mv                a3, a0
        and               a4, a0, a1
        not               a4, a4
        amocas.w.aq       a0, a4, (a2)
        bne               a0, a3, 0b
        ret

asm_test::fetch_nand::u32::relaxed:
        mv                a2, a0
        lw                a0, 0x0(a0)
0:
        mv                a3, a0
        and               a4, a0, a1
        not               a4, a4
        amocas.w          a0, a4, (a2)
        bne               a0, a3, 0b
        ret

asm_test::fetch_nand::u32::release:
        mv                a2, a0
        lw                a0, 0x0(a0)
0:
        mv                a3, a0
        and               a4, a0, a1
        not               a4, a4
        amocas.w.rl       a0, a4, (a2)
        bne               a0, a3, 0b
        ret

asm_test::fetch_nand::u64::acqrel_all:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a1, a4
        mv                a6, a5
        not               a2, a4
        not               a3, a5
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a6
        xor               a3, a4, a1
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a1
        mv                a1, a6
        ret

asm_test::fetch_nand::u64::seqcst_all:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a1, a4
        mv                a6, a5
        not               a2, a4
        not               a3, a5
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a6
        xor               a3, a4, a1
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a1
        mv                a1, a6
        ret

asm_test::fetch_nand::u64::acqrel_zero:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a1, a5
        mv                a6, a4
        li                a2, -0x1
        li                a3, -0x1
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a1
        xor               a3, a4, a6
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a6
        ret

asm_test::fetch_nand::u64::acquire_all:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a1, a4
        mv                a6, a5
        not               a2, a4
        not               a3, a5
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a5, a6
        xor               a3, a4, a1
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a1
        mv                a1, a6
        ret

asm_test::fetch_nand::u64::relaxed_all:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a1, a4
        mv                a6, a5
        not               a2, a4
        not               a3, a5
        amocas.d          a4, a2, (a0)
        xor               a2, a5, a6
        xor               a3, a4, a1
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a1
        mv                a1, a6
        ret

asm_test::fetch_nand::u64::release_all:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a1, a4
        mv                a6, a5
        not               a2, a4
        not               a3, a5
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a5, a6
        xor               a3, a4, a1
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a1
        mv                a1, a6
        ret

asm_test::fetch_nand::u64::seqcst_zero:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a1, a5
        mv                a6, a4
        li                a2, -0x1
        li                a3, -0x1
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a1
        xor               a3, a4, a6
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a6
        ret

asm_test::fetch_nand::u64::acquire_zero:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a1, a5
        mv                a6, a4
        li                a2, -0x1
        li                a3, -0x1
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a5, a1
        xor               a3, a4, a6
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a6
        ret

asm_test::fetch_nand::u64::relaxed_zero:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a1, a5
        mv                a6, a4
        li                a2, -0x1
        li                a3, -0x1
        amocas.d          a4, a2, (a0)
        xor               a2, a5, a1
        xor               a3, a4, a6
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a6
        ret

asm_test::fetch_nand::u64::release_zero:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a1, a5
        mv                a6, a4
        li                a2, -0x1
        li                a3, -0x1
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a5, a1
        xor               a3, a4, a6
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a6
        ret

asm_test::fetch_nand::u64::acqrel:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a4
        mv                t0, a5
        and               a2, a4, a1
        and               a3, a5, a6
        not               a2, a2
        not               a3, a3
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a7
        mv                a1, t0
        ret

asm_test::fetch_nand::u64::seqcst:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a4
        mv                t0, a5
        and               a2, a4, a1
        and               a3, a5, a6
        not               a2, a2
        not               a3, a3
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a7
        mv                a1, t0
        ret

asm_test::fetch_nand::u64::acquire:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a4
        mv                t0, a5
        and               a2, a4, a1
        and               a3, a5, a6
        not               a2, a2
        not               a3, a3
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a7
        mv                a1, t0
        ret

asm_test::fetch_nand::u64::relaxed:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a4
        mv                t0, a5
        and               a2, a4, a1
        and               a3, a5, a6
        not               a2, a2
        not               a3, a3
        amocas.d          a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a7
        mv                a1, t0
        ret

asm_test::fetch_nand::u64::release:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a4
        mv                t0, a5
        and               a2, a4, a1
        and               a3, a5, a6
        not               a2, a2
        not               a3, a3
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a7
        mv                a1, t0
        ret

asm_test::fetch_nand::bool::acqrel_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_nand::bool::seqcst_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_nand::bool::acqrel_false:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_nand::bool::acquire_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aq       a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_nand::bool::relaxed_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w          a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_nand::bool::release_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.rl       a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_nand::bool::seqcst_false:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_nand::bool::acquire_false:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_nand::bool::relaxed_false:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w           a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_nand::bool::release_false:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.rl        a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_nand::bool::acqrel:
        beqz              a1, 0f
        slli              a1, a0, 0x3
        li                a2, 0x1
        andi              a0, a0, -0x4
        sll               a2, a2, a1
        amoxor.w.aqrl     a0, a2, (a0)
        srl               a0, a0, a1
        andi              a0, a0, 0x1
        ret
0:
        slli              a1, a0, 0x3
        li                a2, 0x1
        andi              a0, a0, -0x4
        sll               a2, a2, a1
        amoor.w.aqrl      a0, a2, (a0)
        srl               a0, a0, a1
        andi              a0, a0, 0x1
        ret

asm_test::fetch_nand::bool::seqcst:
        beqz              a1, 0f
        slli              a1, a0, 0x3
        li                a2, 0x1
        andi              a0, a0, -0x4
        sll               a2, a2, a1
        amoxor.w.aqrl     a0, a2, (a0)
        srl               a0, a0, a1
        andi              a0, a0, 0x1
        ret
0:
        slli              a1, a0, 0x3
        li                a2, 0x1
        andi              a0, a0, -0x4
        sll               a2, a2, a1
        amoor.w.aqrl      a0, a2, (a0)
        srl               a0, a0, a1
        andi              a0, a0, 0x1
        ret

asm_test::fetch_nand::bool::acquire:
        beqz              a1, 0f
        slli              a1, a0, 0x3
        li                a2, 0x1
        andi              a0, a0, -0x4
        sll               a2, a2, a1
        amoxor.w.aq       a0, a2, (a0)
        srl               a0, a0, a1
        andi              a0, a0, 0x1
        ret
0:
        slli              a1, a0, 0x3
        li                a2, 0x1
        andi              a0, a0, -0x4
        sll               a2, a2, a1
        amoor.w.aq        a0, a2, (a0)
        srl               a0, a0, a1
        andi              a0, a0, 0x1
        ret

asm_test::fetch_nand::bool::relaxed:
        beqz              a1, 0f
        slli              a1, a0, 0x3
        li                a2, 0x1
        andi              a0, a0, -0x4
        sll               a2, a2, a1
        amoxor.w          a0, a2, (a0)
        srl               a0, a0, a1
        andi              a0, a0, 0x1
        ret
0:
        slli              a1, a0, 0x3
        li                a2, 0x1
        andi              a0, a0, -0x4
        sll               a2, a2, a1
        amoor.w           a0, a2, (a0)
        srl               a0, a0, a1
        andi              a0, a0, 0x1
        ret

asm_test::fetch_nand::bool::release:
        beqz              a1, 0f
        slli              a1, a0, 0x3
        li                a2, 0x1
        andi              a0, a0, -0x4
        sll               a2, a2, a1
        amoxor.w.rl       a0, a2, (a0)
        srl               a0, a0, a1
        andi              a0, a0, 0x1
        ret
0:
        slli              a1, a0, 0x3
        li                a2, 0x1
        andi              a0, a0, -0x4
        sll               a2, a2, a1
        amoor.w.rl        a0, a2, (a0)
        srl               a0, a0, a1
        andi              a0, a0, 0x1
        ret

asm_test::fetch_umax::u8::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w.aq           a4, (a2)
        and               a6, a4, a3
        mv                a5, a4
        bgeu              a6, a1, 1f
        xor               a5, a4, a1
        and               a5, a5, a3
        xor               a5, a5, a4
1:
        sc.w.rl           a5, a5, (a2)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umax::u8::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w.aqrl         a4, (a2)
        and               a6, a4, a3
        mv                a5, a4
        bgeu              a6, a1, 1f
        xor               a5, a4, a1
        and               a5, a5, a3
        xor               a5, a5, a4
1:
        sc.w.rl           a5, a5, (a2)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umax::u8::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w.aq           a4, (a2)
        and               a6, a4, a3
        mv                a5, a4
        bgeu              a6, a1, 1f
        xor               a5, a4, a1
        and               a5, a5, a3
        xor               a5, a5, a4
1:
        sc.w              a5, a5, (a2)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umax::u8::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w              a4, (a2)
        and               a6, a4, a3
        mv                a5, a4
        bgeu              a6, a1, 1f
        xor               a5, a4, a1
        and               a5, a5, a3
        xor               a5, a5, a4
1:
        sc.w              a5, a5, (a2)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umax::u8::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w              a4, (a2)
        and               a6, a4, a3
        mv                a5, a4
        bgeu              a6, a1, 1f
        xor               a5, a4, a1
        and               a5, a5, a3
        xor               a5, a5, a4
1:
        sc.w.rl           a5, a5, (a2)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umax::u16::acqrel:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a1, a1, a0
0:
        lr.w.aq           a4, (a3)
        and               a6, a4, a2
        mv                a5, a4
        bgeu              a6, a1, 1f
        xor               a5, a4, a1
        and               a5, a5, a2
        xor               a5, a5, a4
1:
        sc.w.rl           a5, a5, (a3)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umax::u16::seqcst:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a1, a1, a0
0:
        lr.w.aqrl         a4, (a3)
        and               a6, a4, a2
        mv                a5, a4
        bgeu              a6, a1, 1f
        xor               a5, a4, a1
        and               a5, a5, a2
        xor               a5, a5, a4
1:
        sc.w.rl           a5, a5, (a3)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umax::u16::acquire:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a1, a1, a0
0:
        lr.w.aq           a4, (a3)
        and               a6, a4, a2
        mv                a5, a4
        bgeu              a6, a1, 1f
        xor               a5, a4, a1
        and               a5, a5, a2
        xor               a5, a5, a4
1:
        sc.w              a5, a5, (a3)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umax::u16::relaxed:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a1, a1, a0
0:
        lr.w              a4, (a3)
        and               a6, a4, a2
        mv                a5, a4
        bgeu              a6, a1, 1f
        xor               a5, a4, a1
        and               a5, a5, a2
        xor               a5, a5, a4
1:
        sc.w              a5, a5, (a3)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umax::u16::release:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a1, a1, a0
0:
        lr.w              a4, (a3)
        and               a6, a4, a2
        mv                a5, a4
        bgeu              a6, a1, 1f
        xor               a5, a4, a1
        and               a5, a5, a2
        xor               a5, a5, a4
1:
        sc.w.rl           a5, a5, (a3)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umax::u32::acqrel:
        amomaxu.w.aqrl    a0, a1, (a0)
        ret

asm_test::fetch_umax::u32::seqcst:
        amomaxu.w.aqrl    a0, a1, (a0)
        ret

asm_test::fetch_umax::u32::acquire:
        amomaxu.w.aq      a0, a1, (a0)
        ret

asm_test::fetch_umax::u32::relaxed:
        amomaxu.w         a0, a1, (a0)
        ret

asm_test::fetch_umax::u32::release:
        amomaxu.w.rl      a0, a1, (a0)
        ret

asm_test::fetch_umax::u64::acqrel:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        j                 1f
0:
        mv                a5, a7
        mv                a4, t0
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a4, t0
        xor               a3, a5, a7
        or                a2, a2, a3
        beqz              a2, 4f
1:
        mv                a7, a5
        mv                t0, a4
        beq               a6, a5, 2f
        sltu              a4, a7, a6
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
        j                 3f
2:
        sltu              a4, t0, a1
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
3:
        mv                a2, t0
        mv                a3, a7
        j                 0b
4:
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_umax::u64::seqcst:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        j                 1f
0:
        mv                a5, a7
        mv                a4, t0
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a4, t0
        xor               a3, a5, a7
        or                a2, a2, a3
        beqz              a2, 4f
1:
        mv                a7, a5
        mv                t0, a4
        beq               a6, a5, 2f
        sltu              a4, a7, a6
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
        j                 3f
2:
        sltu              a4, t0, a1
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
3:
        mv                a2, t0
        mv                a3, a7
        j                 0b
4:
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_umax::u64::acquire:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        j                 1f
0:
        mv                a5, a7
        mv                a4, t0
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a4, t0
        xor               a3, a5, a7
        or                a2, a2, a3
        beqz              a2, 4f
1:
        mv                a7, a5
        mv                t0, a4
        beq               a6, a5, 2f
        sltu              a4, a7, a6
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
        j                 3f
2:
        sltu              a4, t0, a1
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
3:
        mv                a2, t0
        mv                a3, a7
        j                 0b
4:
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_umax::u64::relaxed:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        j                 1f
0:
        mv                a5, a7
        mv                a4, t0
        amocas.d          a4, a2, (a0)
        xor               a2, a4, t0
        xor               a3, a5, a7
        or                a2, a2, a3
        beqz              a2, 4f
1:
        mv                a7, a5
        mv                t0, a4
        beq               a6, a5, 2f
        sltu              a4, a7, a6
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
        j                 3f
2:
        sltu              a4, t0, a1
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
3:
        mv                a2, t0
        mv                a3, a7
        j                 0b
4:
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_umax::u64::release:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        j                 1f
0:
        mv                a5, a7
        mv                a4, t0
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a4, t0
        xor               a3, a5, a7
        or                a2, a2, a3
        beqz              a2, 4f
1:
        mv                a7, a5
        mv                t0, a4
        beq               a6, a5, 2f
        sltu              a4, a7, a6
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
        j                 3f
2:
        sltu              a4, t0, a1
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
3:
        mv                a2, t0
        mv                a3, a7
        j                 0b
4:
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_umin::u8::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w.aq           a4, (a2)
        and               a6, a4, a3
        mv                a5, a4
        bgeu              a1, a6, 1f
        xor               a5, a4, a1
        and               a5, a5, a3
        xor               a5, a5, a4
1:
        sc.w.rl           a5, a5, (a2)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umin::u8::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w.aqrl         a4, (a2)
        and               a6, a4, a3
        mv                a5, a4
        bgeu              a1, a6, 1f
        xor               a5, a4, a1
        and               a5, a5, a3
        xor               a5, a5, a4
1:
        sc.w.rl           a5, a5, (a2)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umin::u8::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w.aq           a4, (a2)
        and               a6, a4, a3
        mv                a5, a4
        bgeu              a1, a6, 1f
        xor               a5, a4, a1
        and               a5, a5, a3
        xor               a5, a5, a4
1:
        sc.w              a5, a5, (a2)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umin::u8::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w              a4, (a2)
        and               a6, a4, a3
        mv                a5, a4
        bgeu              a1, a6, 1f
        xor               a5, a4, a1
        and               a5, a5, a3
        xor               a5, a5, a4
1:
        sc.w              a5, a5, (a2)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umin::u8::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w              a4, (a2)
        and               a6, a4, a3
        mv                a5, a4
        bgeu              a1, a6, 1f
        xor               a5, a4, a1
        and               a5, a5, a3
        xor               a5, a5, a4
1:
        sc.w.rl           a5, a5, (a2)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umin::u16::acqrel:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a1, a1, a0
0:
        lr.w.aq           a4, (a3)
        and               a6, a4, a2
        mv                a5, a4
        bgeu              a1, a6, 1f
        xor               a5, a4, a1
        and               a5, a5, a2
        xor               a5, a5, a4
1:
        sc.w.rl           a5, a5, (a3)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umin::u16::seqcst:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a1, a1, a0
0:
        lr.w.aqrl         a4, (a3)
        and               a6, a4, a2
        mv                a5, a4
        bgeu              a1, a6, 1f
        xor               a5, a4, a1
        and               a5, a5, a2
        xor               a5, a5, a4
1:
        sc.w.rl           a5, a5, (a3)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umin::u16::acquire:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a1, a1, a0
0:
        lr.w.aq           a4, (a3)
        and               a6, a4, a2
        mv                a5, a4
        bgeu              a1, a6, 1f
        xor               a5, a4, a1
        and               a5, a5, a2
        xor               a5, a5, a4
1:
        sc.w              a5, a5, (a3)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umin::u16::relaxed:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a1, a1, a0
0:
        lr.w              a4, (a3)
        and               a6, a4, a2
        mv                a5, a4
        bgeu              a1, a6, 1f
        xor               a5, a4, a1
        and               a5, a5, a2
        xor               a5, a5, a4
1:
        sc.w              a5, a5, (a3)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umin::u16::release:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a1, a1, a0
0:
        lr.w              a4, (a3)
        and               a6, a4, a2
        mv                a5, a4
        bgeu              a1, a6, 1f
        xor               a5, a4, a1
        and               a5, a5, a2
        xor               a5, a5, a4
1:
        sc.w.rl           a5, a5, (a3)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umin::u32::acqrel:
        amominu.w.aqrl    a0, a1, (a0)
        ret

asm_test::fetch_umin::u32::seqcst:
        amominu.w.aqrl    a0, a1, (a0)
        ret

asm_test::fetch_umin::u32::acquire:
        amominu.w.aq      a0, a1, (a0)
        ret

asm_test::fetch_umin::u32::relaxed:
        amominu.w         a0, a1, (a0)
        ret

asm_test::fetch_umin::u32::release:
        amominu.w.rl      a0, a1, (a0)
        ret

asm_test::fetch_umin::u64::acqrel:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        j                 1f
0:
        mv                a5, a7
        mv                a4, t0
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a4, t0
        xor               a3, a5, a7
        or                a2, a2, a3
        beqz              a2, 4f
1:
        mv                a7, a5
        mv                t0, a4
        beq               a6, a5, 2f
        sltu              a4, a6, a7
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
        j                 3f
2:
        sltu              a4, a1, t0
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
3:
        mv                a2, t0
        mv                a3, a7
        j                 0b
4:
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_umin::u64::seqcst:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        j                 1f
0:
        mv                a5, a7
        mv                a4, t0
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a4, t0
        xor               a3, a5, a7
        or                a2, a2, a3
        beqz              a2, 4f
1:
        mv                a7, a5
        mv                t0, a4
        beq               a6, a5, 2f
        sltu              a4, a6, a7
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
        j                 3f
2:
        sltu              a4, a1, t0
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
3:
        mv                a2, t0
        mv                a3, a7
        j                 0b
4:
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_umin::u64::acquire:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        j                 1f
0:
        mv                a5, a7
        mv                a4, t0
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a4, t0
        xor               a3, a5, a7
        or                a2, a2, a3
        beqz              a2, 4f
1:
        mv                a7, a5
        mv                t0, a4
        beq               a6, a5, 2f
        sltu              a4, a6, a7
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
        j                 3f
2:
        sltu              a4, a1, t0
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
3:
        mv                a2, t0
        mv                a3, a7
        j                 0b
4:
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_umin::u64::relaxed:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        j                 1f
0:
        mv                a5, a7
        mv                a4, t0
        amocas.d          a4, a2, (a0)
        xor               a2, a4, t0
        xor               a3, a5, a7
        or                a2, a2, a3
        beqz              a2, 4f
1:
        mv                a7, a5
        mv                t0, a4
        beq               a6, a5, 2f
        sltu              a4, a6, a7
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
        j                 3f
2:
        sltu              a4, a1, t0
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
3:
        mv                a2, t0
        mv                a3, a7
        j                 0b
4:
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_umin::u64::release:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        j                 1f
0:
        mv                a5, a7
        mv                a4, t0
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a4, t0
        xor               a3, a5, a7
        or                a2, a2, a3
        beqz              a2, 4f
1:
        mv                a7, a5
        mv                t0, a4
        beq               a6, a5, 2f
        sltu              a4, a6, a7
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
        j                 3f
2:
        sltu              a4, a1, t0
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
3:
        mv                a2, t0
        mv                a3, a7
        j                 0b
4:
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::compare_exchange::u8::acqrel_seqcst:
        li                a3, 0xff
        slli              a4, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aqrl         a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange::u8::seqcst_seqcst:
        li                a3, 0xff
        slli              a4, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aqrl         a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange::u8::acqrel_acquire:
        li                a3, 0xff
        slli              a4, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aq           a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange::u8::acqrel_relaxed:
        li                a3, 0xff
        slli              a4, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aq           a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange::u8::acquire_seqcst:
        li                a3, 0xff
        slli              a4, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aqrl         a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange::u8::relaxed_seqcst:
        li                a3, 0xff
        slli              a4, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aqrl         a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange::u8::release_seqcst:
        li                a3, 0xff
        slli              a4, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aqrl         a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange::u8::seqcst_acquire:
        li                a3, 0xff
        slli              a4, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aqrl         a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange::u8::seqcst_relaxed:
        li                a3, 0xff
        slli              a4, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aqrl         a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange::u8::acquire_acquire:
        li                a3, 0xff
        slli              a4, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aq           a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w              a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange::u8::acquire_relaxed:
        li                a3, 0xff
        slli              a4, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aq           a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w              a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange::u8::relaxed_acquire:
        li                a3, 0xff
        slli              a4, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aq           a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w              a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange::u8::relaxed_relaxed:
        li                a3, 0xff
        slli              a4, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w              a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w              a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange::u8::release_acquire:
        li                a3, 0xff
        slli              a4, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aq           a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange::u8::release_relaxed:
        li                a3, 0xff
        slli              a4, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w              a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange::f32::acqrel_seqcst:
        mv                a3, a1
        fence             rw, rw
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::f32::seqcst_seqcst:
        mv                a3, a1
        fence             rw, rw
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::f32::acqrel_acquire:
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::f32::acqrel_relaxed:
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::f32::acquire_seqcst:
        mv                a3, a1
        fence             rw, rw
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::f32::relaxed_seqcst:
        mv                a3, a1
        fence             rw, rw
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::f32::release_seqcst:
        mv                a3, a1
        fence             rw, rw
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::f32::seqcst_acquire:
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::f32::seqcst_relaxed:
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::f32::acquire_acquire:
        mv                a3, a1
        amocas.w.aq       a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::f32::acquire_relaxed:
        mv                a3, a1
        amocas.w.aq       a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::f32::relaxed_acquire:
        mv                a3, a1
        amocas.w.aq       a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::f32::relaxed_relaxed:
        mv                a3, a1
        amocas.w          a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::f32::release_acquire:
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::f32::release_relaxed:
        mv                a3, a1
        amocas.w.rl       a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::f64::acqrel_seqcst:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        fence             rw, rw
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange::f64::seqcst_seqcst:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        fence             rw, rw
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange::f64::acqrel_acquire:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange::f64::acqrel_relaxed:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange::f64::acquire_seqcst:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        fence             rw, rw
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange::f64::relaxed_seqcst:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        fence             rw, rw
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange::f64::release_seqcst:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        fence             rw, rw
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange::f64::seqcst_acquire:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange::f64::seqcst_relaxed:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange::f64::acquire_acquire:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.aq       a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange::f64::acquire_relaxed:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.aq       a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange::f64::relaxed_acquire:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.aq       a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange::f64::relaxed_relaxed:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d          a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange::f64::release_acquire:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange::f64::release_relaxed:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.rl       a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange::u16::acqrel_seqcst:
        lui               a3, 0x10
        slli              a4, a0, 0x3
        addi              a3, a3, -0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aqrl         a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange::u16::seqcst_seqcst:
        lui               a3, 0x10
        slli              a4, a0, 0x3
        addi              a3, a3, -0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aqrl         a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange::u16::acqrel_acquire:
        lui               a3, 0x10
        slli              a4, a0, 0x3
        addi              a3, a3, -0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aq           a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange::u16::acqrel_relaxed:
        lui               a3, 0x10
        slli              a4, a0, 0x3
        addi              a3, a3, -0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aq           a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange::u16::acquire_seqcst:
        lui               a3, 0x10
        slli              a4, a0, 0x3
        addi              a3, a3, -0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aqrl         a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange::u16::relaxed_seqcst:
        lui               a3, 0x10
        slli              a4, a0, 0x3
        addi              a3, a3, -0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aqrl         a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange::u16::release_seqcst:
        lui               a3, 0x10
        slli              a4, a0, 0x3
        addi              a3, a3, -0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aqrl         a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange::u16::seqcst_acquire:
        lui               a3, 0x10
        slli              a4, a0, 0x3
        addi              a3, a3, -0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aqrl         a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange::u16::seqcst_relaxed:
        lui               a3, 0x10
        slli              a4, a0, 0x3
        addi              a3, a3, -0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aqrl         a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange::u16::acquire_acquire:
        lui               a3, 0x10
        slli              a4, a0, 0x3
        addi              a3, a3, -0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aq           a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w              a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange::u16::acquire_relaxed:
        lui               a3, 0x10
        slli              a4, a0, 0x3
        addi              a3, a3, -0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aq           a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w              a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange::u16::relaxed_acquire:
        lui               a3, 0x10
        slli              a4, a0, 0x3
        addi              a3, a3, -0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aq           a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w              a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange::u16::relaxed_relaxed:
        lui               a3, 0x10
        slli              a4, a0, 0x3
        addi              a3, a3, -0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w              a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w              a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange::u16::release_acquire:
        lui               a3, 0x10
        slli              a4, a0, 0x3
        addi              a3, a3, -0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aq           a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange::u16::release_relaxed:
        lui               a3, 0x10
        slli              a4, a0, 0x3
        addi              a3, a3, -0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w              a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange::u32::acqrel_seqcst:
        mv                a3, a1
        fence             rw, rw
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::seqcst_seqcst:
        mv                a3, a1
        fence             rw, rw
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::acqrel_acquire:
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::acqrel_relaxed:
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::acquire_seqcst:
        mv                a3, a1
        fence             rw, rw
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::relaxed_seqcst:
        mv                a3, a1
        fence             rw, rw
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::release_seqcst:
        mv                a3, a1
        fence             rw, rw
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::seqcst_acquire:
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::seqcst_relaxed:
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::acquire_acquire:
        mv                a3, a1
        amocas.w.aq       a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::acquire_relaxed:
        mv                a3, a1
        amocas.w.aq       a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::relaxed_acquire:
        mv                a3, a1
        amocas.w.aq       a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::relaxed_relaxed:
        mv                a3, a1
        amocas.w          a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::release_acquire:
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::release_relaxed:
        mv                a3, a1
        amocas.w.rl       a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u64::acqrel_seqcst:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        fence             rw, rw
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange::u64::seqcst_seqcst:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        fence             rw, rw
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange::u64::acqrel_acquire:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange::u64::acqrel_relaxed:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange::u64::acquire_seqcst:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        fence             rw, rw
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange::u64::relaxed_seqcst:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        fence             rw, rw
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange::u64::release_seqcst:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        fence             rw, rw
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange::u64::seqcst_acquire:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange::u64::seqcst_relaxed:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange::u64::acquire_acquire:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.aq       a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange::u64::acquire_relaxed:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.aq       a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange::u64::relaxed_acquire:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.aq       a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange::u64::relaxed_relaxed:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d          a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange::u64::release_acquire:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange::u64::release_relaxed:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.rl       a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange::bool::acqrel_seqcst:
        slli              a3, a0, 0x3
        beqz              a1, 0f
        li                a4, 0xff
        sll               a4, a4, a3
        not               a4, a4
        sll               a2, a2, a3
        andi              a0, a0, -0x4
        or                a2, a2, a4
        amoand.w.aqrl     a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a0, a0, -0x4
        sll               a2, a2, a3
        amoor.w.aqrl      a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::seqcst_seqcst:
        slli              a3, a0, 0x3
        beqz              a1, 0f
        li                a4, 0xff
        sll               a4, a4, a3
        not               a4, a4
        sll               a2, a2, a3
        andi              a0, a0, -0x4
        or                a2, a2, a4
        amoand.w.aqrl     a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a0, a0, -0x4
        sll               a2, a2, a3
        amoor.w.aqrl      a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::acqrel_acquire:
        slli              a3, a0, 0x3
        beqz              a1, 0f
        li                a4, 0xff
        sll               a4, a4, a3
        not               a4, a4
        sll               a2, a2, a3
        andi              a0, a0, -0x4
        or                a2, a2, a4
        amoand.w.aqrl     a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a0, a0, -0x4
        sll               a2, a2, a3
        amoor.w.aqrl      a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::acqrel_relaxed:
        slli              a3, a0, 0x3
        beqz              a1, 0f
        li                a4, 0xff
        sll               a4, a4, a3
        not               a4, a4
        sll               a2, a2, a3
        andi              a0, a0, -0x4
        or                a2, a2, a4
        amoand.w.aqrl     a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a0, a0, -0x4
        sll               a2, a2, a3
        amoor.w.aqrl      a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::acquire_seqcst:
        slli              a3, a0, 0x3
        beqz              a1, 0f
        li                a4, 0xff
        sll               a4, a4, a3
        not               a4, a4
        sll               a2, a2, a3
        andi              a0, a0, -0x4
        or                a2, a2, a4
        amoand.w.aqrl     a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a0, a0, -0x4
        sll               a2, a2, a3
        amoor.w.aqrl      a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::relaxed_seqcst:
        slli              a3, a0, 0x3
        beqz              a1, 0f
        li                a4, 0xff
        sll               a4, a4, a3
        not               a4, a4
        sll               a2, a2, a3
        andi              a0, a0, -0x4
        or                a2, a2, a4
        amoand.w.aqrl     a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a0, a0, -0x4
        sll               a2, a2, a3
        amoor.w.aqrl      a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::release_seqcst:
        slli              a3, a0, 0x3
        beqz              a1, 0f
        li                a4, 0xff
        sll               a4, a4, a3
        not               a4, a4
        sll               a2, a2, a3
        andi              a0, a0, -0x4
        or                a2, a2, a4
        amoand.w.aqrl     a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a0, a0, -0x4
        sll               a2, a2, a3
        amoor.w.aqrl      a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::seqcst_acquire:
        slli              a3, a0, 0x3
        beqz              a1, 0f
        li                a4, 0xff
        sll               a4, a4, a3
        not               a4, a4
        sll               a2, a2, a3
        andi              a0, a0, -0x4
        or                a2, a2, a4
        amoand.w.aqrl     a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a0, a0, -0x4
        sll               a2, a2, a3
        amoor.w.aqrl      a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::seqcst_relaxed:
        slli              a3, a0, 0x3
        beqz              a1, 0f
        li                a4, 0xff
        sll               a4, a4, a3
        not               a4, a4
        sll               a2, a2, a3
        andi              a0, a0, -0x4
        or                a2, a2, a4
        amoand.w.aqrl     a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a0, a0, -0x4
        sll               a2, a2, a3
        amoor.w.aqrl      a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::acquire_acquire:
        slli              a3, a0, 0x3
        beqz              a1, 0f
        li                a4, 0xff
        sll               a4, a4, a3
        not               a4, a4
        sll               a2, a2, a3
        andi              a0, a0, -0x4
        or                a2, a2, a4
        amoand.w.aq       a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a0, a0, -0x4
        sll               a2, a2, a3
        amoor.w.aq        a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::acquire_relaxed:
        slli              a3, a0, 0x3
        beqz              a1, 0f
        li                a4, 0xff
        sll               a4, a4, a3
        not               a4, a4
        sll               a2, a2, a3
        andi              a0, a0, -0x4
        or                a2, a2, a4
        amoand.w.aq       a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a0, a0, -0x4
        sll               a2, a2, a3
        amoor.w.aq        a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::relaxed_acquire:
        slli              a3, a0, 0x3
        beqz              a1, 0f
        li                a4, 0xff
        sll               a4, a4, a3
        not               a4, a4
        sll               a2, a2, a3
        andi              a0, a0, -0x4
        or                a2, a2, a4
        amoand.w.aq       a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a0, a0, -0x4
        sll               a2, a2, a3
        amoor.w.aq        a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::relaxed_relaxed:
        slli              a3, a0, 0x3
        beqz              a1, 0f
        li                a4, 0xff
        sll               a4, a4, a3
        not               a4, a4
        sll               a2, a2, a3
        andi              a0, a0, -0x4
        or                a2, a2, a4
        amoand.w          a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a0, a0, -0x4
        sll               a2, a2, a3
        amoor.w           a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::release_acquire:
        slli              a3, a0, 0x3
        beqz              a1, 0f
        li                a4, 0xff
        sll               a4, a4, a3
        not               a4, a4
        sll               a2, a2, a3
        andi              a0, a0, -0x4
        or                a2, a2, a4
        amoand.w.aqrl     a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a0, a0, -0x4
        sll               a2, a2, a3
        amoor.w.aqrl      a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::release_relaxed:
        slli              a3, a0, 0x3
        beqz              a1, 0f
        li                a4, 0xff
        sll               a4, a4, a3
        not               a4, a4
        sll               a2, a2, a3
        andi              a0, a0, -0x4
        or                a2, a2, a4
        amoand.w.rl       a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a0, a0, -0x4
        sll               a2, a2, a3
        amoor.w.rl        a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_true_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a3, a3, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        srl               a1, a0, a2
        xori              a0, a1, 0x1
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_true_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a3, a3, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        srl               a1, a0, a2
        xori              a0, a1, 0x1
        ret

asm_test::compare_exchange::bool::acqrel_acquire_true_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a3, a3, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        srl               a1, a0, a2
        xori              a0, a1, 0x1
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_true_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a3, a3, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        srl               a1, a0, a2
        xori              a0, a1, 0x1
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_false_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_true_false:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aqrl     a0, a1, (a0)
        srl               a1, a0, a2
        xori              a0, a1, 0x1
        ret

asm_test::compare_exchange::bool::acquire_seqcst_true_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a3, a3, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        srl               a1, a0, a2
        xori              a0, a1, 0x1
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_true_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a3, a3, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        srl               a1, a0, a2
        xori              a0, a1, 0x1
        ret

asm_test::compare_exchange::bool::release_seqcst_true_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a3, a3, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        srl               a1, a0, a2
        xori              a0, a1, 0x1
        ret

asm_test::compare_exchange::bool::seqcst_acquire_true_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a3, a3, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        srl               a1, a0, a2
        xori              a0, a1, 0x1
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_true_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a3, a3, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        srl               a1, a0, a2
        xori              a0, a1, 0x1
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_false_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_true_false:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aqrl     a0, a1, (a0)
        srl               a1, a0, a2
        xori              a0, a1, 0x1
        ret

asm_test::compare_exchange::bool::acqrel_acquire_false_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acqrel_acquire_true_false:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aqrl     a0, a1, (a0)
        srl               a1, a0, a2
        xori              a0, a1, 0x1
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_false_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_true_false:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aqrl     a0, a1, (a0)
        srl               a1, a0, a2
        xori              a0, a1, 0x1
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_false_false:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acquire_acquire_true_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a3, a3, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aq       a0, a1, (a0)
        srl               a1, a0, a2
        xori              a0, a1, 0x1
        ret

asm_test::compare_exchange::bool::acquire_relaxed_true_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a3, a3, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aq       a0, a1, (a0)
        srl               a1, a0, a2
        xori              a0, a1, 0x1
        ret

asm_test::compare_exchange::bool::acquire_seqcst_false_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acquire_seqcst_true_false:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aqrl     a0, a1, (a0)
        srl               a1, a0, a2
        xori              a0, a1, 0x1
        ret

asm_test::compare_exchange::bool::relaxed_acquire_true_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a3, a3, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aq       a0, a1, (a0)
        srl               a1, a0, a2
        xori              a0, a1, 0x1
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_true_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a3, a3, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w          a0, a1, (a0)
        srl               a1, a0, a2
        xori              a0, a1, 0x1
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_false_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_true_false:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aqrl     a0, a1, (a0)
        srl               a1, a0, a2
        xori              a0, a1, 0x1
        ret

asm_test::compare_exchange::bool::release_acquire_true_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a3, a3, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        srl               a1, a0, a2
        xori              a0, a1, 0x1
        ret

asm_test::compare_exchange::bool::release_relaxed_true_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a3, a3, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.rl       a0, a1, (a0)
        srl               a1, a0, a2
        xori              a0, a1, 0x1
        ret

asm_test::compare_exchange::bool::release_seqcst_false_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::release_seqcst_true_false:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aqrl     a0, a1, (a0)
        srl               a1, a0, a2
        xori              a0, a1, 0x1
        ret

asm_test::compare_exchange::bool::seqcst_acquire_false_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::seqcst_acquire_true_false:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aqrl     a0, a1, (a0)
        srl               a1, a0, a2
        xori              a0, a1, 0x1
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_false_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_true_false:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aqrl     a0, a1, (a0)
        srl               a1, a0, a2
        xori              a0, a1, 0x1
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_false_false:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acqrel_acquire_false_false:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_false_false:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acquire_acquire_false_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        srl               a0, a0, a2
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acquire_acquire_true_false:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aq       a0, a1, (a0)
        srl               a1, a0, a2
        xori              a0, a1, 0x1
        ret

asm_test::compare_exchange::bool::acquire_relaxed_false_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        srl               a0, a0, a2
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acquire_relaxed_true_false:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aq       a0, a1, (a0)
        srl               a1, a0, a2
        xori              a0, a1, 0x1
        ret

asm_test::compare_exchange::bool::acquire_seqcst_false_false:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::relaxed_acquire_false_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        srl               a0, a0, a2
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::relaxed_acquire_true_false:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aq       a0, a1, (a0)
        srl               a1, a0, a2
        xori              a0, a1, 0x1
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_false_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w           a0, a1, (a0)
        srl               a0, a0, a2
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_true_false:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w          a0, a1, (a0)
        srl               a1, a0, a2
        xori              a0, a1, 0x1
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_false_false:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::release_acquire_false_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::release_acquire_true_false:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aqrl     a0, a1, (a0)
        srl               a1, a0, a2
        xori              a0, a1, 0x1
        ret

asm_test::compare_exchange::bool::release_relaxed_false_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.rl        a0, a1, (a0)
        srl               a0, a0, a2
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::release_relaxed_true_false:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.rl       a0, a1, (a0)
        srl               a1, a0, a2
        xori              a0, a1, 0x1
        ret

asm_test::compare_exchange::bool::release_seqcst_false_false:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::seqcst_acquire_false_false:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_false_false:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acquire_acquire_false_false:
        andi              a1, a0, -0x4
        amoor.w.aq        a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acquire_relaxed_false_false:
        andi              a1, a0, -0x4
        amoor.w.aq        a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::relaxed_acquire_false_false:
        andi              a1, a0, -0x4
        amoor.w.aq        a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_false_false:
        andi              a1, a0, -0x4
        amoor.w           a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::release_acquire_false_false:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::release_relaxed_false_false:
        andi              a1, a0, -0x4
        amoor.w.rl        a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        mv                a1, a0
        ret

asm_test::compare_exchange_weak::u8::acqrel_seqcst:
        li                a3, 0xff
        slli              a4, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aqrl         a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange_weak::u8::seqcst_seqcst:
        li                a3, 0xff
        slli              a4, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aqrl         a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange_weak::u8::acqrel_acquire:
        li                a3, 0xff
        slli              a4, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aq           a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange_weak::u8::acqrel_relaxed:
        li                a3, 0xff
        slli              a4, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aq           a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange_weak::u8::acquire_seqcst:
        li                a3, 0xff
        slli              a4, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aqrl         a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange_weak::u8::relaxed_seqcst:
        li                a3, 0xff
        slli              a4, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aqrl         a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange_weak::u8::release_seqcst:
        li                a3, 0xff
        slli              a4, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aqrl         a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange_weak::u8::seqcst_acquire:
        li                a3, 0xff
        slli              a4, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aqrl         a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange_weak::u8::seqcst_relaxed:
        li                a3, 0xff
        slli              a4, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aqrl         a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange_weak::u8::acquire_acquire:
        li                a3, 0xff
        slli              a4, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aq           a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w              a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange_weak::u8::acquire_relaxed:
        li                a3, 0xff
        slli              a4, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aq           a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w              a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange_weak::u8::relaxed_acquire:
        li                a3, 0xff
        slli              a4, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aq           a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w              a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange_weak::u8::relaxed_relaxed:
        li                a3, 0xff
        slli              a4, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w              a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w              a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange_weak::u8::release_acquire:
        li                a3, 0xff
        slli              a4, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aq           a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange_weak::u8::release_relaxed:
        li                a3, 0xff
        slli              a4, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w              a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange_weak::f32::acqrel_seqcst:
        mv                a3, a1
        fence             rw, rw
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f32::seqcst_seqcst:
        mv                a3, a1
        fence             rw, rw
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f32::acqrel_acquire:
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f32::acqrel_relaxed:
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f32::acquire_seqcst:
        mv                a3, a1
        fence             rw, rw
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f32::relaxed_seqcst:
        mv                a3, a1
        fence             rw, rw
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f32::release_seqcst:
        mv                a3, a1
        fence             rw, rw
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f32::seqcst_acquire:
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f32::seqcst_relaxed:
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f32::acquire_acquire:
        mv                a3, a1
        amocas.w.aq       a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f32::acquire_relaxed:
        mv                a3, a1
        amocas.w.aq       a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f32::relaxed_acquire:
        mv                a3, a1
        amocas.w.aq       a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f32::relaxed_relaxed:
        mv                a3, a1
        amocas.w          a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f32::release_acquire:
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f32::release_relaxed:
        mv                a3, a1
        amocas.w.rl       a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f64::acqrel_seqcst:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        fence             rw, rw
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange_weak::f64::seqcst_seqcst:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        fence             rw, rw
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange_weak::f64::acqrel_acquire:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange_weak::f64::acqrel_relaxed:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange_weak::f64::acquire_seqcst:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        fence             rw, rw
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange_weak::f64::relaxed_seqcst:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        fence             rw, rw
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange_weak::f64::release_seqcst:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        fence             rw, rw
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange_weak::f64::seqcst_acquire:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange_weak::f64::seqcst_relaxed:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange_weak::f64::acquire_acquire:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.aq       a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange_weak::f64::acquire_relaxed:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.aq       a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange_weak::f64::relaxed_acquire:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.aq       a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange_weak::f64::relaxed_relaxed:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d          a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange_weak::f64::release_acquire:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange_weak::f64::release_relaxed:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.rl       a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange_weak::u16::acqrel_seqcst:
        lui               a3, 0x10
        slli              a4, a0, 0x3
        addi              a3, a3, -0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aqrl         a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange_weak::u16::seqcst_seqcst:
        lui               a3, 0x10
        slli              a4, a0, 0x3
        addi              a3, a3, -0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aqrl         a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange_weak::u16::acqrel_acquire:
        lui               a3, 0x10
        slli              a4, a0, 0x3
        addi              a3, a3, -0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aq           a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange_weak::u16::acqrel_relaxed:
        lui               a3, 0x10
        slli              a4, a0, 0x3
        addi              a3, a3, -0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aq           a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange_weak::u16::acquire_seqcst:
        lui               a3, 0x10
        slli              a4, a0, 0x3
        addi              a3, a3, -0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aqrl         a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange_weak::u16::relaxed_seqcst:
        lui               a3, 0x10
        slli              a4, a0, 0x3
        addi              a3, a3, -0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aqrl         a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange_weak::u16::release_seqcst:
        lui               a3, 0x10
        slli              a4, a0, 0x3
        addi              a3, a3, -0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aqrl         a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange_weak::u16::seqcst_acquire:
        lui               a3, 0x10
        slli              a4, a0, 0x3
        addi              a3, a3, -0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aqrl         a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange_weak::u16::seqcst_relaxed:
        lui               a3, 0x10
        slli              a4, a0, 0x3
        addi              a3, a3, -0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aqrl         a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange_weak::u16::acquire_acquire:
        lui               a3, 0x10
        slli              a4, a0, 0x3
        addi              a3, a3, -0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aq           a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w              a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange_weak::u16::acquire_relaxed:
        lui               a3, 0x10
        slli              a4, a0, 0x3
        addi              a3, a3, -0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aq           a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w              a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange_weak::u16::relaxed_acquire:
        lui               a3, 0x10
        slli              a4, a0, 0x3
        addi              a3, a3, -0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aq           a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w              a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange_weak::u16::relaxed_relaxed:
        lui               a3, 0x10
        slli              a4, a0, 0x3
        addi              a3, a3, -0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w              a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w              a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange_weak::u16::release_acquire:
        lui               a3, 0x10
        slli              a4, a0, 0x3
        addi              a3, a3, -0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w.aq           a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange_weak::u16::release_relaxed:
        lui               a3, 0x10
        slli              a4, a0, 0x3
        addi              a3, a3, -0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a4
        sll               a1, a1, a4
        sll               a2, a2, a4
0:
        lr.w              a5, (a0)
        and               a6, a5, a3
        bne               a6, a1, 1f
        xor               a6, a5, a2
        and               a6, a6, a3
        xor               a6, a5, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 0b
1:
        and               a3, a3, a5
        xor               a3, a3, a1
        srl               a1, a5, a4
        snez              a0, a3
        ret

asm_test::compare_exchange_weak::u32::acqrel_seqcst:
        mv                a3, a1
        fence             rw, rw
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::seqcst_seqcst:
        mv                a3, a1
        fence             rw, rw
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::acqrel_acquire:
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::acqrel_relaxed:
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::acquire_seqcst:
        mv                a3, a1
        fence             rw, rw
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::relaxed_seqcst:
        mv                a3, a1
        fence             rw, rw
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::release_seqcst:
        mv                a3, a1
        fence             rw, rw
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::seqcst_acquire:
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::seqcst_relaxed:
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::acquire_acquire:
        mv                a3, a1
        amocas.w.aq       a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::acquire_relaxed:
        mv                a3, a1
        amocas.w.aq       a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::relaxed_acquire:
        mv                a3, a1
        amocas.w.aq       a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::relaxed_relaxed:
        mv                a3, a1
        amocas.w          a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::release_acquire:
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::release_relaxed:
        mv                a3, a1
        amocas.w.rl       a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u64::acqrel_seqcst:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        fence             rw, rw
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange_weak::u64::seqcst_seqcst:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        fence             rw, rw
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange_weak::u64::acqrel_acquire:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange_weak::u64::acqrel_relaxed:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange_weak::u64::acquire_seqcst:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        fence             rw, rw
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange_weak::u64::relaxed_seqcst:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        fence             rw, rw
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange_weak::u64::release_seqcst:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        fence             rw, rw
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange_weak::u64::seqcst_acquire:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange_weak::u64::seqcst_relaxed:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange_weak::u64::acquire_acquire:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.aq       a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange_weak::u64::acquire_relaxed:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.aq       a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange_weak::u64::relaxed_acquire:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.aq       a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange_weak::u64::relaxed_relaxed:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d          a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange_weak::u64::release_acquire:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.aqrl     a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange_weak::u64::release_relaxed:
        mv                a6, a5
        mv                a7, a4
        mv                t0, a3
        mv                t1, a2
        mv                a5, a3
        mv                a4, a2
        mv                a3, a6
        mv                a2, a7
        amocas.d.rl       a4, a2, (a1)
        xor               a1, a4, t1
        xor               a2, a5, t0
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange_weak::bool::acqrel_seqcst:
        slli              a3, a0, 0x3
        beqz              a1, 0f
        li                a4, 0xff
        sll               a4, a4, a3
        not               a4, a4
        sll               a2, a2, a3
        andi              a0, a0, -0x4
        or                a2, a2, a4
        amoand.w.aqrl     a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a0, a0, -0x4
        sll               a2, a2, a3
        amoor.w.aqrl      a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::seqcst_seqcst:
        slli              a3, a0, 0x3
        beqz              a1, 0f
        li                a4, 0xff
        sll               a4, a4, a3
        not               a4, a4
        sll               a2, a2, a3
        andi              a0, a0, -0x4
        or                a2, a2, a4
        amoand.w.aqrl     a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a0, a0, -0x4
        sll               a2, a2, a3
        amoor.w.aqrl      a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::acqrel_acquire:
        slli              a3, a0, 0x3
        beqz              a1, 0f
        li                a4, 0xff
        sll               a4, a4, a3
        not               a4, a4
        sll               a2, a2, a3
        andi              a0, a0, -0x4
        or                a2, a2, a4
        amoand.w.aqrl     a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a0, a0, -0x4
        sll               a2, a2, a3
        amoor.w.aqrl      a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::acqrel_relaxed:
        slli              a3, a0, 0x3
        beqz              a1, 0f
        li                a4, 0xff
        sll               a4, a4, a3
        not               a4, a4
        sll               a2, a2, a3
        andi              a0, a0, -0x4
        or                a2, a2, a4
        amoand.w.aqrl     a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a0, a0, -0x4
        sll               a2, a2, a3
        amoor.w.aqrl      a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::acquire_seqcst:
        slli              a3, a0, 0x3
        beqz              a1, 0f
        li                a4, 0xff
        sll               a4, a4, a3
        not               a4, a4
        sll               a2, a2, a3
        andi              a0, a0, -0x4
        or                a2, a2, a4
        amoand.w.aqrl     a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a0, a0, -0x4
        sll               a2, a2, a3
        amoor.w.aqrl      a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::relaxed_seqcst:
        slli              a3, a0, 0x3
        beqz              a1, 0f
        li                a4, 0xff
        sll               a4, a4, a3
        not               a4, a4
        sll               a2, a2, a3
        andi              a0, a0, -0x4
        or                a2, a2, a4
        amoand.w.aqrl     a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a0, a0, -0x4
        sll               a2, a2, a3
        amoor.w.aqrl      a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::release_seqcst:
        slli              a3, a0, 0x3
        beqz              a1, 0f
        li                a4, 0xff
        sll               a4, a4, a3
        not               a4, a4
        sll               a2, a2, a3
        andi              a0, a0, -0x4
        or                a2, a2, a4
        amoand.w.aqrl     a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a0, a0, -0x4
        sll               a2, a2, a3
        amoor.w.aqrl      a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::seqcst_acquire:
        slli              a3, a0, 0x3
        beqz              a1, 0f
        li                a4, 0xff
        sll               a4, a4, a3
        not               a4, a4
        sll               a2, a2, a3
        andi              a0, a0, -0x4
        or                a2, a2, a4
        amoand.w.aqrl     a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a0, a0, -0x4
        sll               a2, a2, a3
        amoor.w.aqrl      a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::seqcst_relaxed:
        slli              a3, a0, 0x3
        beqz              a1, 0f
        li                a4, 0xff
        sll               a4, a4, a3
        not               a4, a4
        sll               a2, a2, a3
        andi              a0, a0, -0x4
        or                a2, a2, a4
        amoand.w.aqrl     a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a0, a0, -0x4
        sll               a2, a2, a3
        amoor.w.aqrl      a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::acquire_acquire:
        slli              a3, a0, 0x3
        beqz              a1, 0f
        li                a4, 0xff
        sll               a4, a4, a3
        not               a4, a4
        sll               a2, a2, a3
        andi              a0, a0, -0x4
        or                a2, a2, a4
        amoand.w.aq       a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a0, a0, -0x4
        sll               a2, a2, a3
        amoor.w.aq        a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::acquire_relaxed:
        slli              a3, a0, 0x3
        beqz              a1, 0f
        li                a4, 0xff
        sll               a4, a4, a3
        not               a4, a4
        sll               a2, a2, a3
        andi              a0, a0, -0x4
        or                a2, a2, a4
        amoand.w.aq       a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a0, a0, -0x4
        sll               a2, a2, a3
        amoor.w.aq        a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::relaxed_acquire:
        slli              a3, a0, 0x3
        beqz              a1, 0f
        li                a4, 0xff
        sll               a4, a4, a3
        not               a4, a4
        sll               a2, a2, a3
        andi              a0, a0, -0x4
        or                a2, a2, a4
        amoand.w.aq       a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a0, a0, -0x4
        sll               a2, a2, a3
        amoor.w.aq        a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::relaxed_relaxed:
        slli              a3, a0, 0x3
        beqz              a1, 0f
        li                a4, 0xff
        sll               a4, a4, a3
        not               a4, a4
        sll               a2, a2, a3
        andi              a0, a0, -0x4
        or                a2, a2, a4
        amoand.w          a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a0, a0, -0x4
        sll               a2, a2, a3
        amoor.w           a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::release_acquire:
        slli              a3, a0, 0x3
        beqz              a1, 0f
        li                a4, 0xff
        sll               a4, a4, a3
        not               a4, a4
        sll               a2, a2, a3
        andi              a0, a0, -0x4
        or                a2, a2, a4
        amoand.w.aqrl     a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a0, a0, -0x4
        sll               a2, a2, a3
        amoor.w.aqrl      a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::release_relaxed:
        slli              a3, a0, 0x3
        beqz              a1, 0f
        li                a4, 0xff
        sll               a4, a4, a3
        not               a4, a4
        sll               a2, a2, a3
        andi              a0, a0, -0x4
        or                a2, a2, a4
        amoand.w.rl       a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a0, a0, -0x4
        sll               a2, a2, a3
        amoor.w.rl        a0, a2, (a0)
        srl               a2, a0, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::or::u8::acqrel_all:
        li                a1, 0xff
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      zero, a1, (a0)
        ret

asm_test::or::u8::seqcst_all:
        li                a1, 0xff
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      zero, a1, (a0)
        ret

asm_test::or::u8::acqrel_zero:
        andi              a0, a0, -0x4
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::or::u8::acquire_all:
        li                a1, 0xff
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        zero, a1, (a0)
        ret

asm_test::or::u8::relaxed_all:
        li                a1, 0xff
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w           zero, a1, (a0)
        ret

asm_test::or::u8::release_all:
        li                a1, 0xff
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.rl        zero, a1, (a0)
        ret

asm_test::or::u8::seqcst_zero:
        andi              a0, a0, -0x4
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::or::u8::acquire_zero:
        andi              a0, a0, -0x4
        amoor.w.aq        zero, zero, (a0)
        ret

asm_test::or::u8::relaxed_zero:
        andi              a0, a0, -0x4
        amoor.w           zero, zero, (a0)
        ret

asm_test::or::u8::release_zero:
        andi              a0, a0, -0x4
        amoor.w.rl        zero, zero, (a0)
        ret

asm_test::or::u8::acqrel:
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      zero, a1, (a0)
        ret

asm_test::or::u8::seqcst:
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      zero, a1, (a0)
        ret

asm_test::or::u8::acquire:
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        zero, a1, (a0)
        ret

asm_test::or::u8::relaxed:
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w           zero, a1, (a0)
        ret

asm_test::or::u8::release:
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.rl        zero, a1, (a0)
        ret

asm_test::or::u16::acqrel_all:
        lui               a1, 0x10
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      zero, a1, (a0)
        ret

asm_test::or::u16::seqcst_all:
        lui               a1, 0x10
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      zero, a1, (a0)
        ret

asm_test::or::u16::acqrel_zero:
        andi              a0, a0, -0x4
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::or::u16::acquire_all:
        lui               a1, 0x10
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        zero, a1, (a0)
        ret

asm_test::or::u16::relaxed_all:
        lui               a1, 0x10
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w           zero, a1, (a0)
        ret

asm_test::or::u16::release_all:
        lui               a1, 0x10
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.rl        zero, a1, (a0)
        ret

asm_test::or::u16::seqcst_zero:
        andi              a0, a0, -0x4
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::or::u16::acquire_zero:
        andi              a0, a0, -0x4
        amoor.w.aq        zero, zero, (a0)
        ret

asm_test::or::u16::relaxed_zero:
        andi              a0, a0, -0x4
        amoor.w           zero, zero, (a0)
        ret

asm_test::or::u16::release_zero:
        andi              a0, a0, -0x4
        amoor.w.rl        zero, zero, (a0)
        ret

asm_test::or::u16::acqrel:
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      zero, a1, (a0)
        ret

asm_test::or::u16::seqcst:
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      zero, a1, (a0)
        ret

asm_test::or::u16::acquire:
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        zero, a1, (a0)
        ret

asm_test::or::u16::relaxed:
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w           zero, a1, (a0)
        ret

asm_test::or::u16::release:
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.rl        zero, a1, (a0)
        ret

asm_test::or::u32::acqrel_all:
        li                a1, -0x1
        amoswap.w.aqrl    zero, a1, (a0)
        ret

asm_test::or::u32::seqcst_all:
        li                a1, -0x1
        amoswap.w.aqrl    zero, a1, (a0)
        ret

asm_test::or::u32::acqrel_zero:
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::or::u32::acquire_all:
        li                a1, -0x1
        amoswap.w.aq      zero, a1, (a0)
        ret

asm_test::or::u32::relaxed_all:
        li                a1, -0x1
        amoswap.w         zero, a1, (a0)
        ret

asm_test::or::u32::release_all:
        li                a1, -0x1
        amoswap.w.rl      zero, a1, (a0)
        ret

asm_test::or::u32::seqcst_zero:
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::or::u32::acquire_zero:
        amoor.w.aq        zero, zero, (a0)
        ret

asm_test::or::u32::relaxed_zero:
        amoor.w           zero, zero, (a0)
        ret

asm_test::or::u32::release_zero:
        amoor.w.rl        zero, zero, (a0)
        ret

asm_test::or::u32::acqrel:
        amoor.w.aqrl      zero, a1, (a0)
        ret

asm_test::or::u32::seqcst:
        amoor.w.aqrl      zero, a1, (a0)
        ret

asm_test::or::u32::acquire:
        amoor.w.aq        zero, a1, (a0)
        ret

asm_test::or::u32::relaxed:
        amoor.w           zero, a1, (a0)
        ret

asm_test::or::u32::release:
        amoor.w.rl        zero, a1, (a0)
        ret

asm_test::or::u64::acqrel_all:
        lw                a1, 0x0(a0)
        lw                a6, 0x4(a0)
        li                a3, -0x1
0:
        mv                a5, a6
        mv                a4, a1
        li                a2, -0x1
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a6
        xor               a1, a1, a4
        or                a2, a2, a1
        mv                a1, a4
        mv                a6, a5
        bnez              a2, 0b
        ret

asm_test::or::u64::seqcst_all:
        lw                a1, 0x0(a0)
        lw                a6, 0x4(a0)
        li                a3, -0x1
0:
        mv                a5, a6
        mv                a4, a1
        li                a2, -0x1
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a6
        xor               a1, a1, a4
        or                a2, a2, a1
        mv                a1, a4
        mv                a6, a5
        bnez              a2, 0b
        ret

asm_test::or::u64::acqrel_zero:
        lw                a2, 0x0(a0)
        lw                a3, 0x4(a0)
0:
        mv                a5, a3
        mv                a4, a2
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a2, a4
        xor               a3, a3, a5
        or                a1, a2, a3
        mv                a2, a4
        mv                a3, a5
        bnez              a1, 0b
        ret

asm_test::or::u64::acquire_all:
        lw                a1, 0x0(a0)
        lw                a6, 0x4(a0)
        li                a3, -0x1
0:
        mv                a5, a6
        mv                a4, a1
        li                a2, -0x1
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a5, a6
        xor               a1, a1, a4
        or                a2, a2, a1
        mv                a1, a4
        mv                a6, a5
        bnez              a2, 0b
        ret

asm_test::or::u64::relaxed_all:
        lw                a1, 0x0(a0)
        lw                a6, 0x4(a0)
        li                a3, -0x1
0:
        mv                a5, a6
        mv                a4, a1
        li                a2, -0x1
        amocas.d          a4, a2, (a0)
        xor               a2, a5, a6
        xor               a1, a1, a4
        or                a2, a2, a1
        mv                a1, a4
        mv                a6, a5
        bnez              a2, 0b
        ret

asm_test::or::u64::release_all:
        lw                a1, 0x0(a0)
        lw                a6, 0x4(a0)
        li                a3, -0x1
0:
        mv                a5, a6
        mv                a4, a1
        li                a2, -0x1
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a5, a6
        xor               a1, a1, a4
        or                a2, a2, a1
        mv                a1, a4
        mv                a6, a5
        bnez              a2, 0b
        ret

asm_test::or::u64::seqcst_zero:
        lw                a2, 0x0(a0)
        lw                a3, 0x4(a0)
0:
        mv                a5, a3
        mv                a4, a2
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a2, a4
        xor               a3, a3, a5
        or                a1, a2, a3
        mv                a2, a4
        mv                a3, a5
        bnez              a1, 0b
        ret

asm_test::or::u64::acquire_zero:
        lw                a2, 0x0(a0)
        lw                a3, 0x4(a0)
0:
        mv                a5, a3
        mv                a4, a2
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a2, a4
        xor               a3, a3, a5
        or                a1, a2, a3
        mv                a2, a4
        mv                a3, a5
        bnez              a1, 0b
        ret

asm_test::or::u64::relaxed_zero:
        lw                a2, 0x0(a0)
        lw                a3, 0x4(a0)
0:
        mv                a5, a3
        mv                a4, a2
        amocas.d          a4, a2, (a0)
        xor               a2, a2, a4
        xor               a3, a3, a5
        or                a1, a2, a3
        mv                a2, a4
        mv                a3, a5
        bnez              a1, 0b
        ret

asm_test::or::u64::release_zero:
        lw                a2, 0x0(a0)
        lw                a3, 0x4(a0)
0:
        mv                a5, a3
        mv                a4, a2
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a2, a4
        xor               a3, a3, a5
        or                a1, a2, a3
        mv                a2, a4
        mv                a3, a5
        bnez              a1, 0b
        ret

asm_test::or::u64::acqrel:
        mv                a6, a2
        lw                a7, 0x0(a0)
        lw                t0, 0x4(a0)
0:
        mv                a5, t0
        mv                a4, a7
        or                a2, a7, a1
        or                a3, t0, a6
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        mv                a7, a4
        mv                t0, a5
        bnez              a2, 0b
        ret

asm_test::or::u64::seqcst:
        mv                a6, a2
        lw                a7, 0x0(a0)
        lw                t0, 0x4(a0)
0:
        mv                a5, t0
        mv                a4, a7
        or                a2, a7, a1
        or                a3, t0, a6
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        mv                a7, a4
        mv                t0, a5
        bnez              a2, 0b
        ret

asm_test::or::u64::acquire:
        mv                a6, a2
        lw                a7, 0x0(a0)
        lw                t0, 0x4(a0)
0:
        mv                a5, t0
        mv                a4, a7
        or                a2, a7, a1
        or                a3, t0, a6
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        mv                a7, a4
        mv                t0, a5
        bnez              a2, 0b
        ret

asm_test::or::u64::relaxed:
        mv                a6, a2
        lw                a7, 0x0(a0)
        lw                t0, 0x4(a0)
0:
        mv                a5, t0
        mv                a4, a7
        or                a2, a7, a1
        or                a3, t0, a6
        amocas.d          a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        mv                a7, a4
        mv                t0, a5
        bnez              a2, 0b
        ret

asm_test::or::u64::release:
        mv                a6, a2
        lw                a7, 0x0(a0)
        lw                t0, 0x4(a0)
0:
        mv                a5, t0
        mv                a4, a7
        or                a2, a7, a1
        or                a3, t0, a6
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        mv                a7, a4
        mv                t0, a5
        bnez              a2, 0b
        ret

asm_test::or::bool::acqrel_true:
        li                a1, 0x1
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      zero, a1, (a0)
        ret

asm_test::or::bool::seqcst_true:
        li                a1, 0x1
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      zero, a1, (a0)
        ret

asm_test::or::bool::acqrel_false:
        andi              a0, a0, -0x4
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::or::bool::acquire_true:
        li                a1, 0x1
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        zero, a1, (a0)
        ret

asm_test::or::bool::relaxed_true:
        li                a1, 0x1
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w           zero, a1, (a0)
        ret

asm_test::or::bool::release_true:
        li                a1, 0x1
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.rl        zero, a1, (a0)
        ret

asm_test::or::bool::seqcst_false:
        andi              a0, a0, -0x4
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::or::bool::acquire_false:
        andi              a0, a0, -0x4
        amoor.w.aq        zero, zero, (a0)
        ret

asm_test::or::bool::relaxed_false:
        andi              a0, a0, -0x4
        amoor.w           zero, zero, (a0)
        ret

asm_test::or::bool::release_false:
        andi              a0, a0, -0x4
        amoor.w.rl        zero, zero, (a0)
        ret

asm_test::or::bool::acqrel:
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      zero, a1, (a0)
        ret

asm_test::or::bool::seqcst:
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      zero, a1, (a0)
        ret

asm_test::or::bool::acquire:
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        zero, a1, (a0)
        ret

asm_test::or::bool::relaxed:
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w           zero, a1, (a0)
        ret

asm_test::or::bool::release:
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.rl        zero, a1, (a0)
        ret

asm_test::add::u8::acqrel_zero:
        andi              a0, a0, -0x4
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::add::u8::seqcst_zero:
        andi              a0, a0, -0x4
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::add::u8::acquire_zero:
        andi              a0, a0, -0x4
        amoor.w.aq        zero, zero, (a0)
        ret

asm_test::add::u8::relaxed_zero:
        andi              a0, a0, -0x4
        amoor.w           zero, zero, (a0)
        ret

asm_test::add::u8::release_zero:
        andi              a0, a0, -0x4
        amoor.w.rl        zero, zero, (a0)
        ret

asm_test::add::u8::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a0, a1, a0
0:
        lr.w.aq           a1, (a2)
        add               a4, a1, a0
        xor               a4, a4, a1
        and               a4, a4, a3
        xor               a4, a4, a1
        sc.w.rl           a4, a4, (a2)
        bnez              a4, 0b
        ret

asm_test::add::u8::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a0, a1, a0
0:
        lr.w.aqrl         a1, (a2)
        add               a4, a1, a0
        xor               a4, a4, a1
        and               a4, a4, a3
        xor               a4, a4, a1
        sc.w.rl           a4, a4, (a2)
        bnez              a4, 0b
        ret

asm_test::add::u8::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a0, a1, a0
0:
        lr.w.aq           a1, (a2)
        add               a4, a1, a0
        xor               a4, a4, a1
        and               a4, a4, a3
        xor               a4, a4, a1
        sc.w              a4, a4, (a2)
        bnez              a4, 0b
        ret

asm_test::add::u8::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a0, a1, a0
0:
        lr.w              a1, (a2)
        add               a4, a1, a0
        xor               a4, a4, a1
        and               a4, a4, a3
        xor               a4, a4, a1
        sc.w              a4, a4, (a2)
        bnez              a4, 0b
        ret

asm_test::add::u8::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a0, a1, a0
0:
        lr.w              a1, (a2)
        add               a4, a1, a0
        xor               a4, a4, a1
        and               a4, a4, a3
        xor               a4, a4, a1
        sc.w.rl           a4, a4, (a2)
        bnez              a4, 0b
        ret

asm_test::add::u16::acqrel_zero:
        andi              a0, a0, -0x4
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::add::u16::seqcst_zero:
        andi              a0, a0, -0x4
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::add::u16::acquire_zero:
        andi              a0, a0, -0x4
        amoor.w.aq        zero, zero, (a0)
        ret

asm_test::add::u16::relaxed_zero:
        andi              a0, a0, -0x4
        amoor.w           zero, zero, (a0)
        ret

asm_test::add::u16::release_zero:
        andi              a0, a0, -0x4
        amoor.w.rl        zero, zero, (a0)
        ret

asm_test::add::u16::acqrel:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a0, a1, a0
0:
        lr.w.aq           a1, (a3)
        add               a4, a1, a0
        xor               a4, a4, a1
        and               a4, a4, a2
        xor               a4, a4, a1
        sc.w.rl           a4, a4, (a3)
        bnez              a4, 0b
        ret

asm_test::add::u16::seqcst:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a0, a1, a0
0:
        lr.w.aqrl         a1, (a3)
        add               a4, a1, a0
        xor               a4, a4, a1
        and               a4, a4, a2
        xor               a4, a4, a1
        sc.w.rl           a4, a4, (a3)
        bnez              a4, 0b
        ret

asm_test::add::u16::acquire:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a0, a1, a0
0:
        lr.w.aq           a1, (a3)
        add               a4, a1, a0
        xor               a4, a4, a1
        and               a4, a4, a2
        xor               a4, a4, a1
        sc.w              a4, a4, (a3)
        bnez              a4, 0b
        ret

asm_test::add::u16::relaxed:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a0, a1, a0
0:
        lr.w              a1, (a3)
        add               a4, a1, a0
        xor               a4, a4, a1
        and               a4, a4, a2
        xor               a4, a4, a1
        sc.w              a4, a4, (a3)
        bnez              a4, 0b
        ret

asm_test::add::u16::release:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a0, a1, a0
0:
        lr.w              a1, (a3)
        add               a4, a1, a0
        xor               a4, a4, a1
        and               a4, a4, a2
        xor               a4, a4, a1
        sc.w.rl           a4, a4, (a3)
        bnez              a4, 0b
        ret

asm_test::add::u32::acqrel_zero:
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::add::u32::seqcst_zero:
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::add::u32::acquire_zero:
        amoor.w.aq        zero, zero, (a0)
        ret

asm_test::add::u32::relaxed_zero:
        amoor.w           zero, zero, (a0)
        ret

asm_test::add::u32::release_zero:
        amoor.w.rl        zero, zero, (a0)
        ret

asm_test::add::u32::acqrel:
        amoadd.w.aqrl     zero, a1, (a0)
        ret

asm_test::add::u32::seqcst:
        amoadd.w.aqrl     zero, a1, (a0)
        ret

asm_test::add::u32::acquire:
        amoadd.w.aq       zero, a1, (a0)
        ret

asm_test::add::u32::relaxed:
        amoadd.w          zero, a1, (a0)
        ret

asm_test::add::u32::release:
        amoadd.w.rl       zero, a1, (a0)
        ret

asm_test::add::u64::acqrel_zero:
        lw                a2, 0x0(a0)
        lw                a3, 0x4(a0)
0:
        mv                a5, a3
        mv                a4, a2
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a2, a4
        xor               a3, a3, a5
        or                a1, a2, a3
        mv                a2, a4
        mv                a3, a5
        bnez              a1, 0b
        ret

asm_test::add::u64::seqcst_zero:
        lw                a2, 0x0(a0)
        lw                a3, 0x4(a0)
0:
        mv                a5, a3
        mv                a4, a2
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a2, a4
        xor               a3, a3, a5
        or                a1, a2, a3
        mv                a2, a4
        mv                a3, a5
        bnez              a1, 0b
        ret

asm_test::add::u64::acquire_zero:
        lw                a2, 0x0(a0)
        lw                a3, 0x4(a0)
0:
        mv                a5, a3
        mv                a4, a2
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a2, a4
        xor               a3, a3, a5
        or                a1, a2, a3
        mv                a2, a4
        mv                a3, a5
        bnez              a1, 0b
        ret

asm_test::add::u64::relaxed_zero:
        lw                a2, 0x0(a0)
        lw                a3, 0x4(a0)
0:
        mv                a5, a3
        mv                a4, a2
        amocas.d          a4, a2, (a0)
        xor               a2, a2, a4
        xor               a3, a3, a5
        or                a1, a2, a3
        mv                a2, a4
        mv                a3, a5
        bnez              a1, 0b
        ret

asm_test::add::u64::release_zero:
        lw                a2, 0x0(a0)
        lw                a3, 0x4(a0)
0:
        mv                a5, a3
        mv                a4, a2
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a2, a4
        xor               a3, a3, a5
        or                a1, a2, a3
        mv                a2, a4
        mv                a3, a5
        bnez              a1, 0b
        ret

asm_test::add::u64::acqrel:
        mv                a6, a2
        lw                a7, 0x0(a0)
        lw                t0, 0x4(a0)
0:
        mv                a5, t0
        mv                a4, a7
        add               a2, a7, a1
        sltu              a3, a2, a7
        add               t1, t0, a6
        add               a3, a3, t1
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        mv                a7, a4
        mv                t0, a5
        bnez              a2, 0b
        ret

asm_test::add::u64::seqcst:
        mv                a6, a2
        lw                a7, 0x0(a0)
        lw                t0, 0x4(a0)
0:
        mv                a5, t0
        mv                a4, a7
        add               a2, a7, a1
        sltu              a3, a2, a7
        add               t1, t0, a6
        add               a3, a3, t1
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        mv                a7, a4
        mv                t0, a5
        bnez              a2, 0b
        ret

asm_test::add::u64::acquire:
        mv                a6, a2
        lw                a7, 0x0(a0)
        lw                t0, 0x4(a0)
0:
        mv                a5, t0
        mv                a4, a7
        add               a2, a7, a1
        sltu              a3, a2, a7
        add               t1, t0, a6
        add               a3, a3, t1
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        mv                a7, a4
        mv                t0, a5
        bnez              a2, 0b
        ret

asm_test::add::u64::relaxed:
        mv                a6, a2
        lw                a7, 0x0(a0)
        lw                t0, 0x4(a0)
0:
        mv                a5, t0
        mv                a4, a7
        add               a2, a7, a1
        sltu              a3, a2, a7
        add               t1, t0, a6
        add               a3, a3, t1
        amocas.d          a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        mv                a7, a4
        mv                t0, a5
        bnez              a2, 0b
        ret

asm_test::add::u64::release:
        mv                a6, a2
        lw                a7, 0x0(a0)
        lw                t0, 0x4(a0)
0:
        mv                a5, t0
        mv                a4, a7
        add               a2, a7, a1
        sltu              a3, a2, a7
        add               t1, t0, a6
        add               a3, a3, t1
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        mv                a7, a4
        mv                t0, a5
        bnez              a2, 0b
        ret

asm_test::and::u8::acqrel_all:
        andi              a0, a0, -0x4
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::and::u8::seqcst_all:
        andi              a0, a0, -0x4
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::and::u8::acqrel_zero:
        li                a1, 0xff
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aqrl     zero, a1, (a0)
        ret

asm_test::and::u8::acquire_all:
        andi              a0, a0, -0x4
        amoor.w.aq        zero, zero, (a0)
        ret

asm_test::and::u8::relaxed_all:
        andi              a0, a0, -0x4
        amoor.w           zero, zero, (a0)
        ret

asm_test::and::u8::release_all:
        andi              a0, a0, -0x4
        amoor.w.rl        zero, zero, (a0)
        ret

asm_test::and::u8::seqcst_zero:
        li                a1, 0xff
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aqrl     zero, a1, (a0)
        ret

asm_test::and::u8::acquire_zero:
        li                a1, 0xff
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aq       zero, a1, (a0)
        ret

asm_test::and::u8::relaxed_zero:
        li                a1, 0xff
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w          zero, a1, (a0)
        ret

asm_test::and::u8::release_zero:
        li                a1, 0xff
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.rl       zero, a1, (a0)
        ret

asm_test::and::u8::acqrel:
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     zero, a1, (a0)
        ret

asm_test::and::u8::seqcst:
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     zero, a1, (a0)
        ret

asm_test::and::u8::acquire:
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aq       zero, a1, (a0)
        ret

asm_test::and::u8::relaxed:
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w          zero, a1, (a0)
        ret

asm_test::and::u8::release:
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.rl       zero, a1, (a0)
        ret

asm_test::and::u16::acqrel_all:
        andi              a0, a0, -0x4
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::and::u16::seqcst_all:
        andi              a0, a0, -0x4
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::and::u16::acqrel_zero:
        lui               a1, 0x10
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        addi              a1, a1, -0x1
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aqrl     zero, a1, (a0)
        ret

asm_test::and::u16::acquire_all:
        andi              a0, a0, -0x4
        amoor.w.aq        zero, zero, (a0)
        ret

asm_test::and::u16::relaxed_all:
        andi              a0, a0, -0x4
        amoor.w           zero, zero, (a0)
        ret

asm_test::and::u16::release_all:
        andi              a0, a0, -0x4
        amoor.w.rl        zero, zero, (a0)
        ret

asm_test::and::u16::seqcst_zero:
        lui               a1, 0x10
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        addi              a1, a1, -0x1
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aqrl     zero, a1, (a0)
        ret

asm_test::and::u16::acquire_zero:
        lui               a1, 0x10
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        addi              a1, a1, -0x1
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aq       zero, a1, (a0)
        ret

asm_test::and::u16::relaxed_zero:
        lui               a1, 0x10
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        addi              a1, a1, -0x1
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w          zero, a1, (a0)
        ret

asm_test::and::u16::release_zero:
        lui               a1, 0x10
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        addi              a1, a1, -0x1
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.rl       zero, a1, (a0)
        ret

asm_test::and::u16::acqrel:
        lui               a2, 0x10
        slli              a3, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a3
        not               a2, a2
        sll               a1, a1, a3
        andi              a0, a0, -0x4
        or                a1, a1, a2
        amoand.w.aqrl     zero, a1, (a0)
        ret

asm_test::and::u16::seqcst:
        lui               a2, 0x10
        slli              a3, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a3
        not               a2, a2
        sll               a1, a1, a3
        andi              a0, a0, -0x4
        or                a1, a1, a2
        amoand.w.aqrl     zero, a1, (a0)
        ret

asm_test::and::u16::acquire:
        lui               a2, 0x10
        slli              a3, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a3
        not               a2, a2
        sll               a1, a1, a3
        andi              a0, a0, -0x4
        or                a1, a1, a2
        amoand.w.aq       zero, a1, (a0)
        ret

asm_test::and::u16::relaxed:
        lui               a2, 0x10
        slli              a3, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a3
        not               a2, a2
        sll               a1, a1, a3
        andi              a0, a0, -0x4
        or                a1, a1, a2
        amoand.w          zero, a1, (a0)
        ret

asm_test::and::u16::release:
        lui               a2, 0x10
        slli              a3, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a3
        not               a2, a2
        sll               a1, a1, a3
        andi              a0, a0, -0x4
        or                a1, a1, a2
        amoand.w.rl       zero, a1, (a0)
        ret

asm_test::and::u32::acqrel_all:
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::and::u32::seqcst_all:
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::and::u32::acqrel_zero:
        amoswap.w.aqrl    zero, zero, (a0)
        ret

asm_test::and::u32::acquire_all:
        amoor.w.aq        zero, zero, (a0)
        ret

asm_test::and::u32::relaxed_all:
        amoor.w           zero, zero, (a0)
        ret

asm_test::and::u32::release_all:
        amoor.w.rl        zero, zero, (a0)
        ret

asm_test::and::u32::seqcst_zero:
        amoswap.w.aqrl    zero, zero, (a0)
        ret

asm_test::and::u32::acquire_zero:
        amoswap.w.aq      zero, zero, (a0)
        ret

asm_test::and::u32::relaxed_zero:
        amoswap.w         zero, zero, (a0)
        ret

asm_test::and::u32::release_zero:
        amoswap.w.rl      zero, zero, (a0)
        ret

asm_test::and::u32::acqrel:
        amoand.w.aqrl     zero, a1, (a0)
        ret

asm_test::and::u32::seqcst:
        amoand.w.aqrl     zero, a1, (a0)
        ret

asm_test::and::u32::acquire:
        amoand.w.aq       zero, a1, (a0)
        ret

asm_test::and::u32::relaxed:
        amoand.w          zero, a1, (a0)
        ret

asm_test::and::u32::release:
        amoand.w.rl       zero, a1, (a0)
        ret

asm_test::and::u64::acqrel_all:
        lw                a2, 0x0(a0)
        lw                a3, 0x4(a0)
0:
        mv                a5, a3
        mv                a4, a2
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a2, a4
        xor               a3, a3, a5
        or                a1, a2, a3
        mv                a2, a4
        mv                a3, a5
        bnez              a1, 0b
        ret

asm_test::and::u64::seqcst_all:
        lw                a2, 0x0(a0)
        lw                a3, 0x4(a0)
0:
        mv                a5, a3
        mv                a4, a2
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a2, a4
        xor               a3, a3, a5
        or                a1, a2, a3
        mv                a2, a4
        mv                a3, a5
        bnez              a1, 0b
        ret

asm_test::and::u64::acqrel_zero:
        lw                a6, 0x0(a0)
        lw                a1, 0x4(a0)
        li                a3, 0x0
0:
        mv                a5, a1
        mv                a4, a6
        li                a2, 0x0
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a4, a6
        xor               a1, a1, a5
        or                a2, a2, a1
        mv                a6, a4
        mv                a1, a5
        bnez              a2, 0b
        ret

asm_test::and::u64::acquire_all:
        lw                a2, 0x0(a0)
        lw                a3, 0x4(a0)
0:
        mv                a5, a3
        mv                a4, a2
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a2, a4
        xor               a3, a3, a5
        or                a1, a2, a3
        mv                a2, a4
        mv                a3, a5
        bnez              a1, 0b
        ret

asm_test::and::u64::relaxed_all:
        lw                a2, 0x0(a0)
        lw                a3, 0x4(a0)
0:
        mv                a5, a3
        mv                a4, a2
        amocas.d          a4, a2, (a0)
        xor               a2, a2, a4
        xor               a3, a3, a5
        or                a1, a2, a3
        mv                a2, a4
        mv                a3, a5
        bnez              a1, 0b
        ret

asm_test::and::u64::release_all:
        lw                a2, 0x0(a0)
        lw                a3, 0x4(a0)
0:
        mv                a5, a3
        mv                a4, a2
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a2, a4
        xor               a3, a3, a5
        or                a1, a2, a3
        mv                a2, a4
        mv                a3, a5
        bnez              a1, 0b
        ret

asm_test::and::u64::seqcst_zero:
        lw                a6, 0x0(a0)
        lw                a1, 0x4(a0)
        li                a3, 0x0
0:
        mv                a5, a1
        mv                a4, a6
        li                a2, 0x0
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a4, a6
        xor               a1, a1, a5
        or                a2, a2, a1
        mv                a6, a4
        mv                a1, a5
        bnez              a2, 0b
        ret

asm_test::and::u64::acquire_zero:
        lw                a6, 0x0(a0)
        lw                a1, 0x4(a0)
        li                a3, 0x0
0:
        mv                a5, a1
        mv                a4, a6
        li                a2, 0x0
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a4, a6
        xor               a1, a1, a5
        or                a2, a2, a1
        mv                a6, a4
        mv                a1, a5
        bnez              a2, 0b
        ret

asm_test::and::u64::relaxed_zero:
        lw                a6, 0x0(a0)
        lw                a1, 0x4(a0)
        li                a3, 0x0
0:
        mv                a5, a1
        mv                a4, a6
        li                a2, 0x0
        amocas.d          a4, a2, (a0)
        xor               a2, a4, a6
        xor               a1, a1, a5
        or                a2, a2, a1
        mv                a6, a4
        mv                a1, a5
        bnez              a2, 0b
        ret

asm_test::and::u64::release_zero:
        lw                a6, 0x0(a0)
        lw                a1, 0x4(a0)
        li                a3, 0x0
0:
        mv                a5, a1
        mv                a4, a6
        li                a2, 0x0
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a4, a6
        xor               a1, a1, a5
        or                a2, a2, a1
        mv                a6, a4
        mv                a1, a5
        bnez              a2, 0b
        ret

asm_test::and::u64::acqrel:
        mv                a6, a2
        lw                a7, 0x0(a0)
        lw                t0, 0x4(a0)
0:
        mv                a5, t0
        mv                a4, a7
        and               a2, a7, a1
        and               a3, t0, a6
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        mv                a7, a4
        mv                t0, a5
        bnez              a2, 0b
        ret

asm_test::and::u64::seqcst:
        mv                a6, a2
        lw                a7, 0x0(a0)
        lw                t0, 0x4(a0)
0:
        mv                a5, t0
        mv                a4, a7
        and               a2, a7, a1
        and               a3, t0, a6
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        mv                a7, a4
        mv                t0, a5
        bnez              a2, 0b
        ret

asm_test::and::u64::acquire:
        mv                a6, a2
        lw                a7, 0x0(a0)
        lw                t0, 0x4(a0)
0:
        mv                a5, t0
        mv                a4, a7
        and               a2, a7, a1
        and               a3, t0, a6
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        mv                a7, a4
        mv                t0, a5
        bnez              a2, 0b
        ret

asm_test::and::u64::relaxed:
        mv                a6, a2
        lw                a7, 0x0(a0)
        lw                t0, 0x4(a0)
0:
        mv                a5, t0
        mv                a4, a7
        and               a2, a7, a1
        and               a3, t0, a6
        amocas.d          a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        mv                a7, a4
        mv                t0, a5
        bnez              a2, 0b
        ret

asm_test::and::u64::release:
        mv                a6, a2
        lw                a7, 0x0(a0)
        lw                t0, 0x4(a0)
0:
        mv                a5, t0
        mv                a4, a7
        and               a2, a7, a1
        and               a3, t0, a6
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        mv                a7, a4
        mv                t0, a5
        bnez              a2, 0b
        ret

asm_test::and::bool::acqrel_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a2, a3, a2
        andi              a0, a0, -0x4
        or                a1, a1, a2
        amoand.w.aqrl     zero, a1, (a0)
        ret

asm_test::and::bool::seqcst_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a2, a3, a2
        andi              a0, a0, -0x4
        or                a1, a1, a2
        amoand.w.aqrl     zero, a1, (a0)
        ret

asm_test::and::bool::acqrel_false:
        li                a1, 0xff
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aqrl     zero, a1, (a0)
        ret

asm_test::and::bool::acquire_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a2, a3, a2
        andi              a0, a0, -0x4
        or                a1, a1, a2
        amoand.w.aq       zero, a1, (a0)
        ret

asm_test::and::bool::relaxed_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a2, a3, a2
        andi              a0, a0, -0x4
        or                a1, a1, a2
        amoand.w          zero, a1, (a0)
        ret

asm_test::and::bool::release_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a2, a3, a2
        andi              a0, a0, -0x4
        or                a1, a1, a2
        amoand.w.rl       zero, a1, (a0)
        ret

asm_test::and::bool::seqcst_false:
        li                a1, 0xff
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aqrl     zero, a1, (a0)
        ret

asm_test::and::bool::acquire_false:
        li                a1, 0xff
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aq       zero, a1, (a0)
        ret

asm_test::and::bool::relaxed_false:
        li                a1, 0xff
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w          zero, a1, (a0)
        ret

asm_test::and::bool::release_false:
        li                a1, 0xff
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.rl       zero, a1, (a0)
        ret

asm_test::and::bool::acqrel:
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     zero, a1, (a0)
        ret

asm_test::and::bool::seqcst:
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     zero, a1, (a0)
        ret

asm_test::and::bool::acquire:
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aq       zero, a1, (a0)
        ret

asm_test::and::bool::relaxed:
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w          zero, a1, (a0)
        ret

asm_test::and::bool::release:
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.rl       zero, a1, (a0)
        ret

asm_test::neg::u8::acqrel:
        li                a2, 0xff
        lb                a3, 0x0(a0)
        slli              a1, a0, 0x3
        andi              a0, a0, -0x4
        sll               a2, a2, a1
0:
        neg               a4, a3
        zext.b            a3, a3
        zext.b            a4, a4
        sll               a5, a3, a1
        sll               a3, a4, a1
1:
        lr.w.aq           a4, (a0)
        and               a6, a4, a2
        bne               a6, a5, 2f
        xor               a6, a4, a3
        and               a6, a6, a2
        xor               a6, a4, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 1b
2:
        and               a6, a4, a2
        srl               a3, a4, a1
        bne               a5, a6, 0b
        ret

asm_test::neg::u8::seqcst:
        li                a2, 0xff
        lb                a3, 0x0(a0)
        slli              a1, a0, 0x3
        andi              a0, a0, -0x4
        sll               a2, a2, a1
0:
        neg               a4, a3
        zext.b            a3, a3
        zext.b            a4, a4
        sll               a5, a3, a1
        sll               a3, a4, a1
1:
        lr.w.aqrl         a4, (a0)
        and               a6, a4, a2
        bne               a6, a5, 2f
        xor               a6, a4, a3
        and               a6, a6, a2
        xor               a6, a4, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 1b
2:
        and               a6, a4, a2
        srl               a3, a4, a1
        bne               a5, a6, 0b
        ret

asm_test::neg::u8::acquire:
        li                a2, 0xff
        lb                a3, 0x0(a0)
        slli              a1, a0, 0x3
        andi              a0, a0, -0x4
        sll               a2, a2, a1
0:
        neg               a4, a3
        zext.b            a3, a3
        zext.b            a4, a4
        sll               a5, a3, a1
        sll               a3, a4, a1
1:
        lr.w.aq           a4, (a0)
        and               a6, a4, a2
        bne               a6, a5, 2f
        xor               a6, a4, a3
        and               a6, a6, a2
        xor               a6, a4, a6
        sc.w              a6, a6, (a0)
        bnez              a6, 1b
2:
        and               a6, a4, a2
        srl               a3, a4, a1
        bne               a5, a6, 0b
        ret

asm_test::neg::u8::relaxed:
        li                a2, 0xff
        lb                a3, 0x0(a0)
        slli              a1, a0, 0x3
        andi              a0, a0, -0x4
        sll               a2, a2, a1
0:
        neg               a4, a3
        zext.b            a3, a3
        zext.b            a4, a4
        sll               a5, a3, a1
        sll               a3, a4, a1
1:
        lr.w              a4, (a0)
        and               a6, a4, a2
        bne               a6, a5, 2f
        xor               a6, a4, a3
        and               a6, a6, a2
        xor               a6, a4, a6
        sc.w              a6, a6, (a0)
        bnez              a6, 1b
2:
        and               a6, a4, a2
        srl               a3, a4, a1
        bne               a5, a6, 0b
        ret

asm_test::neg::u8::release:
        li                a2, 0xff
        lb                a3, 0x0(a0)
        slli              a1, a0, 0x3
        andi              a0, a0, -0x4
        sll               a2, a2, a1
0:
        neg               a4, a3
        zext.b            a3, a3
        zext.b            a4, a4
        sll               a5, a3, a1
        sll               a3, a4, a1
1:
        lr.w              a4, (a0)
        and               a6, a4, a2
        bne               a6, a5, 2f
        xor               a6, a4, a3
        and               a6, a6, a2
        xor               a6, a4, a6
        sc.w.rl           a6, a6, (a0)
        bnez              a6, 1b
2:
        and               a6, a4, a2
        srl               a3, a4, a1
        bne               a5, a6, 0b
        ret

asm_test::neg::u16::acqrel:
        lui               a2, 0x10
        lh                a4, 0x0(a0)
        slli              a1, a0, 0x3
        addi              a2, a2, -0x1
        andi              a0, a0, -0x4
        sll               a3, a2, a1
0:
        neg               a5, a4
        and               a4, a4, a2
        and               a5, a5, a2
        sll               a6, a4, a1
        sll               a4, a5, a1
1:
        lr.w.aq           a5, (a0)
        and               a7, a5, a3
        bne               a7, a6, 2f
        xor               a7, a5, a4
        and               a7, a7, a3
        xor               a7, a5, a7
        sc.w.rl           a7, a7, (a0)
        bnez              a7, 1b
2:
        and               a7, a5, a3
        srl               a4, a5, a1
        bne               a6, a7, 0b
        ret

asm_test::neg::u16::seqcst:
        lui               a2, 0x10
        lh                a4, 0x0(a0)
        slli              a1, a0, 0x3
        addi              a2, a2, -0x1
        andi              a0, a0, -0x4
        sll               a3, a2, a1
0:
        neg               a5, a4
        and               a4, a4, a2
        and               a5, a5, a2
        sll               a6, a4, a1
        sll               a4, a5, a1
1:
        lr.w.aqrl         a5, (a0)
        and               a7, a5, a3
        bne               a7, a6, 2f
        xor               a7, a5, a4
        and               a7, a7, a3
        xor               a7, a5, a7
        sc.w.rl           a7, a7, (a0)
        bnez              a7, 1b
2:
        and               a7, a5, a3
        srl               a4, a5, a1
        bne               a6, a7, 0b
        ret

asm_test::neg::u16::acquire:
        lui               a2, 0x10
        lh                a4, 0x0(a0)
        slli              a1, a0, 0x3
        addi              a2, a2, -0x1
        andi              a0, a0, -0x4
        sll               a3, a2, a1
0:
        neg               a5, a4
        and               a4, a4, a2
        and               a5, a5, a2
        sll               a6, a4, a1
        sll               a4, a5, a1
1:
        lr.w.aq           a5, (a0)
        and               a7, a5, a3
        bne               a7, a6, 2f
        xor               a7, a5, a4
        and               a7, a7, a3
        xor               a7, a5, a7
        sc.w              a7, a7, (a0)
        bnez              a7, 1b
2:
        and               a7, a5, a3
        srl               a4, a5, a1
        bne               a6, a7, 0b
        ret

asm_test::neg::u16::relaxed:
        lui               a2, 0x10
        lh                a4, 0x0(a0)
        slli              a1, a0, 0x3
        addi              a2, a2, -0x1
        andi              a0, a0, -0x4
        sll               a3, a2, a1
0:
        neg               a5, a4
        and               a4, a4, a2
        and               a5, a5, a2
        sll               a6, a4, a1
        sll               a4, a5, a1
1:
        lr.w              a5, (a0)
        and               a7, a5, a3
        bne               a7, a6, 2f
        xor               a7, a5, a4
        and               a7, a7, a3
        xor               a7, a5, a7
        sc.w              a7, a7, (a0)
        bnez              a7, 1b
2:
        and               a7, a5, a3
        srl               a4, a5, a1
        bne               a6, a7, 0b
        ret

asm_test::neg::u16::release:
        lui               a2, 0x10
        lh                a4, 0x0(a0)
        slli              a1, a0, 0x3
        addi              a2, a2, -0x1
        andi              a0, a0, -0x4
        sll               a3, a2, a1
0:
        neg               a5, a4
        and               a4, a4, a2
        and               a5, a5, a2
        sll               a6, a4, a1
        sll               a4, a5, a1
1:
        lr.w              a5, (a0)
        and               a7, a5, a3
        bne               a7, a6, 2f
        xor               a7, a5, a4
        and               a7, a7, a3
        xor               a7, a5, a7
        sc.w.rl           a7, a7, (a0)
        bnez              a7, 1b
2:
        and               a7, a5, a3
        srl               a4, a5, a1
        bne               a6, a7, 0b
        ret

asm_test::neg::u32::acqrel:
        lw                a1, 0x0(a0)
0:
        mv                a2, a1
        neg               a3, a1
        amocas.w.aqrl     a1, a3, (a0)
        bne               a1, a2, 0b
        ret

asm_test::neg::u32::seqcst:
        lw                a1, 0x0(a0)
0:
        mv                a2, a1
        neg               a3, a1
        amocas.w.aqrl     a1, a3, (a0)
        bne               a1, a2, 0b
        ret

asm_test::neg::u32::acquire:
        lw                a1, 0x0(a0)
0:
        mv                a2, a1
        neg               a3, a1
        amocas.w.aq       a1, a3, (a0)
        bne               a1, a2, 0b
        ret

asm_test::neg::u32::relaxed:
        lw                a1, 0x0(a0)
0:
        mv                a2, a1
        neg               a3, a1
        amocas.w          a1, a3, (a0)
        bne               a1, a2, 0b
        ret

asm_test::neg::u32::release:
        lw                a1, 0x0(a0)
0:
        mv                a2, a1
        neg               a3, a1
        amocas.w.rl       a1, a3, (a0)
        bne               a1, a2, 0b
        ret

asm_test::neg::u64::acqrel:
        lw                a1, 0x0(a0)
        lw                a6, 0x4(a0)
0:
        mv                a5, a6
        mv                a4, a1
        neg               a2, a1
        snez              a3, a1
        neg               a7, a6
        sub               a3, a7, a3
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a6
        xor               a1, a1, a4
        or                a2, a2, a1
        mv                a1, a4
        mv                a6, a5
        bnez              a2, 0b
        ret

asm_test::neg::u64::seqcst:
        lw                a1, 0x0(a0)
        lw                a6, 0x4(a0)
0:
        mv                a5, a6
        mv                a4, a1
        neg               a2, a1
        snez              a3, a1
        neg               a7, a6
        sub               a3, a7, a3
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a6
        xor               a1, a1, a4
        or                a2, a2, a1
        mv                a1, a4
        mv                a6, a5
        bnez              a2, 0b
        ret

asm_test::neg::u64::acquire:
        lw                a1, 0x0(a0)
        lw                a6, 0x4(a0)
0:
        mv                a5, a6
        mv                a4, a1
        neg               a2, a1
        snez              a3, a1
        neg               a7, a6
        sub               a3, a7, a3
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a5, a6
        xor               a1, a1, a4
        or                a2, a2, a1
        mv                a1, a4
        mv                a6, a5
        bnez              a2, 0b
        ret

asm_test::neg::u64::relaxed:
        lw                a1, 0x0(a0)
        lw                a6, 0x4(a0)
0:
        mv                a5, a6
        mv                a4, a1
        neg               a2, a1
        snez              a3, a1
        neg               a7, a6
        sub               a3, a7, a3
        amocas.d          a4, a2, (a0)
        xor               a2, a5, a6
        xor               a1, a1, a4
        or                a2, a2, a1
        mv                a1, a4
        mv                a6, a5
        bnez              a2, 0b
        ret

asm_test::neg::u64::release:
        lw                a1, 0x0(a0)
        lw                a6, 0x4(a0)
0:
        mv                a5, a6
        mv                a4, a1
        neg               a2, a1
        snez              a3, a1
        neg               a7, a6
        sub               a3, a7, a3
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a5, a6
        xor               a1, a1, a4
        or                a2, a2, a1
        mv                a1, a4
        mv                a6, a5
        bnez              a2, 0b
        ret

asm_test::not::u8::acqrel:
        li                a1, 0xff
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     zero, a1, (a0)
        ret

asm_test::not::u8::seqcst:
        li                a1, 0xff
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     zero, a1, (a0)
        ret

asm_test::not::u8::acquire:
        li                a1, 0xff
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aq       zero, a1, (a0)
        ret

asm_test::not::u8::relaxed:
        li                a1, 0xff
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w          zero, a1, (a0)
        ret

asm_test::not::u8::release:
        li                a1, 0xff
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.rl       zero, a1, (a0)
        ret

asm_test::not::u16::acqrel:
        lui               a1, 0x10
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     zero, a1, (a0)
        ret

asm_test::not::u16::seqcst:
        lui               a1, 0x10
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     zero, a1, (a0)
        ret

asm_test::not::u16::acquire:
        lui               a1, 0x10
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aq       zero, a1, (a0)
        ret

asm_test::not::u16::relaxed:
        lui               a1, 0x10
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w          zero, a1, (a0)
        ret

asm_test::not::u16::release:
        lui               a1, 0x10
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.rl       zero, a1, (a0)
        ret

asm_test::not::u32::acqrel:
        li                a1, -0x1
        amoxor.w.aqrl     zero, a1, (a0)
        ret

asm_test::not::u32::seqcst:
        li                a1, -0x1
        amoxor.w.aqrl     zero, a1, (a0)
        ret

asm_test::not::u32::acquire:
        li                a1, -0x1
        amoxor.w.aq       zero, a1, (a0)
        ret

asm_test::not::u32::relaxed:
        li                a1, -0x1
        amoxor.w          zero, a1, (a0)
        ret

asm_test::not::u32::release:
        li                a1, -0x1
        amoxor.w.rl       zero, a1, (a0)
        ret

asm_test::not::u64::acqrel:
        lw                a1, 0x0(a0)
        lw                a6, 0x4(a0)
0:
        mv                a5, a6
        mv                a4, a1
        not               a2, a1
        not               a3, a6
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a6
        xor               a1, a1, a4
        or                a2, a2, a1
        mv                a1, a4
        mv                a6, a5
        bnez              a2, 0b
        ret

asm_test::not::u64::seqcst:
        lw                a1, 0x0(a0)
        lw                a6, 0x4(a0)
0:
        mv                a5, a6
        mv                a4, a1
        not               a2, a1
        not               a3, a6
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a6
        xor               a1, a1, a4
        or                a2, a2, a1
        mv                a1, a4
        mv                a6, a5
        bnez              a2, 0b
        ret

asm_test::not::u64::acquire:
        lw                a1, 0x0(a0)
        lw                a6, 0x4(a0)
0:
        mv                a5, a6
        mv                a4, a1
        not               a2, a1
        not               a3, a6
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a5, a6
        xor               a1, a1, a4
        or                a2, a2, a1
        mv                a1, a4
        mv                a6, a5
        bnez              a2, 0b
        ret

asm_test::not::u64::relaxed:
        lw                a1, 0x0(a0)
        lw                a6, 0x4(a0)
0:
        mv                a5, a6
        mv                a4, a1
        not               a2, a1
        not               a3, a6
        amocas.d          a4, a2, (a0)
        xor               a2, a5, a6
        xor               a1, a1, a4
        or                a2, a2, a1
        mv                a1, a4
        mv                a6, a5
        bnez              a2, 0b
        ret

asm_test::not::u64::release:
        lw                a1, 0x0(a0)
        lw                a6, 0x4(a0)
0:
        mv                a5, a6
        mv                a4, a1
        not               a2, a1
        not               a3, a6
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a5, a6
        xor               a1, a1, a4
        or                a2, a2, a1
        mv                a1, a4
        mv                a6, a5
        bnez              a2, 0b
        ret

asm_test::not::bool::acqrel:
        li                a1, 0x1
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     zero, a1, (a0)
        ret

asm_test::not::bool::seqcst:
        li                a1, 0x1
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     zero, a1, (a0)
        ret

asm_test::not::bool::acquire:
        li                a1, 0x1
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aq       zero, a1, (a0)
        ret

asm_test::not::bool::relaxed:
        li                a1, 0x1
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w          zero, a1, (a0)
        ret

asm_test::not::bool::release:
        li                a1, 0x1
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.rl       zero, a1, (a0)
        ret

asm_test::sub::u8::acqrel_zero:
        andi              a0, a0, -0x4
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::sub::u8::seqcst_zero:
        andi              a0, a0, -0x4
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::sub::u8::acquire_zero:
        andi              a0, a0, -0x4
        amoor.w.aq        zero, zero, (a0)
        ret

asm_test::sub::u8::relaxed_zero:
        andi              a0, a0, -0x4
        amoor.w           zero, zero, (a0)
        ret

asm_test::sub::u8::release_zero:
        andi              a0, a0, -0x4
        amoor.w.rl        zero, zero, (a0)
        ret

asm_test::sub::u8::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a0, a1, a0
0:
        lr.w.aq           a1, (a2)
        sub               a4, a1, a0
        xor               a4, a4, a1
        and               a4, a4, a3
        xor               a4, a4, a1
        sc.w.rl           a4, a4, (a2)
        bnez              a4, 0b
        ret

asm_test::sub::u8::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a0, a1, a0
0:
        lr.w.aqrl         a1, (a2)
        sub               a4, a1, a0
        xor               a4, a4, a1
        and               a4, a4, a3
        xor               a4, a4, a1
        sc.w.rl           a4, a4, (a2)
        bnez              a4, 0b
        ret

asm_test::sub::u8::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a0, a1, a0
0:
        lr.w.aq           a1, (a2)
        sub               a4, a1, a0
        xor               a4, a4, a1
        and               a4, a4, a3
        xor               a4, a4, a1
        sc.w              a4, a4, (a2)
        bnez              a4, 0b
        ret

asm_test::sub::u8::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a0, a1, a0
0:
        lr.w              a1, (a2)
        sub               a4, a1, a0
        xor               a4, a4, a1
        and               a4, a4, a3
        xor               a4, a4, a1
        sc.w              a4, a4, (a2)
        bnez              a4, 0b
        ret

asm_test::sub::u8::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a0, a1, a0
0:
        lr.w              a1, (a2)
        sub               a4, a1, a0
        xor               a4, a4, a1
        and               a4, a4, a3
        xor               a4, a4, a1
        sc.w.rl           a4, a4, (a2)
        bnez              a4, 0b
        ret

asm_test::sub::u16::acqrel_zero:
        andi              a0, a0, -0x4
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::sub::u16::seqcst_zero:
        andi              a0, a0, -0x4
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::sub::u16::acquire_zero:
        andi              a0, a0, -0x4
        amoor.w.aq        zero, zero, (a0)
        ret

asm_test::sub::u16::relaxed_zero:
        andi              a0, a0, -0x4
        amoor.w           zero, zero, (a0)
        ret

asm_test::sub::u16::release_zero:
        andi              a0, a0, -0x4
        amoor.w.rl        zero, zero, (a0)
        ret

asm_test::sub::u16::acqrel:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a0, a1, a0
0:
        lr.w.aq           a1, (a3)
        sub               a4, a1, a0
        xor               a4, a4, a1
        and               a4, a4, a2
        xor               a4, a4, a1
        sc.w.rl           a4, a4, (a3)
        bnez              a4, 0b
        ret

asm_test::sub::u16::seqcst:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a0, a1, a0
0:
        lr.w.aqrl         a1, (a3)
        sub               a4, a1, a0
        xor               a4, a4, a1
        and               a4, a4, a2
        xor               a4, a4, a1
        sc.w.rl           a4, a4, (a3)
        bnez              a4, 0b
        ret

asm_test::sub::u16::acquire:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a0, a1, a0
0:
        lr.w.aq           a1, (a3)
        sub               a4, a1, a0
        xor               a4, a4, a1
        and               a4, a4, a2
        xor               a4, a4, a1
        sc.w              a4, a4, (a3)
        bnez              a4, 0b
        ret

asm_test::sub::u16::relaxed:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a0, a1, a0
0:
        lr.w              a1, (a3)
        sub               a4, a1, a0
        xor               a4, a4, a1
        and               a4, a4, a2
        xor               a4, a4, a1
        sc.w              a4, a4, (a3)
        bnez              a4, 0b
        ret

asm_test::sub::u16::release:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a0, a1, a0
0:
        lr.w              a1, (a3)
        sub               a4, a1, a0
        xor               a4, a4, a1
        and               a4, a4, a2
        xor               a4, a4, a1
        sc.w.rl           a4, a4, (a3)
        bnez              a4, 0b
        ret

asm_test::sub::u32::acqrel_zero:
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::sub::u32::seqcst_zero:
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::sub::u32::acquire_zero:
        amoor.w.aq        zero, zero, (a0)
        ret

asm_test::sub::u32::relaxed_zero:
        amoor.w           zero, zero, (a0)
        ret

asm_test::sub::u32::release_zero:
        amoor.w.rl        zero, zero, (a0)
        ret

asm_test::sub::u32::acqrel:
        neg               a1, a1
        amoadd.w.aqrl     zero, a1, (a0)
        ret

asm_test::sub::u32::seqcst:
        neg               a1, a1
        amoadd.w.aqrl     zero, a1, (a0)
        ret

asm_test::sub::u32::acquire:
        neg               a1, a1
        amoadd.w.aq       zero, a1, (a0)
        ret

asm_test::sub::u32::relaxed:
        neg               a1, a1
        amoadd.w          zero, a1, (a0)
        ret

asm_test::sub::u32::release:
        neg               a1, a1
        amoadd.w.rl       zero, a1, (a0)
        ret

asm_test::sub::u64::acqrel_zero:
        lw                a2, 0x0(a0)
        lw                a3, 0x4(a0)
0:
        mv                a5, a3
        mv                a4, a2
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a2, a4
        xor               a3, a3, a5
        or                a1, a2, a3
        mv                a2, a4
        mv                a3, a5
        bnez              a1, 0b
        ret

asm_test::sub::u64::seqcst_zero:
        lw                a2, 0x0(a0)
        lw                a3, 0x4(a0)
0:
        mv                a5, a3
        mv                a4, a2
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a2, a4
        xor               a3, a3, a5
        or                a1, a2, a3
        mv                a2, a4
        mv                a3, a5
        bnez              a1, 0b
        ret

asm_test::sub::u64::acquire_zero:
        lw                a2, 0x0(a0)
        lw                a3, 0x4(a0)
0:
        mv                a5, a3
        mv                a4, a2
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a2, a4
        xor               a3, a3, a5
        or                a1, a2, a3
        mv                a2, a4
        mv                a3, a5
        bnez              a1, 0b
        ret

asm_test::sub::u64::relaxed_zero:
        lw                a2, 0x0(a0)
        lw                a3, 0x4(a0)
0:
        mv                a5, a3
        mv                a4, a2
        amocas.d          a4, a2, (a0)
        xor               a2, a2, a4
        xor               a3, a3, a5
        or                a1, a2, a3
        mv                a2, a4
        mv                a3, a5
        bnez              a1, 0b
        ret

asm_test::sub::u64::release_zero:
        lw                a2, 0x0(a0)
        lw                a3, 0x4(a0)
0:
        mv                a5, a3
        mv                a4, a2
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a2, a4
        xor               a3, a3, a5
        or                a1, a2, a3
        mv                a2, a4
        mv                a3, a5
        bnez              a1, 0b
        ret

asm_test::sub::u64::acqrel:
        mv                a6, a2
        lw                a7, 0x0(a0)
        lw                t0, 0x4(a0)
0:
        mv                a5, t0
        mv                a4, a7
        sltu              a3, a7, a1
        sub               t1, t0, a6
        sub               a2, a7, a1
        sub               a3, t1, a3
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        mv                a7, a4
        mv                t0, a5
        bnez              a2, 0b
        ret

asm_test::sub::u64::seqcst:
        mv                a6, a2
        lw                a7, 0x0(a0)
        lw                t0, 0x4(a0)
0:
        mv                a5, t0
        mv                a4, a7
        sltu              a3, a7, a1
        sub               t1, t0, a6
        sub               a2, a7, a1
        sub               a3, t1, a3
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        mv                a7, a4
        mv                t0, a5
        bnez              a2, 0b
        ret

asm_test::sub::u64::acquire:
        mv                a6, a2
        lw                a7, 0x0(a0)
        lw                t0, 0x4(a0)
0:
        mv                a5, t0
        mv                a4, a7
        sltu              a3, a7, a1
        sub               t1, t0, a6
        sub               a2, a7, a1
        sub               a3, t1, a3
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        mv                a7, a4
        mv                t0, a5
        bnez              a2, 0b
        ret

asm_test::sub::u64::relaxed:
        mv                a6, a2
        lw                a7, 0x0(a0)
        lw                t0, 0x4(a0)
0:
        mv                a5, t0
        mv                a4, a7
        sltu              a3, a7, a1
        sub               t1, t0, a6
        sub               a2, a7, a1
        sub               a3, t1, a3
        amocas.d          a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        mv                a7, a4
        mv                t0, a5
        bnez              a2, 0b
        ret

asm_test::sub::u64::release:
        mv                a6, a2
        lw                a7, 0x0(a0)
        lw                t0, 0x4(a0)
0:
        mv                a5, t0
        mv                a4, a7
        sltu              a3, a7, a1
        sub               t1, t0, a6
        sub               a2, a7, a1
        sub               a3, t1, a3
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        mv                a7, a4
        mv                t0, a5
        bnez              a2, 0b
        ret

asm_test::xor::u8::acqrel_zero:
        andi              a0, a0, -0x4
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::xor::u8::seqcst_zero:
        andi              a0, a0, -0x4
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::xor::u8::acquire_zero:
        andi              a0, a0, -0x4
        amoor.w.aq        zero, zero, (a0)
        ret

asm_test::xor::u8::relaxed_zero:
        andi              a0, a0, -0x4
        amoor.w           zero, zero, (a0)
        ret

asm_test::xor::u8::release_zero:
        andi              a0, a0, -0x4
        amoor.w.rl        zero, zero, (a0)
        ret

asm_test::xor::u8::acqrel:
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     zero, a1, (a0)
        ret

asm_test::xor::u8::seqcst:
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     zero, a1, (a0)
        ret

asm_test::xor::u8::acquire:
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aq       zero, a1, (a0)
        ret

asm_test::xor::u8::relaxed:
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w          zero, a1, (a0)
        ret

asm_test::xor::u8::release:
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.rl       zero, a1, (a0)
        ret

asm_test::xor::u16::acqrel_zero:
        andi              a0, a0, -0x4
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::xor::u16::seqcst_zero:
        andi              a0, a0, -0x4
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::xor::u16::acquire_zero:
        andi              a0, a0, -0x4
        amoor.w.aq        zero, zero, (a0)
        ret

asm_test::xor::u16::relaxed_zero:
        andi              a0, a0, -0x4
        amoor.w           zero, zero, (a0)
        ret

asm_test::xor::u16::release_zero:
        andi              a0, a0, -0x4
        amoor.w.rl        zero, zero, (a0)
        ret

asm_test::xor::u16::acqrel:
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     zero, a1, (a0)
        ret

asm_test::xor::u16::seqcst:
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     zero, a1, (a0)
        ret

asm_test::xor::u16::acquire:
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aq       zero, a1, (a0)
        ret

asm_test::xor::u16::relaxed:
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w          zero, a1, (a0)
        ret

asm_test::xor::u16::release:
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.rl       zero, a1, (a0)
        ret

asm_test::xor::u32::acqrel_zero:
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::xor::u32::seqcst_zero:
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::xor::u32::acquire_zero:
        amoor.w.aq        zero, zero, (a0)
        ret

asm_test::xor::u32::relaxed_zero:
        amoor.w           zero, zero, (a0)
        ret

asm_test::xor::u32::release_zero:
        amoor.w.rl        zero, zero, (a0)
        ret

asm_test::xor::u32::acqrel:
        amoxor.w.aqrl     zero, a1, (a0)
        ret

asm_test::xor::u32::seqcst:
        amoxor.w.aqrl     zero, a1, (a0)
        ret

asm_test::xor::u32::acquire:
        amoxor.w.aq       zero, a1, (a0)
        ret

asm_test::xor::u32::relaxed:
        amoxor.w          zero, a1, (a0)
        ret

asm_test::xor::u32::release:
        amoxor.w.rl       zero, a1, (a0)
        ret

asm_test::xor::u64::acqrel_zero:
        lw                a2, 0x0(a0)
        lw                a3, 0x4(a0)
0:
        mv                a5, a3
        mv                a4, a2
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a2, a4
        xor               a3, a3, a5
        or                a1, a2, a3
        mv                a2, a4
        mv                a3, a5
        bnez              a1, 0b
        ret

asm_test::xor::u64::seqcst_zero:
        lw                a2, 0x0(a0)
        lw                a3, 0x4(a0)
0:
        mv                a5, a3
        mv                a4, a2
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a2, a4
        xor               a3, a3, a5
        or                a1, a2, a3
        mv                a2, a4
        mv                a3, a5
        bnez              a1, 0b
        ret

asm_test::xor::u64::acquire_zero:
        lw                a2, 0x0(a0)
        lw                a3, 0x4(a0)
0:
        mv                a5, a3
        mv                a4, a2
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a2, a4
        xor               a3, a3, a5
        or                a1, a2, a3
        mv                a2, a4
        mv                a3, a5
        bnez              a1, 0b
        ret

asm_test::xor::u64::relaxed_zero:
        lw                a2, 0x0(a0)
        lw                a3, 0x4(a0)
0:
        mv                a5, a3
        mv                a4, a2
        amocas.d          a4, a2, (a0)
        xor               a2, a2, a4
        xor               a3, a3, a5
        or                a1, a2, a3
        mv                a2, a4
        mv                a3, a5
        bnez              a1, 0b
        ret

asm_test::xor::u64::release_zero:
        lw                a2, 0x0(a0)
        lw                a3, 0x4(a0)
0:
        mv                a5, a3
        mv                a4, a2
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a2, a4
        xor               a3, a3, a5
        or                a1, a2, a3
        mv                a2, a4
        mv                a3, a5
        bnez              a1, 0b
        ret

asm_test::xor::u64::acqrel:
        mv                a6, a2
        lw                a7, 0x0(a0)
        lw                t0, 0x4(a0)
0:
        mv                a5, t0
        mv                a4, a7
        xor               a2, a7, a1
        xor               a3, t0, a6
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        mv                a7, a4
        mv                t0, a5
        bnez              a2, 0b
        ret

asm_test::xor::u64::seqcst:
        mv                a6, a2
        lw                a7, 0x0(a0)
        lw                t0, 0x4(a0)
0:
        mv                a5, t0
        mv                a4, a7
        xor               a2, a7, a1
        xor               a3, t0, a6
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        mv                a7, a4
        mv                t0, a5
        bnez              a2, 0b
        ret

asm_test::xor::u64::acquire:
        mv                a6, a2
        lw                a7, 0x0(a0)
        lw                t0, 0x4(a0)
0:
        mv                a5, t0
        mv                a4, a7
        xor               a2, a7, a1
        xor               a3, t0, a6
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        mv                a7, a4
        mv                t0, a5
        bnez              a2, 0b
        ret

asm_test::xor::u64::relaxed:
        mv                a6, a2
        lw                a7, 0x0(a0)
        lw                t0, 0x4(a0)
0:
        mv                a5, t0
        mv                a4, a7
        xor               a2, a7, a1
        xor               a3, t0, a6
        amocas.d          a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        mv                a7, a4
        mv                t0, a5
        bnez              a2, 0b
        ret

asm_test::xor::u64::release:
        mv                a6, a2
        lw                a7, 0x0(a0)
        lw                t0, 0x4(a0)
0:
        mv                a5, t0
        mv                a4, a7
        xor               a2, a7, a1
        xor               a3, t0, a6
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        mv                a7, a4
        mv                t0, a5
        bnez              a2, 0b
        ret

asm_test::xor::bool::acqrel_true:
        li                a1, 0x1
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     zero, a1, (a0)
        ret

asm_test::xor::bool::seqcst_true:
        li                a1, 0x1
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     zero, a1, (a0)
        ret

asm_test::xor::bool::acqrel_false:
        andi              a0, a0, -0x4
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::xor::bool::acquire_true:
        li                a1, 0x1
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aq       zero, a1, (a0)
        ret

asm_test::xor::bool::relaxed_true:
        li                a1, 0x1
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w          zero, a1, (a0)
        ret

asm_test::xor::bool::release_true:
        li                a1, 0x1
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.rl       zero, a1, (a0)
        ret

asm_test::xor::bool::seqcst_false:
        andi              a0, a0, -0x4
        amoor.w.aqrl      zero, zero, (a0)
        ret

asm_test::xor::bool::acquire_false:
        andi              a0, a0, -0x4
        amoor.w.aq        zero, zero, (a0)
        ret

asm_test::xor::bool::relaxed_false:
        andi              a0, a0, -0x4
        amoor.w           zero, zero, (a0)
        ret

asm_test::xor::bool::release_false:
        andi              a0, a0, -0x4
        amoor.w.rl        zero, zero, (a0)
        ret

asm_test::xor::bool::acqrel:
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     zero, a1, (a0)
        ret

asm_test::xor::bool::seqcst:
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     zero, a1, (a0)
        ret

asm_test::xor::bool::acquire:
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aq       zero, a1, (a0)
        ret

asm_test::xor::bool::relaxed:
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w          zero, a1, (a0)
        ret

asm_test::xor::bool::release:
        andi              a2, a0, 0x3
        slli              a2, a2, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.rl       zero, a1, (a0)
        ret

asm_test::load::u8::seqcst:
        fence             rw, rw
        lb                a0, 0x0(a0)
        fence             r, rw
        ret

asm_test::load::u8::acquire:
        lb                a0, 0x0(a0)
        fence             r, rw
        ret

asm_test::load::u8::relaxed:
        lb                a0, 0x0(a0)
        ret

asm_test::load::f32::seqcst:
        fence             rw, rw
        lw                a0, 0x0(a0)
        fence             r, rw
        ret

asm_test::load::f32::acquire:
        lw                a0, 0x0(a0)
        fence             r, rw
        ret

asm_test::load::f32::relaxed:
        lw                a0, 0x0(a0)
        ret

asm_test::load::f64::seqcst:
        li                a2, 0x0
        li                a3, 0x0
        fence             rw, rw
        amocas.d.aqrl     a2, a2, (a0)
        mv                a1, a3
        mv                a0, a2
        ret

asm_test::load::f64::acquire:
        li                a2, 0x0
        li                a3, 0x0
        amocas.d.aq       a2, a2, (a0)
        mv                a1, a3
        mv                a0, a2
        ret

asm_test::load::f64::relaxed:
        li                a2, 0x0
        li                a3, 0x0
        amocas.d          a2, a2, (a0)
        mv                a1, a3
        mv                a0, a2
        ret

asm_test::load::u16::seqcst:
        fence             rw, rw
        lh                a0, 0x0(a0)
        fence             r, rw
        ret

asm_test::load::u16::acquire:
        lh                a0, 0x0(a0)
        fence             r, rw
        ret

asm_test::load::u16::relaxed:
        lh                a0, 0x0(a0)
        ret

asm_test::load::u32::seqcst:
        fence             rw, rw
        lw                a0, 0x0(a0)
        fence             r, rw
        ret

asm_test::load::u32::acquire:
        lw                a0, 0x0(a0)
        fence             r, rw
        ret

asm_test::load::u32::relaxed:
        lw                a0, 0x0(a0)
        ret

asm_test::load::u64::seqcst:
        li                a2, 0x0
        li                a3, 0x0
        fence             rw, rw
        amocas.d.aqrl     a2, a2, (a0)
        mv                a1, a3
        mv                a0, a2
        ret

asm_test::load::u64::acquire:
        li                a2, 0x0
        li                a3, 0x0
        amocas.d.aq       a2, a2, (a0)
        mv                a1, a3
        mv                a0, a2
        ret

asm_test::load::u64::relaxed:
        li                a2, 0x0
        li                a3, 0x0
        amocas.d          a2, a2, (a0)
        mv                a1, a3
        mv                a0, a2
        ret

asm_test::load::bool::seqcst:
        fence             rw, rw
        lbu               a0, 0x0(a0)
        fence             r, rw
        ret

asm_test::load::bool::acquire:
        lbu               a0, 0x0(a0)
        fence             r, rw
        ret

asm_test::load::bool::relaxed:
        lbu               a0, 0x0(a0)
        ret

asm_test::swap::u8::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w.aq           a4, (a2)
        mv                a5, a1
        xor               a5, a5, a4
        and               a5, a5, a3
        xor               a5, a5, a4
        sc.w.rl           a5, a5, (a2)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::swap::u8::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w.aqrl         a4, (a2)
        mv                a5, a1
        xor               a5, a5, a4
        and               a5, a5, a3
        xor               a5, a5, a4
        sc.w.rl           a5, a5, (a2)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::swap::u8::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w.aq           a4, (a2)
        mv                a5, a1
        xor               a5, a5, a4
        and               a5, a5, a3
        xor               a5, a5, a4
        sc.w              a5, a5, (a2)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::swap::u8::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w              a4, (a2)
        mv                a5, a1
        xor               a5, a5, a4
        and               a5, a5, a3
        xor               a5, a5, a4
        sc.w              a5, a5, (a2)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::swap::u8::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w              a4, (a2)
        mv                a5, a1
        xor               a5, a5, a4
        and               a5, a5, a3
        xor               a5, a5, a4
        sc.w.rl           a5, a5, (a2)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::swap::f32::acqrel:
        amoswap.w.aqrl    a0, a1, (a0)
        ret

asm_test::swap::f32::seqcst:
        amoswap.w.aqrl    a0, a1, (a0)
        ret

asm_test::swap::f32::acquire:
        amoswap.w.aq      a0, a1, (a0)
        ret

asm_test::swap::f32::relaxed:
        amoswap.w         a0, a1, (a0)
        ret

asm_test::swap::f32::release:
        amoswap.w.rl      a0, a1, (a0)
        ret

asm_test::swap::f64::acqrel:
        mv                a3, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        mv                a2, a1
0:
        mv                a1, a5
        mv                a6, a4
        amocas.d.aqrl     a4, a2, (a0)
        xor               a7, a5, a1
        xor               t0, a4, a6
        or                a7, t0, a7
        bnez              a7, 0b
        mv                a0, a6
        ret

asm_test::swap::f64::seqcst:
        mv                a3, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        mv                a2, a1
0:
        mv                a1, a5
        mv                a6, a4
        amocas.d.aqrl     a4, a2, (a0)
        xor               a7, a5, a1
        xor               t0, a4, a6
        or                a7, t0, a7
        bnez              a7, 0b
        mv                a0, a6
        ret

asm_test::swap::f64::acquire:
        mv                a3, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        mv                a2, a1
0:
        mv                a1, a5
        mv                a6, a4
        amocas.d.aq       a4, a2, (a0)
        xor               a7, a5, a1
        xor               t0, a4, a6
        or                a7, t0, a7
        bnez              a7, 0b
        mv                a0, a6
        ret

asm_test::swap::f64::relaxed:
        mv                a3, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        mv                a2, a1
0:
        mv                a1, a5
        mv                a6, a4
        amocas.d          a4, a2, (a0)
        xor               a7, a5, a1
        xor               t0, a4, a6
        or                a7, t0, a7
        bnez              a7, 0b
        mv                a0, a6
        ret

asm_test::swap::f64::release:
        mv                a3, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        mv                a2, a1
0:
        mv                a1, a5
        mv                a6, a4
        amocas.d.rl       a4, a2, (a0)
        xor               a7, a5, a1
        xor               t0, a4, a6
        or                a7, t0, a7
        bnez              a7, 0b
        mv                a0, a6
        ret

asm_test::swap::u16::acqrel:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a1, a1, a0
0:
        lr.w.aq           a4, (a3)
        mv                a5, a1
        xor               a5, a5, a4
        and               a5, a5, a2
        xor               a5, a5, a4
        sc.w.rl           a5, a5, (a3)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::swap::u16::seqcst:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a1, a1, a0
0:
        lr.w.aqrl         a4, (a3)
        mv                a5, a1
        xor               a5, a5, a4
        and               a5, a5, a2
        xor               a5, a5, a4
        sc.w.rl           a5, a5, (a3)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::swap::u16::acquire:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a1, a1, a0
0:
        lr.w.aq           a4, (a3)
        mv                a5, a1
        xor               a5, a5, a4
        and               a5, a5, a2
        xor               a5, a5, a4
        sc.w              a5, a5, (a3)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::swap::u16::relaxed:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a1, a1, a0
0:
        lr.w              a4, (a3)
        mv                a5, a1
        xor               a5, a5, a4
        and               a5, a5, a2
        xor               a5, a5, a4
        sc.w              a5, a5, (a3)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::swap::u16::release:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a1, a1, a0
0:
        lr.w              a4, (a3)
        mv                a5, a1
        xor               a5, a5, a4
        and               a5, a5, a2
        xor               a5, a5, a4
        sc.w.rl           a5, a5, (a3)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::swap::u32::acqrel:
        amoswap.w.aqrl    a0, a1, (a0)
        ret

asm_test::swap::u32::seqcst:
        amoswap.w.aqrl    a0, a1, (a0)
        ret

asm_test::swap::u32::acquire:
        amoswap.w.aq      a0, a1, (a0)
        ret

asm_test::swap::u32::relaxed:
        amoswap.w         a0, a1, (a0)
        ret

asm_test::swap::u32::release:
        amoswap.w.rl      a0, a1, (a0)
        ret

asm_test::swap::u64::acqrel:
        mv                a3, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        mv                a2, a1
0:
        mv                a1, a5
        mv                a6, a4
        amocas.d.aqrl     a4, a2, (a0)
        xor               a7, a5, a1
        xor               t0, a4, a6
        or                a7, t0, a7
        bnez              a7, 0b
        mv                a0, a6
        ret

asm_test::swap::u64::seqcst:
        mv                a3, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        mv                a2, a1
0:
        mv                a1, a5
        mv                a6, a4
        amocas.d.aqrl     a4, a2, (a0)
        xor               a7, a5, a1
        xor               t0, a4, a6
        or                a7, t0, a7
        bnez              a7, 0b
        mv                a0, a6
        ret

asm_test::swap::u64::acquire:
        mv                a3, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        mv                a2, a1
0:
        mv                a1, a5
        mv                a6, a4
        amocas.d.aq       a4, a2, (a0)
        xor               a7, a5, a1
        xor               t0, a4, a6
        or                a7, t0, a7
        bnez              a7, 0b
        mv                a0, a6
        ret

asm_test::swap::u64::relaxed:
        mv                a3, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        mv                a2, a1
0:
        mv                a1, a5
        mv                a6, a4
        amocas.d          a4, a2, (a0)
        xor               a7, a5, a1
        xor               t0, a4, a6
        or                a7, t0, a7
        bnez              a7, 0b
        mv                a0, a6
        ret

asm_test::swap::u64::release:
        mv                a3, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        mv                a2, a1
0:
        mv                a1, a5
        mv                a6, a4
        amocas.d.rl       a4, a2, (a0)
        xor               a7, a5, a1
        xor               t0, a4, a6
        or                a7, t0, a7
        bnez              a7, 0b
        mv                a0, a6
        ret

asm_test::swap::bool::acqrel_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::swap::bool::seqcst_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::swap::bool::acqrel_false:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::swap::bool::acquire_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::swap::bool::relaxed_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w           a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::swap::bool::release_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.rl        a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::swap::bool::seqcst_false:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::swap::bool::acquire_false:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aq       a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::swap::bool::relaxed_false:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w          a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::swap::bool::release_false:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.rl       a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::swap::bool::acqrel:
        beqz              a1, 0f
        slli              a1, a0, 0x3
        li                a2, 0x1
        andi              a0, a0, -0x4
        sll               a2, a2, a1
        amoor.w.aqrl      a0, a2, (a0)
        srl               a0, a0, a1
        andi              a0, a0, 0x1
        ret
0:
        slli              a1, a0, 0x3
        li                a2, 0xff
        sll               a2, a2, a1
        andi              a0, a0, -0x4
        not               a2, a2
        amoand.w.aqrl     a0, a2, (a0)
        srl               a0, a0, a1
        andi              a0, a0, 0x1
        ret

asm_test::swap::bool::seqcst:
        beqz              a1, 0f
        slli              a1, a0, 0x3
        li                a2, 0x1
        andi              a0, a0, -0x4
        sll               a2, a2, a1
        amoor.w.aqrl      a0, a2, (a0)
        srl               a0, a0, a1
        andi              a0, a0, 0x1
        ret
0:
        slli              a1, a0, 0x3
        li                a2, 0xff
        sll               a2, a2, a1
        andi              a0, a0, -0x4
        not               a2, a2
        amoand.w.aqrl     a0, a2, (a0)
        srl               a0, a0, a1
        andi              a0, a0, 0x1
        ret

asm_test::swap::bool::acquire:
        beqz              a1, 0f
        slli              a1, a0, 0x3
        li                a2, 0x1
        andi              a0, a0, -0x4
        sll               a2, a2, a1
        amoor.w.aq        a0, a2, (a0)
        srl               a0, a0, a1
        andi              a0, a0, 0x1
        ret
0:
        slli              a1, a0, 0x3
        li                a2, 0xff
        sll               a2, a2, a1
        andi              a0, a0, -0x4
        not               a2, a2
        amoand.w.aq       a0, a2, (a0)
        srl               a0, a0, a1
        andi              a0, a0, 0x1
        ret

asm_test::swap::bool::relaxed:
        beqz              a1, 0f
        slli              a1, a0, 0x3
        li                a2, 0x1
        andi              a0, a0, -0x4
        sll               a2, a2, a1
        amoor.w           a0, a2, (a0)
        srl               a0, a0, a1
        andi              a0, a0, 0x1
        ret
0:
        slli              a1, a0, 0x3
        li                a2, 0xff
        sll               a2, a2, a1
        andi              a0, a0, -0x4
        not               a2, a2
        amoand.w          a0, a2, (a0)
        srl               a0, a0, a1
        andi              a0, a0, 0x1
        ret

asm_test::swap::bool::release:
        beqz              a1, 0f
        slli              a1, a0, 0x3
        li                a2, 0x1
        andi              a0, a0, -0x4
        sll               a2, a2, a1
        amoor.w.rl        a0, a2, (a0)
        srl               a0, a0, a1
        andi              a0, a0, 0x1
        ret
0:
        slli              a1, a0, 0x3
        li                a2, 0xff
        sll               a2, a2, a1
        andi              a0, a0, -0x4
        not               a2, a2
        amoand.w.rl       a0, a2, (a0)
        srl               a0, a0, a1
        andi              a0, a0, 0x1
        ret

asm_test::store::u8::seqcst:
        fence             rw, w
        sb                a1, 0x0(a0)
        fence             rw, rw
        ret

asm_test::store::u8::relaxed:
        sb                a1, 0x0(a0)
        ret

asm_test::store::u8::release:
        fence             rw, w
        sb                a1, 0x0(a0)
        ret

asm_test::store::f32::seqcst:
        fence             rw, w
        sw                a1, 0x0(a0)
        fence             rw, rw
        ret

asm_test::store::f32::relaxed:
        sw                a1, 0x0(a0)
        ret

asm_test::store::f32::release:
        fence             rw, w
        sw                a1, 0x0(a0)
        ret

asm_test::store::f64::seqcst:
        mv                a3, a2
        lw                a7, 0x0(a0)
        lw                a6, 0x4(a0)
        mv                a2, a1
0:
        mv                a5, a6
        mv                a4, a7
        amocas.d.aqrl     a4, a2, (a0)
        xor               a1, a4, a7
        xor               a6, a5, a6
        or                a1, a1, a6
        mv                a7, a4
        mv                a6, a5
        bnez              a1, 0b
        ret

asm_test::store::f64::relaxed:
        mv                a3, a2
        lw                a7, 0x0(a0)
        lw                a6, 0x4(a0)
        mv                a2, a1
0:
        mv                a5, a6
        mv                a4, a7
        amocas.d          a4, a2, (a0)
        xor               a1, a4, a7
        xor               a6, a5, a6
        or                a1, a1, a6
        mv                a7, a4
        mv                a6, a5
        bnez              a1, 0b
        ret

asm_test::store::f64::release:
        mv                a3, a2
        lw                a7, 0x0(a0)
        lw                a6, 0x4(a0)
        mv                a2, a1
0:
        mv                a5, a6
        mv                a4, a7
        amocas.d.rl       a4, a2, (a0)
        xor               a1, a4, a7
        xor               a6, a5, a6
        or                a1, a1, a6
        mv                a7, a4
        mv                a6, a5
        bnez              a1, 0b
        ret

asm_test::store::u16::seqcst:
        fence             rw, w
        sh                a1, 0x0(a0)
        fence             rw, rw
        ret

asm_test::store::u16::relaxed:
        sh                a1, 0x0(a0)
        ret

asm_test::store::u16::release:
        fence             rw, w
        sh                a1, 0x0(a0)
        ret

asm_test::store::u32::seqcst:
        fence             rw, w
        sw                a1, 0x0(a0)
        fence             rw, rw
        ret

asm_test::store::u32::relaxed:
        sw                a1, 0x0(a0)
        ret

asm_test::store::u32::release:
        fence             rw, w
        sw                a1, 0x0(a0)
        ret

asm_test::store::u64::seqcst:
        mv                a3, a2
        lw                a7, 0x0(a0)
        lw                a6, 0x4(a0)
        mv                a2, a1
0:
        mv                a5, a6
        mv                a4, a7
        amocas.d.aqrl     a4, a2, (a0)
        xor               a1, a4, a7
        xor               a6, a5, a6
        or                a1, a1, a6
        mv                a7, a4
        mv                a6, a5
        bnez              a1, 0b
        ret

asm_test::store::u64::relaxed:
        mv                a3, a2
        lw                a7, 0x0(a0)
        lw                a6, 0x4(a0)
        mv                a2, a1
0:
        mv                a5, a6
        mv                a4, a7
        amocas.d          a4, a2, (a0)
        xor               a1, a4, a7
        xor               a6, a5, a6
        or                a1, a1, a6
        mv                a7, a4
        mv                a6, a5
        bnez              a1, 0b
        ret

asm_test::store::u64::release:
        mv                a3, a2
        lw                a7, 0x0(a0)
        lw                a6, 0x4(a0)
        mv                a2, a1
0:
        mv                a5, a6
        mv                a4, a7
        amocas.d.rl       a4, a2, (a0)
        xor               a1, a4, a7
        xor               a6, a5, a6
        or                a1, a1, a6
        mv                a7, a4
        mv                a6, a5
        bnez              a1, 0b
        ret

asm_test::store::bool::seqcst:
        fence             rw, w
        sb                a1, 0x0(a0)
        fence             rw, rw
        ret

asm_test::store::bool::relaxed:
        sb                a1, 0x0(a0)
        ret

asm_test::store::bool::release:
        fence             rw, w
        sb                a1, 0x0(a0)
        ret

asm_test::bit_set::u8::acqrel:
        andi              a1, a1, 0x7
        li                a2, 0x1
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a1, a2
        amoor.w.aqrl      a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_set::u8::seqcst:
        andi              a1, a1, 0x7
        li                a2, 0x1
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a1, a2
        amoor.w.aqrl      a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_set::u8::acquire:
        andi              a1, a1, 0x7
        li                a2, 0x1
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a1, a2
        amoor.w.aq        a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_set::u8::relaxed:
        andi              a1, a1, 0x7
        li                a2, 0x1
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a1, a2
        amoor.w           a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_set::u8::release:
        andi              a1, a1, 0x7
        li                a2, 0x1
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a1, a2
        amoor.w.rl        a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_set::u16::acqrel:
        andi              a1, a1, 0xf
        li                a2, 0x1
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a1, a2
        amoor.w.aqrl      a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_set::u16::seqcst:
        andi              a1, a1, 0xf
        li                a2, 0x1
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a1, a2
        amoor.w.aqrl      a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_set::u16::acquire:
        andi              a1, a1, 0xf
        li                a2, 0x1
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a1, a2
        amoor.w.aq        a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_set::u16::relaxed:
        andi              a1, a1, 0xf
        li                a2, 0x1
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a1, a2
        amoor.w           a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_set::u16::release:
        andi              a1, a1, 0xf
        li                a2, 0x1
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a1, a2
        amoor.w.rl        a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_set::u32::acqrel:
        li                a2, 0x1
        sll               a1, a2, a1
        amoor.w.aqrl      a0, a1, (a0)
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_set::u32::seqcst:
        li                a2, 0x1
        sll               a1, a2, a1
        amoor.w.aqrl      a0, a1, (a0)
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_set::u32::acquire:
        li                a2, 0x1
        sll               a1, a2, a1
        amoor.w.aq        a0, a1, (a0)
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_set::u32::relaxed:
        li                a2, 0x1
        sll               a1, a2, a1
        amoor.w           a0, a1, (a0)
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_set::u32::release:
        li                a2, 0x1
        sll               a1, a2, a1
        amoor.w.rl        a0, a1, (a0)
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_set::u64::acqrel:
        andi              a2, a1, 0x3f
        li                a3, 0x1
        addi              a4, a2, -0x20
        sll               a1, a3, a1
        srli              a6, a4, 0x1f
        sll               a2, a3, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        neg               a3, a6
        addi              a6, a6, -0x1
        and               a7, a3, a1
        and               t0, a6, a2
0:
        mv                a1, a4
        mv                a6, a5
        or                a2, a4, a7
        or                a3, a5, t0
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a6
        xor               a3, a4, a1
        or                a2, a2, a3
        bnez              a2, 0b
        and               a0, a1, a7
        and               a1, a6, t0
        or                a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_set::u64::seqcst:
        andi              a2, a1, 0x3f
        li                a3, 0x1
        addi              a4, a2, -0x20
        sll               a1, a3, a1
        srli              a6, a4, 0x1f
        sll               a2, a3, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        neg               a3, a6
        addi              a6, a6, -0x1
        and               a7, a3, a1
        and               t0, a6, a2
0:
        mv                a1, a4
        mv                a6, a5
        or                a2, a4, a7
        or                a3, a5, t0
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a6
        xor               a3, a4, a1
        or                a2, a2, a3
        bnez              a2, 0b
        and               a0, a1, a7
        and               a1, a6, t0
        or                a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_set::u64::acquire:
        andi              a2, a1, 0x3f
        li                a3, 0x1
        addi              a4, a2, -0x20
        sll               a1, a3, a1
        srli              a6, a4, 0x1f
        sll               a2, a3, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        neg               a3, a6
        addi              a6, a6, -0x1
        and               a7, a3, a1
        and               t0, a6, a2
0:
        mv                a1, a4
        mv                a6, a5
        or                a2, a4, a7
        or                a3, a5, t0
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a5, a6
        xor               a3, a4, a1
        or                a2, a2, a3
        bnez              a2, 0b
        and               a0, a1, a7
        and               a1, a6, t0
        or                a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_set::u64::relaxed:
        andi              a2, a1, 0x3f
        li                a3, 0x1
        addi              a4, a2, -0x20
        sll               a1, a3, a1
        srli              a6, a4, 0x1f
        sll               a2, a3, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        neg               a3, a6
        addi              a6, a6, -0x1
        and               a7, a3, a1
        and               t0, a6, a2
0:
        mv                a1, a4
        mv                a6, a5
        or                a2, a4, a7
        or                a3, a5, t0
        amocas.d          a4, a2, (a0)
        xor               a2, a5, a6
        xor               a3, a4, a1
        or                a2, a2, a3
        bnez              a2, 0b
        and               a0, a1, a7
        and               a1, a6, t0
        or                a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_set::u64::release:
        andi              a2, a1, 0x3f
        li                a3, 0x1
        addi              a4, a2, -0x20
        sll               a1, a3, a1
        srli              a6, a4, 0x1f
        sll               a2, a3, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        neg               a3, a6
        addi              a6, a6, -0x1
        and               a7, a3, a1
        and               t0, a6, a2
0:
        mv                a1, a4
        mv                a6, a5
        or                a2, a4, a7
        or                a3, a5, t0
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a5, a6
        xor               a3, a4, a1
        or                a2, a2, a3
        bnez              a2, 0b
        and               a0, a1, a7
        and               a1, a6, t0
        or                a0, a0, a1
        snez              a0, a0
        ret

asm_test::fetch_or::u8::acqrel_all:
        li                a1, 0xff
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u8::seqcst_all:
        li                a1, 0xff
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u8::acqrel_zero:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_or::u8::acquire_all:
        li                a1, 0xff
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u8::relaxed_all:
        li                a1, 0xff
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w           a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u8::release_all:
        li                a1, 0xff
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.rl        a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u8::seqcst_zero:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_or::u8::acquire_zero:
        andi              a1, a0, -0x4
        amoor.w.aq        a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_or::u8::relaxed_zero:
        andi              a1, a0, -0x4
        amoor.w           a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_or::u8::release_zero:
        andi              a1, a0, -0x4
        amoor.w.rl        a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_or::u8::acqrel:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u8::seqcst:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u8::acquire:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u8::relaxed:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w           a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u8::release:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.rl        a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u16::acqrel_all:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u16::seqcst_all:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u16::acqrel_zero:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_or::u16::acquire_all:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u16::relaxed_all:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w           a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u16::release_all:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.rl        a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u16::seqcst_zero:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_or::u16::acquire_zero:
        andi              a1, a0, -0x4
        amoor.w.aq        a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_or::u16::relaxed_zero:
        andi              a1, a0, -0x4
        amoor.w           a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_or::u16::release_zero:
        andi              a1, a0, -0x4
        amoor.w.rl        a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_or::u16::acqrel:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u16::seqcst:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u16::acquire:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u16::relaxed:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w           a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u16::release:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.rl        a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u32::acqrel_all:
        li                a1, -0x1
        amoswap.w.aqrl    a0, a1, (a0)
        ret

asm_test::fetch_or::u32::seqcst_all:
        li                a1, -0x1
        amoswap.w.aqrl    a0, a1, (a0)
        ret

asm_test::fetch_or::u32::acqrel_zero:
        amoor.w.aqrl      a0, zero, (a0)
        ret

asm_test::fetch_or::u32::acquire_all:
        li                a1, -0x1
        amoswap.w.aq      a0, a1, (a0)
        ret

asm_test::fetch_or::u32::relaxed_all:
        li                a1, -0x1
        amoswap.w         a0, a1, (a0)
        ret

asm_test::fetch_or::u32::release_all:
        li                a1, -0x1
        amoswap.w.rl      a0, a1, (a0)
        ret

asm_test::fetch_or::u32::seqcst_zero:
        amoor.w.aqrl      a0, zero, (a0)
        ret

asm_test::fetch_or::u32::acquire_zero:
        amoor.w.aq        a0, zero, (a0)
        ret

asm_test::fetch_or::u32::relaxed_zero:
        amoor.w           a0, zero, (a0)
        ret

asm_test::fetch_or::u32::release_zero:
        amoor.w.rl        a0, zero, (a0)
        ret

asm_test::fetch_or::u32::acqrel:
        amoor.w.aqrl      a0, a1, (a0)
        ret

asm_test::fetch_or::u32::seqcst:
        amoor.w.aqrl      a0, a1, (a0)
        ret

asm_test::fetch_or::u32::acquire:
        amoor.w.aq        a0, a1, (a0)
        ret

asm_test::fetch_or::u32::relaxed:
        amoor.w           a0, a1, (a0)
        ret

asm_test::fetch_or::u32::release:
        amoor.w.rl        a0, a1, (a0)
        ret

asm_test::fetch_or::u64::acqrel_all:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a1, a5
        mv                a6, a4
        li                a2, -0x1
        li                a3, -0x1
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a1
        xor               a3, a4, a6
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a6
        ret

asm_test::fetch_or::u64::seqcst_all:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a1, a5
        mv                a6, a4
        li                a2, -0x1
        li                a3, -0x1
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a1
        xor               a3, a4, a6
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a6
        ret

asm_test::fetch_or::u64::acqrel_zero:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a2, a4
        mv                a3, a5
        amocas.d.aqrl     a4, a2, (a0)
        xor               a1, a5, a3
        xor               a6, a4, a2
        or                a1, a6, a1
        bnez              a1, 0b
        mv                a0, a2
        mv                a1, a3
        ret

asm_test::fetch_or::u64::acquire_all:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a1, a5
        mv                a6, a4
        li                a2, -0x1
        li                a3, -0x1
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a5, a1
        xor               a3, a4, a6
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a6
        ret

asm_test::fetch_or::u64::relaxed_all:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a1, a5
        mv                a6, a4
        li                a2, -0x1
        li                a3, -0x1
        amocas.d          a4, a2, (a0)
        xor               a2, a5, a1
        xor               a3, a4, a6
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a6
        ret

asm_test::fetch_or::u64::release_all:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a1, a5
        mv                a6, a4
        li                a2, -0x1
        li                a3, -0x1
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a5, a1
        xor               a3, a4, a6
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a6
        ret

asm_test::fetch_or::u64::seqcst_zero:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a2, a4
        mv                a3, a5
        amocas.d.aqrl     a4, a2, (a0)
        xor               a1, a5, a3
        xor               a6, a4, a2
        or                a1, a6, a1
        bnez              a1, 0b
        mv                a0, a2
        mv                a1, a3
        ret

asm_test::fetch_or::u64::acquire_zero:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a2, a4
        mv                a3, a5
        amocas.d.aq       a4, a2, (a0)
        xor               a1, a5, a3
        xor               a6, a4, a2
        or                a1, a6, a1
        bnez              a1, 0b
        mv                a0, a2
        mv                a1, a3
        ret

asm_test::fetch_or::u64::relaxed_zero:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a2, a4
        mv                a3, a5
        amocas.d          a4, a2, (a0)
        xor               a1, a5, a3
        xor               a6, a4, a2
        or                a1, a6, a1
        bnez              a1, 0b
        mv                a0, a2
        mv                a1, a3
        ret

asm_test::fetch_or::u64::release_zero:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a2, a4
        mv                a3, a5
        amocas.d.rl       a4, a2, (a0)
        xor               a1, a5, a3
        xor               a6, a4, a2
        or                a1, a6, a1
        bnez              a1, 0b
        mv                a0, a2
        mv                a1, a3
        ret

asm_test::fetch_or::u64::acqrel:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a4
        mv                t0, a5
        or                a2, a4, a1
        or                a3, a5, a6
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a7
        mv                a1, t0
        ret

asm_test::fetch_or::u64::seqcst:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a4
        mv                t0, a5
        or                a2, a4, a1
        or                a3, a5, a6
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a7
        mv                a1, t0
        ret

asm_test::fetch_or::u64::acquire:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a4
        mv                t0, a5
        or                a2, a4, a1
        or                a3, a5, a6
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a7
        mv                a1, t0
        ret

asm_test::fetch_or::u64::relaxed:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a4
        mv                t0, a5
        or                a2, a4, a1
        or                a3, a5, a6
        amocas.d          a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a7
        mv                a1, t0
        ret

asm_test::fetch_or::u64::release:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a4
        mv                t0, a5
        or                a2, a4, a1
        or                a3, a5, a6
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a7
        mv                a1, t0
        ret

asm_test::fetch_or::bool::acqrel_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_or::bool::seqcst_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_or::bool::acqrel_false:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        andi              a0, a0, 0x1
        ret

asm_test::fetch_or::bool::acquire_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_or::bool::relaxed_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w           a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_or::bool::release_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.rl        a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_or::bool::seqcst_false:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        andi              a0, a0, 0x1
        ret

asm_test::fetch_or::bool::acquire_false:
        andi              a1, a0, -0x4
        amoor.w.aq        a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        andi              a0, a0, 0x1
        ret

asm_test::fetch_or::bool::relaxed_false:
        andi              a1, a0, -0x4
        amoor.w           a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        andi              a0, a0, 0x1
        ret

asm_test::fetch_or::bool::release_false:
        andi              a1, a0, -0x4
        amoor.w.rl        a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        andi              a0, a0, 0x1
        ret

asm_test::fetch_or::bool::acqrel:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_or::bool::seqcst:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_or::bool::acquire:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_or::bool::relaxed:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w           a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_or::bool::release:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.rl        a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::bit_clear::u8::acqrel:
        li                a2, 0x1
        andi              a1, a1, 0x7
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        li                a3, 0xff
        xori              a4, a1, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a4, a4, a2
        andi              a0, a0, -0x4
        or                a3, a3, a4
        amoand.w.aqrl     a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_clear::u8::seqcst:
        li                a2, 0x1
        andi              a1, a1, 0x7
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        li                a3, 0xff
        xori              a4, a1, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a4, a4, a2
        andi              a0, a0, -0x4
        or                a3, a3, a4
        amoand.w.aqrl     a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_clear::u8::acquire:
        li                a2, 0x1
        andi              a1, a1, 0x7
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        li                a3, 0xff
        xori              a4, a1, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a4, a4, a2
        andi              a0, a0, -0x4
        or                a3, a3, a4
        amoand.w.aq       a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_clear::u8::relaxed:
        li                a2, 0x1
        andi              a1, a1, 0x7
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        li                a3, 0xff
        xori              a4, a1, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a4, a4, a2
        andi              a0, a0, -0x4
        or                a3, a3, a4
        amoand.w          a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_clear::u8::release:
        li                a2, 0x1
        andi              a1, a1, 0x7
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        li                a3, 0xff
        xori              a4, a1, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a4, a4, a2
        andi              a0, a0, -0x4
        or                a3, a3, a4
        amoand.w.rl       a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_clear::u16::acqrel:
        li                a2, 0x1
        andi              a1, a1, 0xf
        lui               a3, 0x10
        sll               a1, a2, a1
        addi              a3, a3, -0x1
        slli              a2, a0, 0x3
        xor               a4, a1, a3
        sll               a3, a3, a2
        not               a3, a3
        sll               a4, a4, a2
        andi              a0, a0, -0x4
        or                a3, a3, a4
        amoand.w.aqrl     a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_clear::u16::seqcst:
        li                a2, 0x1
        andi              a1, a1, 0xf
        lui               a3, 0x10
        sll               a1, a2, a1
        addi              a3, a3, -0x1
        slli              a2, a0, 0x3
        xor               a4, a1, a3
        sll               a3, a3, a2
        not               a3, a3
        sll               a4, a4, a2
        andi              a0, a0, -0x4
        or                a3, a3, a4
        amoand.w.aqrl     a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_clear::u16::acquire:
        li                a2, 0x1
        andi              a1, a1, 0xf
        lui               a3, 0x10
        sll               a1, a2, a1
        addi              a3, a3, -0x1
        slli              a2, a0, 0x3
        xor               a4, a1, a3
        sll               a3, a3, a2
        not               a3, a3
        sll               a4, a4, a2
        andi              a0, a0, -0x4
        or                a3, a3, a4
        amoand.w.aq       a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_clear::u16::relaxed:
        li                a2, 0x1
        andi              a1, a1, 0xf
        lui               a3, 0x10
        sll               a1, a2, a1
        addi              a3, a3, -0x1
        slli              a2, a0, 0x3
        xor               a4, a1, a3
        sll               a3, a3, a2
        not               a3, a3
        sll               a4, a4, a2
        andi              a0, a0, -0x4
        or                a3, a3, a4
        amoand.w          a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_clear::u16::release:
        li                a2, 0x1
        andi              a1, a1, 0xf
        lui               a3, 0x10
        sll               a1, a2, a1
        addi              a3, a3, -0x1
        slli              a2, a0, 0x3
        xor               a4, a1, a3
        sll               a3, a3, a2
        not               a3, a3
        sll               a4, a4, a2
        andi              a0, a0, -0x4
        or                a3, a3, a4
        amoand.w.rl       a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_clear::u32::acqrel:
        li                a2, 0x1
        sll               a1, a2, a1
        not               a2, a1
        amoand.w.aqrl     a0, a2, (a0)
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_clear::u32::seqcst:
        li                a2, 0x1
        sll               a1, a2, a1
        not               a2, a1
        amoand.w.aqrl     a0, a2, (a0)
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_clear::u32::acquire:
        li                a2, 0x1
        sll               a1, a2, a1
        not               a2, a1
        amoand.w.aq       a0, a2, (a0)
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_clear::u32::relaxed:
        li                a2, 0x1
        sll               a1, a2, a1
        not               a2, a1
        amoand.w          a0, a2, (a0)
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_clear::u32::release:
        li                a2, 0x1
        sll               a1, a2, a1
        not               a2, a1
        amoand.w.rl       a0, a2, (a0)
        and               a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_clear::u64::acqrel:
        andi              a2, a1, 0x3f
        li                a3, 0x1
        addi              a4, a2, -0x20
        sll               a1, a3, a1
        srli              a4, a4, 0x1f
        sll               a2, a3, a2
        neg               a3, a4
        addi              a6, a4, -0x1
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        and               a7, a3, a1
        and               t0, a6, a2
        not               t1, a7
        not               t2, t0
0:
        mv                a1, a4
        mv                a6, a5
        and               a2, a4, t1
        and               a3, a5, t2
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a6
        xor               a3, a4, a1
        or                a2, a2, a3
        bnez              a2, 0b
        and               a0, a1, a7
        and               a1, a6, t0
        or                a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_clear::u64::seqcst:
        andi              a2, a1, 0x3f
        li                a3, 0x1
        addi              a4, a2, -0x20
        sll               a1, a3, a1
        srli              a4, a4, 0x1f
        sll               a2, a3, a2
        neg               a3, a4
        addi              a6, a4, -0x1
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        and               a7, a3, a1
        and               t0, a6, a2
        not               t1, a7
        not               t2, t0
0:
        mv                a1, a4
        mv                a6, a5
        and               a2, a4, t1
        and               a3, a5, t2
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a6
        xor               a3, a4, a1
        or                a2, a2, a3
        bnez              a2, 0b
        and               a0, a1, a7
        and               a1, a6, t0
        or                a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_clear::u64::acquire:
        andi              a2, a1, 0x3f
        li                a3, 0x1
        addi              a4, a2, -0x20
        sll               a1, a3, a1
        srli              a4, a4, 0x1f
        sll               a2, a3, a2
        neg               a3, a4
        addi              a6, a4, -0x1
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        and               a7, a3, a1
        and               t0, a6, a2
        not               t1, a7
        not               t2, t0
0:
        mv                a1, a4
        mv                a6, a5
        and               a2, a4, t1
        and               a3, a5, t2
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a5, a6
        xor               a3, a4, a1
        or                a2, a2, a3
        bnez              a2, 0b
        and               a0, a1, a7
        and               a1, a6, t0
        or                a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_clear::u64::relaxed:
        andi              a2, a1, 0x3f
        li                a3, 0x1
        addi              a4, a2, -0x20
        sll               a1, a3, a1
        srli              a4, a4, 0x1f
        sll               a2, a3, a2
        neg               a3, a4
        addi              a6, a4, -0x1
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        and               a7, a3, a1
        and               t0, a6, a2
        not               t1, a7
        not               t2, t0
0:
        mv                a1, a4
        mv                a6, a5
        and               a2, a4, t1
        and               a3, a5, t2
        amocas.d          a4, a2, (a0)
        xor               a2, a5, a6
        xor               a3, a4, a1
        or                a2, a2, a3
        bnez              a2, 0b
        and               a0, a1, a7
        and               a1, a6, t0
        or                a0, a0, a1
        snez              a0, a0
        ret

asm_test::bit_clear::u64::release:
        andi              a2, a1, 0x3f
        li                a3, 0x1
        addi              a4, a2, -0x20
        sll               a1, a3, a1
        srli              a4, a4, 0x1f
        sll               a2, a3, a2
        neg               a3, a4
        addi              a6, a4, -0x1
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        and               a7, a3, a1
        and               t0, a6, a2
        not               t1, a7
        not               t2, t0
0:
        mv                a1, a4
        mv                a6, a5
        and               a2, a4, t1
        and               a3, a5, t2
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a5, a6
        xor               a3, a4, a1
        or                a2, a2, a3
        bnez              a2, 0b
        and               a0, a1, a7
        and               a1, a6, t0
        or                a0, a0, a1
        snez              a0, a0
        ret

asm_test::fetch_abs::f32::acqrel:
        lui               a1, 0x80000
        addi              a1, a1, -0x1
        amoand.w.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_abs::f32::seqcst:
        lui               a1, 0x80000
        addi              a1, a1, -0x1
        amoand.w.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_abs::f32::acquire:
        lui               a1, 0x80000
        addi              a1, a1, -0x1
        amoand.w.aq       a0, a1, (a0)
        ret

asm_test::fetch_abs::f32::relaxed:
        lui               a1, 0x80000
        addi              a1, a1, -0x1
        amoand.w          a0, a1, (a0)
        ret

asm_test::fetch_abs::f32::release:
        lui               a1, 0x80000
        addi              a1, a1, -0x1
        amoand.w.rl       a0, a1, (a0)
        ret

asm_test::fetch_abs::f64::acqrel:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a1, a5
        mv                a2, a4
        slli              a3, a5, 0x1
        srli              a3, a3, 0x1
        amocas.d.aqrl     a4, a2, (a0)
        xor               a3, a5, a1
        xor               a6, a4, a2
        or                a3, a6, a3
        bnez              a3, 0b
        mv                a0, a2
        ret

asm_test::fetch_abs::f64::seqcst:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a1, a5
        mv                a2, a4
        slli              a3, a5, 0x1
        srli              a3, a3, 0x1
        amocas.d.aqrl     a4, a2, (a0)
        xor               a3, a5, a1
        xor               a6, a4, a2
        or                a3, a6, a3
        bnez              a3, 0b
        mv                a0, a2
        ret

asm_test::fetch_abs::f64::acquire:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a1, a5
        mv                a2, a4
        slli              a3, a5, 0x1
        srli              a3, a3, 0x1
        amocas.d.aq       a4, a2, (a0)
        xor               a3, a5, a1
        xor               a6, a4, a2
        or                a3, a6, a3
        bnez              a3, 0b
        mv                a0, a2
        ret

asm_test::fetch_abs::f64::relaxed:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a1, a5
        mv                a2, a4
        slli              a3, a5, 0x1
        srli              a3, a3, 0x1
        amocas.d          a4, a2, (a0)
        xor               a3, a5, a1
        xor               a6, a4, a2
        or                a3, a6, a3
        bnez              a3, 0b
        mv                a0, a2
        ret

asm_test::fetch_abs::f64::release:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a1, a5
        mv                a2, a4
        slli              a3, a5, 0x1
        srli              a3, a3, 0x1
        amocas.d.rl       a4, a2, (a0)
        xor               a3, a5, a1
        xor               a6, a4, a2
        or                a3, a6, a3
        bnez              a3, 0b
        mv                a0, a2
        ret

asm_test::fetch_add::u8::acqrel_zero:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_add::u8::seqcst_zero:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_add::u8::acquire_zero:
        andi              a1, a0, -0x4
        amoor.w.aq        a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_add::u8::relaxed_zero:
        andi              a1, a0, -0x4
        amoor.w           a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_add::u8::release_zero:
        andi              a1, a0, -0x4
        amoor.w.rl        a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_add::u8::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w.aq           a4, (a2)
        add               a5, a4, a1
        xor               a5, a5, a4
        and               a5, a5, a3
        xor               a5, a5, a4
        sc.w.rl           a5, a5, (a2)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_add::u8::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w.aqrl         a4, (a2)
        add               a5, a4, a1
        xor               a5, a5, a4
        and               a5, a5, a3
        xor               a5, a5, a4
        sc.w.rl           a5, a5, (a2)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_add::u8::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w.aq           a4, (a2)
        add               a5, a4, a1
        xor               a5, a5, a4
        and               a5, a5, a3
        xor               a5, a5, a4
        sc.w              a5, a5, (a2)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_add::u8::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w              a4, (a2)
        add               a5, a4, a1
        xor               a5, a5, a4
        and               a5, a5, a3
        xor               a5, a5, a4
        sc.w              a5, a5, (a2)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_add::u8::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w              a4, (a2)
        add               a5, a4, a1
        xor               a5, a5, a4
        and               a5, a5, a3
        xor               a5, a5, a4
        sc.w.rl           a5, a5, (a2)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_add::f32::acqrel_zero:
        addi              sp, sp, -0x10
        sw                ra, 0xc(sp)
        sw                s0, 0x8(sp)
        sw                s1, 0x4(sp)
        sw                s2, 0x0(sp)
        mv                s1, a0
        lw                s0, 0x0(a0)
0:
        mv                s2, s0
        mv                a0, s0
        li                a1, 0x0
1:
        auipc             ra, 0x0
        jalr              r1b
        amocas.w.aqrl     s0, a0, (s1)
        bne               s0, s2, 0b
        mv                a0, s0
        lw                ra, 0xc(sp)
        lw                s0, 0x8(sp)
        lw                s1, 0x4(sp)
        lw                s2, 0x0(sp)
        addi              sp, sp, 0x10
        ret

asm_test::fetch_add::f32::seqcst_zero:
        addi              sp, sp, -0x10
        sw                ra, 0xc(sp)
        sw                s0, 0x8(sp)
        sw                s1, 0x4(sp)
        sw                s2, 0x0(sp)
        mv                s1, a0
        lw                s0, 0x0(a0)
0:
        mv                s2, s0
        mv                a0, s0
        li                a1, 0x0
1:
        auipc             ra, 0x0
        jalr              r1b
        amocas.w.aqrl     s0, a0, (s1)
        bne               s0, s2, 0b
        mv                a0, s0
        lw                ra, 0xc(sp)
        lw                s0, 0x8(sp)
        lw                s1, 0x4(sp)
        lw                s2, 0x0(sp)
        addi              sp, sp, 0x10
        ret

asm_test::fetch_add::f32::acquire_zero:
        addi              sp, sp, -0x10
        sw                ra, 0xc(sp)
        sw                s0, 0x8(sp)
        sw                s1, 0x4(sp)
        sw                s2, 0x0(sp)
        mv                s1, a0
        lw                s0, 0x0(a0)
0:
        mv                s2, s0
        mv                a0, s0
        li                a1, 0x0
1:
        auipc             ra, 0x0
        jalr              r1b
        amocas.w.aq       s0, a0, (s1)
        bne               s0, s2, 0b
        mv                a0, s0
        lw                ra, 0xc(sp)
        lw                s0, 0x8(sp)
        lw                s1, 0x4(sp)
        lw                s2, 0x0(sp)
        addi              sp, sp, 0x10
        ret

asm_test::fetch_add::f32::relaxed_zero:
        addi              sp, sp, -0x10
        sw                ra, 0xc(sp)
        sw                s0, 0x8(sp)
        sw                s1, 0x4(sp)
        sw                s2, 0x0(sp)
        mv                s1, a0
        lw                s0, 0x0(a0)
0:
        mv                s2, s0
        mv                a0, s0
        li                a1, 0x0
1:
        auipc             ra, 0x0
        jalr              r1b
        amocas.w          s0, a0, (s1)
        bne               s0, s2, 0b
        mv                a0, s0
        lw                ra, 0xc(sp)
        lw                s0, 0x8(sp)
        lw                s1, 0x4(sp)
        lw                s2, 0x0(sp)
        addi              sp, sp, 0x10
        ret

asm_test::fetch_add::f32::release_zero:
        addi              sp, sp, -0x10
        sw                ra, 0xc(sp)
        sw                s0, 0x8(sp)
        sw                s1, 0x4(sp)
        sw                s2, 0x0(sp)
        mv                s1, a0
        lw                s0, 0x0(a0)
0:
        mv                s2, s0
        mv                a0, s0
        li                a1, 0x0
1:
        auipc             ra, 0x0
        jalr              r1b
        amocas.w.rl       s0, a0, (s1)
        bne               s0, s2, 0b
        mv                a0, s0
        lw                ra, 0xc(sp)
        lw                s0, 0x8(sp)
        lw                s1, 0x4(sp)
        lw                s2, 0x0(sp)
        addi              sp, sp, 0x10
        ret

asm_test::fetch_add::f32::acqrel:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        mv                s2, a1
0:
        mv                s3, s1
        mv                a0, s2
        mv                a1, s1
1:
        auipc             ra, 0x0
        jalr              r1b
        amocas.w.aqrl     s1, a0, (s0)
        bne               s1, s3, 0b
        mv                a0, s1
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_add::f32::seqcst:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        mv                s2, a1
0:
        mv                s3, s1
        mv                a0, s2
        mv                a1, s1
1:
        auipc             ra, 0x0
        jalr              r1b
        amocas.w.aqrl     s1, a0, (s0)
        bne               s1, s3, 0b
        mv                a0, s1
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_add::f32::acquire:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        mv                s2, a1
0:
        mv                s3, s1
        mv                a0, s2
        mv                a1, s1
1:
        auipc             ra, 0x0
        jalr              r1b
        amocas.w.aq       s1, a0, (s0)
        bne               s1, s3, 0b
        mv                a0, s1
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_add::f32::relaxed:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        mv                s2, a1
0:
        mv                s3, s1
        mv                a0, s2
        mv                a1, s1
1:
        auipc             ra, 0x0
        jalr              r1b
        amocas.w          s1, a0, (s0)
        bne               s1, s3, 0b
        mv                a0, s1
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_add::f32::release:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        mv                s2, a1
0:
        mv                s3, s1
        mv                a0, s2
        mv                a1, s1
1:
        auipc             ra, 0x0
        jalr              r1b
        amocas.w.rl       s1, a0, (s0)
        bne               s1, s3, 0b
        mv                a0, s1
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_add::f64::acqrel_zero:
        addi              sp, sp, -0x10
        sw                ra, 0xc(sp)
        sw                s0, 0x8(sp)
        sw                s1, 0x4(sp)
        sw                s2, 0x0(sp)
        mv                s0, a0
        li                a2, 0x0
        li                a3, 0x0
        amocas.d          a2, a2, (a0)
        mv                a5, a3
        mv                a4, a2
0:
        mv                s1, a5
        mv                s2, a4
        mv                a0, a4
        mv                a1, a5
        li                a2, 0x0
        li                a3, 0x0
1:
        auipc             ra, 0x0
        jalr              r1b
        mv                a4, s2
        mv                a5, s1
        mv                a3, a1
        mv                a2, a0
        amocas.d.aqrl     a4, a2, (s0)
        xor               a0, a4, s2
        xor               a1, a5, s1
        or                a0, a0, a1
        bnez              a0, 0b
        mv                a0, s2
        mv                a1, s1
        lw                ra, 0xc(sp)
        lw                s0, 0x8(sp)
        lw                s1, 0x4(sp)
        lw                s2, 0x0(sp)
        addi              sp, sp, 0x10
        ret

asm_test::fetch_add::f64::seqcst_zero:
        addi              sp, sp, -0x10
        sw                ra, 0xc(sp)
        sw                s0, 0x8(sp)
        sw                s1, 0x4(sp)
        sw                s2, 0x0(sp)
        mv                s0, a0
        li                a2, 0x0
        li                a3, 0x0
        amocas.d          a2, a2, (a0)
        mv                a5, a3
        mv                a4, a2
0:
        mv                s1, a5
        mv                s2, a4
        mv                a0, a4
        mv                a1, a5
        li                a2, 0x0
        li                a3, 0x0
1:
        auipc             ra, 0x0
        jalr              r1b
        mv                a4, s2
        mv                a5, s1
        mv                a3, a1
        mv                a2, a0
        amocas.d.aqrl     a4, a2, (s0)
        xor               a0, a4, s2
        xor               a1, a5, s1
        or                a0, a0, a1
        bnez              a0, 0b
        mv                a0, s2
        mv                a1, s1
        lw                ra, 0xc(sp)
        lw                s0, 0x8(sp)
        lw                s1, 0x4(sp)
        lw                s2, 0x0(sp)
        addi              sp, sp, 0x10
        ret

asm_test::fetch_add::f64::acquire_zero:
        addi              sp, sp, -0x10
        sw                ra, 0xc(sp)
        sw                s0, 0x8(sp)
        sw                s1, 0x4(sp)
        sw                s2, 0x0(sp)
        mv                s0, a0
        li                a2, 0x0
        li                a3, 0x0
        amocas.d          a2, a2, (a0)
        mv                a5, a3
        mv                a4, a2
0:
        mv                s1, a5
        mv                s2, a4
        mv                a0, a4
        mv                a1, a5
        li                a2, 0x0
        li                a3, 0x0
1:
        auipc             ra, 0x0
        jalr              r1b
        mv                a4, s2
        mv                a5, s1
        mv                a3, a1
        mv                a2, a0
        amocas.d.aq       a4, a2, (s0)
        xor               a0, a4, s2
        xor               a1, a5, s1
        or                a0, a0, a1
        bnez              a0, 0b
        mv                a0, s2
        mv                a1, s1
        lw                ra, 0xc(sp)
        lw                s0, 0x8(sp)
        lw                s1, 0x4(sp)
        lw                s2, 0x0(sp)
        addi              sp, sp, 0x10
        ret

asm_test::fetch_add::f64::relaxed_zero:
        addi              sp, sp, -0x10
        sw                ra, 0xc(sp)
        sw                s0, 0x8(sp)
        sw                s1, 0x4(sp)
        sw                s2, 0x0(sp)
        mv                s0, a0
        li                a2, 0x0
        li                a3, 0x0
        amocas.d          a2, a2, (a0)
        mv                a5, a3
        mv                a4, a2
0:
        mv                s1, a5
        mv                s2, a4
        mv                a0, a4
        mv                a1, a5
        li                a2, 0x0
        li                a3, 0x0
1:
        auipc             ra, 0x0
        jalr              r1b
        mv                a4, s2
        mv                a5, s1
        mv                a3, a1
        mv                a2, a0
        amocas.d          a4, a2, (s0)
        xor               a0, a4, s2
        xor               a1, a5, s1
        or                a0, a0, a1
        bnez              a0, 0b
        mv                a0, s2
        mv                a1, s1
        lw                ra, 0xc(sp)
        lw                s0, 0x8(sp)
        lw                s1, 0x4(sp)
        lw                s2, 0x0(sp)
        addi              sp, sp, 0x10
        ret

asm_test::fetch_add::f64::release_zero:
        addi              sp, sp, -0x10
        sw                ra, 0xc(sp)
        sw                s0, 0x8(sp)
        sw                s1, 0x4(sp)
        sw                s2, 0x0(sp)
        mv                s0, a0
        li                a2, 0x0
        li                a3, 0x0
        amocas.d          a2, a2, (a0)
        mv                a5, a3
        mv                a4, a2
0:
        mv                s1, a5
        mv                s2, a4
        mv                a0, a4
        mv                a1, a5
        li                a2, 0x0
        li                a3, 0x0
1:
        auipc             ra, 0x0
        jalr              r1b
        mv                a4, s2
        mv                a5, s1
        mv                a3, a1
        mv                a2, a0
        amocas.d.rl       a4, a2, (s0)
        xor               a0, a4, s2
        xor               a1, a5, s1
        or                a0, a0, a1
        bnez              a0, 0b
        mv                a0, s2
        mv                a1, s1
        lw                ra, 0xc(sp)
        lw                s0, 0x8(sp)
        lw                s1, 0x4(sp)
        lw                s2, 0x0(sp)
        addi              sp, sp, 0x10
        ret

asm_test::fetch_add::f64::acqrel:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        sw                s4, 0x8(sp)
        mv                s0, a2
        mv                s1, a1
        mv                s2, a0
        li                a2, 0x0
        li                a3, 0x0
        amocas.d          a2, a2, (a0)
        mv                a5, a3
        mv                a4, a2
0:
        mv                s3, a5
        mv                s4, a4
        mv                a0, s1
        mv                a1, s0
        mv                a2, a4
        mv                a3, a5
1:
        auipc             ra, 0x0
        jalr              r1b
        mv                a4, s4
        mv                a5, s3
        mv                a3, a1
        mv                a2, a0
        amocas.d.aqrl     a4, a2, (s2)
        xor               a0, a4, s4
        xor               a1, a5, s3
        or                a0, a0, a1
        bnez              a0, 0b
        mv                a0, s4
        mv                a1, s3
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        lw                s4, 0x8(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_add::f64::seqcst:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        sw                s4, 0x8(sp)
        mv                s0, a2
        mv                s1, a1
        mv                s2, a0
        li                a2, 0x0
        li                a3, 0x0
        amocas.d          a2, a2, (a0)
        mv                a5, a3
        mv                a4, a2
0:
        mv                s3, a5
        mv                s4, a4
        mv                a0, s1
        mv                a1, s0
        mv                a2, a4
        mv                a3, a5
1:
        auipc             ra, 0x0
        jalr              r1b
        mv                a4, s4
        mv                a5, s3
        mv                a3, a1
        mv                a2, a0
        amocas.d.aqrl     a4, a2, (s2)
        xor               a0, a4, s4
        xor               a1, a5, s3
        or                a0, a0, a1
        bnez              a0, 0b
        mv                a0, s4
        mv                a1, s3
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        lw                s4, 0x8(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_add::f64::acquire:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        sw                s4, 0x8(sp)
        mv                s0, a2
        mv                s1, a1
        mv                s2, a0
        li                a2, 0x0
        li                a3, 0x0
        amocas.d          a2, a2, (a0)
        mv                a5, a3
        mv                a4, a2
0:
        mv                s3, a5
        mv                s4, a4
        mv                a0, s1
        mv                a1, s0
        mv                a2, a4
        mv                a3, a5
1:
        auipc             ra, 0x0
        jalr              r1b
        mv                a4, s4
        mv                a5, s3
        mv                a3, a1
        mv                a2, a0
        amocas.d.aq       a4, a2, (s2)
        xor               a0, a4, s4
        xor               a1, a5, s3
        or                a0, a0, a1
        bnez              a0, 0b
        mv                a0, s4
        mv                a1, s3
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        lw                s4, 0x8(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_add::f64::relaxed:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        sw                s4, 0x8(sp)
        mv                s0, a2
        mv                s1, a1
        mv                s2, a0
        li                a2, 0x0
        li                a3, 0x0
        amocas.d          a2, a2, (a0)
        mv                a5, a3
        mv                a4, a2
0:
        mv                s3, a5
        mv                s4, a4
        mv                a0, s1
        mv                a1, s0
        mv                a2, a4
        mv                a3, a5
1:
        auipc             ra, 0x0
        jalr              r1b
        mv                a4, s4
        mv                a5, s3
        mv                a3, a1
        mv                a2, a0
        amocas.d          a4, a2, (s2)
        xor               a0, a4, s4
        xor               a1, a5, s3
        or                a0, a0, a1
        bnez              a0, 0b
        mv                a0, s4
        mv                a1, s3
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        lw                s4, 0x8(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_add::f64::release:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        sw                s4, 0x8(sp)
        mv                s0, a2
        mv                s1, a1
        mv                s2, a0
        li                a2, 0x0
        li                a3, 0x0
        amocas.d          a2, a2, (a0)
        mv                a5, a3
        mv                a4, a2
0:
        mv                s3, a5
        mv                s4, a4
        mv                a0, s1
        mv                a1, s0
        mv                a2, a4
        mv                a3, a5
1:
        auipc             ra, 0x0
        jalr              r1b
        mv                a4, s4
        mv                a5, s3
        mv                a3, a1
        mv                a2, a0
        amocas.d.rl       a4, a2, (s2)
        xor               a0, a4, s4
        xor               a1, a5, s3
        or                a0, a0, a1
        bnez              a0, 0b
        mv                a0, s4
        mv                a1, s3
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        lw                s4, 0x8(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_add::u16::acqrel_zero:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_add::u16::seqcst_zero:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_add::u16::acquire_zero:
        andi              a1, a0, -0x4
        amoor.w.aq        a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_add::u16::relaxed_zero:
        andi              a1, a0, -0x4
        amoor.w           a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_add::u16::release_zero:
        andi              a1, a0, -0x4
        amoor.w.rl        a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_add::u16::acqrel:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a1, a1, a0
0:
        lr.w.aq           a4, (a3)
        add               a5, a4, a1
        xor               a5, a5, a4
        and               a5, a5, a2
        xor               a5, a5, a4
        sc.w.rl           a5, a5, (a3)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_add::u16::seqcst:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a1, a1, a0
0:
        lr.w.aqrl         a4, (a3)
        add               a5, a4, a1
        xor               a5, a5, a4
        and               a5, a5, a2
        xor               a5, a5, a4
        sc.w.rl           a5, a5, (a3)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_add::u16::acquire:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a1, a1, a0
0:
        lr.w.aq           a4, (a3)
        add               a5, a4, a1
        xor               a5, a5, a4
        and               a5, a5, a2
        xor               a5, a5, a4
        sc.w              a5, a5, (a3)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_add::u16::relaxed:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a1, a1, a0
0:
        lr.w              a4, (a3)
        add               a5, a4, a1
        xor               a5, a5, a4
        and               a5, a5, a2
        xor               a5, a5, a4
        sc.w              a5, a5, (a3)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_add::u16::release:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a1, a1, a0
0:
        lr.w              a4, (a3)
        add               a5, a4, a1
        xor               a5, a5, a4
        and               a5, a5, a2
        xor               a5, a5, a4
        sc.w.rl           a5, a5, (a3)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_add::u32::acqrel_zero:
        amoor.w.aqrl      a0, zero, (a0)
        ret

asm_test::fetch_add::u32::seqcst_zero:
        amoor.w.aqrl      a0, zero, (a0)
        ret

asm_test::fetch_add::u32::acquire_zero:
        amoor.w.aq        a0, zero, (a0)
        ret

asm_test::fetch_add::u32::relaxed_zero:
        amoor.w           a0, zero, (a0)
        ret

asm_test::fetch_add::u32::release_zero:
        amoor.w.rl        a0, zero, (a0)
        ret

asm_test::fetch_add::u32::acqrel:
        amoadd.w.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_add::u32::seqcst:
        amoadd.w.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_add::u32::acquire:
        amoadd.w.aq       a0, a1, (a0)
        ret

asm_test::fetch_add::u32::relaxed:
        amoadd.w          a0, a1, (a0)
        ret

asm_test::fetch_add::u32::release:
        amoadd.w.rl       a0, a1, (a0)
        ret

asm_test::fetch_add::u64::acqrel_zero:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a2, a4
        mv                a3, a5
        amocas.d.aqrl     a4, a2, (a0)
        xor               a1, a5, a3
        xor               a6, a4, a2
        or                a1, a6, a1
        bnez              a1, 0b
        mv                a0, a2
        mv                a1, a3
        ret

asm_test::fetch_add::u64::seqcst_zero:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a2, a4
        mv                a3, a5
        amocas.d.aqrl     a4, a2, (a0)
        xor               a1, a5, a3
        xor               a6, a4, a2
        or                a1, a6, a1
        bnez              a1, 0b
        mv                a0, a2
        mv                a1, a3
        ret

asm_test::fetch_add::u64::acquire_zero:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a2, a4
        mv                a3, a5
        amocas.d.aq       a4, a2, (a0)
        xor               a1, a5, a3
        xor               a6, a4, a2
        or                a1, a6, a1
        bnez              a1, 0b
        mv                a0, a2
        mv                a1, a3
        ret

asm_test::fetch_add::u64::relaxed_zero:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a2, a4
        mv                a3, a5
        amocas.d          a4, a2, (a0)
        xor               a1, a5, a3
        xor               a6, a4, a2
        or                a1, a6, a1
        bnez              a1, 0b
        mv                a0, a2
        mv                a1, a3
        ret

asm_test::fetch_add::u64::release_zero:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a2, a4
        mv                a3, a5
        amocas.d.rl       a4, a2, (a0)
        xor               a1, a5, a3
        xor               a6, a4, a2
        or                a1, a6, a1
        bnez              a1, 0b
        mv                a0, a2
        mv                a1, a3
        ret

asm_test::fetch_add::u64::acqrel:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a4
        mv                t0, a5
        add               a2, a4, a1
        add               a3, a5, a6
        sltu              a4, a2, a4
        add               a3, a3, a4
        mv                a4, a7
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a7
        mv                a1, t0
        ret

asm_test::fetch_add::u64::seqcst:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a4
        mv                t0, a5
        add               a2, a4, a1
        add               a3, a5, a6
        sltu              a4, a2, a4
        add               a3, a3, a4
        mv                a4, a7
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a7
        mv                a1, t0
        ret

asm_test::fetch_add::u64::acquire:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a4
        mv                t0, a5
        add               a2, a4, a1
        add               a3, a5, a6
        sltu              a4, a2, a4
        add               a3, a3, a4
        mv                a4, a7
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a7
        mv                a1, t0
        ret

asm_test::fetch_add::u64::relaxed:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a4
        mv                t0, a5
        add               a2, a4, a1
        add               a3, a5, a6
        sltu              a4, a2, a4
        add               a3, a3, a4
        mv                a4, a7
        amocas.d          a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a7
        mv                a1, t0
        ret

asm_test::fetch_add::u64::release:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a4
        mv                t0, a5
        add               a2, a4, a1
        add               a3, a5, a6
        sltu              a4, a2, a4
        add               a3, a3, a4
        mv                a4, a7
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a7
        mv                a1, t0
        ret

asm_test::fetch_and::u8::acqrel_all:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_and::u8::seqcst_all:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_and::u8::acqrel_zero:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_and::u8::acquire_all:
        andi              a1, a0, -0x4
        amoor.w.aq        a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_and::u8::relaxed_all:
        andi              a1, a0, -0x4
        amoor.w           a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_and::u8::release_all:
        andi              a1, a0, -0x4
        amoor.w.rl        a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_and::u8::seqcst_zero:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_and::u8::acquire_zero:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aq       a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_and::u8::relaxed_zero:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w          a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_and::u8::release_zero:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.rl       a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_and::u8::acqrel:
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_and::u8::seqcst:
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_and::u8::acquire:
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aq       a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_and::u8::relaxed:
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w          a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_and::u8::release:
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.rl       a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_and::u16::acqrel_all:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_and::u16::seqcst_all:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_and::u16::acqrel_zero:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_and::u16::acquire_all:
        andi              a1, a0, -0x4
        amoor.w.aq        a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_and::u16::relaxed_all:
        andi              a1, a0, -0x4
        amoor.w           a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_and::u16::release_all:
        andi              a1, a0, -0x4
        amoor.w.rl        a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_and::u16::seqcst_zero:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_and::u16::acquire_zero:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aq       a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_and::u16::relaxed_zero:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w          a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_and::u16::release_zero:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.rl       a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_and::u16::acqrel:
        lui               a2, 0x10
        slli              a3, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a3
        not               a2, a2
        sll               a1, a1, a3
        andi              a0, a0, -0x4
        or                a1, a1, a2
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a3
        ret

asm_test::fetch_and::u16::seqcst:
        lui               a2, 0x10
        slli              a3, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a3
        not               a2, a2
        sll               a1, a1, a3
        andi              a0, a0, -0x4
        or                a1, a1, a2
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a3
        ret

asm_test::fetch_and::u16::acquire:
        lui               a2, 0x10
        slli              a3, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a3
        not               a2, a2
        sll               a1, a1, a3
        andi              a0, a0, -0x4
        or                a1, a1, a2
        amoand.w.aq       a0, a1, (a0)
        srl               a0, a0, a3
        ret

asm_test::fetch_and::u16::relaxed:
        lui               a2, 0x10
        slli              a3, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a3
        not               a2, a2
        sll               a1, a1, a3
        andi              a0, a0, -0x4
        or                a1, a1, a2
        amoand.w          a0, a1, (a0)
        srl               a0, a0, a3
        ret

asm_test::fetch_and::u16::release:
        lui               a2, 0x10
        slli              a3, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a3
        not               a2, a2
        sll               a1, a1, a3
        andi              a0, a0, -0x4
        or                a1, a1, a2
        amoand.w.rl       a0, a1, (a0)
        srl               a0, a0, a3
        ret

asm_test::fetch_and::u32::acqrel_all:
        amoor.w.aqrl      a0, zero, (a0)
        ret

asm_test::fetch_and::u32::seqcst_all:
        amoor.w.aqrl      a0, zero, (a0)
        ret

asm_test::fetch_and::u32::acqrel_zero:
        amoswap.w.aqrl    a0, zero, (a0)
        ret

asm_test::fetch_and::u32::acquire_all:
        amoor.w.aq        a0, zero, (a0)
        ret

asm_test::fetch_and::u32::relaxed_all:
        amoor.w           a0, zero, (a0)
        ret

asm_test::fetch_and::u32::release_all:
        amoor.w.rl        a0, zero, (a0)
        ret

asm_test::fetch_and::u32::seqcst_zero:
        amoswap.w.aqrl    a0, zero, (a0)
        ret

asm_test::fetch_and::u32::acquire_zero:
        amoswap.w.aq      a0, zero, (a0)
        ret

asm_test::fetch_and::u32::relaxed_zero:
        amoswap.w         a0, zero, (a0)
        ret

asm_test::fetch_and::u32::release_zero:
        amoswap.w.rl      a0, zero, (a0)
        ret

asm_test::fetch_and::u32::acqrel:
        amoand.w.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_and::u32::seqcst:
        amoand.w.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_and::u32::acquire:
        amoand.w.aq       a0, a1, (a0)
        ret

asm_test::fetch_and::u32::relaxed:
        amoand.w          a0, a1, (a0)
        ret

asm_test::fetch_and::u32::release:
        amoand.w.rl       a0, a1, (a0)
        ret

asm_test::fetch_and::u64::acqrel_all:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a2, a4
        mv                a3, a5
        amocas.d.aqrl     a4, a2, (a0)
        xor               a1, a5, a3
        xor               a6, a4, a2
        or                a1, a6, a1
        bnez              a1, 0b
        mv                a0, a2
        mv                a1, a3
        ret

asm_test::fetch_and::u64::seqcst_all:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a2, a4
        mv                a3, a5
        amocas.d.aqrl     a4, a2, (a0)
        xor               a1, a5, a3
        xor               a6, a4, a2
        or                a1, a6, a1
        bnez              a1, 0b
        mv                a0, a2
        mv                a1, a3
        ret

asm_test::fetch_and::u64::acqrel_zero:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        li                a2, 0x0
        li                a3, 0x0
        mv                a1, a5
        mv                a6, a4
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a1
        xor               a3, a4, a6
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a6
        ret

asm_test::fetch_and::u64::acquire_all:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a2, a4
        mv                a3, a5
        amocas.d.aq       a4, a2, (a0)
        xor               a1, a5, a3
        xor               a6, a4, a2
        or                a1, a6, a1
        bnez              a1, 0b
        mv                a0, a2
        mv                a1, a3
        ret

asm_test::fetch_and::u64::relaxed_all:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a2, a4
        mv                a3, a5
        amocas.d          a4, a2, (a0)
        xor               a1, a5, a3
        xor               a6, a4, a2
        or                a1, a6, a1
        bnez              a1, 0b
        mv                a0, a2
        mv                a1, a3
        ret

asm_test::fetch_and::u64::release_all:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a2, a4
        mv                a3, a5
        amocas.d.rl       a4, a2, (a0)
        xor               a1, a5, a3
        xor               a6, a4, a2
        or                a1, a6, a1
        bnez              a1, 0b
        mv                a0, a2
        mv                a1, a3
        ret

asm_test::fetch_and::u64::seqcst_zero:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        li                a2, 0x0
        li                a3, 0x0
        mv                a1, a5
        mv                a6, a4
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a1
        xor               a3, a4, a6
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a6
        ret

asm_test::fetch_and::u64::acquire_zero:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        li                a2, 0x0
        li                a3, 0x0
        mv                a1, a5
        mv                a6, a4
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a5, a1
        xor               a3, a4, a6
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a6
        ret

asm_test::fetch_and::u64::relaxed_zero:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        li                a2, 0x0
        li                a3, 0x0
        mv                a1, a5
        mv                a6, a4
        amocas.d          a4, a2, (a0)
        xor               a2, a5, a1
        xor               a3, a4, a6
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a6
        ret

asm_test::fetch_and::u64::release_zero:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        li                a2, 0x0
        li                a3, 0x0
        mv                a1, a5
        mv                a6, a4
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a5, a1
        xor               a3, a4, a6
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a6
        ret

asm_test::fetch_and::u64::acqrel:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a4
        mv                t0, a5
        and               a2, a4, a1
        and               a3, a5, a6
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a7
        mv                a1, t0
        ret

asm_test::fetch_and::u64::seqcst:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a4
        mv                t0, a5
        and               a2, a4, a1
        and               a3, a5, a6
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a7
        mv                a1, t0
        ret

asm_test::fetch_and::u64::acquire:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a4
        mv                t0, a5
        and               a2, a4, a1
        and               a3, a5, a6
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a7
        mv                a1, t0
        ret

asm_test::fetch_and::u64::relaxed:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a4
        mv                t0, a5
        and               a2, a4, a1
        and               a3, a5, a6
        amocas.d          a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a7
        mv                a1, t0
        ret

asm_test::fetch_and::u64::release:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a4
        mv                t0, a5
        and               a2, a4, a1
        and               a3, a5, a6
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a7
        mv                a1, t0
        ret

asm_test::fetch_and::bool::acqrel_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a3, a3, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_and::bool::seqcst_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a3, a3, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_and::bool::acqrel_false:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_and::bool::acquire_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a3, a3, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aq       a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_and::bool::relaxed_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a3, a3, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w          a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_and::bool::release_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a3, a3, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.rl       a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_and::bool::seqcst_false:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_and::bool::acquire_false:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.aq       a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_and::bool::relaxed_false:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w          a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_and::bool::release_false:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        not               a1, a1
        amoand.w.rl       a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_and::bool::acqrel:
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_and::bool::seqcst:
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_and::bool::acquire:
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aq       a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_and::bool::relaxed:
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w          a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_and::bool::release:
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.rl       a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_max::i8::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        andi              a4, a0, 0x18
        sll               a3, a3, a0
        sll               a1, a1, a0
        xori              a4, a4, 0x18
0:
        lr.w.aq           a5, (a2)
        and               a7, a5, a3
        mv                a6, a5
        sll               a7, a7, a4
        sra               a7, a7, a4
        bge               a7, a1, 1f
        xor               a6, a5, a1
        and               a6, a6, a3
        xor               a6, a5, a6
1:
        sc.w.rl           a6, a6, (a2)
        bnez              a6, 0b
        srl               a0, a5, a0
        ret

asm_test::fetch_max::i8::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        andi              a4, a0, 0x18
        sll               a3, a3, a0
        sll               a1, a1, a0
        xori              a4, a4, 0x18
0:
        lr.w.aqrl         a5, (a2)
        and               a7, a5, a3
        mv                a6, a5
        sll               a7, a7, a4
        sra               a7, a7, a4
        bge               a7, a1, 1f
        xor               a6, a5, a1
        and               a6, a6, a3
        xor               a6, a5, a6
1:
        sc.w.rl           a6, a6, (a2)
        bnez              a6, 0b
        srl               a0, a5, a0
        ret

asm_test::fetch_max::i8::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        andi              a4, a0, 0x18
        sll               a3, a3, a0
        sll               a1, a1, a0
        xori              a4, a4, 0x18
0:
        lr.w.aq           a5, (a2)
        and               a7, a5, a3
        mv                a6, a5
        sll               a7, a7, a4
        sra               a7, a7, a4
        bge               a7, a1, 1f
        xor               a6, a5, a1
        and               a6, a6, a3
        xor               a6, a5, a6
1:
        sc.w              a6, a6, (a2)
        bnez              a6, 0b
        srl               a0, a5, a0
        ret

asm_test::fetch_max::i8::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        andi              a4, a0, 0x18
        sll               a3, a3, a0
        sll               a1, a1, a0
        xori              a4, a4, 0x18
0:
        lr.w              a5, (a2)
        and               a7, a5, a3
        mv                a6, a5
        sll               a7, a7, a4
        sra               a7, a7, a4
        bge               a7, a1, 1f
        xor               a6, a5, a1
        and               a6, a6, a3
        xor               a6, a5, a6
1:
        sc.w              a6, a6, (a2)
        bnez              a6, 0b
        srl               a0, a5, a0
        ret

asm_test::fetch_max::i8::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        andi              a4, a0, 0x18
        sll               a3, a3, a0
        sll               a1, a1, a0
        xori              a4, a4, 0x18
0:
        lr.w              a5, (a2)
        and               a7, a5, a3
        mv                a6, a5
        sll               a7, a7, a4
        sra               a7, a7, a4
        bge               a7, a1, 1f
        xor               a6, a5, a1
        and               a6, a6, a3
        xor               a6, a5, a6
1:
        sc.w.rl           a6, a6, (a2)
        bnez              a6, 0b
        srl               a0, a5, a0
        ret

asm_test::fetch_max::f32::acqrel:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        mv                s2, a1
0:
        mv                s3, s1
        mv                a0, s1
        mv                a1, s2
1:
        auipc             ra, 0x0
        jalr              r1b
        amocas.w.aqrl     s1, a0, (s0)
        bne               s1, s3, 0b
        mv                a0, s1
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_max::f32::seqcst:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        mv                s2, a1
0:
        mv                s3, s1
        mv                a0, s1
        mv                a1, s2
1:
        auipc             ra, 0x0
        jalr              r1b
        amocas.w.aqrl     s1, a0, (s0)
        bne               s1, s3, 0b
        mv                a0, s1
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_max::f32::acquire:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        mv                s2, a1
0:
        mv                s3, s1
        mv                a0, s1
        mv                a1, s2
1:
        auipc             ra, 0x0
        jalr              r1b
        amocas.w.aq       s1, a0, (s0)
        bne               s1, s3, 0b
        mv                a0, s1
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_max::f32::relaxed:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        mv                s2, a1
0:
        mv                s3, s1
        mv                a0, s1
        mv                a1, s2
1:
        auipc             ra, 0x0
        jalr              r1b
        amocas.w          s1, a0, (s0)
        bne               s1, s3, 0b
        mv                a0, s1
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_max::f32::release:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        mv                s2, a1
0:
        mv                s3, s1
        mv                a0, s1
        mv                a1, s2
1:
        auipc             ra, 0x0
        jalr              r1b
        amocas.w.rl       s1, a0, (s0)
        bne               s1, s3, 0b
        mv                a0, s1
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_max::f64::acqrel:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        sw                s4, 0x8(sp)
        mv                s0, a2
        mv                s1, a1
        mv                s2, a0
        li                a2, 0x0
        li                a3, 0x0
        amocas.d          a2, a2, (a0)
        mv                a5, a3
        mv                a4, a2
0:
        mv                s3, a5
        mv                s4, a4
        mv                a0, a4
        mv                a1, a5
        mv                a2, s1
        mv                a3, s0
1:
        auipc             ra, 0x0
        jalr              r1b
        mv                a4, s4
        mv                a5, s3
        mv                a3, a1
        mv                a2, a0
        amocas.d.aqrl     a4, a2, (s2)
        xor               a0, a4, s4
        xor               a1, a5, s3
        or                a0, a0, a1
        bnez              a0, 0b
        mv                a0, s4
        mv                a1, s3
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        lw                s4, 0x8(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_max::f64::seqcst:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        sw                s4, 0x8(sp)
        mv                s0, a2
        mv                s1, a1
        mv                s2, a0
        li                a2, 0x0
        li                a3, 0x0
        amocas.d          a2, a2, (a0)
        mv                a5, a3
        mv                a4, a2
0:
        mv                s3, a5
        mv                s4, a4
        mv                a0, a4
        mv                a1, a5
        mv                a2, s1
        mv                a3, s0
1:
        auipc             ra, 0x0
        jalr              r1b
        mv                a4, s4
        mv                a5, s3
        mv                a3, a1
        mv                a2, a0
        amocas.d.aqrl     a4, a2, (s2)
        xor               a0, a4, s4
        xor               a1, a5, s3
        or                a0, a0, a1
        bnez              a0, 0b
        mv                a0, s4
        mv                a1, s3
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        lw                s4, 0x8(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_max::f64::acquire:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        sw                s4, 0x8(sp)
        mv                s0, a2
        mv                s1, a1
        mv                s2, a0
        li                a2, 0x0
        li                a3, 0x0
        amocas.d          a2, a2, (a0)
        mv                a5, a3
        mv                a4, a2
0:
        mv                s3, a5
        mv                s4, a4
        mv                a0, a4
        mv                a1, a5
        mv                a2, s1
        mv                a3, s0
1:
        auipc             ra, 0x0
        jalr              r1b
        mv                a4, s4
        mv                a5, s3
        mv                a3, a1
        mv                a2, a0
        amocas.d.aq       a4, a2, (s2)
        xor               a0, a4, s4
        xor               a1, a5, s3
        or                a0, a0, a1
        bnez              a0, 0b
        mv                a0, s4
        mv                a1, s3
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        lw                s4, 0x8(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_max::f64::relaxed:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        sw                s4, 0x8(sp)
        mv                s0, a2
        mv                s1, a1
        mv                s2, a0
        li                a2, 0x0
        li                a3, 0x0
        amocas.d          a2, a2, (a0)
        mv                a5, a3
        mv                a4, a2
0:
        mv                s3, a5
        mv                s4, a4
        mv                a0, a4
        mv                a1, a5
        mv                a2, s1
        mv                a3, s0
1:
        auipc             ra, 0x0
        jalr              r1b
        mv                a4, s4
        mv                a5, s3
        mv                a3, a1
        mv                a2, a0
        amocas.d          a4, a2, (s2)
        xor               a0, a4, s4
        xor               a1, a5, s3
        or                a0, a0, a1
        bnez              a0, 0b
        mv                a0, s4
        mv                a1, s3
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        lw                s4, 0x8(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_max::f64::release:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        sw                s4, 0x8(sp)
        mv                s0, a2
        mv                s1, a1
        mv                s2, a0
        li                a2, 0x0
        li                a3, 0x0
        amocas.d          a2, a2, (a0)
        mv                a5, a3
        mv                a4, a2
0:
        mv                s3, a5
        mv                s4, a4
        mv                a0, a4
        mv                a1, a5
        mv                a2, s1
        mv                a3, s0
1:
        auipc             ra, 0x0
        jalr              r1b
        mv                a4, s4
        mv                a5, s3
        mv                a3, a1
        mv                a2, a0
        amocas.d.rl       a4, a2, (s2)
        xor               a0, a4, s4
        xor               a1, a5, s3
        or                a0, a0, a1
        bnez              a0, 0b
        mv                a0, s4
        mv                a1, s3
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        lw                s4, 0x8(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_max::i16::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        andi              a4, a0, 0x18
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        li                a5, 0x10
        sll               a1, a1, a0
        sub               a5, a5, a4
0:
        lr.w.aq           a4, (a2)
        and               a7, a4, a3
        mv                a6, a4
        sll               a7, a7, a5
        sra               a7, a7, a5
        bge               a7, a1, 1f
        xor               a6, a4, a1
        and               a6, a6, a3
        xor               a6, a4, a6
1:
        sc.w.rl           a6, a6, (a2)
        bnez              a6, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_max::i16::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        andi              a4, a0, 0x18
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        li                a5, 0x10
        sll               a1, a1, a0
        sub               a5, a5, a4
0:
        lr.w.aqrl         a4, (a2)
        and               a7, a4, a3
        mv                a6, a4
        sll               a7, a7, a5
        sra               a7, a7, a5
        bge               a7, a1, 1f
        xor               a6, a4, a1
        and               a6, a6, a3
        xor               a6, a4, a6
1:
        sc.w.rl           a6, a6, (a2)
        bnez              a6, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_max::i16::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        andi              a4, a0, 0x18
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        li                a5, 0x10
        sll               a1, a1, a0
        sub               a5, a5, a4
0:
        lr.w.aq           a4, (a2)
        and               a7, a4, a3
        mv                a6, a4
        sll               a7, a7, a5
        sra               a7, a7, a5
        bge               a7, a1, 1f
        xor               a6, a4, a1
        and               a6, a6, a3
        xor               a6, a4, a6
1:
        sc.w              a6, a6, (a2)
        bnez              a6, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_max::i16::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        andi              a4, a0, 0x18
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        li                a5, 0x10
        sll               a1, a1, a0
        sub               a5, a5, a4
0:
        lr.w              a4, (a2)
        and               a7, a4, a3
        mv                a6, a4
        sll               a7, a7, a5
        sra               a7, a7, a5
        bge               a7, a1, 1f
        xor               a6, a4, a1
        and               a6, a6, a3
        xor               a6, a4, a6
1:
        sc.w              a6, a6, (a2)
        bnez              a6, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_max::i16::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        andi              a4, a0, 0x18
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        li                a5, 0x10
        sll               a1, a1, a0
        sub               a5, a5, a4
0:
        lr.w              a4, (a2)
        and               a7, a4, a3
        mv                a6, a4
        sll               a7, a7, a5
        sra               a7, a7, a5
        bge               a7, a1, 1f
        xor               a6, a4, a1
        and               a6, a6, a3
        xor               a6, a4, a6
1:
        sc.w.rl           a6, a6, (a2)
        bnez              a6, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_max::i32::acqrel:
        amomax.w.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_max::i32::seqcst:
        amomax.w.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_max::i32::acquire:
        amomax.w.aq       a0, a1, (a0)
        ret

asm_test::fetch_max::i32::relaxed:
        amomax.w          a0, a1, (a0)
        ret

asm_test::fetch_max::i32::release:
        amomax.w.rl       a0, a1, (a0)
        ret

asm_test::fetch_max::i64::acqrel:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        j                 1f
0:
        mv                a5, a7
        mv                a4, t0
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a4, t0
        xor               a3, a5, a7
        or                a2, a2, a3
        beqz              a2, 4f
1:
        mv                a7, a5
        mv                t0, a4
        beq               a6, a5, 2f
        slt               a4, a7, a6
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
        j                 3f
2:
        sltu              a4, t0, a1
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
3:
        mv                a2, t0
        mv                a3, a7
        j                 0b
4:
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_max::i64::seqcst:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        j                 1f
0:
        mv                a5, a7
        mv                a4, t0
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a4, t0
        xor               a3, a5, a7
        or                a2, a2, a3
        beqz              a2, 4f
1:
        mv                a7, a5
        mv                t0, a4
        beq               a6, a5, 2f
        slt               a4, a7, a6
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
        j                 3f
2:
        sltu              a4, t0, a1
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
3:
        mv                a2, t0
        mv                a3, a7
        j                 0b
4:
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_max::i64::acquire:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        j                 1f
0:
        mv                a5, a7
        mv                a4, t0
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a4, t0
        xor               a3, a5, a7
        or                a2, a2, a3
        beqz              a2, 4f
1:
        mv                a7, a5
        mv                t0, a4
        beq               a6, a5, 2f
        slt               a4, a7, a6
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
        j                 3f
2:
        sltu              a4, t0, a1
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
3:
        mv                a2, t0
        mv                a3, a7
        j                 0b
4:
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_max::i64::relaxed:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        j                 1f
0:
        mv                a5, a7
        mv                a4, t0
        amocas.d          a4, a2, (a0)
        xor               a2, a4, t0
        xor               a3, a5, a7
        or                a2, a2, a3
        beqz              a2, 4f
1:
        mv                a7, a5
        mv                t0, a4
        beq               a6, a5, 2f
        slt               a4, a7, a6
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
        j                 3f
2:
        sltu              a4, t0, a1
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
3:
        mv                a2, t0
        mv                a3, a7
        j                 0b
4:
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_max::i64::release:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        j                 1f
0:
        mv                a5, a7
        mv                a4, t0
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a4, t0
        xor               a3, a5, a7
        or                a2, a2, a3
        beqz              a2, 4f
1:
        mv                a7, a5
        mv                t0, a4
        beq               a6, a5, 2f
        slt               a4, a7, a6
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
        j                 3f
2:
        sltu              a4, t0, a1
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
3:
        mv                a2, t0
        mv                a3, a7
        j                 0b
4:
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_min::i8::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        andi              a4, a0, 0x18
        sll               a3, a3, a0
        sll               a1, a1, a0
        xori              a4, a4, 0x18
0:
        lr.w.aq           a5, (a2)
        and               a7, a5, a3
        mv                a6, a5
        sll               a7, a7, a4
        sra               a7, a7, a4
        bge               a1, a7, 1f
        xor               a6, a5, a1
        and               a6, a6, a3
        xor               a6, a5, a6
1:
        sc.w.rl           a6, a6, (a2)
        bnez              a6, 0b
        srl               a0, a5, a0
        ret

asm_test::fetch_min::i8::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        andi              a4, a0, 0x18
        sll               a3, a3, a0
        sll               a1, a1, a0
        xori              a4, a4, 0x18
0:
        lr.w.aqrl         a5, (a2)
        and               a7, a5, a3
        mv                a6, a5
        sll               a7, a7, a4
        sra               a7, a7, a4
        bge               a1, a7, 1f
        xor               a6, a5, a1
        and               a6, a6, a3
        xor               a6, a5, a6
1:
        sc.w.rl           a6, a6, (a2)
        bnez              a6, 0b
        srl               a0, a5, a0
        ret

asm_test::fetch_min::i8::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        andi              a4, a0, 0x18
        sll               a3, a3, a0
        sll               a1, a1, a0
        xori              a4, a4, 0x18
0:
        lr.w.aq           a5, (a2)
        and               a7, a5, a3
        mv                a6, a5
        sll               a7, a7, a4
        sra               a7, a7, a4
        bge               a1, a7, 1f
        xor               a6, a5, a1
        and               a6, a6, a3
        xor               a6, a5, a6
1:
        sc.w              a6, a6, (a2)
        bnez              a6, 0b
        srl               a0, a5, a0
        ret

asm_test::fetch_min::i8::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        andi              a4, a0, 0x18
        sll               a3, a3, a0
        sll               a1, a1, a0
        xori              a4, a4, 0x18
0:
        lr.w              a5, (a2)
        and               a7, a5, a3
        mv                a6, a5
        sll               a7, a7, a4
        sra               a7, a7, a4
        bge               a1, a7, 1f
        xor               a6, a5, a1
        and               a6, a6, a3
        xor               a6, a5, a6
1:
        sc.w              a6, a6, (a2)
        bnez              a6, 0b
        srl               a0, a5, a0
        ret

asm_test::fetch_min::i8::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        andi              a4, a0, 0x18
        sll               a3, a3, a0
        sll               a1, a1, a0
        xori              a4, a4, 0x18
0:
        lr.w              a5, (a2)
        and               a7, a5, a3
        mv                a6, a5
        sll               a7, a7, a4
        sra               a7, a7, a4
        bge               a1, a7, 1f
        xor               a6, a5, a1
        and               a6, a6, a3
        xor               a6, a5, a6
1:
        sc.w.rl           a6, a6, (a2)
        bnez              a6, 0b
        srl               a0, a5, a0
        ret

asm_test::fetch_min::f32::acqrel:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        mv                s2, a1
0:
        mv                s3, s1
        mv                a0, s1
        mv                a1, s2
1:
        auipc             ra, 0x0
        jalr              r1b
        amocas.w.aqrl     s1, a0, (s0)
        bne               s1, s3, 0b
        mv                a0, s1
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_min::f32::seqcst:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        mv                s2, a1
0:
        mv                s3, s1
        mv                a0, s1
        mv                a1, s2
1:
        auipc             ra, 0x0
        jalr              r1b
        amocas.w.aqrl     s1, a0, (s0)
        bne               s1, s3, 0b
        mv                a0, s1
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_min::f32::acquire:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        mv                s2, a1
0:
        mv                s3, s1
        mv                a0, s1
        mv                a1, s2
1:
        auipc             ra, 0x0
        jalr              r1b
        amocas.w.aq       s1, a0, (s0)
        bne               s1, s3, 0b
        mv                a0, s1
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_min::f32::relaxed:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        mv                s2, a1
0:
        mv                s3, s1
        mv                a0, s1
        mv                a1, s2
1:
        auipc             ra, 0x0
        jalr              r1b
        amocas.w          s1, a0, (s0)
        bne               s1, s3, 0b
        mv                a0, s1
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_min::f32::release:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        mv                s2, a1
0:
        mv                s3, s1
        mv                a0, s1
        mv                a1, s2
1:
        auipc             ra, 0x0
        jalr              r1b
        amocas.w.rl       s1, a0, (s0)
        bne               s1, s3, 0b
        mv                a0, s1
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_min::f64::acqrel:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        sw                s4, 0x8(sp)
        mv                s0, a2
        mv                s1, a1
        mv                s2, a0
        li                a2, 0x0
        li                a3, 0x0
        amocas.d          a2, a2, (a0)
        mv                a5, a3
        mv                a4, a2
0:
        mv                s3, a5
        mv                s4, a4
        mv                a0, a4
        mv                a1, a5
        mv                a2, s1
        mv                a3, s0
1:
        auipc             ra, 0x0
        jalr              r1b
        mv                a4, s4
        mv                a5, s3
        mv                a3, a1
        mv                a2, a0
        amocas.d.aqrl     a4, a2, (s2)
        xor               a0, a4, s4
        xor               a1, a5, s3
        or                a0, a0, a1
        bnez              a0, 0b
        mv                a0, s4
        mv                a1, s3
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        lw                s4, 0x8(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_min::f64::seqcst:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        sw                s4, 0x8(sp)
        mv                s0, a2
        mv                s1, a1
        mv                s2, a0
        li                a2, 0x0
        li                a3, 0x0
        amocas.d          a2, a2, (a0)
        mv                a5, a3
        mv                a4, a2
0:
        mv                s3, a5
        mv                s4, a4
        mv                a0, a4
        mv                a1, a5
        mv                a2, s1
        mv                a3, s0
1:
        auipc             ra, 0x0
        jalr              r1b
        mv                a4, s4
        mv                a5, s3
        mv                a3, a1
        mv                a2, a0
        amocas.d.aqrl     a4, a2, (s2)
        xor               a0, a4, s4
        xor               a1, a5, s3
        or                a0, a0, a1
        bnez              a0, 0b
        mv                a0, s4
        mv                a1, s3
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        lw                s4, 0x8(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_min::f64::acquire:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        sw                s4, 0x8(sp)
        mv                s0, a2
        mv                s1, a1
        mv                s2, a0
        li                a2, 0x0
        li                a3, 0x0
        amocas.d          a2, a2, (a0)
        mv                a5, a3
        mv                a4, a2
0:
        mv                s3, a5
        mv                s4, a4
        mv                a0, a4
        mv                a1, a5
        mv                a2, s1
        mv                a3, s0
1:
        auipc             ra, 0x0
        jalr              r1b
        mv                a4, s4
        mv                a5, s3
        mv                a3, a1
        mv                a2, a0
        amocas.d.aq       a4, a2, (s2)
        xor               a0, a4, s4
        xor               a1, a5, s3
        or                a0, a0, a1
        bnez              a0, 0b
        mv                a0, s4
        mv                a1, s3
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        lw                s4, 0x8(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_min::f64::relaxed:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        sw                s4, 0x8(sp)
        mv                s0, a2
        mv                s1, a1
        mv                s2, a0
        li                a2, 0x0
        li                a3, 0x0
        amocas.d          a2, a2, (a0)
        mv                a5, a3
        mv                a4, a2
0:
        mv                s3, a5
        mv                s4, a4
        mv                a0, a4
        mv                a1, a5
        mv                a2, s1
        mv                a3, s0
1:
        auipc             ra, 0x0
        jalr              r1b
        mv                a4, s4
        mv                a5, s3
        mv                a3, a1
        mv                a2, a0
        amocas.d          a4, a2, (s2)
        xor               a0, a4, s4
        xor               a1, a5, s3
        or                a0, a0, a1
        bnez              a0, 0b
        mv                a0, s4
        mv                a1, s3
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        lw                s4, 0x8(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_min::f64::release:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        sw                s4, 0x8(sp)
        mv                s0, a2
        mv                s1, a1
        mv                s2, a0
        li                a2, 0x0
        li                a3, 0x0
        amocas.d          a2, a2, (a0)
        mv                a5, a3
        mv                a4, a2
0:
        mv                s3, a5
        mv                s4, a4
        mv                a0, a4
        mv                a1, a5
        mv                a2, s1
        mv                a3, s0
1:
        auipc             ra, 0x0
        jalr              r1b
        mv                a4, s4
        mv                a5, s3
        mv                a3, a1
        mv                a2, a0
        amocas.d.rl       a4, a2, (s2)
        xor               a0, a4, s4
        xor               a1, a5, s3
        or                a0, a0, a1
        bnez              a0, 0b
        mv                a0, s4
        mv                a1, s3
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        lw                s4, 0x8(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_min::i16::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        andi              a4, a0, 0x18
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        li                a5, 0x10
        sll               a1, a1, a0
        sub               a5, a5, a4
0:
        lr.w.aq           a4, (a2)
        and               a7, a4, a3
        mv                a6, a4
        sll               a7, a7, a5
        sra               a7, a7, a5
        bge               a1, a7, 1f
        xor               a6, a4, a1
        and               a6, a6, a3
        xor               a6, a4, a6
1:
        sc.w.rl           a6, a6, (a2)
        bnez              a6, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_min::i16::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        andi              a4, a0, 0x18
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        li                a5, 0x10
        sll               a1, a1, a0
        sub               a5, a5, a4
0:
        lr.w.aqrl         a4, (a2)
        and               a7, a4, a3
        mv                a6, a4
        sll               a7, a7, a5
        sra               a7, a7, a5
        bge               a1, a7, 1f
        xor               a6, a4, a1
        and               a6, a6, a3
        xor               a6, a4, a6
1:
        sc.w.rl           a6, a6, (a2)
        bnez              a6, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_min::i16::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        andi              a4, a0, 0x18
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        li                a5, 0x10
        sll               a1, a1, a0
        sub               a5, a5, a4
0:
        lr.w.aq           a4, (a2)
        and               a7, a4, a3
        mv                a6, a4
        sll               a7, a7, a5
        sra               a7, a7, a5
        bge               a1, a7, 1f
        xor               a6, a4, a1
        and               a6, a6, a3
        xor               a6, a4, a6
1:
        sc.w              a6, a6, (a2)
        bnez              a6, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_min::i16::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        andi              a4, a0, 0x18
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        li                a5, 0x10
        sll               a1, a1, a0
        sub               a5, a5, a4
0:
        lr.w              a4, (a2)
        and               a7, a4, a3
        mv                a6, a4
        sll               a7, a7, a5
        sra               a7, a7, a5
        bge               a1, a7, 1f
        xor               a6, a4, a1
        and               a6, a6, a3
        xor               a6, a4, a6
1:
        sc.w              a6, a6, (a2)
        bnez              a6, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_min::i16::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        andi              a4, a0, 0x18
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        li                a5, 0x10
        sll               a1, a1, a0
        sub               a5, a5, a4
0:
        lr.w              a4, (a2)
        and               a7, a4, a3
        mv                a6, a4
        sll               a7, a7, a5
        sra               a7, a7, a5
        bge               a1, a7, 1f
        xor               a6, a4, a1
        and               a6, a6, a3
        xor               a6, a4, a6
1:
        sc.w.rl           a6, a6, (a2)
        bnez              a6, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_min::i32::acqrel:
        amomin.w.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_min::i32::seqcst:
        amomin.w.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_min::i32::acquire:
        amomin.w.aq       a0, a1, (a0)
        ret

asm_test::fetch_min::i32::relaxed:
        amomin.w          a0, a1, (a0)
        ret

asm_test::fetch_min::i32::release:
        amomin.w.rl       a0, a1, (a0)
        ret

asm_test::fetch_min::i64::acqrel:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        j                 1f
0:
        mv                a5, a7
        mv                a4, t0
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a4, t0
        xor               a3, a5, a7
        or                a2, a2, a3
        beqz              a2, 4f
1:
        mv                a7, a5
        mv                t0, a4
        beq               a6, a5, 2f
        slt               a4, a6, a7
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
        j                 3f
2:
        sltu              a4, a1, t0
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
3:
        mv                a2, t0
        mv                a3, a7
        j                 0b
4:
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_min::i64::seqcst:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        j                 1f
0:
        mv                a5, a7
        mv                a4, t0
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a4, t0
        xor               a3, a5, a7
        or                a2, a2, a3
        beqz              a2, 4f
1:
        mv                a7, a5
        mv                t0, a4
        beq               a6, a5, 2f
        slt               a4, a6, a7
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
        j                 3f
2:
        sltu              a4, a1, t0
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
3:
        mv                a2, t0
        mv                a3, a7
        j                 0b
4:
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_min::i64::acquire:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        j                 1f
0:
        mv                a5, a7
        mv                a4, t0
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a4, t0
        xor               a3, a5, a7
        or                a2, a2, a3
        beqz              a2, 4f
1:
        mv                a7, a5
        mv                t0, a4
        beq               a6, a5, 2f
        slt               a4, a6, a7
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
        j                 3f
2:
        sltu              a4, a1, t0
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
3:
        mv                a2, t0
        mv                a3, a7
        j                 0b
4:
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_min::i64::relaxed:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        j                 1f
0:
        mv                a5, a7
        mv                a4, t0
        amocas.d          a4, a2, (a0)
        xor               a2, a4, t0
        xor               a3, a5, a7
        or                a2, a2, a3
        beqz              a2, 4f
1:
        mv                a7, a5
        mv                t0, a4
        beq               a6, a5, 2f
        slt               a4, a6, a7
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
        j                 3f
2:
        sltu              a4, a1, t0
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
3:
        mv                a2, t0
        mv                a3, a7
        j                 0b
4:
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_min::i64::release:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        j                 1f
0:
        mv                a5, a7
        mv                a4, t0
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a4, t0
        xor               a3, a5, a7
        or                a2, a2, a3
        beqz              a2, 4f
1:
        mv                a7, a5
        mv                t0, a4
        beq               a6, a5, 2f
        slt               a4, a6, a7
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
        j                 3f
2:
        sltu              a4, a1, t0
        mv                a2, a1
        mv                a3, a6
        bnez              a4, 0b
3:
        mv                a2, t0
        mv                a3, a7
        j                 0b
4:
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_neg::u8::acqrel:
        mv                a1, a0
        li                a3, 0xff
        lb                a0, 0x0(a0)
        slli              a2, a1, 0x3
        andi              a1, a1, -0x4
        sll               a3, a3, a2
0:
        neg               a4, a0
        zext.b            a0, a0
        zext.b            a4, a4
        sll               a5, a0, a2
        sll               a0, a4, a2
1:
        lr.w.aq           a4, (a1)
        and               a6, a4, a3
        bne               a6, a5, 2f
        xor               a6, a4, a0
        and               a6, a6, a3
        xor               a6, a4, a6
        sc.w.rl           a6, a6, (a1)
        bnez              a6, 1b
2:
        and               a6, a4, a3
        srl               a0, a4, a2
        bne               a5, a6, 0b
        ret

asm_test::fetch_neg::u8::seqcst:
        mv                a1, a0
        li                a3, 0xff
        lb                a0, 0x0(a0)
        slli              a2, a1, 0x3
        andi              a1, a1, -0x4
        sll               a3, a3, a2
0:
        neg               a4, a0
        zext.b            a0, a0
        zext.b            a4, a4
        sll               a5, a0, a2
        sll               a0, a4, a2
1:
        lr.w.aqrl         a4, (a1)
        and               a6, a4, a3
        bne               a6, a5, 2f
        xor               a6, a4, a0
        and               a6, a6, a3
        xor               a6, a4, a6
        sc.w.rl           a6, a6, (a1)
        bnez              a6, 1b
2:
        and               a6, a4, a3
        srl               a0, a4, a2
        bne               a5, a6, 0b
        ret

asm_test::fetch_neg::u8::acquire:
        mv                a1, a0
        li                a3, 0xff
        lb                a0, 0x0(a0)
        slli              a2, a1, 0x3
        andi              a1, a1, -0x4
        sll               a3, a3, a2
0:
        neg               a4, a0
        zext.b            a0, a0
        zext.b            a4, a4
        sll               a5, a0, a2
        sll               a0, a4, a2
1:
        lr.w.aq           a4, (a1)
        and               a6, a4, a3
        bne               a6, a5, 2f
        xor               a6, a4, a0
        and               a6, a6, a3
        xor               a6, a4, a6
        sc.w              a6, a6, (a1)
        bnez              a6, 1b
2:
        and               a6, a4, a3
        srl               a0, a4, a2
        bne               a5, a6, 0b
        ret

asm_test::fetch_neg::u8::relaxed:
        mv                a1, a0
        li                a3, 0xff
        lb                a0, 0x0(a0)
        slli              a2, a1, 0x3
        andi              a1, a1, -0x4
        sll               a3, a3, a2
0:
        neg               a4, a0
        zext.b            a0, a0
        zext.b            a4, a4
        sll               a5, a0, a2
        sll               a0, a4, a2
1:
        lr.w              a4, (a1)
        and               a6, a4, a3
        bne               a6, a5, 2f
        xor               a6, a4, a0
        and               a6, a6, a3
        xor               a6, a4, a6
        sc.w              a6, a6, (a1)
        bnez              a6, 1b
2:
        and               a6, a4, a3
        srl               a0, a4, a2
        bne               a5, a6, 0b
        ret

asm_test::fetch_neg::u8::release:
        mv                a1, a0
        li                a3, 0xff
        lb                a0, 0x0(a0)
        slli              a2, a1, 0x3
        andi              a1, a1, -0x4
        sll               a3, a3, a2
0:
        neg               a4, a0
        zext.b            a0, a0
        zext.b            a4, a4
        sll               a5, a0, a2
        sll               a0, a4, a2
1:
        lr.w              a4, (a1)
        and               a6, a4, a3
        bne               a6, a5, 2f
        xor               a6, a4, a0
        and               a6, a6, a3
        xor               a6, a4, a6
        sc.w.rl           a6, a6, (a1)
        bnez              a6, 1b
2:
        and               a6, a4, a3
        srl               a0, a4, a2
        bne               a5, a6, 0b
        ret

asm_test::fetch_neg::f32::acqrel:
        lui               a1, 0x80000
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_neg::f32::seqcst:
        lui               a1, 0x80000
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_neg::f32::acquire:
        lui               a1, 0x80000
        amoxor.w.aq       a0, a1, (a0)
        ret

asm_test::fetch_neg::f32::relaxed:
        lui               a1, 0x80000
        amoxor.w          a0, a1, (a0)
        ret

asm_test::fetch_neg::f32::release:
        lui               a1, 0x80000
        amoxor.w.rl       a0, a1, (a0)
        ret

asm_test::fetch_neg::f64::acqrel:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        lui               a6, 0x80000
0:
        mv                a1, a5
        mv                a2, a4
        xor               a3, a5, a6
        amocas.d.aqrl     a4, a2, (a0)
        xor               a3, a5, a1
        xor               a7, a4, a2
        or                a3, a7, a3
        bnez              a3, 0b
        mv                a0, a2
        ret

asm_test::fetch_neg::f64::seqcst:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        lui               a6, 0x80000
0:
        mv                a1, a5
        mv                a2, a4
        xor               a3, a5, a6
        amocas.d.aqrl     a4, a2, (a0)
        xor               a3, a5, a1
        xor               a7, a4, a2
        or                a3, a7, a3
        bnez              a3, 0b
        mv                a0, a2
        ret

asm_test::fetch_neg::f64::acquire:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        lui               a6, 0x80000
0:
        mv                a1, a5
        mv                a2, a4
        xor               a3, a5, a6
        amocas.d.aq       a4, a2, (a0)
        xor               a3, a5, a1
        xor               a7, a4, a2
        or                a3, a7, a3
        bnez              a3, 0b
        mv                a0, a2
        ret

asm_test::fetch_neg::f64::relaxed:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        lui               a6, 0x80000
0:
        mv                a1, a5
        mv                a2, a4
        xor               a3, a5, a6
        amocas.d          a4, a2, (a0)
        xor               a3, a5, a1
        xor               a7, a4, a2
        or                a3, a7, a3
        bnez              a3, 0b
        mv                a0, a2
        ret

asm_test::fetch_neg::f64::release:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        lui               a6, 0x80000
0:
        mv                a1, a5
        mv                a2, a4
        xor               a3, a5, a6
        amocas.d.rl       a4, a2, (a0)
        xor               a3, a5, a1
        xor               a7, a4, a2
        or                a3, a7, a3
        bnez              a3, 0b
        mv                a0, a2
        ret

asm_test::fetch_neg::u16::acqrel:
        mv                a1, a0
        lui               a3, 0x10
        lh                a0, 0x0(a0)
        slli              a2, a1, 0x3
        addi              a3, a3, -0x1
        andi              a1, a1, -0x4
        sll               a4, a3, a2
0:
        neg               a5, a0
        and               a0, a0, a3
        and               a5, a5, a3
        sll               a6, a0, a2
        sll               a0, a5, a2
1:
        lr.w.aq           a5, (a1)
        and               a7, a5, a4
        bne               a7, a6, 2f
        xor               a7, a5, a0
        and               a7, a7, a4
        xor               a7, a5, a7
        sc.w.rl           a7, a7, (a1)
        bnez              a7, 1b
2:
        and               a7, a5, a4
        srl               a0, a5, a2
        bne               a6, a7, 0b
        ret

asm_test::fetch_neg::u16::seqcst:
        mv                a1, a0
        lui               a3, 0x10
        lh                a0, 0x0(a0)
        slli              a2, a1, 0x3
        addi              a3, a3, -0x1
        andi              a1, a1, -0x4
        sll               a4, a3, a2
0:
        neg               a5, a0
        and               a0, a0, a3
        and               a5, a5, a3
        sll               a6, a0, a2
        sll               a0, a5, a2
1:
        lr.w.aqrl         a5, (a1)
        and               a7, a5, a4
        bne               a7, a6, 2f
        xor               a7, a5, a0
        and               a7, a7, a4
        xor               a7, a5, a7
        sc.w.rl           a7, a7, (a1)
        bnez              a7, 1b
2:
        and               a7, a5, a4
        srl               a0, a5, a2
        bne               a6, a7, 0b
        ret

asm_test::fetch_neg::u16::acquire:
        mv                a1, a0
        lui               a3, 0x10
        lh                a0, 0x0(a0)
        slli              a2, a1, 0x3
        addi              a3, a3, -0x1
        andi              a1, a1, -0x4
        sll               a4, a3, a2
0:
        neg               a5, a0
        and               a0, a0, a3
        and               a5, a5, a3
        sll               a6, a0, a2
        sll               a0, a5, a2
1:
        lr.w.aq           a5, (a1)
        and               a7, a5, a4
        bne               a7, a6, 2f
        xor               a7, a5, a0
        and               a7, a7, a4
        xor               a7, a5, a7
        sc.w              a7, a7, (a1)
        bnez              a7, 1b
2:
        and               a7, a5, a4
        srl               a0, a5, a2
        bne               a6, a7, 0b
        ret

asm_test::fetch_neg::u16::relaxed:
        mv                a1, a0
        lui               a3, 0x10
        lh                a0, 0x0(a0)
        slli              a2, a1, 0x3
        addi              a3, a3, -0x1
        andi              a1, a1, -0x4
        sll               a4, a3, a2
0:
        neg               a5, a0
        and               a0, a0, a3
        and               a5, a5, a3
        sll               a6, a0, a2
        sll               a0, a5, a2
1:
        lr.w              a5, (a1)
        and               a7, a5, a4
        bne               a7, a6, 2f
        xor               a7, a5, a0
        and               a7, a7, a4
        xor               a7, a5, a7
        sc.w              a7, a7, (a1)
        bnez              a7, 1b
2:
        and               a7, a5, a4
        srl               a0, a5, a2
        bne               a6, a7, 0b
        ret

asm_test::fetch_neg::u16::release:
        mv                a1, a0
        lui               a3, 0x10
        lh                a0, 0x0(a0)
        slli              a2, a1, 0x3
        addi              a3, a3, -0x1
        andi              a1, a1, -0x4
        sll               a4, a3, a2
0:
        neg               a5, a0
        and               a0, a0, a3
        and               a5, a5, a3
        sll               a6, a0, a2
        sll               a0, a5, a2
1:
        lr.w              a5, (a1)
        and               a7, a5, a4
        bne               a7, a6, 2f
        xor               a7, a5, a0
        and               a7, a7, a4
        xor               a7, a5, a7
        sc.w.rl           a7, a7, (a1)
        bnez              a7, 1b
2:
        and               a7, a5, a4
        srl               a0, a5, a2
        bne               a6, a7, 0b
        ret

asm_test::fetch_neg::u32::acqrel:
        mv                a1, a0
        lw                a0, 0x0(a0)
0:
        mv                a2, a0
        neg               a3, a0
        amocas.w.aqrl     a0, a3, (a1)
        bne               a0, a2, 0b
        ret

asm_test::fetch_neg::u32::seqcst:
        mv                a1, a0
        lw                a0, 0x0(a0)
0:
        mv                a2, a0
        neg               a3, a0
        amocas.w.aqrl     a0, a3, (a1)
        bne               a0, a2, 0b
        ret

asm_test::fetch_neg::u32::acquire:
        mv                a1, a0
        lw                a0, 0x0(a0)
0:
        mv                a2, a0
        neg               a3, a0
        amocas.w.aq       a0, a3, (a1)
        bne               a0, a2, 0b
        ret

asm_test::fetch_neg::u32::relaxed:
        mv                a1, a0
        lw                a0, 0x0(a0)
0:
        mv                a2, a0
        neg               a3, a0
        amocas.w          a0, a3, (a1)
        bne               a0, a2, 0b
        ret

asm_test::fetch_neg::u32::release:
        mv                a1, a0
        lw                a0, 0x0(a0)
0:
        mv                a2, a0
        neg               a3, a0
        amocas.w.rl       a0, a3, (a1)
        bne               a0, a2, 0b
        ret

asm_test::fetch_neg::u64::acqrel:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a1, a4
        mv                a6, a5
        neg               a2, a4
        snez              a3, a4
        neg               a4, a5
        sub               a3, a4, a3
        mv                a4, a1
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a6
        xor               a3, a4, a1
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a1
        mv                a1, a6
        ret

asm_test::fetch_neg::u64::seqcst:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a1, a4
        mv                a6, a5
        neg               a2, a4
        snez              a3, a4
        neg               a4, a5
        sub               a3, a4, a3
        mv                a4, a1
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a6
        xor               a3, a4, a1
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a1
        mv                a1, a6
        ret

asm_test::fetch_neg::u64::acquire:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a1, a4
        mv                a6, a5
        neg               a2, a4
        snez              a3, a4
        neg               a4, a5
        sub               a3, a4, a3
        mv                a4, a1
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a5, a6
        xor               a3, a4, a1
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a1
        mv                a1, a6
        ret

asm_test::fetch_neg::u64::relaxed:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a1, a4
        mv                a6, a5
        neg               a2, a4
        snez              a3, a4
        neg               a4, a5
        sub               a3, a4, a3
        mv                a4, a1
        amocas.d          a4, a2, (a0)
        xor               a2, a5, a6
        xor               a3, a4, a1
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a1
        mv                a1, a6
        ret

asm_test::fetch_neg::u64::release:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a1, a4
        mv                a6, a5
        neg               a2, a4
        snez              a3, a4
        neg               a4, a5
        sub               a3, a4, a3
        mv                a4, a1
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a5, a6
        xor               a3, a4, a1
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a1
        mv                a1, a6
        ret

asm_test::fetch_not::u8::acqrel:
        li                a1, 0xff
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_not::u8::seqcst:
        li                a1, 0xff
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_not::u8::acquire:
        li                a1, 0xff
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aq       a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_not::u8::relaxed:
        li                a1, 0xff
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w          a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_not::u8::release:
        li                a1, 0xff
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.rl       a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_not::u16::acqrel:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_not::u16::seqcst:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_not::u16::acquire:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aq       a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_not::u16::relaxed:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w          a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_not::u16::release:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.rl       a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_not::u32::acqrel:
        li                a1, -0x1
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_not::u32::seqcst:
        li                a1, -0x1
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_not::u32::acquire:
        li                a1, -0x1
        amoxor.w.aq       a0, a1, (a0)
        ret

asm_test::fetch_not::u32::relaxed:
        li                a1, -0x1
        amoxor.w          a0, a1, (a0)
        ret

asm_test::fetch_not::u32::release:
        li                a1, -0x1
        amoxor.w.rl       a0, a1, (a0)
        ret

asm_test::fetch_not::u64::acqrel:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a1, a4
        mv                a6, a5
        not               a2, a4
        not               a3, a5
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a6
        xor               a3, a4, a1
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a1
        mv                a1, a6
        ret

asm_test::fetch_not::u64::seqcst:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a1, a4
        mv                a6, a5
        not               a2, a4
        not               a3, a5
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a6
        xor               a3, a4, a1
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a1
        mv                a1, a6
        ret

asm_test::fetch_not::u64::acquire:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a1, a4
        mv                a6, a5
        not               a2, a4
        not               a3, a5
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a5, a6
        xor               a3, a4, a1
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a1
        mv                a1, a6
        ret

asm_test::fetch_not::u64::relaxed:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a1, a4
        mv                a6, a5
        not               a2, a4
        not               a3, a5
        amocas.d          a4, a2, (a0)
        xor               a2, a5, a6
        xor               a3, a4, a1
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a1
        mv                a1, a6
        ret

asm_test::fetch_not::u64::release:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a1, a4
        mv                a6, a5
        not               a2, a4
        not               a3, a5
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a5, a6
        xor               a3, a4, a1
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a1
        mv                a1, a6
        ret

asm_test::fetch_not::bool::acqrel:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_not::bool::seqcst:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_not::bool::acquire:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aq       a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_not::bool::relaxed:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w          a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_not::bool::release:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.rl       a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_sub::u8::acqrel_zero:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_sub::u8::seqcst_zero:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_sub::u8::acquire_zero:
        andi              a1, a0, -0x4
        amoor.w.aq        a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_sub::u8::relaxed_zero:
        andi              a1, a0, -0x4
        amoor.w           a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_sub::u8::release_zero:
        andi              a1, a0, -0x4
        amoor.w.rl        a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_sub::u8::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w.aq           a4, (a2)
        sub               a5, a4, a1
        xor               a5, a5, a4
        and               a5, a5, a3
        xor               a5, a5, a4
        sc.w.rl           a5, a5, (a2)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_sub::u8::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w.aqrl         a4, (a2)
        sub               a5, a4, a1
        xor               a5, a5, a4
        and               a5, a5, a3
        xor               a5, a5, a4
        sc.w.rl           a5, a5, (a2)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_sub::u8::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w.aq           a4, (a2)
        sub               a5, a4, a1
        xor               a5, a5, a4
        and               a5, a5, a3
        xor               a5, a5, a4
        sc.w              a5, a5, (a2)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_sub::u8::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w              a4, (a2)
        sub               a5, a4, a1
        xor               a5, a5, a4
        and               a5, a5, a3
        xor               a5, a5, a4
        sc.w              a5, a5, (a2)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_sub::u8::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w              a4, (a2)
        sub               a5, a4, a1
        xor               a5, a5, a4
        and               a5, a5, a3
        xor               a5, a5, a4
        sc.w.rl           a5, a5, (a2)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_sub::f32::acqrel_zero:
        mv                a1, a0
        lw                a0, 0x0(a0)
0:
        mv                a2, a0
        amocas.w.aqrl     a0, a0, (a1)
        bne               a0, a2, 0b
        ret

asm_test::fetch_sub::f32::seqcst_zero:
        mv                a1, a0
        lw                a0, 0x0(a0)
0:
        mv                a2, a0
        amocas.w.aqrl     a0, a0, (a1)
        bne               a0, a2, 0b
        ret

asm_test::fetch_sub::f32::acquire_zero:
        mv                a1, a0
        lw                a0, 0x0(a0)
0:
        mv                a2, a0
        amocas.w.aq       a0, a0, (a1)
        bne               a0, a2, 0b
        ret

asm_test::fetch_sub::f32::relaxed_zero:
        mv                a1, a0
        lw                a0, 0x0(a0)
0:
        mv                a2, a0
        amocas.w          a0, a0, (a1)
        bne               a0, a2, 0b
        ret

asm_test::fetch_sub::f32::release_zero:
        mv                a1, a0
        lw                a0, 0x0(a0)
0:
        mv                a2, a0
        amocas.w.rl       a0, a0, (a1)
        bne               a0, a2, 0b
        ret

asm_test::fetch_sub::f32::acqrel:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        mv                s2, a1
0:
        mv                s3, s1
        mv                a0, s1
        mv                a1, s2
1:
        auipc             ra, 0x0
        jalr              r1b
        amocas.w.aqrl     s1, a0, (s0)
        bne               s1, s3, 0b
        mv                a0, s1
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_sub::f32::seqcst:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        mv                s2, a1
0:
        mv                s3, s1
        mv                a0, s1
        mv                a1, s2
1:
        auipc             ra, 0x0
        jalr              r1b
        amocas.w.aqrl     s1, a0, (s0)
        bne               s1, s3, 0b
        mv                a0, s1
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_sub::f32::acquire:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        mv                s2, a1
0:
        mv                s3, s1
        mv                a0, s1
        mv                a1, s2
1:
        auipc             ra, 0x0
        jalr              r1b
        amocas.w.aq       s1, a0, (s0)
        bne               s1, s3, 0b
        mv                a0, s1
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_sub::f32::relaxed:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        mv                s2, a1
0:
        mv                s3, s1
        mv                a0, s1
        mv                a1, s2
1:
        auipc             ra, 0x0
        jalr              r1b
        amocas.w          s1, a0, (s0)
        bne               s1, s3, 0b
        mv                a0, s1
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_sub::f32::release:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        mv                s2, a1
0:
        mv                s3, s1
        mv                a0, s1
        mv                a1, s2
1:
        auipc             ra, 0x0
        jalr              r1b
        amocas.w.rl       s1, a0, (s0)
        bne               s1, s3, 0b
        mv                a0, s1
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_sub::f64::acqrel_zero:
        li                a2, 0x0
        li                a3, 0x0
        amocas.d          a2, a2, (a0)
        mv                a5, a3
        mv                a4, a2
0:
        mv                a2, a4
        mv                a3, a5
        amocas.d.aqrl     a4, a2, (a0)
        xor               a1, a5, a3
        xor               a6, a4, a2
        or                a1, a6, a1
        bnez              a1, 0b
        mv                a0, a2
        mv                a1, a3
        ret

asm_test::fetch_sub::f64::seqcst_zero:
        li                a2, 0x0
        li                a3, 0x0
        amocas.d          a2, a2, (a0)
        mv                a5, a3
        mv                a4, a2
0:
        mv                a2, a4
        mv                a3, a5
        amocas.d.aqrl     a4, a2, (a0)
        xor               a1, a5, a3
        xor               a6, a4, a2
        or                a1, a6, a1
        bnez              a1, 0b
        mv                a0, a2
        mv                a1, a3
        ret

asm_test::fetch_sub::f64::acquire_zero:
        li                a2, 0x0
        li                a3, 0x0
        amocas.d          a2, a2, (a0)
        mv                a5, a3
        mv                a4, a2
0:
        mv                a2, a4
        mv                a3, a5
        amocas.d.aq       a4, a2, (a0)
        xor               a1, a5, a3
        xor               a6, a4, a2
        or                a1, a6, a1
        bnez              a1, 0b
        mv                a0, a2
        mv                a1, a3
        ret

asm_test::fetch_sub::f64::relaxed_zero:
        li                a2, 0x0
        li                a3, 0x0
        amocas.d          a2, a2, (a0)
        mv                a5, a3
        mv                a4, a2
0:
        mv                a2, a4
        mv                a3, a5
        amocas.d          a4, a2, (a0)
        xor               a1, a5, a3
        xor               a6, a4, a2
        or                a1, a6, a1
        bnez              a1, 0b
        mv                a0, a2
        mv                a1, a3
        ret

asm_test::fetch_sub::f64::release_zero:
        li                a2, 0x0
        li                a3, 0x0
        amocas.d          a2, a2, (a0)
        mv                a5, a3
        mv                a4, a2
0:
        mv                a2, a4
        mv                a3, a5
        amocas.d.rl       a4, a2, (a0)
        xor               a1, a5, a3
        xor               a6, a4, a2
        or                a1, a6, a1
        bnez              a1, 0b
        mv                a0, a2
        mv                a1, a3
        ret

asm_test::fetch_sub::f64::acqrel:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        sw                s4, 0x8(sp)
        mv                s0, a2
        mv                s1, a1
        mv                s2, a0
        li                a2, 0x0
        li                a3, 0x0
        amocas.d          a2, a2, (a0)
        mv                a5, a3
        mv                a4, a2
0:
        mv                s3, a5
        mv                s4, a4
        mv                a0, a4
        mv                a1, a5
        mv                a2, s1
        mv                a3, s0
1:
        auipc             ra, 0x0
        jalr              r1b
        mv                a4, s4
        mv                a5, s3
        mv                a3, a1
        mv                a2, a0
        amocas.d.aqrl     a4, a2, (s2)
        xor               a0, a4, s4
        xor               a1, a5, s3
        or                a0, a0, a1
        bnez              a0, 0b
        mv                a0, s4
        mv                a1, s3
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        lw                s4, 0x8(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_sub::f64::seqcst:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        sw                s4, 0x8(sp)
        mv                s0, a2
        mv                s1, a1
        mv                s2, a0
        li                a2, 0x0
        li                a3, 0x0
        amocas.d          a2, a2, (a0)
        mv                a5, a3
        mv                a4, a2
0:
        mv                s3, a5
        mv                s4, a4
        mv                a0, a4
        mv                a1, a5
        mv                a2, s1
        mv                a3, s0
1:
        auipc             ra, 0x0
        jalr              r1b
        mv                a4, s4
        mv                a5, s3
        mv                a3, a1
        mv                a2, a0
        amocas.d.aqrl     a4, a2, (s2)
        xor               a0, a4, s4
        xor               a1, a5, s3
        or                a0, a0, a1
        bnez              a0, 0b
        mv                a0, s4
        mv                a1, s3
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        lw                s4, 0x8(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_sub::f64::acquire:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        sw                s4, 0x8(sp)
        mv                s0, a2
        mv                s1, a1
        mv                s2, a0
        li                a2, 0x0
        li                a3, 0x0
        amocas.d          a2, a2, (a0)
        mv                a5, a3
        mv                a4, a2
0:
        mv                s3, a5
        mv                s4, a4
        mv                a0, a4
        mv                a1, a5
        mv                a2, s1
        mv                a3, s0
1:
        auipc             ra, 0x0
        jalr              r1b
        mv                a4, s4
        mv                a5, s3
        mv                a3, a1
        mv                a2, a0
        amocas.d.aq       a4, a2, (s2)
        xor               a0, a4, s4
        xor               a1, a5, s3
        or                a0, a0, a1
        bnez              a0, 0b
        mv                a0, s4
        mv                a1, s3
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        lw                s4, 0x8(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_sub::f64::relaxed:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        sw                s4, 0x8(sp)
        mv                s0, a2
        mv                s1, a1
        mv                s2, a0
        li                a2, 0x0
        li                a3, 0x0
        amocas.d          a2, a2, (a0)
        mv                a5, a3
        mv                a4, a2
0:
        mv                s3, a5
        mv                s4, a4
        mv                a0, a4
        mv                a1, a5
        mv                a2, s1
        mv                a3, s0
1:
        auipc             ra, 0x0
        jalr              r1b
        mv                a4, s4
        mv                a5, s3
        mv                a3, a1
        mv                a2, a0
        amocas.d          a4, a2, (s2)
        xor               a0, a4, s4
        xor               a1, a5, s3
        or                a0, a0, a1
        bnez              a0, 0b
        mv                a0, s4
        mv                a1, s3
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        lw                s4, 0x8(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_sub::f64::release:
        addi              sp, sp, -0x20
        sw                ra, 0x1c(sp)
        sw                s0, 0x18(sp)
        sw                s1, 0x14(sp)
        sw                s2, 0x10(sp)
        sw                s3, 0xc(sp)
        sw                s4, 0x8(sp)
        mv                s0, a2
        mv                s1, a1
        mv                s2, a0
        li                a2, 0x0
        li                a3, 0x0
        amocas.d          a2, a2, (a0)
        mv                a5, a3
        mv                a4, a2
0:
        mv                s3, a5
        mv                s4, a4
        mv                a0, a4
        mv                a1, a5
        mv                a2, s1
        mv                a3, s0
1:
        auipc             ra, 0x0
        jalr              r1b
        mv                a4, s4
        mv                a5, s3
        mv                a3, a1
        mv                a2, a0
        amocas.d.rl       a4, a2, (s2)
        xor               a0, a4, s4
        xor               a1, a5, s3
        or                a0, a0, a1
        bnez              a0, 0b
        mv                a0, s4
        mv                a1, s3
        lw                ra, 0x1c(sp)
        lw                s0, 0x18(sp)
        lw                s1, 0x14(sp)
        lw                s2, 0x10(sp)
        lw                s3, 0xc(sp)
        lw                s4, 0x8(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_sub::u16::acqrel_zero:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_sub::u16::seqcst_zero:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_sub::u16::acquire_zero:
        andi              a1, a0, -0x4
        amoor.w.aq        a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_sub::u16::relaxed_zero:
        andi              a1, a0, -0x4
        amoor.w           a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_sub::u16::release_zero:
        andi              a1, a0, -0x4
        amoor.w.rl        a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_sub::u16::acqrel:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a1, a1, a0
0:
        lr.w.aq           a4, (a3)
        sub               a5, a4, a1
        xor               a5, a5, a4
        and               a5, a5, a2
        xor               a5, a5, a4
        sc.w.rl           a5, a5, (a3)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_sub::u16::seqcst:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a1, a1, a0
0:
        lr.w.aqrl         a4, (a3)
        sub               a5, a4, a1
        xor               a5, a5, a4
        and               a5, a5, a2
        xor               a5, a5, a4
        sc.w.rl           a5, a5, (a3)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_sub::u16::acquire:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a1, a1, a0
0:
        lr.w.aq           a4, (a3)
        sub               a5, a4, a1
        xor               a5, a5, a4
        and               a5, a5, a2
        xor               a5, a5, a4
        sc.w              a5, a5, (a3)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_sub::u16::relaxed:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a1, a1, a0
0:
        lr.w              a4, (a3)
        sub               a5, a4, a1
        xor               a5, a5, a4
        and               a5, a5, a2
        xor               a5, a5, a4
        sc.w              a5, a5, (a3)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_sub::u16::release:
        lui               a2, 0x10
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        sll               a1, a1, a0
0:
        lr.w              a4, (a3)
        sub               a5, a4, a1
        xor               a5, a5, a4
        and               a5, a5, a2
        xor               a5, a5, a4
        sc.w.rl           a5, a5, (a3)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_sub::u32::acqrel_zero:
        amoor.w.aqrl      a0, zero, (a0)
        ret

asm_test::fetch_sub::u32::seqcst_zero:
        amoor.w.aqrl      a0, zero, (a0)
        ret

asm_test::fetch_sub::u32::acquire_zero:
        amoor.w.aq        a0, zero, (a0)
        ret

asm_test::fetch_sub::u32::relaxed_zero:
        amoor.w           a0, zero, (a0)
        ret

asm_test::fetch_sub::u32::release_zero:
        amoor.w.rl        a0, zero, (a0)
        ret

asm_test::fetch_sub::u32::acqrel:
        neg               a1, a1
        amoadd.w.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_sub::u32::seqcst:
        neg               a1, a1
        amoadd.w.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_sub::u32::acquire:
        neg               a1, a1
        amoadd.w.aq       a0, a1, (a0)
        ret

asm_test::fetch_sub::u32::relaxed:
        neg               a1, a1
        amoadd.w          a0, a1, (a0)
        ret

asm_test::fetch_sub::u32::release:
        neg               a1, a1
        amoadd.w.rl       a0, a1, (a0)
        ret

asm_test::fetch_sub::u64::acqrel_zero:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a2, a4
        mv                a3, a5
        amocas.d.aqrl     a4, a2, (a0)
        xor               a1, a5, a3
        xor               a6, a4, a2
        or                a1, a6, a1
        bnez              a1, 0b
        mv                a0, a2
        mv                a1, a3
        ret

asm_test::fetch_sub::u64::seqcst_zero:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a2, a4
        mv                a3, a5
        amocas.d.aqrl     a4, a2, (a0)
        xor               a1, a5, a3
        xor               a6, a4, a2
        or                a1, a6, a1
        bnez              a1, 0b
        mv                a0, a2
        mv                a1, a3
        ret

asm_test::fetch_sub::u64::acquire_zero:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a2, a4
        mv                a3, a5
        amocas.d.aq       a4, a2, (a0)
        xor               a1, a5, a3
        xor               a6, a4, a2
        or                a1, a6, a1
        bnez              a1, 0b
        mv                a0, a2
        mv                a1, a3
        ret

asm_test::fetch_sub::u64::relaxed_zero:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a2, a4
        mv                a3, a5
        amocas.d          a4, a2, (a0)
        xor               a1, a5, a3
        xor               a6, a4, a2
        or                a1, a6, a1
        bnez              a1, 0b
        mv                a0, a2
        mv                a1, a3
        ret

asm_test::fetch_sub::u64::release_zero:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a2, a4
        mv                a3, a5
        amocas.d.rl       a4, a2, (a0)
        xor               a1, a5, a3
        xor               a6, a4, a2
        or                a1, a6, a1
        bnez              a1, 0b
        mv                a0, a2
        mv                a1, a3
        ret

asm_test::fetch_sub::u64::acqrel:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a4
        mv                t0, a5
        sltu              a3, a4, a1
        sub               a4, a5, a6
        sub               a2, a7, a1
        sub               a3, a4, a3
        mv                a4, a7
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a7
        mv                a1, t0
        ret

asm_test::fetch_sub::u64::seqcst:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a4
        mv                t0, a5
        sltu              a3, a4, a1
        sub               a4, a5, a6
        sub               a2, a7, a1
        sub               a3, a4, a3
        mv                a4, a7
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a7
        mv                a1, t0
        ret

asm_test::fetch_sub::u64::acquire:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a4
        mv                t0, a5
        sltu              a3, a4, a1
        sub               a4, a5, a6
        sub               a2, a7, a1
        sub               a3, a4, a3
        mv                a4, a7
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a7
        mv                a1, t0
        ret

asm_test::fetch_sub::u64::relaxed:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a4
        mv                t0, a5
        sltu              a3, a4, a1
        sub               a4, a5, a6
        sub               a2, a7, a1
        sub               a3, a4, a3
        mv                a4, a7
        amocas.d          a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a7
        mv                a1, t0
        ret

asm_test::fetch_sub::u64::release:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a4
        mv                t0, a5
        sltu              a3, a4, a1
        sub               a4, a5, a6
        sub               a2, a7, a1
        sub               a3, a4, a3
        mv                a4, a7
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a7
        mv                a1, t0
        ret

asm_test::fetch_xor::u8::acqrel_zero:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_xor::u8::seqcst_zero:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_xor::u8::acquire_zero:
        andi              a1, a0, -0x4
        amoor.w.aq        a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_xor::u8::relaxed_zero:
        andi              a1, a0, -0x4
        amoor.w           a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_xor::u8::release_zero:
        andi              a1, a0, -0x4
        amoor.w.rl        a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_xor::u8::acqrel:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_xor::u8::seqcst:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_xor::u8::acquire:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aq       a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_xor::u8::relaxed:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w          a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_xor::u8::release:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.rl       a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_xor::u16::acqrel_zero:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_xor::u16::seqcst_zero:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_xor::u16::acquire_zero:
        andi              a1, a0, -0x4
        amoor.w.aq        a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_xor::u16::relaxed_zero:
        andi              a1, a0, -0x4
        amoor.w           a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_xor::u16::release_zero:
        andi              a1, a0, -0x4
        amoor.w.rl        a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_xor::u16::acqrel:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_xor::u16::seqcst:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_xor::u16::acquire:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aq       a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_xor::u16::relaxed:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w          a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_xor::u16::release:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.rl       a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_xor::u32::acqrel_zero:
        amoor.w.aqrl      a0, zero, (a0)
        ret

asm_test::fetch_xor::u32::seqcst_zero:
        amoor.w.aqrl      a0, zero, (a0)
        ret

asm_test::fetch_xor::u32::acquire_zero:
        amoor.w.aq        a0, zero, (a0)
        ret

asm_test::fetch_xor::u32::relaxed_zero:
        amoor.w           a0, zero, (a0)
        ret

asm_test::fetch_xor::u32::release_zero:
        amoor.w.rl        a0, zero, (a0)
        ret

asm_test::fetch_xor::u32::acqrel:
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_xor::u32::seqcst:
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_xor::u32::acquire:
        amoxor.w.aq       a0, a1, (a0)
        ret

asm_test::fetch_xor::u32::relaxed:
        amoxor.w          a0, a1, (a0)
        ret

asm_test::fetch_xor::u32::release:
        amoxor.w.rl       a0, a1, (a0)
        ret

asm_test::fetch_xor::u64::acqrel_zero:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a2, a4
        mv                a3, a5
        amocas.d.aqrl     a4, a2, (a0)
        xor               a1, a5, a3
        xor               a6, a4, a2
        or                a1, a6, a1
        bnez              a1, 0b
        mv                a0, a2
        mv                a1, a3
        ret

asm_test::fetch_xor::u64::seqcst_zero:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a2, a4
        mv                a3, a5
        amocas.d.aqrl     a4, a2, (a0)
        xor               a1, a5, a3
        xor               a6, a4, a2
        or                a1, a6, a1
        bnez              a1, 0b
        mv                a0, a2
        mv                a1, a3
        ret

asm_test::fetch_xor::u64::acquire_zero:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a2, a4
        mv                a3, a5
        amocas.d.aq       a4, a2, (a0)
        xor               a1, a5, a3
        xor               a6, a4, a2
        or                a1, a6, a1
        bnez              a1, 0b
        mv                a0, a2
        mv                a1, a3
        ret

asm_test::fetch_xor::u64::relaxed_zero:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a2, a4
        mv                a3, a5
        amocas.d          a4, a2, (a0)
        xor               a1, a5, a3
        xor               a6, a4, a2
        or                a1, a6, a1
        bnez              a1, 0b
        mv                a0, a2
        mv                a1, a3
        ret

asm_test::fetch_xor::u64::release_zero:
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a2, a4
        mv                a3, a5
        amocas.d.rl       a4, a2, (a0)
        xor               a1, a5, a3
        xor               a6, a4, a2
        or                a1, a6, a1
        bnez              a1, 0b
        mv                a0, a2
        mv                a1, a3
        ret

asm_test::fetch_xor::u64::acqrel:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a4
        mv                t0, a5
        xor               a2, a4, a1
        xor               a3, a5, a6
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a7
        mv                a1, t0
        ret

asm_test::fetch_xor::u64::seqcst:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a4
        mv                t0, a5
        xor               a2, a4, a1
        xor               a3, a5, a6
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a7
        mv                a1, t0
        ret

asm_test::fetch_xor::u64::acquire:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a4
        mv                t0, a5
        xor               a2, a4, a1
        xor               a3, a5, a6
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a7
        mv                a1, t0
        ret

asm_test::fetch_xor::u64::relaxed:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a4
        mv                t0, a5
        xor               a2, a4, a1
        xor               a3, a5, a6
        amocas.d          a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a7
        mv                a1, t0
        ret

asm_test::fetch_xor::u64::release:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a4
        mv                t0, a5
        xor               a2, a4, a1
        xor               a3, a5, a6
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, a7
        mv                a1, t0
        ret

asm_test::fetch_xor::bool::acqrel_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_xor::bool::seqcst_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_xor::bool::acqrel_false:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        andi              a0, a0, 0x1
        ret

asm_test::fetch_xor::bool::acquire_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aq       a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_xor::bool::relaxed_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w          a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_xor::bool::release_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.rl       a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_xor::bool::seqcst_false:
        andi              a1, a0, -0x4
        amoor.w.aqrl      a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        andi              a0, a0, 0x1
        ret

asm_test::fetch_xor::bool::acquire_false:
        andi              a1, a0, -0x4
        amoor.w.aq        a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        andi              a0, a0, 0x1
        ret

asm_test::fetch_xor::bool::relaxed_false:
        andi              a1, a0, -0x4
        amoor.w           a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        andi              a0, a0, 0x1
        ret

asm_test::fetch_xor::bool::release_false:
        andi              a1, a0, -0x4
        amoor.w.rl        a1, zero, (a1)
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        andi              a0, a0, 0x1
        ret

asm_test::fetch_xor::bool::acqrel:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_xor::bool::seqcst:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_xor::bool::acquire:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aq       a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_xor::bool::relaxed:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w          a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

asm_test::fetch_xor::bool::release:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.rl       a0, a1, (a0)
        srl               a0, a0, a2
        andi              a0, a0, 0x1
        ret

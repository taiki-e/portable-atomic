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

asm_test::fetch_nand::u16::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
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

asm_test::fetch_nand::u16::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
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

asm_test::fetch_nand::u16::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
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

asm_test::fetch_nand::u16::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
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

asm_test::fetch_nand::u16::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
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

asm_test::fetch_nand::u64::acqrel:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a5
        mv                t0, a4
        and               a3, a5, a6
        and               a2, a4, a1
        not               a2, a2
        not               a3, a3
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a7
        xor               a3, a4, t0
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_nand::u64::seqcst:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a5
        mv                t0, a4
        and               a3, a5, a6
        and               a2, a4, a1
        not               a2, a2
        not               a3, a3
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a7
        xor               a3, a4, t0
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_nand::u64::acquire:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a5
        mv                t0, a4
        and               a3, a5, a6
        and               a2, a4, a1
        not               a2, a2
        not               a3, a3
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a5, a7
        xor               a3, a4, t0
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_nand::u64::relaxed:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a5
        mv                t0, a4
        and               a3, a5, a6
        and               a2, a4, a1
        not               a2, a2
        not               a3, a3
        amocas.d          a4, a2, (a0)
        xor               a2, a5, a7
        xor               a3, a4, t0
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_nand::u64::release:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a5
        mv                t0, a4
        and               a3, a5, a6
        and               a2, a4, a1
        not               a2, a2
        not               a3, a3
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a5, a7
        xor               a3, a4, t0
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_umax::u8::acqrel:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w.aq           a4, (a6)
        and               a2, a4, a3
        mv                a5, a4
        bgeu              a2, a1, 1f
        xor               a5, a4, a1
        and               a5, a5, a3
        xor               a5, a5, a4
1:
        sc.w.rl           a5, a5, (a6)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umax::u8::seqcst:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w.aqrl         a4, (a6)
        and               a2, a4, a3
        mv                a5, a4
        bgeu              a2, a1, 1f
        xor               a5, a4, a1
        and               a5, a5, a3
        xor               a5, a5, a4
1:
        sc.w.rl           a5, a5, (a6)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umax::u8::acquire:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w.aq           a4, (a6)
        and               a2, a4, a3
        mv                a5, a4
        bgeu              a2, a1, 1f
        xor               a5, a4, a1
        and               a5, a5, a3
        xor               a5, a5, a4
1:
        sc.w              a5, a5, (a6)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umax::u8::relaxed:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w              a4, (a6)
        and               a2, a4, a3
        mv                a5, a4
        bgeu              a2, a1, 1f
        xor               a5, a4, a1
        and               a5, a5, a3
        xor               a5, a5, a4
1:
        sc.w              a5, a5, (a6)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umax::u8::release:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w              a4, (a6)
        and               a2, a4, a3
        mv                a5, a4
        bgeu              a2, a1, 1f
        xor               a5, a4, a1
        and               a5, a5, a3
        xor               a5, a5, a4
1:
        sc.w.rl           a5, a5, (a6)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umax::u16::acqrel:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w.aq           a4, (a6)
        and               a2, a4, a3
        mv                a5, a4
        bgeu              a2, a1, 1f
        xor               a5, a4, a1
        and               a5, a5, a3
        xor               a5, a5, a4
1:
        sc.w.rl           a5, a5, (a6)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umax::u16::seqcst:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w.aqrl         a4, (a6)
        and               a2, a4, a3
        mv                a5, a4
        bgeu              a2, a1, 1f
        xor               a5, a4, a1
        and               a5, a5, a3
        xor               a5, a5, a4
1:
        sc.w.rl           a5, a5, (a6)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umax::u16::acquire:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w.aq           a4, (a6)
        and               a2, a4, a3
        mv                a5, a4
        bgeu              a2, a1, 1f
        xor               a5, a4, a1
        and               a5, a5, a3
        xor               a5, a5, a4
1:
        sc.w              a5, a5, (a6)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umax::u16::relaxed:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w              a4, (a6)
        and               a2, a4, a3
        mv                a5, a4
        bgeu              a2, a1, 1f
        xor               a5, a4, a1
        and               a5, a5, a3
        xor               a5, a5, a4
1:
        sc.w              a5, a5, (a6)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umax::u16::release:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w              a4, (a6)
        and               a2, a4, a3
        mv                a5, a4
        bgeu              a2, a1, 1f
        xor               a5, a4, a1
        and               a5, a5, a3
        xor               a5, a5, a4
1:
        sc.w.rl           a5, a5, (a6)
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
        xor               a2, a5, a7
        xor               a3, a4, t0
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
        xor               a2, a5, a7
        xor               a3, a4, t0
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
        xor               a2, a5, a7
        xor               a3, a4, t0
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
        xor               a2, a5, a7
        xor               a3, a4, t0
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
        xor               a2, a5, a7
        xor               a3, a4, t0
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
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w.aq           a4, (a6)
        and               a2, a4, a3
        mv                a5, a4
        bgeu              a1, a2, 1f
        xor               a5, a4, a1
        and               a5, a5, a3
        xor               a5, a5, a4
1:
        sc.w.rl           a5, a5, (a6)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umin::u8::seqcst:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w.aqrl         a4, (a6)
        and               a2, a4, a3
        mv                a5, a4
        bgeu              a1, a2, 1f
        xor               a5, a4, a1
        and               a5, a5, a3
        xor               a5, a5, a4
1:
        sc.w.rl           a5, a5, (a6)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umin::u8::acquire:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w.aq           a4, (a6)
        and               a2, a4, a3
        mv                a5, a4
        bgeu              a1, a2, 1f
        xor               a5, a4, a1
        and               a5, a5, a3
        xor               a5, a5, a4
1:
        sc.w              a5, a5, (a6)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umin::u8::relaxed:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w              a4, (a6)
        and               a2, a4, a3
        mv                a5, a4
        bgeu              a1, a2, 1f
        xor               a5, a4, a1
        and               a5, a5, a3
        xor               a5, a5, a4
1:
        sc.w              a5, a5, (a6)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umin::u8::release:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w              a4, (a6)
        and               a2, a4, a3
        mv                a5, a4
        bgeu              a1, a2, 1f
        xor               a5, a4, a1
        and               a5, a5, a3
        xor               a5, a5, a4
1:
        sc.w.rl           a5, a5, (a6)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umin::u16::acqrel:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w.aq           a4, (a6)
        and               a2, a4, a3
        mv                a5, a4
        bgeu              a1, a2, 1f
        xor               a5, a4, a1
        and               a5, a5, a3
        xor               a5, a5, a4
1:
        sc.w.rl           a5, a5, (a6)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umin::u16::seqcst:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w.aqrl         a4, (a6)
        and               a2, a4, a3
        mv                a5, a4
        bgeu              a1, a2, 1f
        xor               a5, a4, a1
        and               a5, a5, a3
        xor               a5, a5, a4
1:
        sc.w.rl           a5, a5, (a6)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umin::u16::acquire:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w.aq           a4, (a6)
        and               a2, a4, a3
        mv                a5, a4
        bgeu              a1, a2, 1f
        xor               a5, a4, a1
        and               a5, a5, a3
        xor               a5, a5, a4
1:
        sc.w              a5, a5, (a6)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umin::u16::relaxed:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w              a4, (a6)
        and               a2, a4, a3
        mv                a5, a4
        bgeu              a1, a2, 1f
        xor               a5, a4, a1
        and               a5, a5, a3
        xor               a5, a5, a4
1:
        sc.w              a5, a5, (a6)
        bnez              a5, 0b
        srl               a0, a4, a0
        ret

asm_test::fetch_umin::u16::release:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        sll               a1, a1, a0
0:
        lr.w              a4, (a6)
        and               a2, a4, a3
        mv                a5, a4
        bgeu              a1, a2, 1f
        xor               a5, a4, a1
        and               a5, a5, a3
        xor               a5, a5, a4
1:
        sc.w.rl           a5, a5, (a6)
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
        xor               a2, a5, a7
        xor               a3, a4, t0
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
        xor               a2, a5, a7
        xor               a3, a4, t0
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
        xor               a2, a5, a7
        xor               a3, a4, t0
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
        xor               a2, a5, a7
        xor               a3, a4, t0
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
        xor               a2, a5, a7
        xor               a3, a4, t0
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
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a4, 0xff
        sll               a4, a4, a0
        sll               a5, a1, a0
        sll               a1, a2, a0
0:
        lr.w.aqrl         a2, (a6)
        and               a3, a2, a4
        bne               a3, a5, 1f
        xor               a3, a2, a1
        and               a3, a3, a4
        xor               a3, a3, a2
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a2, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange::u8::seqcst_seqcst:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a4, 0xff
        sll               a4, a4, a0
        sll               a5, a1, a0
        sll               a1, a2, a0
0:
        lr.w.aqrl         a2, (a6)
        and               a3, a2, a4
        bne               a3, a5, 1f
        xor               a3, a2, a1
        and               a3, a3, a4
        xor               a3, a3, a2
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a2, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange::u8::acqrel_acquire:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a4, 0xff
        sll               a4, a4, a0
        sll               a5, a1, a0
        sll               a1, a2, a0
0:
        lr.w.aq           a2, (a6)
        and               a3, a2, a4
        bne               a3, a5, 1f
        xor               a3, a2, a1
        and               a3, a3, a4
        xor               a3, a3, a2
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a2, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange::u8::acqrel_relaxed:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a4, 0xff
        sll               a4, a4, a0
        sll               a5, a1, a0
        sll               a1, a2, a0
0:
        lr.w.aq           a2, (a6)
        and               a3, a2, a4
        bne               a3, a5, 1f
        xor               a3, a2, a1
        and               a3, a3, a4
        xor               a3, a3, a2
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a2, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange::u8::acquire_seqcst:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a4, 0xff
        sll               a4, a4, a0
        sll               a5, a1, a0
        sll               a1, a2, a0
0:
        lr.w.aqrl         a2, (a6)
        and               a3, a2, a4
        bne               a3, a5, 1f
        xor               a3, a2, a1
        and               a3, a3, a4
        xor               a3, a3, a2
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a2, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange::u8::relaxed_seqcst:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a4, 0xff
        sll               a4, a4, a0
        sll               a5, a1, a0
        sll               a1, a2, a0
0:
        lr.w.aqrl         a2, (a6)
        and               a3, a2, a4
        bne               a3, a5, 1f
        xor               a3, a2, a1
        and               a3, a3, a4
        xor               a3, a3, a2
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a2, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange::u8::release_seqcst:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a4, 0xff
        sll               a4, a4, a0
        sll               a5, a1, a0
        sll               a1, a2, a0
0:
        lr.w.aqrl         a2, (a6)
        and               a3, a2, a4
        bne               a3, a5, 1f
        xor               a3, a2, a1
        and               a3, a3, a4
        xor               a3, a3, a2
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a2, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange::u8::seqcst_acquire:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a4, 0xff
        sll               a4, a4, a0
        sll               a5, a1, a0
        sll               a1, a2, a0
0:
        lr.w.aqrl         a2, (a6)
        and               a3, a2, a4
        bne               a3, a5, 1f
        xor               a3, a2, a1
        and               a3, a3, a4
        xor               a3, a3, a2
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a2, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange::u8::seqcst_relaxed:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a4, 0xff
        sll               a4, a4, a0
        sll               a5, a1, a0
        sll               a1, a2, a0
0:
        lr.w.aqrl         a2, (a6)
        and               a3, a2, a4
        bne               a3, a5, 1f
        xor               a3, a2, a1
        and               a3, a3, a4
        xor               a3, a3, a2
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a2, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange::u8::acquire_acquire:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a4, 0xff
        sll               a4, a4, a0
        sll               a5, a1, a0
        sll               a1, a2, a0
0:
        lr.w.aq           a2, (a6)
        and               a3, a2, a4
        bne               a3, a5, 1f
        xor               a3, a2, a1
        and               a3, a3, a4
        xor               a3, a3, a2
        sc.w              a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a2, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange::u8::acquire_relaxed:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a4, 0xff
        sll               a4, a4, a0
        sll               a5, a1, a0
        sll               a1, a2, a0
0:
        lr.w.aq           a2, (a6)
        and               a3, a2, a4
        bne               a3, a5, 1f
        xor               a3, a2, a1
        and               a3, a3, a4
        xor               a3, a3, a2
        sc.w              a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a2, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange::u8::relaxed_acquire:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a4, 0xff
        sll               a4, a4, a0
        sll               a5, a1, a0
        sll               a1, a2, a0
0:
        lr.w.aq           a2, (a6)
        and               a3, a2, a4
        bne               a3, a5, 1f
        xor               a3, a2, a1
        and               a3, a3, a4
        xor               a3, a3, a2
        sc.w              a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a2, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange::u8::relaxed_relaxed:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a4, 0xff
        sll               a4, a4, a0
        sll               a5, a1, a0
        sll               a1, a2, a0
0:
        lr.w              a2, (a6)
        and               a3, a2, a4
        bne               a3, a5, 1f
        xor               a3, a2, a1
        and               a3, a3, a4
        xor               a3, a3, a2
        sc.w              a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a2, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange::u8::release_acquire:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a4, 0xff
        sll               a4, a4, a0
        sll               a5, a1, a0
        sll               a1, a2, a0
0:
        lr.w.aq           a2, (a6)
        and               a3, a2, a4
        bne               a3, a5, 1f
        xor               a3, a2, a1
        and               a3, a3, a4
        xor               a3, a3, a2
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a2, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange::u8::release_relaxed:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a4, 0xff
        sll               a4, a4, a0
        sll               a5, a1, a0
        sll               a1, a2, a0
0:
        lr.w              a2, (a6)
        and               a3, a2, a4
        bne               a3, a5, 1f
        xor               a3, a2, a1
        and               a3, a3, a4
        xor               a3, a3, a2
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a2, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange::u16::acqrel_seqcst:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a4, 0x10
        addi              a4, a4, -0x1
        sll               a5, a1, a0
        sll               a1, a2, a0
        sll               a2, a4, a0
0:
        lr.w.aqrl         a4, (a6)
        and               a3, a4, a2
        bne               a3, a5, 1f
        xor               a3, a4, a1
        and               a3, a3, a2
        xor               a3, a3, a4
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a4, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange::u16::seqcst_seqcst:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a4, 0x10
        addi              a4, a4, -0x1
        sll               a5, a1, a0
        sll               a1, a2, a0
        sll               a2, a4, a0
0:
        lr.w.aqrl         a4, (a6)
        and               a3, a4, a2
        bne               a3, a5, 1f
        xor               a3, a4, a1
        and               a3, a3, a2
        xor               a3, a3, a4
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a4, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange::u16::acqrel_acquire:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a4, 0x10
        addi              a4, a4, -0x1
        sll               a5, a1, a0
        sll               a1, a2, a0
        sll               a2, a4, a0
0:
        lr.w.aq           a4, (a6)
        and               a3, a4, a2
        bne               a3, a5, 1f
        xor               a3, a4, a1
        and               a3, a3, a2
        xor               a3, a3, a4
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a4, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange::u16::acqrel_relaxed:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a4, 0x10
        addi              a4, a4, -0x1
        sll               a5, a1, a0
        sll               a1, a2, a0
        sll               a2, a4, a0
0:
        lr.w.aq           a4, (a6)
        and               a3, a4, a2
        bne               a3, a5, 1f
        xor               a3, a4, a1
        and               a3, a3, a2
        xor               a3, a3, a4
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a4, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange::u16::acquire_seqcst:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a4, 0x10
        addi              a4, a4, -0x1
        sll               a5, a1, a0
        sll               a1, a2, a0
        sll               a2, a4, a0
0:
        lr.w.aqrl         a4, (a6)
        and               a3, a4, a2
        bne               a3, a5, 1f
        xor               a3, a4, a1
        and               a3, a3, a2
        xor               a3, a3, a4
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a4, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange::u16::relaxed_seqcst:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a4, 0x10
        addi              a4, a4, -0x1
        sll               a5, a1, a0
        sll               a1, a2, a0
        sll               a2, a4, a0
0:
        lr.w.aqrl         a4, (a6)
        and               a3, a4, a2
        bne               a3, a5, 1f
        xor               a3, a4, a1
        and               a3, a3, a2
        xor               a3, a3, a4
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a4, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange::u16::release_seqcst:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a4, 0x10
        addi              a4, a4, -0x1
        sll               a5, a1, a0
        sll               a1, a2, a0
        sll               a2, a4, a0
0:
        lr.w.aqrl         a4, (a6)
        and               a3, a4, a2
        bne               a3, a5, 1f
        xor               a3, a4, a1
        and               a3, a3, a2
        xor               a3, a3, a4
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a4, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange::u16::seqcst_acquire:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a4, 0x10
        addi              a4, a4, -0x1
        sll               a5, a1, a0
        sll               a1, a2, a0
        sll               a2, a4, a0
0:
        lr.w.aqrl         a4, (a6)
        and               a3, a4, a2
        bne               a3, a5, 1f
        xor               a3, a4, a1
        and               a3, a3, a2
        xor               a3, a3, a4
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a4, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange::u16::seqcst_relaxed:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a4, 0x10
        addi              a4, a4, -0x1
        sll               a5, a1, a0
        sll               a1, a2, a0
        sll               a2, a4, a0
0:
        lr.w.aqrl         a4, (a6)
        and               a3, a4, a2
        bne               a3, a5, 1f
        xor               a3, a4, a1
        and               a3, a3, a2
        xor               a3, a3, a4
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a4, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange::u16::acquire_acquire:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a4, 0x10
        addi              a4, a4, -0x1
        sll               a5, a1, a0
        sll               a1, a2, a0
        sll               a2, a4, a0
0:
        lr.w.aq           a4, (a6)
        and               a3, a4, a2
        bne               a3, a5, 1f
        xor               a3, a4, a1
        and               a3, a3, a2
        xor               a3, a3, a4
        sc.w              a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a4, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange::u16::acquire_relaxed:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a4, 0x10
        addi              a4, a4, -0x1
        sll               a5, a1, a0
        sll               a1, a2, a0
        sll               a2, a4, a0
0:
        lr.w.aq           a4, (a6)
        and               a3, a4, a2
        bne               a3, a5, 1f
        xor               a3, a4, a1
        and               a3, a3, a2
        xor               a3, a3, a4
        sc.w              a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a4, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange::u16::relaxed_acquire:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a4, 0x10
        addi              a4, a4, -0x1
        sll               a5, a1, a0
        sll               a1, a2, a0
        sll               a2, a4, a0
0:
        lr.w.aq           a4, (a6)
        and               a3, a4, a2
        bne               a3, a5, 1f
        xor               a3, a4, a1
        and               a3, a3, a2
        xor               a3, a3, a4
        sc.w              a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a4, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange::u16::relaxed_relaxed:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a4, 0x10
        addi              a4, a4, -0x1
        sll               a5, a1, a0
        sll               a1, a2, a0
        sll               a2, a4, a0
0:
        lr.w              a4, (a6)
        and               a3, a4, a2
        bne               a3, a5, 1f
        xor               a3, a4, a1
        and               a3, a3, a2
        xor               a3, a3, a4
        sc.w              a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a4, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange::u16::release_acquire:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a4, 0x10
        addi              a4, a4, -0x1
        sll               a5, a1, a0
        sll               a1, a2, a0
        sll               a2, a4, a0
0:
        lr.w.aq           a4, (a6)
        and               a3, a4, a2
        bne               a3, a5, 1f
        xor               a3, a4, a1
        and               a3, a3, a2
        xor               a3, a3, a4
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a4, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange::u16::release_relaxed:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a4, 0x10
        addi              a4, a4, -0x1
        sll               a5, a1, a0
        sll               a1, a2, a0
        sll               a2, a4, a0
0:
        lr.w              a4, (a6)
        and               a3, a4, a2
        bne               a3, a5, 1f
        xor               a3, a4, a1
        and               a3, a3, a2
        xor               a3, a3, a4
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a4, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange::u32::acqrel_seqcst:
        fence             rw, rw
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::seqcst_seqcst:
        fence             rw, rw
        mv                a3, a1
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
        fence             rw, rw
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::relaxed_seqcst:
        fence             rw, rw
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::release_seqcst:
        fence             rw, rw
        mv                a3, a1
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
        xor               a1, a5, t0
        xor               a2, a4, t1
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
        xor               a1, a5, t0
        xor               a2, a4, t1
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
        xor               a1, a5, t0
        xor               a2, a4, t1
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
        xor               a1, a5, t0
        xor               a2, a4, t1
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
        xor               a1, a5, t0
        xor               a2, a4, t1
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
        xor               a1, a5, t0
        xor               a2, a4, t1
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
        xor               a1, a5, t0
        xor               a2, a4, t1
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
        xor               a1, a5, t0
        xor               a2, a4, t1
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
        xor               a1, a5, t0
        xor               a2, a4, t1
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
        xor               a1, a5, t0
        xor               a2, a4, t1
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
        xor               a1, a5, t0
        xor               a2, a4, t1
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
        xor               a1, a5, t0
        xor               a2, a4, t1
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
        xor               a1, a5, t0
        xor               a2, a4, t1
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
        xor               a1, a5, t0
        xor               a2, a4, t1
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
        xor               a1, a5, t0
        xor               a2, a4, t1
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::compare_exchange_weak::u8::acqrel_seqcst:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a4, 0xff
        sll               a4, a4, a0
        sll               a5, a1, a0
        sll               a1, a2, a0
0:
        lr.w.aqrl         a2, (a6)
        and               a3, a2, a4
        bne               a3, a5, 1f
        xor               a3, a2, a1
        and               a3, a3, a4
        xor               a3, a3, a2
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a2, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange_weak::u8::seqcst_seqcst:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a4, 0xff
        sll               a4, a4, a0
        sll               a5, a1, a0
        sll               a1, a2, a0
0:
        lr.w.aqrl         a2, (a6)
        and               a3, a2, a4
        bne               a3, a5, 1f
        xor               a3, a2, a1
        and               a3, a3, a4
        xor               a3, a3, a2
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a2, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange_weak::u8::acqrel_acquire:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a4, 0xff
        sll               a4, a4, a0
        sll               a5, a1, a0
        sll               a1, a2, a0
0:
        lr.w.aq           a2, (a6)
        and               a3, a2, a4
        bne               a3, a5, 1f
        xor               a3, a2, a1
        and               a3, a3, a4
        xor               a3, a3, a2
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a2, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange_weak::u8::acqrel_relaxed:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a4, 0xff
        sll               a4, a4, a0
        sll               a5, a1, a0
        sll               a1, a2, a0
0:
        lr.w.aq           a2, (a6)
        and               a3, a2, a4
        bne               a3, a5, 1f
        xor               a3, a2, a1
        and               a3, a3, a4
        xor               a3, a3, a2
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a2, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange_weak::u8::acquire_seqcst:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a4, 0xff
        sll               a4, a4, a0
        sll               a5, a1, a0
        sll               a1, a2, a0
0:
        lr.w.aqrl         a2, (a6)
        and               a3, a2, a4
        bne               a3, a5, 1f
        xor               a3, a2, a1
        and               a3, a3, a4
        xor               a3, a3, a2
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a2, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange_weak::u8::relaxed_seqcst:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a4, 0xff
        sll               a4, a4, a0
        sll               a5, a1, a0
        sll               a1, a2, a0
0:
        lr.w.aqrl         a2, (a6)
        and               a3, a2, a4
        bne               a3, a5, 1f
        xor               a3, a2, a1
        and               a3, a3, a4
        xor               a3, a3, a2
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a2, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange_weak::u8::release_seqcst:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a4, 0xff
        sll               a4, a4, a0
        sll               a5, a1, a0
        sll               a1, a2, a0
0:
        lr.w.aqrl         a2, (a6)
        and               a3, a2, a4
        bne               a3, a5, 1f
        xor               a3, a2, a1
        and               a3, a3, a4
        xor               a3, a3, a2
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a2, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange_weak::u8::seqcst_acquire:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a4, 0xff
        sll               a4, a4, a0
        sll               a5, a1, a0
        sll               a1, a2, a0
0:
        lr.w.aqrl         a2, (a6)
        and               a3, a2, a4
        bne               a3, a5, 1f
        xor               a3, a2, a1
        and               a3, a3, a4
        xor               a3, a3, a2
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a2, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange_weak::u8::seqcst_relaxed:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a4, 0xff
        sll               a4, a4, a0
        sll               a5, a1, a0
        sll               a1, a2, a0
0:
        lr.w.aqrl         a2, (a6)
        and               a3, a2, a4
        bne               a3, a5, 1f
        xor               a3, a2, a1
        and               a3, a3, a4
        xor               a3, a3, a2
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a2, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange_weak::u8::acquire_acquire:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a4, 0xff
        sll               a4, a4, a0
        sll               a5, a1, a0
        sll               a1, a2, a0
0:
        lr.w.aq           a2, (a6)
        and               a3, a2, a4
        bne               a3, a5, 1f
        xor               a3, a2, a1
        and               a3, a3, a4
        xor               a3, a3, a2
        sc.w              a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a2, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange_weak::u8::acquire_relaxed:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a4, 0xff
        sll               a4, a4, a0
        sll               a5, a1, a0
        sll               a1, a2, a0
0:
        lr.w.aq           a2, (a6)
        and               a3, a2, a4
        bne               a3, a5, 1f
        xor               a3, a2, a1
        and               a3, a3, a4
        xor               a3, a3, a2
        sc.w              a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a2, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange_weak::u8::relaxed_acquire:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a4, 0xff
        sll               a4, a4, a0
        sll               a5, a1, a0
        sll               a1, a2, a0
0:
        lr.w.aq           a2, (a6)
        and               a3, a2, a4
        bne               a3, a5, 1f
        xor               a3, a2, a1
        and               a3, a3, a4
        xor               a3, a3, a2
        sc.w              a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a2, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange_weak::u8::relaxed_relaxed:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a4, 0xff
        sll               a4, a4, a0
        sll               a5, a1, a0
        sll               a1, a2, a0
0:
        lr.w              a2, (a6)
        and               a3, a2, a4
        bne               a3, a5, 1f
        xor               a3, a2, a1
        and               a3, a3, a4
        xor               a3, a3, a2
        sc.w              a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a2, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange_weak::u8::release_acquire:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a4, 0xff
        sll               a4, a4, a0
        sll               a5, a1, a0
        sll               a1, a2, a0
0:
        lr.w.aq           a2, (a6)
        and               a3, a2, a4
        bne               a3, a5, 1f
        xor               a3, a2, a1
        and               a3, a3, a4
        xor               a3, a3, a2
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a2, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange_weak::u8::release_relaxed:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a4, 0xff
        sll               a4, a4, a0
        sll               a5, a1, a0
        sll               a1, a2, a0
0:
        lr.w              a2, (a6)
        and               a3, a2, a4
        bne               a3, a5, 1f
        xor               a3, a2, a1
        and               a3, a3, a4
        xor               a3, a3, a2
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a2, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange_weak::u16::acqrel_seqcst:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a4, 0x10
        addi              a4, a4, -0x1
        sll               a5, a1, a0
        sll               a1, a2, a0
        sll               a2, a4, a0
0:
        lr.w.aqrl         a4, (a6)
        and               a3, a4, a2
        bne               a3, a5, 1f
        xor               a3, a4, a1
        and               a3, a3, a2
        xor               a3, a3, a4
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a4, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange_weak::u16::seqcst_seqcst:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a4, 0x10
        addi              a4, a4, -0x1
        sll               a5, a1, a0
        sll               a1, a2, a0
        sll               a2, a4, a0
0:
        lr.w.aqrl         a4, (a6)
        and               a3, a4, a2
        bne               a3, a5, 1f
        xor               a3, a4, a1
        and               a3, a3, a2
        xor               a3, a3, a4
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a4, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange_weak::u16::acqrel_acquire:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a4, 0x10
        addi              a4, a4, -0x1
        sll               a5, a1, a0
        sll               a1, a2, a0
        sll               a2, a4, a0
0:
        lr.w.aq           a4, (a6)
        and               a3, a4, a2
        bne               a3, a5, 1f
        xor               a3, a4, a1
        and               a3, a3, a2
        xor               a3, a3, a4
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a4, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange_weak::u16::acqrel_relaxed:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a4, 0x10
        addi              a4, a4, -0x1
        sll               a5, a1, a0
        sll               a1, a2, a0
        sll               a2, a4, a0
0:
        lr.w.aq           a4, (a6)
        and               a3, a4, a2
        bne               a3, a5, 1f
        xor               a3, a4, a1
        and               a3, a3, a2
        xor               a3, a3, a4
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a4, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange_weak::u16::acquire_seqcst:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a4, 0x10
        addi              a4, a4, -0x1
        sll               a5, a1, a0
        sll               a1, a2, a0
        sll               a2, a4, a0
0:
        lr.w.aqrl         a4, (a6)
        and               a3, a4, a2
        bne               a3, a5, 1f
        xor               a3, a4, a1
        and               a3, a3, a2
        xor               a3, a3, a4
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a4, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange_weak::u16::relaxed_seqcst:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a4, 0x10
        addi              a4, a4, -0x1
        sll               a5, a1, a0
        sll               a1, a2, a0
        sll               a2, a4, a0
0:
        lr.w.aqrl         a4, (a6)
        and               a3, a4, a2
        bne               a3, a5, 1f
        xor               a3, a4, a1
        and               a3, a3, a2
        xor               a3, a3, a4
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a4, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange_weak::u16::release_seqcst:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a4, 0x10
        addi              a4, a4, -0x1
        sll               a5, a1, a0
        sll               a1, a2, a0
        sll               a2, a4, a0
0:
        lr.w.aqrl         a4, (a6)
        and               a3, a4, a2
        bne               a3, a5, 1f
        xor               a3, a4, a1
        and               a3, a3, a2
        xor               a3, a3, a4
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a4, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange_weak::u16::seqcst_acquire:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a4, 0x10
        addi              a4, a4, -0x1
        sll               a5, a1, a0
        sll               a1, a2, a0
        sll               a2, a4, a0
0:
        lr.w.aqrl         a4, (a6)
        and               a3, a4, a2
        bne               a3, a5, 1f
        xor               a3, a4, a1
        and               a3, a3, a2
        xor               a3, a3, a4
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a4, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange_weak::u16::seqcst_relaxed:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a4, 0x10
        addi              a4, a4, -0x1
        sll               a5, a1, a0
        sll               a1, a2, a0
        sll               a2, a4, a0
0:
        lr.w.aqrl         a4, (a6)
        and               a3, a4, a2
        bne               a3, a5, 1f
        xor               a3, a4, a1
        and               a3, a3, a2
        xor               a3, a3, a4
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a4, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange_weak::u16::acquire_acquire:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a4, 0x10
        addi              a4, a4, -0x1
        sll               a5, a1, a0
        sll               a1, a2, a0
        sll               a2, a4, a0
0:
        lr.w.aq           a4, (a6)
        and               a3, a4, a2
        bne               a3, a5, 1f
        xor               a3, a4, a1
        and               a3, a3, a2
        xor               a3, a3, a4
        sc.w              a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a4, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange_weak::u16::acquire_relaxed:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a4, 0x10
        addi              a4, a4, -0x1
        sll               a5, a1, a0
        sll               a1, a2, a0
        sll               a2, a4, a0
0:
        lr.w.aq           a4, (a6)
        and               a3, a4, a2
        bne               a3, a5, 1f
        xor               a3, a4, a1
        and               a3, a3, a2
        xor               a3, a3, a4
        sc.w              a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a4, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange_weak::u16::relaxed_acquire:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a4, 0x10
        addi              a4, a4, -0x1
        sll               a5, a1, a0
        sll               a1, a2, a0
        sll               a2, a4, a0
0:
        lr.w.aq           a4, (a6)
        and               a3, a4, a2
        bne               a3, a5, 1f
        xor               a3, a4, a1
        and               a3, a3, a2
        xor               a3, a3, a4
        sc.w              a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a4, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange_weak::u16::relaxed_relaxed:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a4, 0x10
        addi              a4, a4, -0x1
        sll               a5, a1, a0
        sll               a1, a2, a0
        sll               a2, a4, a0
0:
        lr.w              a4, (a6)
        and               a3, a4, a2
        bne               a3, a5, 1f
        xor               a3, a4, a1
        and               a3, a3, a2
        xor               a3, a3, a4
        sc.w              a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a4, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange_weak::u16::release_acquire:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a4, 0x10
        addi              a4, a4, -0x1
        sll               a5, a1, a0
        sll               a1, a2, a0
        sll               a2, a4, a0
0:
        lr.w.aq           a4, (a6)
        and               a3, a4, a2
        bne               a3, a5, 1f
        xor               a3, a4, a1
        and               a3, a3, a2
        xor               a3, a3, a4
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a4, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange_weak::u16::release_relaxed:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a4, 0x10
        addi              a4, a4, -0x1
        sll               a5, a1, a0
        sll               a1, a2, a0
        sll               a2, a4, a0
0:
        lr.w              a4, (a6)
        and               a3, a4, a2
        bne               a3, a5, 1f
        xor               a3, a4, a1
        and               a3, a3, a2
        xor               a3, a3, a4
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 0b
1:
        srl               a1, a4, a0
        and               a2, a2, a4
        xor               a2, a2, a5
        snez              a0, a2
        ret

asm_test::compare_exchange_weak::u32::acqrel_seqcst:
        fence             rw, rw
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::seqcst_seqcst:
        fence             rw, rw
        mv                a3, a1
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
        fence             rw, rw
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::relaxed_seqcst:
        fence             rw, rw
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::release_seqcst:
        fence             rw, rw
        mv                a3, a1
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
        xor               a1, a5, t0
        xor               a2, a4, t1
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
        xor               a1, a5, t0
        xor               a2, a4, t1
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
        xor               a1, a5, t0
        xor               a2, a4, t1
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
        xor               a1, a5, t0
        xor               a2, a4, t1
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
        xor               a1, a5, t0
        xor               a2, a4, t1
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
        xor               a1, a5, t0
        xor               a2, a4, t1
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
        xor               a1, a5, t0
        xor               a2, a4, t1
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
        xor               a1, a5, t0
        xor               a2, a4, t1
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
        xor               a1, a5, t0
        xor               a2, a4, t1
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
        xor               a1, a5, t0
        xor               a2, a4, t1
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
        xor               a1, a5, t0
        xor               a2, a4, t1
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
        xor               a1, a5, t0
        xor               a2, a4, t1
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
        xor               a1, a5, t0
        xor               a2, a4, t1
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
        xor               a1, a5, t0
        xor               a2, a4, t1
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
        xor               a1, a5, t0
        xor               a2, a4, t1
        or                a1, a1, a2
        snez              a1, a1
        sw                a1, 0x0(a0)
        sw                zero, 0x4(a0)
        sw                a4, 0x8(a0)
        sw                a5, 0xc(a0)
        ret

asm_test::or::u8::acqrel:
        andi              a2, a0, -0x4
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoor.w.aqrl      zero, a0, (a2)
        ret

asm_test::or::u8::seqcst:
        andi              a2, a0, -0x4
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoor.w.aqrl      zero, a0, (a2)
        ret

asm_test::or::u8::acquire:
        andi              a2, a0, -0x4
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoor.w.aq        zero, a0, (a2)
        ret

asm_test::or::u8::relaxed:
        andi              a2, a0, -0x4
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoor.w           zero, a0, (a2)
        ret

asm_test::or::u8::release:
        andi              a2, a0, -0x4
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoor.w.rl        zero, a0, (a2)
        ret

asm_test::or::u16::acqrel:
        andi              a2, a0, -0x4
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoor.w.aqrl      zero, a0, (a2)
        ret

asm_test::or::u16::seqcst:
        andi              a2, a0, -0x4
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoor.w.aqrl      zero, a0, (a2)
        ret

asm_test::or::u16::acquire:
        andi              a2, a0, -0x4
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoor.w.aq        zero, a0, (a2)
        ret

asm_test::or::u16::relaxed:
        andi              a2, a0, -0x4
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoor.w           zero, a0, (a2)
        ret

asm_test::or::u16::release:
        andi              a2, a0, -0x4
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoor.w.rl        zero, a0, (a2)
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

asm_test::add::u16::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
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

asm_test::add::u16::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
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

asm_test::add::u16::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
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

asm_test::add::u16::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
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

asm_test::add::u16::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
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

asm_test::add::u64::acqrel:
        mv                a6, a2
        lw                a7, 0x0(a0)
        lw                t0, 0x4(a0)
0:
        mv                a5, t0
        mv                a4, a7
        add               a2, a7, a1
        add               t1, t0, a6
        sltu              a3, a2, a7
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
        add               t1, t0, a6
        sltu              a3, a2, a7
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
        add               t1, t0, a6
        sltu              a3, a2, a7
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
        add               t1, t0, a6
        sltu              a3, a2, a7
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
        add               t1, t0, a6
        sltu              a3, a2, a7
        add               a3, a3, t1
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        mv                a7, a4
        mv                t0, a5
        bnez              a2, 0b
        ret

asm_test::and::u8::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        not               a3, a3
        sll               a0, a1, a0
        or                a0, a0, a3
        amoand.w.aqrl     zero, a0, (a2)
        ret

asm_test::and::u8::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        not               a3, a3
        sll               a0, a1, a0
        or                a0, a0, a3
        amoand.w.aqrl     zero, a0, (a2)
        ret

asm_test::and::u8::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        not               a3, a3
        sll               a0, a1, a0
        or                a0, a0, a3
        amoand.w.aq       zero, a0, (a2)
        ret

asm_test::and::u8::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        not               a3, a3
        sll               a0, a1, a0
        or                a0, a0, a3
        amoand.w          zero, a0, (a2)
        ret

asm_test::and::u8::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        not               a3, a3
        sll               a0, a1, a0
        or                a0, a0, a3
        amoand.w.rl       zero, a0, (a2)
        ret

asm_test::and::u16::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        not               a3, a3
        sll               a0, a1, a0
        or                a0, a0, a3
        amoand.w.aqrl     zero, a0, (a2)
        ret

asm_test::and::u16::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        not               a3, a3
        sll               a0, a1, a0
        or                a0, a0, a3
        amoand.w.aqrl     zero, a0, (a2)
        ret

asm_test::and::u16::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        not               a3, a3
        sll               a0, a1, a0
        or                a0, a0, a3
        amoand.w.aq       zero, a0, (a2)
        ret

asm_test::and::u16::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        not               a3, a3
        sll               a0, a1, a0
        or                a0, a0, a3
        amoand.w          zero, a0, (a2)
        ret

asm_test::and::u16::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        not               a3, a3
        sll               a0, a1, a0
        or                a0, a0, a3
        amoand.w.rl       zero, a0, (a2)
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

asm_test::neg::u8::acqrel:
        lb                a3, 0x0(a0)
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a2, 0xff
        sll               a2, a2, a0
0:
        neg               a4, a3
        zext.b            a3, a3
        sll               a5, a3, a0
        zext.b            a3, a4
        sll               a3, a3, a0
1:
        lr.w.aq           a4, (a6)
        and               a1, a4, a2
        bne               a1, a5, 2f
        xor               a1, a4, a3
        and               a1, a1, a2
        xor               a1, a1, a4
        sc.w.rl           a1, a1, (a6)
        bnez              a1, 1b
2:
        and               a1, a4, a2
        srl               a3, a4, a0
        bne               a5, a1, 0b
        ret

asm_test::neg::u8::seqcst:
        lb                a3, 0x0(a0)
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a2, 0xff
        sll               a2, a2, a0
0:
        neg               a4, a3
        zext.b            a3, a3
        sll               a5, a3, a0
        zext.b            a3, a4
        sll               a3, a3, a0
1:
        lr.w.aqrl         a4, (a6)
        and               a1, a4, a2
        bne               a1, a5, 2f
        xor               a1, a4, a3
        and               a1, a1, a2
        xor               a1, a1, a4
        sc.w.rl           a1, a1, (a6)
        bnez              a1, 1b
2:
        and               a1, a4, a2
        srl               a3, a4, a0
        bne               a5, a1, 0b
        ret

asm_test::neg::u8::acquire:
        lb                a3, 0x0(a0)
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a2, 0xff
        sll               a2, a2, a0
0:
        neg               a4, a3
        zext.b            a3, a3
        sll               a5, a3, a0
        zext.b            a3, a4
        sll               a3, a3, a0
1:
        lr.w.aq           a4, (a6)
        and               a1, a4, a2
        bne               a1, a5, 2f
        xor               a1, a4, a3
        and               a1, a1, a2
        xor               a1, a1, a4
        sc.w              a1, a1, (a6)
        bnez              a1, 1b
2:
        and               a1, a4, a2
        srl               a3, a4, a0
        bne               a5, a1, 0b
        ret

asm_test::neg::u8::relaxed:
        lb                a3, 0x0(a0)
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a2, 0xff
        sll               a2, a2, a0
0:
        neg               a4, a3
        zext.b            a3, a3
        sll               a5, a3, a0
        zext.b            a3, a4
        sll               a3, a3, a0
1:
        lr.w              a4, (a6)
        and               a1, a4, a2
        bne               a1, a5, 2f
        xor               a1, a4, a3
        and               a1, a1, a2
        xor               a1, a1, a4
        sc.w              a1, a1, (a6)
        bnez              a1, 1b
2:
        and               a1, a4, a2
        srl               a3, a4, a0
        bne               a5, a1, 0b
        ret

asm_test::neg::u8::release:
        lb                a3, 0x0(a0)
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a2, 0xff
        sll               a2, a2, a0
0:
        neg               a4, a3
        zext.b            a3, a3
        sll               a5, a3, a0
        zext.b            a3, a4
        sll               a3, a3, a0
1:
        lr.w              a4, (a6)
        and               a1, a4, a2
        bne               a1, a5, 2f
        xor               a1, a4, a3
        and               a1, a1, a2
        xor               a1, a1, a4
        sc.w.rl           a1, a1, (a6)
        bnez              a1, 1b
2:
        and               a1, a4, a2
        srl               a3, a4, a0
        bne               a5, a1, 0b
        ret

asm_test::neg::u16::acqrel:
        lh                a4, 0x0(a0)
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a2, 0x10
        addi              a7, a2, -0x1
        sll               a3, a7, a0
0:
        neg               a5, a4
        and               a4, a4, a7
        sll               a1, a4, a0
        and               a5, a5, a7
        sll               a4, a5, a0
1:
        lr.w.aq           a5, (a6)
        and               a2, a5, a3
        bne               a2, a1, 2f
        xor               a2, a5, a4
        and               a2, a2, a3
        xor               a2, a2, a5
        sc.w.rl           a2, a2, (a6)
        bnez              a2, 1b
2:
        and               a2, a5, a3
        srl               a4, a5, a0
        bne               a1, a2, 0b
        ret

asm_test::neg::u16::seqcst:
        lh                a4, 0x0(a0)
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a2, 0x10
        addi              a7, a2, -0x1
        sll               a3, a7, a0
0:
        neg               a5, a4
        and               a4, a4, a7
        sll               a1, a4, a0
        and               a5, a5, a7
        sll               a4, a5, a0
1:
        lr.w.aqrl         a5, (a6)
        and               a2, a5, a3
        bne               a2, a1, 2f
        xor               a2, a5, a4
        and               a2, a2, a3
        xor               a2, a2, a5
        sc.w.rl           a2, a2, (a6)
        bnez              a2, 1b
2:
        and               a2, a5, a3
        srl               a4, a5, a0
        bne               a1, a2, 0b
        ret

asm_test::neg::u16::acquire:
        lh                a4, 0x0(a0)
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a2, 0x10
        addi              a7, a2, -0x1
        sll               a3, a7, a0
0:
        neg               a5, a4
        and               a4, a4, a7
        sll               a1, a4, a0
        and               a5, a5, a7
        sll               a4, a5, a0
1:
        lr.w.aq           a5, (a6)
        and               a2, a5, a3
        bne               a2, a1, 2f
        xor               a2, a5, a4
        and               a2, a2, a3
        xor               a2, a2, a5
        sc.w              a2, a2, (a6)
        bnez              a2, 1b
2:
        and               a2, a5, a3
        srl               a4, a5, a0
        bne               a1, a2, 0b
        ret

asm_test::neg::u16::relaxed:
        lh                a4, 0x0(a0)
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a2, 0x10
        addi              a7, a2, -0x1
        sll               a3, a7, a0
0:
        neg               a5, a4
        and               a4, a4, a7
        sll               a1, a4, a0
        and               a5, a5, a7
        sll               a4, a5, a0
1:
        lr.w              a5, (a6)
        and               a2, a5, a3
        bne               a2, a1, 2f
        xor               a2, a5, a4
        and               a2, a2, a3
        xor               a2, a2, a5
        sc.w              a2, a2, (a6)
        bnez              a2, 1b
2:
        and               a2, a5, a3
        srl               a4, a5, a0
        bne               a1, a2, 0b
        ret

asm_test::neg::u16::release:
        lh                a4, 0x0(a0)
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a2, 0x10
        addi              a7, a2, -0x1
        sll               a3, a7, a0
0:
        neg               a5, a4
        and               a4, a4, a7
        sll               a1, a4, a0
        and               a5, a5, a7
        sll               a4, a5, a0
1:
        lr.w              a5, (a6)
        and               a2, a5, a3
        bne               a2, a1, 2f
        xor               a2, a5, a4
        and               a2, a2, a3
        xor               a2, a2, a5
        sc.w.rl           a2, a2, (a6)
        bnez              a2, 1b
2:
        and               a2, a5, a3
        srl               a4, a5, a0
        bne               a1, a2, 0b
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
        snez              a2, a1
        neg               a3, a6
        sub               a3, a3, a2
        neg               a2, a1
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
        snez              a2, a1
        neg               a3, a6
        sub               a3, a3, a2
        neg               a2, a1
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
        snez              a2, a1
        neg               a3, a6
        sub               a3, a3, a2
        neg               a2, a1
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
        snez              a2, a1
        neg               a3, a6
        sub               a3, a3, a2
        neg               a2, a1
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
        snez              a2, a1
        neg               a3, a6
        sub               a3, a3, a2
        neg               a2, a1
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a5, a6
        xor               a1, a1, a4
        or                a2, a2, a1
        mv                a1, a4
        mv                a6, a5
        bnez              a2, 0b
        ret

asm_test::not::u8::acqrel:
        andi              a1, a0, -0x4
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        li                a2, 0xff
        sll               a0, a2, a0
        amoxor.w.aqrl     zero, a0, (a1)
        ret

asm_test::not::u8::seqcst:
        andi              a1, a0, -0x4
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        li                a2, 0xff
        sll               a0, a2, a0
        amoxor.w.aqrl     zero, a0, (a1)
        ret

asm_test::not::u8::acquire:
        andi              a1, a0, -0x4
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        li                a2, 0xff
        sll               a0, a2, a0
        amoxor.w.aq       zero, a0, (a1)
        ret

asm_test::not::u8::relaxed:
        andi              a1, a0, -0x4
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        li                a2, 0xff
        sll               a0, a2, a0
        amoxor.w          zero, a0, (a1)
        ret

asm_test::not::u8::release:
        andi              a1, a0, -0x4
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        li                a2, 0xff
        sll               a0, a2, a0
        amoxor.w.rl       zero, a0, (a1)
        ret

asm_test::not::u16::acqrel:
        andi              a1, a0, -0x4
        andi              a0, a0, 0x3
        lui               a2, 0x10
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a0, a2, a0
        amoxor.w.aqrl     zero, a0, (a1)
        ret

asm_test::not::u16::seqcst:
        andi              a1, a0, -0x4
        andi              a0, a0, 0x3
        lui               a2, 0x10
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a0, a2, a0
        amoxor.w.aqrl     zero, a0, (a1)
        ret

asm_test::not::u16::acquire:
        andi              a1, a0, -0x4
        andi              a0, a0, 0x3
        lui               a2, 0x10
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a0, a2, a0
        amoxor.w.aq       zero, a0, (a1)
        ret

asm_test::not::u16::relaxed:
        andi              a1, a0, -0x4
        andi              a0, a0, 0x3
        lui               a2, 0x10
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a0, a2, a0
        amoxor.w          zero, a0, (a1)
        ret

asm_test::not::u16::release:
        andi              a1, a0, -0x4
        andi              a0, a0, 0x3
        lui               a2, 0x10
        slli              a0, a0, 0x3
        addi              a2, a2, -0x1
        sll               a0, a2, a0
        amoxor.w.rl       zero, a0, (a1)
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
        lw                a6, 0x0(a0)
        lw                a1, 0x4(a0)
0:
        mv                a5, a1
        mv                a4, a6
        not               a2, a6
        not               a3, a1
        amocas.d.aqrl     a4, a2, (a0)
        xor               a1, a1, a5
        xor               a2, a4, a6
        or                a2, a2, a1
        mv                a6, a4
        mv                a1, a5
        bnez              a2, 0b
        ret

asm_test::not::u64::seqcst:
        lw                a6, 0x0(a0)
        lw                a1, 0x4(a0)
0:
        mv                a5, a1
        mv                a4, a6
        not               a2, a6
        not               a3, a1
        amocas.d.aqrl     a4, a2, (a0)
        xor               a1, a1, a5
        xor               a2, a4, a6
        or                a2, a2, a1
        mv                a6, a4
        mv                a1, a5
        bnez              a2, 0b
        ret

asm_test::not::u64::acquire:
        lw                a6, 0x0(a0)
        lw                a1, 0x4(a0)
0:
        mv                a5, a1
        mv                a4, a6
        not               a2, a6
        not               a3, a1
        amocas.d.aq       a4, a2, (a0)
        xor               a1, a1, a5
        xor               a2, a4, a6
        or                a2, a2, a1
        mv                a6, a4
        mv                a1, a5
        bnez              a2, 0b
        ret

asm_test::not::u64::relaxed:
        lw                a6, 0x0(a0)
        lw                a1, 0x4(a0)
0:
        mv                a5, a1
        mv                a4, a6
        not               a2, a6
        not               a3, a1
        amocas.d          a4, a2, (a0)
        xor               a1, a1, a5
        xor               a2, a4, a6
        or                a2, a2, a1
        mv                a6, a4
        mv                a1, a5
        bnez              a2, 0b
        ret

asm_test::not::u64::release:
        lw                a6, 0x0(a0)
        lw                a1, 0x4(a0)
0:
        mv                a5, a1
        mv                a4, a6
        not               a2, a6
        not               a3, a1
        amocas.d.rl       a4, a2, (a0)
        xor               a1, a1, a5
        xor               a2, a4, a6
        or                a2, a2, a1
        mv                a6, a4
        mv                a1, a5
        bnez              a2, 0b
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

asm_test::sub::u16::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
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

asm_test::sub::u16::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
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

asm_test::sub::u16::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
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

asm_test::sub::u16::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
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

asm_test::sub::u16::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
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

asm_test::sub::u64::acqrel:
        mv                a6, a2
        lw                a7, 0x0(a0)
        lw                t0, 0x4(a0)
0:
        mv                a5, t0
        mv                a4, a7
        sltu              a2, a7, a1
        sub               a3, t0, a6
        sub               a3, a3, a2
        sub               a2, a7, a1
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
        sltu              a2, a7, a1
        sub               a3, t0, a6
        sub               a3, a3, a2
        sub               a2, a7, a1
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
        sltu              a2, a7, a1
        sub               a3, t0, a6
        sub               a3, a3, a2
        sub               a2, a7, a1
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
        sltu              a2, a7, a1
        sub               a3, t0, a6
        sub               a3, a3, a2
        sub               a2, a7, a1
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
        sltu              a2, a7, a1
        sub               a3, t0, a6
        sub               a3, a3, a2
        sub               a2, a7, a1
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a5, t0
        xor               a3, a4, a7
        or                a2, a2, a3
        mv                a7, a4
        mv                t0, a5
        bnez              a2, 0b
        ret

asm_test::xor::u8::acqrel:
        andi              a2, a0, -0x4
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoxor.w.aqrl     zero, a0, (a2)
        ret

asm_test::xor::u8::seqcst:
        andi              a2, a0, -0x4
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoxor.w.aqrl     zero, a0, (a2)
        ret

asm_test::xor::u8::acquire:
        andi              a2, a0, -0x4
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoxor.w.aq       zero, a0, (a2)
        ret

asm_test::xor::u8::relaxed:
        andi              a2, a0, -0x4
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoxor.w          zero, a0, (a2)
        ret

asm_test::xor::u8::release:
        andi              a2, a0, -0x4
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoxor.w.rl       zero, a0, (a2)
        ret

asm_test::xor::u16::acqrel:
        andi              a2, a0, -0x4
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoxor.w.aqrl     zero, a0, (a2)
        ret

asm_test::xor::u16::seqcst:
        andi              a2, a0, -0x4
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoxor.w.aqrl     zero, a0, (a2)
        ret

asm_test::xor::u16::acquire:
        andi              a2, a0, -0x4
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoxor.w.aq       zero, a0, (a2)
        ret

asm_test::xor::u16::relaxed:
        andi              a2, a0, -0x4
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoxor.w          zero, a0, (a2)
        ret

asm_test::xor::u16::release:
        andi              a2, a0, -0x4
        andi              a0, a0, 0x3
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoxor.w.rl       zero, a0, (a2)
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

asm_test::swap::u16::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
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

asm_test::swap::u16::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
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

asm_test::swap::u16::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
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

asm_test::swap::u16::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
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

asm_test::swap::u16::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
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
        mv                a6, a5
        mv                t0, a4
        amocas.d.aqrl     a4, a2, (a0)
        xor               a7, a5, a6
        xor               a1, a4, t0
        or                a1, a1, a7
        bnez              a1, 0b
        mv                a0, t0
        mv                a1, a6
        ret

asm_test::swap::u64::seqcst:
        mv                a3, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        mv                a2, a1
0:
        mv                a6, a5
        mv                t0, a4
        amocas.d.aqrl     a4, a2, (a0)
        xor               a7, a5, a6
        xor               a1, a4, t0
        or                a1, a1, a7
        bnez              a1, 0b
        mv                a0, t0
        mv                a1, a6
        ret

asm_test::swap::u64::acquire:
        mv                a3, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        mv                a2, a1
0:
        mv                a6, a5
        mv                t0, a4
        amocas.d.aq       a4, a2, (a0)
        xor               a7, a5, a6
        xor               a1, a4, t0
        or                a1, a1, a7
        bnez              a1, 0b
        mv                a0, t0
        mv                a1, a6
        ret

asm_test::swap::u64::relaxed:
        mv                a3, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        mv                a2, a1
0:
        mv                a6, a5
        mv                t0, a4
        amocas.d          a4, a2, (a0)
        xor               a7, a5, a6
        xor               a1, a4, t0
        or                a1, a1, a7
        bnez              a1, 0b
        mv                a0, t0
        mv                a1, a6
        ret

asm_test::swap::u64::release:
        mv                a3, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
        mv                a2, a1
0:
        mv                a6, a5
        mv                t0, a4
        amocas.d.rl       a4, a2, (a0)
        xor               a7, a5, a6
        xor               a1, a4, t0
        or                a1, a1, a7
        bnez              a1, 0b
        mv                a0, t0
        mv                a1, a6
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
        lw                a6, 0x0(a0)
        lw                a7, 0x4(a0)
        mv                a2, a1
0:
        mv                a5, a7
        mv                a4, a6
        amocas.d.aqrl     a4, a2, (a0)
        xor               a7, a5, a7
        xor               a1, a4, a6
        or                a1, a1, a7
        mv                a6, a4
        mv                a7, a5
        bnez              a1, 0b
        ret

asm_test::store::u64::relaxed:
        mv                a3, a2
        lw                a6, 0x0(a0)
        lw                a7, 0x4(a0)
        mv                a2, a1
0:
        mv                a5, a7
        mv                a4, a6
        amocas.d          a4, a2, (a0)
        xor               a7, a5, a7
        xor               a1, a4, a6
        or                a1, a1, a7
        mv                a6, a4
        mv                a7, a5
        bnez              a1, 0b
        ret

asm_test::store::u64::release:
        mv                a3, a2
        lw                a6, 0x0(a0)
        lw                a7, 0x4(a0)
        mv                a2, a1
0:
        mv                a5, a7
        mv                a4, a6
        amocas.d.rl       a4, a2, (a0)
        xor               a7, a5, a7
        xor               a1, a4, a6
        or                a1, a1, a7
        mv                a6, a4
        mv                a7, a5
        bnez              a1, 0b
        ret

asm_test::fetch_or::u8::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoor.w.aqrl      a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_or::u8::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoor.w.aqrl      a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_or::u8::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoor.w.aq        a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_or::u8::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoor.w           a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_or::u8::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoor.w.rl        a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_or::u16::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoor.w.aqrl      a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_or::u16::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoor.w.aqrl      a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_or::u16::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoor.w.aq        a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_or::u16::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoor.w           a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_or::u16::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoor.w.rl        a1, a1, (a2)
        srl               a0, a1, a0
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

asm_test::fetch_or::u64::acqrel:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a5
        mv                t0, a4
        or                a2, a4, a1
        or                a3, a5, a6
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a7
        xor               a3, a4, t0
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_or::u64::seqcst:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a5
        mv                t0, a4
        or                a2, a4, a1
        or                a3, a5, a6
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a7
        xor               a3, a4, t0
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_or::u64::acquire:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a5
        mv                t0, a4
        or                a2, a4, a1
        or                a3, a5, a6
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a5, a7
        xor               a3, a4, t0
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_or::u64::relaxed:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a5
        mv                t0, a4
        or                a2, a4, a1
        or                a3, a5, a6
        amocas.d          a4, a2, (a0)
        xor               a2, a5, a7
        xor               a3, a4, t0
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_or::u64::release:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a5
        mv                t0, a4
        or                a2, a4, a1
        or                a3, a5, a6
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a5, a7
        xor               a3, a4, t0
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, t0
        mv                a1, a7
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

asm_test::fetch_add::u16::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
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

asm_test::fetch_add::u16::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
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

asm_test::fetch_add::u16::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
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

asm_test::fetch_add::u16::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
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

asm_test::fetch_add::u16::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
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

asm_test::fetch_add::u64::acqrel:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a5
        mv                t0, a4
        add               a2, a4, a1
        add               a3, a5, a6
        sltu              a4, a2, a4
        add               a3, a3, a4
        mv                a4, t0
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a7
        xor               a3, a4, t0
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_add::u64::seqcst:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a5
        mv                t0, a4
        add               a2, a4, a1
        add               a3, a5, a6
        sltu              a4, a2, a4
        add               a3, a3, a4
        mv                a4, t0
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a7
        xor               a3, a4, t0
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_add::u64::acquire:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a5
        mv                t0, a4
        add               a2, a4, a1
        add               a3, a5, a6
        sltu              a4, a2, a4
        add               a3, a3, a4
        mv                a4, t0
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a5, a7
        xor               a3, a4, t0
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_add::u64::relaxed:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a5
        mv                t0, a4
        add               a2, a4, a1
        add               a3, a5, a6
        sltu              a4, a2, a4
        add               a3, a3, a4
        mv                a4, t0
        amocas.d          a4, a2, (a0)
        xor               a2, a5, a7
        xor               a3, a4, t0
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_add::u64::release:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a5
        mv                t0, a4
        add               a2, a4, a1
        add               a3, a5, a6
        sltu              a4, a2, a4
        add               a3, a3, a4
        mv                a4, t0
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a5, a7
        xor               a3, a4, t0
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_and::u8::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        not               a3, a3
        sll               a1, a1, a0
        or                a1, a1, a3
        amoand.w.aqrl     a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_and::u8::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        not               a3, a3
        sll               a1, a1, a0
        or                a1, a1, a3
        amoand.w.aqrl     a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_and::u8::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        not               a3, a3
        sll               a1, a1, a0
        or                a1, a1, a3
        amoand.w.aq       a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_and::u8::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        not               a3, a3
        sll               a1, a1, a0
        or                a1, a1, a3
        amoand.w          a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_and::u8::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        not               a3, a3
        sll               a1, a1, a0
        or                a1, a1, a3
        amoand.w.rl       a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_and::u16::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        not               a3, a3
        sll               a1, a1, a0
        or                a1, a1, a3
        amoand.w.aqrl     a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_and::u16::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        not               a3, a3
        sll               a1, a1, a0
        or                a1, a1, a3
        amoand.w.aqrl     a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_and::u16::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        not               a3, a3
        sll               a1, a1, a0
        or                a1, a1, a3
        amoand.w.aq       a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_and::u16::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        not               a3, a3
        sll               a1, a1, a0
        or                a1, a1, a3
        amoand.w          a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_and::u16::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        not               a3, a3
        sll               a1, a1, a0
        or                a1, a1, a3
        amoand.w.rl       a1, a1, (a2)
        srl               a0, a1, a0
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

asm_test::fetch_and::u64::acqrel:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a5
        mv                t0, a4
        and               a2, a4, a1
        and               a3, a5, a6
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a7
        xor               a3, a4, t0
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_and::u64::seqcst:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a5
        mv                t0, a4
        and               a2, a4, a1
        and               a3, a5, a6
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a7
        xor               a3, a4, t0
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_and::u64::acquire:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a5
        mv                t0, a4
        and               a2, a4, a1
        and               a3, a5, a6
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a5, a7
        xor               a3, a4, t0
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_and::u64::relaxed:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a5
        mv                t0, a4
        and               a2, a4, a1
        and               a3, a5, a6
        amocas.d          a4, a2, (a0)
        xor               a2, a5, a7
        xor               a3, a4, t0
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_and::u64::release:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a5
        mv                t0, a4
        and               a2, a4, a1
        and               a3, a5, a6
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a5, a7
        xor               a3, a4, t0
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_max::i8::acqrel:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        andi              a4, a0, 0x18
        sll               a7, a3, a0
        sll               a1, a1, a0
        xori              a4, a4, 0x18
0:
        lr.w.aq           a5, (a6)
        and               a3, a5, a7
        mv                a2, a5
        sll               a3, a3, a4
        sra               a3, a3, a4
        bge               a3, a1, 1f
        xor               a2, a5, a1
        and               a2, a2, a7
        xor               a2, a2, a5
1:
        sc.w.rl           a2, a2, (a6)
        bnez              a2, 0b
        srl               a0, a5, a0
        ret

asm_test::fetch_max::i8::seqcst:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        andi              a4, a0, 0x18
        sll               a7, a3, a0
        sll               a1, a1, a0
        xori              a4, a4, 0x18
0:
        lr.w.aqrl         a5, (a6)
        and               a3, a5, a7
        mv                a2, a5
        sll               a3, a3, a4
        sra               a3, a3, a4
        bge               a3, a1, 1f
        xor               a2, a5, a1
        and               a2, a2, a7
        xor               a2, a2, a5
1:
        sc.w.rl           a2, a2, (a6)
        bnez              a2, 0b
        srl               a0, a5, a0
        ret

asm_test::fetch_max::i8::acquire:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        andi              a4, a0, 0x18
        sll               a7, a3, a0
        sll               a1, a1, a0
        xori              a4, a4, 0x18
0:
        lr.w.aq           a5, (a6)
        and               a3, a5, a7
        mv                a2, a5
        sll               a3, a3, a4
        sra               a3, a3, a4
        bge               a3, a1, 1f
        xor               a2, a5, a1
        and               a2, a2, a7
        xor               a2, a2, a5
1:
        sc.w              a2, a2, (a6)
        bnez              a2, 0b
        srl               a0, a5, a0
        ret

asm_test::fetch_max::i8::relaxed:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        andi              a4, a0, 0x18
        sll               a7, a3, a0
        sll               a1, a1, a0
        xori              a4, a4, 0x18
0:
        lr.w              a5, (a6)
        and               a3, a5, a7
        mv                a2, a5
        sll               a3, a3, a4
        sra               a3, a3, a4
        bge               a3, a1, 1f
        xor               a2, a5, a1
        and               a2, a2, a7
        xor               a2, a2, a5
1:
        sc.w              a2, a2, (a6)
        bnez              a2, 0b
        srl               a0, a5, a0
        ret

asm_test::fetch_max::i8::release:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        andi              a4, a0, 0x18
        sll               a7, a3, a0
        sll               a1, a1, a0
        xori              a4, a4, 0x18
0:
        lr.w              a5, (a6)
        and               a3, a5, a7
        mv                a2, a5
        sll               a3, a3, a4
        sra               a3, a3, a4
        bge               a3, a1, 1f
        xor               a2, a5, a1
        and               a2, a2, a7
        xor               a2, a2, a5
1:
        sc.w.rl           a2, a2, (a6)
        bnez              a2, 0b
        srl               a0, a5, a0
        ret

asm_test::fetch_max::i16::acqrel:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        li                a4, 0x10
        andi              a5, a0, 0x18
        addi              a3, a3, -0x1
        sll               a7, a1, a0
        sll               a3, a3, a0
        sub               a4, a4, a5
0:
        lr.w.aq           a5, (a6)
        and               a1, a5, a3
        mv                a2, a5
        sll               a1, a1, a4
        sra               a1, a1, a4
        bge               a1, a7, 1f
        xor               a2, a5, a7
        and               a2, a2, a3
        xor               a2, a2, a5
1:
        sc.w.rl           a2, a2, (a6)
        bnez              a2, 0b
        srl               a0, a5, a0
        ret

asm_test::fetch_max::i16::seqcst:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        li                a4, 0x10
        andi              a5, a0, 0x18
        addi              a3, a3, -0x1
        sll               a7, a1, a0
        sll               a3, a3, a0
        sub               a4, a4, a5
0:
        lr.w.aqrl         a5, (a6)
        and               a1, a5, a3
        mv                a2, a5
        sll               a1, a1, a4
        sra               a1, a1, a4
        bge               a1, a7, 1f
        xor               a2, a5, a7
        and               a2, a2, a3
        xor               a2, a2, a5
1:
        sc.w.rl           a2, a2, (a6)
        bnez              a2, 0b
        srl               a0, a5, a0
        ret

asm_test::fetch_max::i16::acquire:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        li                a4, 0x10
        andi              a5, a0, 0x18
        addi              a3, a3, -0x1
        sll               a7, a1, a0
        sll               a3, a3, a0
        sub               a4, a4, a5
0:
        lr.w.aq           a5, (a6)
        and               a1, a5, a3
        mv                a2, a5
        sll               a1, a1, a4
        sra               a1, a1, a4
        bge               a1, a7, 1f
        xor               a2, a5, a7
        and               a2, a2, a3
        xor               a2, a2, a5
1:
        sc.w              a2, a2, (a6)
        bnez              a2, 0b
        srl               a0, a5, a0
        ret

asm_test::fetch_max::i16::relaxed:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        li                a4, 0x10
        andi              a5, a0, 0x18
        addi              a3, a3, -0x1
        sll               a7, a1, a0
        sll               a3, a3, a0
        sub               a4, a4, a5
0:
        lr.w              a5, (a6)
        and               a1, a5, a3
        mv                a2, a5
        sll               a1, a1, a4
        sra               a1, a1, a4
        bge               a1, a7, 1f
        xor               a2, a5, a7
        and               a2, a2, a3
        xor               a2, a2, a5
1:
        sc.w              a2, a2, (a6)
        bnez              a2, 0b
        srl               a0, a5, a0
        ret

asm_test::fetch_max::i16::release:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        li                a4, 0x10
        andi              a5, a0, 0x18
        addi              a3, a3, -0x1
        sll               a7, a1, a0
        sll               a3, a3, a0
        sub               a4, a4, a5
0:
        lr.w              a5, (a6)
        and               a1, a5, a3
        mv                a2, a5
        sll               a1, a1, a4
        sra               a1, a1, a4
        bge               a1, a7, 1f
        xor               a2, a5, a7
        and               a2, a2, a3
        xor               a2, a2, a5
1:
        sc.w.rl           a2, a2, (a6)
        bnez              a2, 0b
        srl               a0, a5, a0
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
        xor               a2, a5, a7
        xor               a3, a4, t0
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
        xor               a2, a5, a7
        xor               a3, a4, t0
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
        xor               a2, a5, a7
        xor               a3, a4, t0
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
        xor               a2, a5, a7
        xor               a3, a4, t0
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
        xor               a2, a5, a7
        xor               a3, a4, t0
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
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        andi              a4, a0, 0x18
        sll               a7, a3, a0
        sll               a1, a1, a0
        xori              a4, a4, 0x18
0:
        lr.w.aq           a5, (a6)
        and               a3, a5, a7
        mv                a2, a5
        sll               a3, a3, a4
        sra               a3, a3, a4
        bge               a1, a3, 1f
        xor               a2, a5, a1
        and               a2, a2, a7
        xor               a2, a2, a5
1:
        sc.w.rl           a2, a2, (a6)
        bnez              a2, 0b
        srl               a0, a5, a0
        ret

asm_test::fetch_min::i8::seqcst:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        andi              a4, a0, 0x18
        sll               a7, a3, a0
        sll               a1, a1, a0
        xori              a4, a4, 0x18
0:
        lr.w.aqrl         a5, (a6)
        and               a3, a5, a7
        mv                a2, a5
        sll               a3, a3, a4
        sra               a3, a3, a4
        bge               a1, a3, 1f
        xor               a2, a5, a1
        and               a2, a2, a7
        xor               a2, a2, a5
1:
        sc.w.rl           a2, a2, (a6)
        bnez              a2, 0b
        srl               a0, a5, a0
        ret

asm_test::fetch_min::i8::acquire:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        andi              a4, a0, 0x18
        sll               a7, a3, a0
        sll               a1, a1, a0
        xori              a4, a4, 0x18
0:
        lr.w.aq           a5, (a6)
        and               a3, a5, a7
        mv                a2, a5
        sll               a3, a3, a4
        sra               a3, a3, a4
        bge               a1, a3, 1f
        xor               a2, a5, a1
        and               a2, a2, a7
        xor               a2, a2, a5
1:
        sc.w              a2, a2, (a6)
        bnez              a2, 0b
        srl               a0, a5, a0
        ret

asm_test::fetch_min::i8::relaxed:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        andi              a4, a0, 0x18
        sll               a7, a3, a0
        sll               a1, a1, a0
        xori              a4, a4, 0x18
0:
        lr.w              a5, (a6)
        and               a3, a5, a7
        mv                a2, a5
        sll               a3, a3, a4
        sra               a3, a3, a4
        bge               a1, a3, 1f
        xor               a2, a5, a1
        and               a2, a2, a7
        xor               a2, a2, a5
1:
        sc.w              a2, a2, (a6)
        bnez              a2, 0b
        srl               a0, a5, a0
        ret

asm_test::fetch_min::i8::release:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        andi              a4, a0, 0x18
        sll               a7, a3, a0
        sll               a1, a1, a0
        xori              a4, a4, 0x18
0:
        lr.w              a5, (a6)
        and               a3, a5, a7
        mv                a2, a5
        sll               a3, a3, a4
        sra               a3, a3, a4
        bge               a1, a3, 1f
        xor               a2, a5, a1
        and               a2, a2, a7
        xor               a2, a2, a5
1:
        sc.w.rl           a2, a2, (a6)
        bnez              a2, 0b
        srl               a0, a5, a0
        ret

asm_test::fetch_min::i16::acqrel:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        li                a4, 0x10
        andi              a5, a0, 0x18
        addi              a3, a3, -0x1
        sll               a7, a1, a0
        sll               a3, a3, a0
        sub               a4, a4, a5
0:
        lr.w.aq           a5, (a6)
        and               a1, a5, a3
        mv                a2, a5
        sll               a1, a1, a4
        sra               a1, a1, a4
        bge               a7, a1, 1f
        xor               a2, a5, a7
        and               a2, a2, a3
        xor               a2, a2, a5
1:
        sc.w.rl           a2, a2, (a6)
        bnez              a2, 0b
        srl               a0, a5, a0
        ret

asm_test::fetch_min::i16::seqcst:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        li                a4, 0x10
        andi              a5, a0, 0x18
        addi              a3, a3, -0x1
        sll               a7, a1, a0
        sll               a3, a3, a0
        sub               a4, a4, a5
0:
        lr.w.aqrl         a5, (a6)
        and               a1, a5, a3
        mv                a2, a5
        sll               a1, a1, a4
        sra               a1, a1, a4
        bge               a7, a1, 1f
        xor               a2, a5, a7
        and               a2, a2, a3
        xor               a2, a2, a5
1:
        sc.w.rl           a2, a2, (a6)
        bnez              a2, 0b
        srl               a0, a5, a0
        ret

asm_test::fetch_min::i16::acquire:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        li                a4, 0x10
        andi              a5, a0, 0x18
        addi              a3, a3, -0x1
        sll               a7, a1, a0
        sll               a3, a3, a0
        sub               a4, a4, a5
0:
        lr.w.aq           a5, (a6)
        and               a1, a5, a3
        mv                a2, a5
        sll               a1, a1, a4
        sra               a1, a1, a4
        bge               a7, a1, 1f
        xor               a2, a5, a7
        and               a2, a2, a3
        xor               a2, a2, a5
1:
        sc.w              a2, a2, (a6)
        bnez              a2, 0b
        srl               a0, a5, a0
        ret

asm_test::fetch_min::i16::relaxed:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        li                a4, 0x10
        andi              a5, a0, 0x18
        addi              a3, a3, -0x1
        sll               a7, a1, a0
        sll               a3, a3, a0
        sub               a4, a4, a5
0:
        lr.w              a5, (a6)
        and               a1, a5, a3
        mv                a2, a5
        sll               a1, a1, a4
        sra               a1, a1, a4
        bge               a7, a1, 1f
        xor               a2, a5, a7
        and               a2, a2, a3
        xor               a2, a2, a5
1:
        sc.w              a2, a2, (a6)
        bnez              a2, 0b
        srl               a0, a5, a0
        ret

asm_test::fetch_min::i16::release:
        andi              a6, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        li                a4, 0x10
        andi              a5, a0, 0x18
        addi              a3, a3, -0x1
        sll               a7, a1, a0
        sll               a3, a3, a0
        sub               a4, a4, a5
0:
        lr.w              a5, (a6)
        and               a1, a5, a3
        mv                a2, a5
        sll               a1, a1, a4
        sra               a1, a1, a4
        bge               a7, a1, 1f
        xor               a2, a5, a7
        and               a2, a2, a3
        xor               a2, a2, a5
1:
        sc.w.rl           a2, a2, (a6)
        bnez              a2, 0b
        srl               a0, a5, a0
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
        xor               a2, a5, a7
        xor               a3, a4, t0
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
        xor               a2, a5, a7
        xor               a3, a4, t0
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
        xor               a2, a5, a7
        xor               a3, a4, t0
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
        xor               a2, a5, a7
        xor               a3, a4, t0
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
        xor               a2, a5, a7
        xor               a3, a4, t0
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
        lb                a0, 0x0(a0)
        andi              a6, a1, -0x4
        slli              a1, a1, 0x3
        li                a3, 0xff
        sll               a3, a3, a1
0:
        neg               a4, a0
        zext.b            a0, a0
        sll               a5, a0, a1
        zext.b            a0, a4
        sll               a0, a0, a1
1:
        lr.w.aq           a4, (a6)
        and               a2, a4, a3
        bne               a2, a5, 2f
        xor               a2, a4, a0
        and               a2, a2, a3
        xor               a2, a2, a4
        sc.w.rl           a2, a2, (a6)
        bnez              a2, 1b
2:
        and               a2, a4, a3
        srl               a0, a4, a1
        bne               a5, a2, 0b
        ret

asm_test::fetch_neg::u8::seqcst:
        mv                a1, a0
        lb                a0, 0x0(a0)
        andi              a6, a1, -0x4
        slli              a1, a1, 0x3
        li                a3, 0xff
        sll               a3, a3, a1
0:
        neg               a4, a0
        zext.b            a0, a0
        sll               a5, a0, a1
        zext.b            a0, a4
        sll               a0, a0, a1
1:
        lr.w.aqrl         a4, (a6)
        and               a2, a4, a3
        bne               a2, a5, 2f
        xor               a2, a4, a0
        and               a2, a2, a3
        xor               a2, a2, a4
        sc.w.rl           a2, a2, (a6)
        bnez              a2, 1b
2:
        and               a2, a4, a3
        srl               a0, a4, a1
        bne               a5, a2, 0b
        ret

asm_test::fetch_neg::u8::acquire:
        mv                a1, a0
        lb                a0, 0x0(a0)
        andi              a6, a1, -0x4
        slli              a1, a1, 0x3
        li                a3, 0xff
        sll               a3, a3, a1
0:
        neg               a4, a0
        zext.b            a0, a0
        sll               a5, a0, a1
        zext.b            a0, a4
        sll               a0, a0, a1
1:
        lr.w.aq           a4, (a6)
        and               a2, a4, a3
        bne               a2, a5, 2f
        xor               a2, a4, a0
        and               a2, a2, a3
        xor               a2, a2, a4
        sc.w              a2, a2, (a6)
        bnez              a2, 1b
2:
        and               a2, a4, a3
        srl               a0, a4, a1
        bne               a5, a2, 0b
        ret

asm_test::fetch_neg::u8::relaxed:
        mv                a1, a0
        lb                a0, 0x0(a0)
        andi              a6, a1, -0x4
        slli              a1, a1, 0x3
        li                a3, 0xff
        sll               a3, a3, a1
0:
        neg               a4, a0
        zext.b            a0, a0
        sll               a5, a0, a1
        zext.b            a0, a4
        sll               a0, a0, a1
1:
        lr.w              a4, (a6)
        and               a2, a4, a3
        bne               a2, a5, 2f
        xor               a2, a4, a0
        and               a2, a2, a3
        xor               a2, a2, a4
        sc.w              a2, a2, (a6)
        bnez              a2, 1b
2:
        and               a2, a4, a3
        srl               a0, a4, a1
        bne               a5, a2, 0b
        ret

asm_test::fetch_neg::u8::release:
        mv                a1, a0
        lb                a0, 0x0(a0)
        andi              a6, a1, -0x4
        slli              a1, a1, 0x3
        li                a3, 0xff
        sll               a3, a3, a1
0:
        neg               a4, a0
        zext.b            a0, a0
        sll               a5, a0, a1
        zext.b            a0, a4
        sll               a0, a0, a1
1:
        lr.w              a4, (a6)
        and               a2, a4, a3
        bne               a2, a5, 2f
        xor               a2, a4, a0
        and               a2, a2, a3
        xor               a2, a2, a4
        sc.w.rl           a2, a2, (a6)
        bnez              a2, 1b
2:
        and               a2, a4, a3
        srl               a0, a4, a1
        bne               a5, a2, 0b
        ret

asm_test::fetch_neg::u16::acqrel:
        mv                a1, a0
        lh                a0, 0x0(a0)
        andi              a6, a1, -0x4
        slli              a1, a1, 0x3
        lui               a3, 0x10
        addi              a7, a3, -0x1
        sll               a4, a7, a1
0:
        neg               a5, a0
        and               a0, a0, a7
        sll               a2, a0, a1
        and               a5, a5, a7
        sll               a0, a5, a1
1:
        lr.w.aq           a5, (a6)
        and               a3, a5, a4
        bne               a3, a2, 2f
        xor               a3, a5, a0
        and               a3, a3, a4
        xor               a3, a3, a5
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 1b
2:
        and               a3, a5, a4
        srl               a0, a5, a1
        bne               a2, a3, 0b
        ret

asm_test::fetch_neg::u16::seqcst:
        mv                a1, a0
        lh                a0, 0x0(a0)
        andi              a6, a1, -0x4
        slli              a1, a1, 0x3
        lui               a3, 0x10
        addi              a7, a3, -0x1
        sll               a4, a7, a1
0:
        neg               a5, a0
        and               a0, a0, a7
        sll               a2, a0, a1
        and               a5, a5, a7
        sll               a0, a5, a1
1:
        lr.w.aqrl         a5, (a6)
        and               a3, a5, a4
        bne               a3, a2, 2f
        xor               a3, a5, a0
        and               a3, a3, a4
        xor               a3, a3, a5
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 1b
2:
        and               a3, a5, a4
        srl               a0, a5, a1
        bne               a2, a3, 0b
        ret

asm_test::fetch_neg::u16::acquire:
        mv                a1, a0
        lh                a0, 0x0(a0)
        andi              a6, a1, -0x4
        slli              a1, a1, 0x3
        lui               a3, 0x10
        addi              a7, a3, -0x1
        sll               a4, a7, a1
0:
        neg               a5, a0
        and               a0, a0, a7
        sll               a2, a0, a1
        and               a5, a5, a7
        sll               a0, a5, a1
1:
        lr.w.aq           a5, (a6)
        and               a3, a5, a4
        bne               a3, a2, 2f
        xor               a3, a5, a0
        and               a3, a3, a4
        xor               a3, a3, a5
        sc.w              a3, a3, (a6)
        bnez              a3, 1b
2:
        and               a3, a5, a4
        srl               a0, a5, a1
        bne               a2, a3, 0b
        ret

asm_test::fetch_neg::u16::relaxed:
        mv                a1, a0
        lh                a0, 0x0(a0)
        andi              a6, a1, -0x4
        slli              a1, a1, 0x3
        lui               a3, 0x10
        addi              a7, a3, -0x1
        sll               a4, a7, a1
0:
        neg               a5, a0
        and               a0, a0, a7
        sll               a2, a0, a1
        and               a5, a5, a7
        sll               a0, a5, a1
1:
        lr.w              a5, (a6)
        and               a3, a5, a4
        bne               a3, a2, 2f
        xor               a3, a5, a0
        and               a3, a3, a4
        xor               a3, a3, a5
        sc.w              a3, a3, (a6)
        bnez              a3, 1b
2:
        and               a3, a5, a4
        srl               a0, a5, a1
        bne               a2, a3, 0b
        ret

asm_test::fetch_neg::u16::release:
        mv                a1, a0
        lh                a0, 0x0(a0)
        andi              a6, a1, -0x4
        slli              a1, a1, 0x3
        lui               a3, 0x10
        addi              a7, a3, -0x1
        sll               a4, a7, a1
0:
        neg               a5, a0
        and               a0, a0, a7
        sll               a2, a0, a1
        and               a5, a5, a7
        sll               a0, a5, a1
1:
        lr.w              a5, (a6)
        and               a3, a5, a4
        bne               a3, a2, 2f
        xor               a3, a5, a0
        and               a3, a3, a4
        xor               a3, a3, a5
        sc.w.rl           a3, a3, (a6)
        bnez              a3, 1b
2:
        and               a3, a5, a4
        srl               a0, a5, a1
        bne               a2, a3, 0b
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
        mv                a6, a5
        mv                a1, a4
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
        mv                a6, a5
        mv                a1, a4
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
        mv                a6, a5
        mv                a1, a4
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
        mv                a6, a5
        mv                a1, a4
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
        mv                a6, a5
        mv                a1, a4
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
        andi              a1, a0, -0x4
        slli              a0, a0, 0x3
        li                a2, 0xff
        sll               a2, a2, a0
        amoxor.w.aqrl     a1, a2, (a1)
        srl               a0, a1, a0
        ret

asm_test::fetch_not::u8::seqcst:
        andi              a1, a0, -0x4
        slli              a0, a0, 0x3
        li                a2, 0xff
        sll               a2, a2, a0
        amoxor.w.aqrl     a1, a2, (a1)
        srl               a0, a1, a0
        ret

asm_test::fetch_not::u8::acquire:
        andi              a1, a0, -0x4
        slli              a0, a0, 0x3
        li                a2, 0xff
        sll               a2, a2, a0
        amoxor.w.aq       a1, a2, (a1)
        srl               a0, a1, a0
        ret

asm_test::fetch_not::u8::relaxed:
        andi              a1, a0, -0x4
        slli              a0, a0, 0x3
        li                a2, 0xff
        sll               a2, a2, a0
        amoxor.w          a1, a2, (a1)
        srl               a0, a1, a0
        ret

asm_test::fetch_not::u8::release:
        andi              a1, a0, -0x4
        slli              a0, a0, 0x3
        li                a2, 0xff
        sll               a2, a2, a0
        amoxor.w.rl       a1, a2, (a1)
        srl               a0, a1, a0
        ret

asm_test::fetch_not::u16::acqrel:
        andi              a1, a0, -0x4
        slli              a0, a0, 0x3
        lui               a2, 0x10
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        amoxor.w.aqrl     a1, a2, (a1)
        srl               a0, a1, a0
        ret

asm_test::fetch_not::u16::seqcst:
        andi              a1, a0, -0x4
        slli              a0, a0, 0x3
        lui               a2, 0x10
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        amoxor.w.aqrl     a1, a2, (a1)
        srl               a0, a1, a0
        ret

asm_test::fetch_not::u16::acquire:
        andi              a1, a0, -0x4
        slli              a0, a0, 0x3
        lui               a2, 0x10
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        amoxor.w.aq       a1, a2, (a1)
        srl               a0, a1, a0
        ret

asm_test::fetch_not::u16::relaxed:
        andi              a1, a0, -0x4
        slli              a0, a0, 0x3
        lui               a2, 0x10
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        amoxor.w          a1, a2, (a1)
        srl               a0, a1, a0
        ret

asm_test::fetch_not::u16::release:
        andi              a1, a0, -0x4
        slli              a0, a0, 0x3
        lui               a2, 0x10
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        amoxor.w.rl       a1, a2, (a1)
        srl               a0, a1, a0
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
        mv                a6, a5
        mv                a1, a4
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
        mv                a6, a5
        mv                a1, a4
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
        mv                a6, a5
        mv                a1, a4
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
        mv                a6, a5
        mv                a1, a4
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
        mv                a6, a5
        mv                a1, a4
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

asm_test::fetch_sub::u16::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
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

asm_test::fetch_sub::u16::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
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

asm_test::fetch_sub::u16::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
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

asm_test::fetch_sub::u16::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
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

asm_test::fetch_sub::u16::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
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

asm_test::fetch_sub::u64::acqrel:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a5
        mv                t0, a4
        sltu              a3, a4, a1
        sub               a4, a5, a6
        sub               a2, t0, a1
        sub               a3, a4, a3
        mv                a4, t0
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a7
        xor               a3, a4, t0
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_sub::u64::seqcst:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a5
        mv                t0, a4
        sltu              a3, a4, a1
        sub               a4, a5, a6
        sub               a2, t0, a1
        sub               a3, a4, a3
        mv                a4, t0
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a7
        xor               a3, a4, t0
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_sub::u64::acquire:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a5
        mv                t0, a4
        sltu              a3, a4, a1
        sub               a4, a5, a6
        sub               a2, t0, a1
        sub               a3, a4, a3
        mv                a4, t0
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a5, a7
        xor               a3, a4, t0
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_sub::u64::relaxed:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a5
        mv                t0, a4
        sltu              a3, a4, a1
        sub               a4, a5, a6
        sub               a2, t0, a1
        sub               a3, a4, a3
        mv                a4, t0
        amocas.d          a4, a2, (a0)
        xor               a2, a5, a7
        xor               a3, a4, t0
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_sub::u64::release:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a5
        mv                t0, a4
        sltu              a3, a4, a1
        sub               a4, a5, a6
        sub               a2, t0, a1
        sub               a3, a4, a3
        mv                a4, t0
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a5, a7
        xor               a3, a4, t0
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_xor::u8::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoxor.w.aqrl     a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_xor::u8::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoxor.w.aqrl     a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_xor::u8::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoxor.w.aq       a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_xor::u8::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoxor.w          a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_xor::u8::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoxor.w.rl       a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_xor::u16::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoxor.w.aqrl     a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_xor::u16::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoxor.w.aqrl     a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_xor::u16::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoxor.w.aq       a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_xor::u16::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoxor.w          a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_xor::u16::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoxor.w.rl       a1, a1, (a2)
        srl               a0, a1, a0
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

asm_test::fetch_xor::u64::acqrel:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a5
        mv                t0, a4
        xor               a2, a4, a1
        xor               a3, a5, a6
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a7
        xor               a3, a4, t0
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_xor::u64::seqcst:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a5
        mv                t0, a4
        xor               a2, a4, a1
        xor               a3, a5, a6
        amocas.d.aqrl     a4, a2, (a0)
        xor               a2, a5, a7
        xor               a3, a4, t0
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_xor::u64::acquire:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a5
        mv                t0, a4
        xor               a2, a4, a1
        xor               a3, a5, a6
        amocas.d.aq       a4, a2, (a0)
        xor               a2, a5, a7
        xor               a3, a4, t0
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_xor::u64::relaxed:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a5
        mv                t0, a4
        xor               a2, a4, a1
        xor               a3, a5, a6
        amocas.d          a4, a2, (a0)
        xor               a2, a5, a7
        xor               a3, a4, t0
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, t0
        mv                a1, a7
        ret

asm_test::fetch_xor::u64::release:
        mv                a6, a2
        lw                a4, 0x0(a0)
        lw                a5, 0x4(a0)
0:
        mv                a7, a5
        mv                t0, a4
        xor               a2, a4, a1
        xor               a3, a5, a6
        amocas.d.rl       a4, a2, (a0)
        xor               a2, a5, a7
        xor               a3, a4, t0
        or                a2, a2, a3
        bnez              a2, 0b
        mv                a0, t0
        mv                a1, a7
        ret


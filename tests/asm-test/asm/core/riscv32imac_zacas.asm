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
        xor               a1, a1, a3
        seqz              a0, a1
        srl               a1, a5, a4
        addi              a0, a0, -0x1
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
        xor               a1, a1, a3
        seqz              a0, a1
        srl               a1, a5, a4
        addi              a0, a0, -0x1
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
        xor               a1, a1, a3
        seqz              a0, a1
        srl               a1, a5, a4
        addi              a0, a0, -0x1
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
        xor               a1, a1, a3
        seqz              a0, a1
        srl               a1, a5, a4
        addi              a0, a0, -0x1
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
        xor               a1, a1, a3
        seqz              a0, a1
        srl               a1, a5, a4
        addi              a0, a0, -0x1
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
        xor               a1, a1, a3
        seqz              a0, a1
        srl               a1, a5, a4
        addi              a0, a0, -0x1
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
        xor               a1, a1, a3
        seqz              a0, a1
        srl               a1, a5, a4
        addi              a0, a0, -0x1
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
        xor               a1, a1, a3
        seqz              a0, a1
        srl               a1, a5, a4
        addi              a0, a0, -0x1
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
        xor               a1, a1, a3
        seqz              a0, a1
        srl               a1, a5, a4
        addi              a0, a0, -0x1
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
        xor               a1, a1, a3
        seqz              a0, a1
        srl               a1, a5, a4
        addi              a0, a0, -0x1
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
        xor               a1, a1, a3
        seqz              a0, a1
        srl               a1, a5, a4
        addi              a0, a0, -0x1
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
        xor               a1, a1, a3
        seqz              a0, a1
        srl               a1, a5, a4
        addi              a0, a0, -0x1
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
        xor               a1, a1, a3
        seqz              a0, a1
        srl               a1, a5, a4
        addi              a0, a0, -0x1
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
        xor               a1, a1, a3
        seqz              a0, a1
        srl               a1, a5, a4
        addi              a0, a0, -0x1
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
        xor               a1, a1, a3
        seqz              a0, a1
        srl               a1, a5, a4
        addi              a0, a0, -0x1
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
        xor               a1, a1, a3
        seqz              a0, a1
        not               a0, a0
        srl               a1, a5, a4
        zext.b            a0, a0
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
        xor               a1, a1, a3
        seqz              a0, a1
        not               a0, a0
        srl               a1, a5, a4
        zext.b            a0, a0
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
        xor               a1, a1, a3
        seqz              a0, a1
        not               a0, a0
        srl               a1, a5, a4
        zext.b            a0, a0
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
        xor               a1, a1, a3
        seqz              a0, a1
        not               a0, a0
        srl               a1, a5, a4
        zext.b            a0, a0
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
        xor               a1, a1, a3
        seqz              a0, a1
        not               a0, a0
        srl               a1, a5, a4
        zext.b            a0, a0
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
        xor               a1, a1, a3
        seqz              a0, a1
        not               a0, a0
        srl               a1, a5, a4
        zext.b            a0, a0
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
        xor               a1, a1, a3
        seqz              a0, a1
        not               a0, a0
        srl               a1, a5, a4
        zext.b            a0, a0
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
        xor               a1, a1, a3
        seqz              a0, a1
        not               a0, a0
        srl               a1, a5, a4
        zext.b            a0, a0
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
        xor               a1, a1, a3
        seqz              a0, a1
        not               a0, a0
        srl               a1, a5, a4
        zext.b            a0, a0
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
        xor               a1, a1, a3
        seqz              a0, a1
        not               a0, a0
        srl               a1, a5, a4
        zext.b            a0, a0
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
        xor               a1, a1, a3
        seqz              a0, a1
        not               a0, a0
        srl               a1, a5, a4
        zext.b            a0, a0
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
        xor               a1, a1, a3
        seqz              a0, a1
        not               a0, a0
        srl               a1, a5, a4
        zext.b            a0, a0
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
        xor               a1, a1, a3
        seqz              a0, a1
        not               a0, a0
        srl               a1, a5, a4
        zext.b            a0, a0
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
        xor               a1, a1, a3
        seqz              a0, a1
        not               a0, a0
        srl               a1, a5, a4
        zext.b            a0, a0
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
        xor               a1, a1, a3
        seqz              a0, a1
        not               a0, a0
        srl               a1, a5, a4
        zext.b            a0, a0
        ret

asm_test::compare_exchange::u32::acqrel_seqcst:
        mv                a3, a1
        fence             rw, rw
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        seqz              a0, a1
        xori              a0, a0, 0xff
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::seqcst_seqcst:
        mv                a3, a1
        fence             rw, rw
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        seqz              a0, a1
        xori              a0, a0, 0xff
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::acqrel_acquire:
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        seqz              a0, a1
        xori              a0, a0, 0xff
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::acqrel_relaxed:
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        seqz              a0, a1
        xori              a0, a0, 0xff
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::acquire_seqcst:
        mv                a3, a1
        fence             rw, rw
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        seqz              a0, a1
        xori              a0, a0, 0xff
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::relaxed_seqcst:
        mv                a3, a1
        fence             rw, rw
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        seqz              a0, a1
        xori              a0, a0, 0xff
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::release_seqcst:
        mv                a3, a1
        fence             rw, rw
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        seqz              a0, a1
        xori              a0, a0, 0xff
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::seqcst_acquire:
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        seqz              a0, a1
        xori              a0, a0, 0xff
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::seqcst_relaxed:
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        seqz              a0, a1
        xori              a0, a0, 0xff
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::acquire_acquire:
        mv                a3, a1
        amocas.w.aq       a3, a2, (a0)
        xor               a1, a1, a3
        seqz              a0, a1
        xori              a0, a0, 0xff
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::acquire_relaxed:
        mv                a3, a1
        amocas.w.aq       a3, a2, (a0)
        xor               a1, a1, a3
        seqz              a0, a1
        xori              a0, a0, 0xff
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::relaxed_acquire:
        mv                a3, a1
        amocas.w.aq       a3, a2, (a0)
        xor               a1, a1, a3
        seqz              a0, a1
        xori              a0, a0, 0xff
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::relaxed_relaxed:
        mv                a3, a1
        amocas.w          a3, a2, (a0)
        xor               a1, a1, a3
        seqz              a0, a1
        xori              a0, a0, 0xff
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::release_acquire:
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        seqz              a0, a1
        xori              a0, a0, 0xff
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::release_relaxed:
        mv                a3, a1
        amocas.w.rl       a3, a2, (a0)
        xor               a1, a1, a3
        seqz              a0, a1
        xori              a0, a0, 0xff
        mv                a1, a3
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
        xor               a1, a1, a3
        seqz              a0, a1
        srl               a1, a5, a4
        addi              a0, a0, -0x1
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
        xor               a1, a1, a3
        seqz              a0, a1
        srl               a1, a5, a4
        addi              a0, a0, -0x1
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
        xor               a1, a1, a3
        seqz              a0, a1
        srl               a1, a5, a4
        addi              a0, a0, -0x1
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
        xor               a1, a1, a3
        seqz              a0, a1
        srl               a1, a5, a4
        addi              a0, a0, -0x1
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
        xor               a1, a1, a3
        seqz              a0, a1
        srl               a1, a5, a4
        addi              a0, a0, -0x1
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
        xor               a1, a1, a3
        seqz              a0, a1
        srl               a1, a5, a4
        addi              a0, a0, -0x1
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
        xor               a1, a1, a3
        seqz              a0, a1
        srl               a1, a5, a4
        addi              a0, a0, -0x1
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
        xor               a1, a1, a3
        seqz              a0, a1
        srl               a1, a5, a4
        addi              a0, a0, -0x1
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
        xor               a1, a1, a3
        seqz              a0, a1
        srl               a1, a5, a4
        addi              a0, a0, -0x1
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
        xor               a1, a1, a3
        seqz              a0, a1
        srl               a1, a5, a4
        addi              a0, a0, -0x1
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
        xor               a1, a1, a3
        seqz              a0, a1
        srl               a1, a5, a4
        addi              a0, a0, -0x1
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
        xor               a1, a1, a3
        seqz              a0, a1
        srl               a1, a5, a4
        addi              a0, a0, -0x1
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
        xor               a1, a1, a3
        seqz              a0, a1
        srl               a1, a5, a4
        addi              a0, a0, -0x1
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
        xor               a1, a1, a3
        seqz              a0, a1
        srl               a1, a5, a4
        addi              a0, a0, -0x1
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
        xor               a1, a1, a3
        seqz              a0, a1
        srl               a1, a5, a4
        addi              a0, a0, -0x1
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
        xor               a1, a1, a3
        seqz              a0, a1
        not               a0, a0
        srl               a1, a5, a4
        zext.b            a0, a0
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
        xor               a1, a1, a3
        seqz              a0, a1
        not               a0, a0
        srl               a1, a5, a4
        zext.b            a0, a0
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
        xor               a1, a1, a3
        seqz              a0, a1
        not               a0, a0
        srl               a1, a5, a4
        zext.b            a0, a0
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
        xor               a1, a1, a3
        seqz              a0, a1
        not               a0, a0
        srl               a1, a5, a4
        zext.b            a0, a0
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
        xor               a1, a1, a3
        seqz              a0, a1
        not               a0, a0
        srl               a1, a5, a4
        zext.b            a0, a0
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
        xor               a1, a1, a3
        seqz              a0, a1
        not               a0, a0
        srl               a1, a5, a4
        zext.b            a0, a0
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
        xor               a1, a1, a3
        seqz              a0, a1
        not               a0, a0
        srl               a1, a5, a4
        zext.b            a0, a0
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
        xor               a1, a1, a3
        seqz              a0, a1
        not               a0, a0
        srl               a1, a5, a4
        zext.b            a0, a0
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
        xor               a1, a1, a3
        seqz              a0, a1
        not               a0, a0
        srl               a1, a5, a4
        zext.b            a0, a0
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
        xor               a1, a1, a3
        seqz              a0, a1
        not               a0, a0
        srl               a1, a5, a4
        zext.b            a0, a0
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
        xor               a1, a1, a3
        seqz              a0, a1
        not               a0, a0
        srl               a1, a5, a4
        zext.b            a0, a0
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
        xor               a1, a1, a3
        seqz              a0, a1
        not               a0, a0
        srl               a1, a5, a4
        zext.b            a0, a0
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
        xor               a1, a1, a3
        seqz              a0, a1
        not               a0, a0
        srl               a1, a5, a4
        zext.b            a0, a0
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
        xor               a1, a1, a3
        seqz              a0, a1
        not               a0, a0
        srl               a1, a5, a4
        zext.b            a0, a0
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
        xor               a1, a1, a3
        seqz              a0, a1
        not               a0, a0
        srl               a1, a5, a4
        zext.b            a0, a0
        ret

asm_test::compare_exchange_weak::u32::acqrel_seqcst:
        mv                a3, a1
        fence             rw, rw
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        seqz              a0, a1
        xori              a0, a0, 0xff
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::seqcst_seqcst:
        mv                a3, a1
        fence             rw, rw
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        seqz              a0, a1
        xori              a0, a0, 0xff
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::acqrel_acquire:
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        seqz              a0, a1
        xori              a0, a0, 0xff
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::acqrel_relaxed:
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        seqz              a0, a1
        xori              a0, a0, 0xff
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::acquire_seqcst:
        mv                a3, a1
        fence             rw, rw
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        seqz              a0, a1
        xori              a0, a0, 0xff
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::relaxed_seqcst:
        mv                a3, a1
        fence             rw, rw
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        seqz              a0, a1
        xori              a0, a0, 0xff
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::release_seqcst:
        mv                a3, a1
        fence             rw, rw
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        seqz              a0, a1
        xori              a0, a0, 0xff
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::seqcst_acquire:
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        seqz              a0, a1
        xori              a0, a0, 0xff
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::seqcst_relaxed:
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        seqz              a0, a1
        xori              a0, a0, 0xff
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::acquire_acquire:
        mv                a3, a1
        amocas.w.aq       a3, a2, (a0)
        xor               a1, a1, a3
        seqz              a0, a1
        xori              a0, a0, 0xff
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::acquire_relaxed:
        mv                a3, a1
        amocas.w.aq       a3, a2, (a0)
        xor               a1, a1, a3
        seqz              a0, a1
        xori              a0, a0, 0xff
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::relaxed_acquire:
        mv                a3, a1
        amocas.w.aq       a3, a2, (a0)
        xor               a1, a1, a3
        seqz              a0, a1
        xori              a0, a0, 0xff
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::relaxed_relaxed:
        mv                a3, a1
        amocas.w          a3, a2, (a0)
        xor               a1, a1, a3
        seqz              a0, a1
        xori              a0, a0, 0xff
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::release_acquire:
        mv                a3, a1
        amocas.w.aqrl     a3, a2, (a0)
        xor               a1, a1, a3
        seqz              a0, a1
        xori              a0, a0, 0xff
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::release_relaxed:
        mv                a3, a1
        amocas.w.rl       a3, a2, (a0)
        xor               a1, a1, a3
        seqz              a0, a1
        xori              a0, a0, 0xff
        mv                a1, a3
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

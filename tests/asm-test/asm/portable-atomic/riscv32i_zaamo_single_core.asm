<portable_atomic::AtomicBool>::compare_exchange:
        slli              a5, a4, 0x2
        lui               a6, 0x0
        mv                a6, a6
        add               a5, a6, a5
        lw                a5, 0x0(a5)
        jr                a5
        beqz              a3, 1f
        li                a5, 0x1
        bne               a3, a5, 2f
        li                a3, 0x4
        beq               a4, a3, 0f
        li                a3, 0x1
0:
        li                a5, 0x2
        bne               a4, a5, 3f
        li                a3, 0x3
        j                 3f
1:
        li                a3, 0x2
        beq               a4, a3, 3f
        addi              a4, a4, -0x4
        seqz              a3, a4
        slli              a3, a3, 0x2
        j                 3f
2:
        li                a5, 0x4
        bne               a4, a5, 3f
        li                a3, 0x4
3:
        andi              a4, a0, -0x4
        slli              a0, a0, 0x3
        beq               a1, a2, 4f
        beqz              a2, 5f
        li                a2, 0x1
        li                a5, 0x2
        sll               a2, a2, a0
        blt               a5, a3, 9f
        beqz              a3, 11f
        li                a5, 0x1
        bne               a3, a5, 13f
        amoor.w.rl        a2, a2, (a4)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
4:
        li                a2, 0x0
        li                a5, 0x2
        sll               a2, a2, a0
        blt               a5, a3, 6f
        beqz              a3, 7f
        li                a5, 0x1
        bne               a3, a5, 8f
        amoor.w.rl        a2, a2, (a4)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
5:
        li                a5, 0xff
        sll               a2, a2, a0
        sll               a5, a5, a0
        not               a5, a5
        li                a6, 0x2
        or                a2, a2, a5
        blt               a6, a3, 10f
        beqz              a3, 12f
        li                a5, 0x1
        bne               a3, a5, 14f
        amoand.w.rl       a2, a2, (a4)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
6:
        amoor.w.aqrl      a2, a2, (a4)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
7:
        amoor.w           a2, a2, (a4)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
8:
        amoor.w.aq        a2, a2, (a4)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
9:
        amoor.w.aqrl      a2, a2, (a4)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
10:
        amoand.w.aqrl     a2, a2, (a4)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
11:
        amoor.w           a2, a2, (a4)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
12:
        amoand.w          a2, a2, (a4)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
13:
        amoor.w.aq        a2, a2, (a4)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
14:
        amoand.w.aq       a2, a2, (a4)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
        lui               a0, 0x0
        mv                a0, a0
        lui               a2, 0x0
        mv                a2, a2
        li                a1, 0x34
15:
        auipc             ra, 0x0
        jalr              r15b
        lui               a0, 0x0
        mv                a0, a0
        lui               a2, 0x0
        mv                a2, a2
        li                a1, 0x3d
16:
        auipc             ra, 0x0
        jalr              r16b

asm_test::fetch_nand::u8::acqrel:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sb                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u8::seqcst:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sb                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u8::acquire:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sb                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u8::relaxed:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sb                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u8::release:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sb                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u16::acqrel:
        csrrci            a3, mstatus, 0x8
        lhu               a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sh                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u16::seqcst:
        csrrci            a3, mstatus, 0x8
        lhu               a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sh                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u16::acquire:
        csrrci            a3, mstatus, 0x8
        lhu               a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sh                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u16::relaxed:
        csrrci            a3, mstatus, 0x8
        lhu               a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sh                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u16::release:
        csrrci            a3, mstatus, 0x8
        lhu               a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sh                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u32::acqrel:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sw                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u32::seqcst:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sw                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u32::acquire:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sw                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u32::relaxed:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sw                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u32::release:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sw                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::bool::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0x1
        sll               a3, a3, a0
        beqz              a1, 0f
        amoxor.w.aqrl     a1, a3, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret
0:
        amoor.w.aqrl      a1, a3, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_nand::bool::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0x1
        sll               a3, a3, a0
        beqz              a1, 0f
        amoxor.w.aqrl     a1, a3, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret
0:
        amoor.w.aqrl      a1, a3, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_nand::bool::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0x1
        sll               a3, a3, a0
        beqz              a1, 0f
        amoxor.w.aq       a1, a3, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret
0:
        amoor.w.aq        a1, a3, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_nand::bool::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0x1
        sll               a3, a3, a0
        beqz              a1, 0f
        amoxor.w          a1, a3, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret
0:
        amoor.w           a1, a3, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_nand::bool::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0x1
        sll               a3, a3, a0
        beqz              a1, 0f
        amoxor.w.rl       a1, a3, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret
0:
        amoor.w.rl        a1, a3, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_umax::u8::acqrel:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lbu               a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_umax::u8::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lbu               a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_umax::u8::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lbu               a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_umax::u8::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lbu               a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_umax::u8::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lbu               a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_umax::u16::acqrel:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lhu               a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_umax::u16::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lhu               a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_umax::u16::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lhu               a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_umax::u16::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lhu               a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_umax::u16::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lhu               a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              mstatus, a3
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
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lbu               a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_umin::u8::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lbu               a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_umin::u8::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lbu               a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_umin::u8::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lbu               a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_umin::u8::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lbu               a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_umin::u16::acqrel:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lhu               a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_umin::u16::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lhu               a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_umin::u16::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lhu               a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_umin::u16::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lhu               a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_umin::u16::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lhu               a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              mstatus, a3
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
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::seqcst_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::acqrel_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::acqrel_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::acquire_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::relaxed_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::release_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::seqcst_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::seqcst_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::acquire_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::acquire_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::relaxed_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::relaxed_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::release_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::release_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::acqrel_seqcst:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::seqcst_seqcst:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::acqrel_acquire:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::acqrel_relaxed:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::acquire_seqcst:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::relaxed_seqcst:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::release_seqcst:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::seqcst_acquire:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::seqcst_relaxed:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::acquire_acquire:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::acquire_relaxed:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::relaxed_acquire:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::relaxed_relaxed:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::release_acquire:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::release_relaxed:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::acqrel_seqcst:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::seqcst_seqcst:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::acqrel_acquire:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::acqrel_relaxed:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::acquire_seqcst:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::relaxed_seqcst:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::release_seqcst:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::seqcst_acquire:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::seqcst_relaxed:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::acquire_acquire:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::acquire_relaxed:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::relaxed_acquire:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::relaxed_relaxed:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::release_acquire:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::release_relaxed:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::bool::acqrel_seqcst:
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        beq               a1, a2, 0f
        beqz              a2, 1f
        li                a2, 0x1
        sll               a2, a2, a0
        amoor.w.aqrl      a2, a2, (a3)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        li                a2, 0x0
        sll               a2, a2, a0
        amoor.w.aqrl      a2, a2, (a3)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        li                a4, 0xff
        sll               a4, a4, a0
        not               a4, a4
        sll               a2, a2, a0
        or                a2, a2, a4
        amoand.w.aqrl     a2, a2, (a3)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::seqcst_seqcst:
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        beq               a1, a2, 0f
        beqz              a2, 1f
        li                a2, 0x1
        sll               a2, a2, a0
        amoor.w.aqrl      a2, a2, (a3)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        li                a2, 0x0
        sll               a2, a2, a0
        amoor.w.aqrl      a2, a2, (a3)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        li                a4, 0xff
        sll               a4, a4, a0
        not               a4, a4
        sll               a2, a2, a0
        or                a2, a2, a4
        amoand.w.aqrl     a2, a2, (a3)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::acqrel_acquire:
        li                a3, 0x3
        li                a4, 0x2
0:
        auipc             t1, 0x0
        jr                t0b

asm_test::compare_exchange::bool::acqrel_relaxed:
        li                a3, 0x3
        li                a4, 0x0
0:
        auipc             t1, 0x0
        jr                t0b

asm_test::compare_exchange::bool::acquire_seqcst:
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        beq               a1, a2, 0f
        beqz              a2, 1f
        li                a2, 0x1
        sll               a2, a2, a0
        amoor.w.aqrl      a2, a2, (a3)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        li                a2, 0x0
        sll               a2, a2, a0
        amoor.w.aqrl      a2, a2, (a3)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        li                a4, 0xff
        sll               a4, a4, a0
        not               a4, a4
        sll               a2, a2, a0
        or                a2, a2, a4
        amoand.w.aqrl     a2, a2, (a3)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::relaxed_seqcst:
        li                a4, 0x4
        li                a3, 0x0
0:
        auipc             t1, 0x0
        jr                t0b

asm_test::compare_exchange::bool::release_seqcst:
        li                a3, 0x1
        li                a4, 0x4
0:
        auipc             t1, 0x0
        jr                t0b

asm_test::compare_exchange::bool::seqcst_acquire:
        li                a3, 0x4
        li                a4, 0x2
0:
        auipc             t1, 0x0
        jr                t0b

asm_test::compare_exchange::bool::seqcst_relaxed:
        li                a3, 0x4
        li                a4, 0x0
0:
        auipc             t1, 0x0
        jr                t0b

asm_test::compare_exchange::bool::acquire_acquire:
        li                a3, 0x2
        li                a4, 0x2
0:
        auipc             t1, 0x0
        jr                t0b

asm_test::compare_exchange::bool::acquire_relaxed:
        li                a3, 0x2
        li                a4, 0x0
0:
        auipc             t1, 0x0
        jr                t0b

asm_test::compare_exchange::bool::relaxed_acquire:
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        beq               a1, a2, 0f
        beqz              a2, 1f
        li                a2, 0x1
        sll               a2, a2, a0
        amoor.w.aq        a2, a2, (a3)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        li                a2, 0x0
        sll               a2, a2, a0
        amoor.w.aq        a2, a2, (a3)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        li                a4, 0xff
        sll               a4, a4, a0
        not               a4, a4
        sll               a2, a2, a0
        or                a2, a2, a4
        amoand.w.aq       a2, a2, (a3)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::relaxed_relaxed:
        li                a3, 0x0
        li                a4, 0x0
0:
        auipc             t1, 0x0
        jr                t0b

asm_test::compare_exchange::bool::release_acquire:
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        beq               a1, a2, 0f
        beqz              a2, 1f
        li                a2, 0x1
        sll               a2, a2, a0
        amoor.w.aqrl      a2, a2, (a3)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        li                a2, 0x0
        sll               a2, a2, a0
        amoor.w.aqrl      a2, a2, (a3)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        li                a4, 0xff
        sll               a4, a4, a0
        not               a4, a4
        sll               a2, a2, a0
        or                a2, a2, a4
        amoand.w.aqrl     a2, a2, (a3)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::release_relaxed:
        li                a3, 0x1
        li                a4, 0x0
0:
        auipc             t1, 0x0
        jr                t0b

asm_test::compare_exchange_weak::u8::acqrel_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::seqcst_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::acqrel_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::acqrel_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::acquire_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::relaxed_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::release_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::seqcst_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::seqcst_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::acquire_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::acquire_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::relaxed_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::relaxed_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::release_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::release_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::acqrel_seqcst:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::seqcst_seqcst:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::acqrel_acquire:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::acqrel_relaxed:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::acquire_seqcst:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::relaxed_seqcst:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::release_seqcst:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::seqcst_acquire:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::seqcst_relaxed:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::acquire_acquire:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::acquire_relaxed:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::relaxed_acquire:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::relaxed_relaxed:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::release_acquire:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::release_relaxed:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::acqrel_seqcst:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::seqcst_seqcst:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::acqrel_acquire:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::acqrel_relaxed:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::acquire_seqcst:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::relaxed_seqcst:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::release_seqcst:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::seqcst_acquire:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::seqcst_relaxed:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::acquire_acquire:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::acquire_relaxed:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::relaxed_acquire:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::relaxed_relaxed:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::release_acquire:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::release_relaxed:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::bool::acqrel_seqcst:
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        beq               a1, a2, 0f
        beqz              a2, 1f
        li                a2, 0x1
        sll               a2, a2, a0
        amoor.w.aqrl      a2, a2, (a3)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        li                a2, 0x0
        sll               a2, a2, a0
        amoor.w.aqrl      a2, a2, (a3)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        li                a4, 0xff
        sll               a4, a4, a0
        not               a4, a4
        sll               a2, a2, a0
        or                a2, a2, a4
        amoand.w.aqrl     a2, a2, (a3)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::seqcst_seqcst:
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        beq               a1, a2, 0f
        beqz              a2, 1f
        li                a2, 0x1
        sll               a2, a2, a0
        amoor.w.aqrl      a2, a2, (a3)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        li                a2, 0x0
        sll               a2, a2, a0
        amoor.w.aqrl      a2, a2, (a3)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        li                a4, 0xff
        sll               a4, a4, a0
        not               a4, a4
        sll               a2, a2, a0
        or                a2, a2, a4
        amoand.w.aqrl     a2, a2, (a3)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::acqrel_acquire:
        li                a3, 0x3
        li                a4, 0x2
0:
        auipc             t1, 0x0
        jr                t0b

asm_test::compare_exchange_weak::bool::acqrel_relaxed:
        li                a3, 0x3
        li                a4, 0x0
0:
        auipc             t1, 0x0
        jr                t0b

asm_test::compare_exchange_weak::bool::acquire_seqcst:
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        beq               a1, a2, 0f
        beqz              a2, 1f
        li                a2, 0x1
        sll               a2, a2, a0
        amoor.w.aqrl      a2, a2, (a3)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        li                a2, 0x0
        sll               a2, a2, a0
        amoor.w.aqrl      a2, a2, (a3)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        li                a4, 0xff
        sll               a4, a4, a0
        not               a4, a4
        sll               a2, a2, a0
        or                a2, a2, a4
        amoand.w.aqrl     a2, a2, (a3)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::relaxed_seqcst:
        li                a4, 0x4
        li                a3, 0x0
0:
        auipc             t1, 0x0
        jr                t0b

asm_test::compare_exchange_weak::bool::release_seqcst:
        li                a3, 0x1
        li                a4, 0x4
0:
        auipc             t1, 0x0
        jr                t0b

asm_test::compare_exchange_weak::bool::seqcst_acquire:
        li                a3, 0x4
        li                a4, 0x2
0:
        auipc             t1, 0x0
        jr                t0b

asm_test::compare_exchange_weak::bool::seqcst_relaxed:
        li                a3, 0x4
        li                a4, 0x0
0:
        auipc             t1, 0x0
        jr                t0b

asm_test::compare_exchange_weak::bool::acquire_acquire:
        li                a3, 0x2
        li                a4, 0x2
0:
        auipc             t1, 0x0
        jr                t0b

asm_test::compare_exchange_weak::bool::acquire_relaxed:
        li                a3, 0x2
        li                a4, 0x0
0:
        auipc             t1, 0x0
        jr                t0b

asm_test::compare_exchange_weak::bool::relaxed_acquire:
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        beq               a1, a2, 0f
        beqz              a2, 1f
        li                a2, 0x1
        sll               a2, a2, a0
        amoor.w.aq        a2, a2, (a3)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        li                a2, 0x0
        sll               a2, a2, a0
        amoor.w.aq        a2, a2, (a3)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        li                a4, 0xff
        sll               a4, a4, a0
        not               a4, a4
        sll               a2, a2, a0
        or                a2, a2, a4
        amoand.w.aq       a2, a2, (a3)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::relaxed_relaxed:
        li                a3, 0x0
        li                a4, 0x0
0:
        auipc             t1, 0x0
        jr                t0b

asm_test::compare_exchange_weak::bool::release_acquire:
        andi              a3, a0, -0x4
        slli              a0, a0, 0x3
        beq               a1, a2, 0f
        beqz              a2, 1f
        li                a2, 0x1
        sll               a2, a2, a0
        amoor.w.aqrl      a2, a2, (a3)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        li                a2, 0x0
        sll               a2, a2, a0
        amoor.w.aqrl      a2, a2, (a3)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        li                a4, 0xff
        sll               a4, a4, a0
        not               a4, a4
        sll               a2, a2, a0
        or                a2, a2, a4
        amoand.w.aqrl     a2, a2, (a3)
        srl               a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::release_relaxed:
        li                a3, 0x1
        li                a4, 0x0
0:
        auipc             t1, 0x0
        jr                t0b

asm_test::or::u8::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoor.w.aqrl      a0, a0, (a2)
        ret

asm_test::or::u8::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoor.w.aqrl      a0, a0, (a2)
        ret

asm_test::or::u8::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoor.w.aq        a0, a0, (a2)
        ret

asm_test::or::u8::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoor.w           a0, a0, (a2)
        ret

asm_test::or::u8::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoor.w.rl        a0, a0, (a2)
        ret

asm_test::or::u16::acqrel:
        andi              a2, a0, -0x3
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoor.w.aqrl      a0, a0, (a2)
        ret

asm_test::or::u16::seqcst:
        andi              a2, a0, -0x3
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoor.w.aqrl      a0, a0, (a2)
        ret

asm_test::or::u16::acquire:
        andi              a2, a0, -0x3
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoor.w.aq        a0, a0, (a2)
        ret

asm_test::or::u16::relaxed:
        andi              a2, a0, -0x3
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoor.w           a0, a0, (a2)
        ret

asm_test::or::u16::release:
        andi              a2, a0, -0x3
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoor.w.rl        a0, a0, (a2)
        ret

asm_test::or::u32::acqrel:
        amoor.w.aqrl      a0, a1, (a0)
        ret

asm_test::or::u32::seqcst:
        amoor.w.aqrl      a0, a1, (a0)
        ret

asm_test::or::u32::acquire:
        amoor.w.aq        a0, a1, (a0)
        ret

asm_test::or::u32::relaxed:
        amoor.w           a0, a1, (a0)
        ret

asm_test::or::u32::release:
        amoor.w.rl        a0, a1, (a0)
        ret

asm_test::add::u8::acqrel:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        add               a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              mstatus, a2
        ret

asm_test::add::u8::seqcst:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        add               a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              mstatus, a2
        ret

asm_test::add::u8::acquire:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        add               a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              mstatus, a2
        ret

asm_test::add::u8::relaxed:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        add               a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              mstatus, a2
        ret

asm_test::add::u8::release:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        add               a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              mstatus, a2
        ret

asm_test::add::u16::acqrel:
        csrrci            a2, mstatus, 0x8
        lh                a3, 0x0(a0)
        add               a1, a3, a1
        sh                a1, 0x0(a0)
        csrw              mstatus, a2
        ret

asm_test::add::u16::seqcst:
        csrrci            a2, mstatus, 0x8
        lh                a3, 0x0(a0)
        add               a1, a3, a1
        sh                a1, 0x0(a0)
        csrw              mstatus, a2
        ret

asm_test::add::u16::acquire:
        csrrci            a2, mstatus, 0x8
        lh                a3, 0x0(a0)
        add               a1, a3, a1
        sh                a1, 0x0(a0)
        csrw              mstatus, a2
        ret

asm_test::add::u16::relaxed:
        csrrci            a2, mstatus, 0x8
        lh                a3, 0x0(a0)
        add               a1, a3, a1
        sh                a1, 0x0(a0)
        csrw              mstatus, a2
        ret

asm_test::add::u16::release:
        csrrci            a2, mstatus, 0x8
        lh                a3, 0x0(a0)
        add               a1, a3, a1
        sh                a1, 0x0(a0)
        csrw              mstatus, a2
        ret

asm_test::add::u32::acqrel:
        amoadd.w.aqrl     a0, a1, (a0)
        ret

asm_test::add::u32::seqcst:
        amoadd.w.aqrl     a0, a1, (a0)
        ret

asm_test::add::u32::acquire:
        amoadd.w.aq       a0, a1, (a0)
        ret

asm_test::add::u32::relaxed:
        amoadd.w          a0, a1, (a0)
        ret

asm_test::add::u32::release:
        amoadd.w.rl       a0, a1, (a0)
        ret

asm_test::and::u8::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        not               a3, a3
        sll               a0, a1, a0
        or                a0, a0, a3
        amoand.w.aqrl     a0, a0, (a2)
        ret

asm_test::and::u8::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        not               a3, a3
        sll               a0, a1, a0
        or                a0, a0, a3
        amoand.w.aqrl     a0, a0, (a2)
        ret

asm_test::and::u8::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        not               a3, a3
        sll               a0, a1, a0
        or                a0, a0, a3
        amoand.w.aq       a0, a0, (a2)
        ret

asm_test::and::u8::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        not               a3, a3
        sll               a0, a1, a0
        or                a0, a0, a3
        amoand.w          a0, a0, (a2)
        ret

asm_test::and::u8::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        not               a3, a3
        sll               a0, a1, a0
        or                a0, a0, a3
        amoand.w.rl       a0, a0, (a2)
        ret

asm_test::and::u16::acqrel:
        andi              a2, a0, -0x3
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        not               a3, a3
        sll               a0, a1, a0
        or                a0, a0, a3
        amoand.w.aqrl     a0, a0, (a2)
        ret

asm_test::and::u16::seqcst:
        andi              a2, a0, -0x3
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        not               a3, a3
        sll               a0, a1, a0
        or                a0, a0, a3
        amoand.w.aqrl     a0, a0, (a2)
        ret

asm_test::and::u16::acquire:
        andi              a2, a0, -0x3
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        not               a3, a3
        sll               a0, a1, a0
        or                a0, a0, a3
        amoand.w.aq       a0, a0, (a2)
        ret

asm_test::and::u16::relaxed:
        andi              a2, a0, -0x3
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        not               a3, a3
        sll               a0, a1, a0
        or                a0, a0, a3
        amoand.w          a0, a0, (a2)
        ret

asm_test::and::u16::release:
        andi              a2, a0, -0x3
        slli              a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sll               a3, a3, a0
        not               a3, a3
        sll               a0, a1, a0
        or                a0, a0, a3
        amoand.w.rl       a0, a0, (a2)
        ret

asm_test::and::u32::acqrel:
        amoand.w.aqrl     a0, a1, (a0)
        ret

asm_test::and::u32::seqcst:
        amoand.w.aqrl     a0, a1, (a0)
        ret

asm_test::and::u32::acquire:
        amoand.w.aq       a0, a1, (a0)
        ret

asm_test::and::u32::relaxed:
        amoand.w          a0, a1, (a0)
        ret

asm_test::and::u32::release:
        amoand.w.rl       a0, a1, (a0)
        ret

asm_test::neg::u8::acqrel:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        neg               a2, a2
        sb                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::neg::u8::seqcst:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        neg               a2, a2
        sb                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::neg::u8::acquire:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        neg               a2, a2
        sb                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::neg::u8::relaxed:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        neg               a2, a2
        sb                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::neg::u8::release:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        neg               a2, a2
        sb                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::neg::u16::acqrel:
        csrrci            a1, mstatus, 0x8
        lh                a2, 0x0(a0)
        neg               a2, a2
        sh                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::neg::u16::seqcst:
        csrrci            a1, mstatus, 0x8
        lh                a2, 0x0(a0)
        neg               a2, a2
        sh                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::neg::u16::acquire:
        csrrci            a1, mstatus, 0x8
        lh                a2, 0x0(a0)
        neg               a2, a2
        sh                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::neg::u16::relaxed:
        csrrci            a1, mstatus, 0x8
        lh                a2, 0x0(a0)
        neg               a2, a2
        sh                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::neg::u16::release:
        csrrci            a1, mstatus, 0x8
        lh                a2, 0x0(a0)
        neg               a2, a2
        sh                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::neg::u32::acqrel:
        csrrci            a1, mstatus, 0x8
        lw                a2, 0x0(a0)
        neg               a2, a2
        sw                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::neg::u32::seqcst:
        csrrci            a1, mstatus, 0x8
        lw                a2, 0x0(a0)
        neg               a2, a2
        sw                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::neg::u32::acquire:
        csrrci            a1, mstatus, 0x8
        lw                a2, 0x0(a0)
        neg               a2, a2
        sw                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::neg::u32::relaxed:
        csrrci            a1, mstatus, 0x8
        lw                a2, 0x0(a0)
        neg               a2, a2
        sw                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::neg::u32::release:
        csrrci            a1, mstatus, 0x8
        lw                a2, 0x0(a0)
        neg               a2, a2
        sw                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::not::u8::acqrel:
        andi              a1, a0, -0x4
        slli              a0, a0, 0x3
        li                a2, 0xff
        sll               a0, a2, a0
        amoxor.w.aqrl     a0, a0, (a1)
        ret

asm_test::not::u8::seqcst:
        andi              a1, a0, -0x4
        slli              a0, a0, 0x3
        li                a2, 0xff
        sll               a0, a2, a0
        amoxor.w.aqrl     a0, a0, (a1)
        ret

asm_test::not::u8::acquire:
        andi              a1, a0, -0x4
        slli              a0, a0, 0x3
        li                a2, 0xff
        sll               a0, a2, a0
        amoxor.w.aq       a0, a0, (a1)
        ret

asm_test::not::u8::relaxed:
        andi              a1, a0, -0x4
        slli              a0, a0, 0x3
        li                a2, 0xff
        sll               a0, a2, a0
        amoxor.w          a0, a0, (a1)
        ret

asm_test::not::u8::release:
        andi              a1, a0, -0x4
        slli              a0, a0, 0x3
        li                a2, 0xff
        sll               a0, a2, a0
        amoxor.w.rl       a0, a0, (a1)
        ret

asm_test::not::u16::acqrel:
        andi              a1, a0, -0x3
        slli              a0, a0, 0x3
        lui               a2, 0x10
        addi              a2, a2, -0x1
        sll               a0, a2, a0
        amoxor.w.aqrl     a0, a0, (a1)
        ret

asm_test::not::u16::seqcst:
        andi              a1, a0, -0x3
        slli              a0, a0, 0x3
        lui               a2, 0x10
        addi              a2, a2, -0x1
        sll               a0, a2, a0
        amoxor.w.aqrl     a0, a0, (a1)
        ret

asm_test::not::u16::acquire:
        andi              a1, a0, -0x3
        slli              a0, a0, 0x3
        lui               a2, 0x10
        addi              a2, a2, -0x1
        sll               a0, a2, a0
        amoxor.w.aq       a0, a0, (a1)
        ret

asm_test::not::u16::relaxed:
        andi              a1, a0, -0x3
        slli              a0, a0, 0x3
        lui               a2, 0x10
        addi              a2, a2, -0x1
        sll               a0, a2, a0
        amoxor.w          a0, a0, (a1)
        ret

asm_test::not::u16::release:
        andi              a1, a0, -0x3
        slli              a0, a0, 0x3
        lui               a2, 0x10
        addi              a2, a2, -0x1
        sll               a0, a2, a0
        amoxor.w.rl       a0, a0, (a1)
        ret

asm_test::not::u32::acqrel:
        li                a1, -0x1
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::not::u32::seqcst:
        li                a1, -0x1
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::not::u32::acquire:
        li                a1, -0x1
        amoxor.w.aq       a0, a1, (a0)
        ret

asm_test::not::u32::relaxed:
        li                a1, -0x1
        amoxor.w          a0, a1, (a0)
        ret

asm_test::not::u32::release:
        li                a1, -0x1
        amoxor.w.rl       a0, a1, (a0)
        ret

asm_test::sub::u8::acqrel:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        sub               a3, a3, a1
        sb                a3, 0x0(a0)
        csrw              mstatus, a2
        ret

asm_test::sub::u8::seqcst:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        sub               a3, a3, a1
        sb                a3, 0x0(a0)
        csrw              mstatus, a2
        ret

asm_test::sub::u8::acquire:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        sub               a3, a3, a1
        sb                a3, 0x0(a0)
        csrw              mstatus, a2
        ret

asm_test::sub::u8::relaxed:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        sub               a3, a3, a1
        sb                a3, 0x0(a0)
        csrw              mstatus, a2
        ret

asm_test::sub::u8::release:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        sub               a3, a3, a1
        sb                a3, 0x0(a0)
        csrw              mstatus, a2
        ret

asm_test::sub::u16::acqrel:
        csrrci            a2, mstatus, 0x8
        lh                a3, 0x0(a0)
        sub               a3, a3, a1
        sh                a3, 0x0(a0)
        csrw              mstatus, a2
        ret

asm_test::sub::u16::seqcst:
        csrrci            a2, mstatus, 0x8
        lh                a3, 0x0(a0)
        sub               a3, a3, a1
        sh                a3, 0x0(a0)
        csrw              mstatus, a2
        ret

asm_test::sub::u16::acquire:
        csrrci            a2, mstatus, 0x8
        lh                a3, 0x0(a0)
        sub               a3, a3, a1
        sh                a3, 0x0(a0)
        csrw              mstatus, a2
        ret

asm_test::sub::u16::relaxed:
        csrrci            a2, mstatus, 0x8
        lh                a3, 0x0(a0)
        sub               a3, a3, a1
        sh                a3, 0x0(a0)
        csrw              mstatus, a2
        ret

asm_test::sub::u16::release:
        csrrci            a2, mstatus, 0x8
        lh                a3, 0x0(a0)
        sub               a3, a3, a1
        sh                a3, 0x0(a0)
        csrw              mstatus, a2
        ret

asm_test::sub::u32::acqrel:
        neg               a1, a1
        amoadd.w.aqrl     a0, a1, (a0)
        ret

asm_test::sub::u32::seqcst:
        neg               a1, a1
        amoadd.w.aqrl     a0, a1, (a0)
        ret

asm_test::sub::u32::acquire:
        neg               a1, a1
        amoadd.w.aq       a0, a1, (a0)
        ret

asm_test::sub::u32::relaxed:
        neg               a1, a1
        amoadd.w          a0, a1, (a0)
        ret

asm_test::sub::u32::release:
        neg               a1, a1
        amoadd.w.rl       a0, a1, (a0)
        ret

asm_test::xor::u8::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoxor.w.aqrl     a0, a0, (a2)
        ret

asm_test::xor::u8::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoxor.w.aqrl     a0, a0, (a2)
        ret

asm_test::xor::u8::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoxor.w.aq       a0, a0, (a2)
        ret

asm_test::xor::u8::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoxor.w          a0, a0, (a2)
        ret

asm_test::xor::u8::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoxor.w.rl       a0, a0, (a2)
        ret

asm_test::xor::u16::acqrel:
        andi              a2, a0, -0x3
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoxor.w.aqrl     a0, a0, (a2)
        ret

asm_test::xor::u16::seqcst:
        andi              a2, a0, -0x3
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoxor.w.aqrl     a0, a0, (a2)
        ret

asm_test::xor::u16::acquire:
        andi              a2, a0, -0x3
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoxor.w.aq       a0, a0, (a2)
        ret

asm_test::xor::u16::relaxed:
        andi              a2, a0, -0x3
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoxor.w          a0, a0, (a2)
        ret

asm_test::xor::u16::release:
        andi              a2, a0, -0x3
        slli              a0, a0, 0x3
        sll               a0, a1, a0
        amoxor.w.rl       a0, a0, (a2)
        ret

asm_test::xor::u32::acqrel:
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::xor::u32::seqcst:
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::xor::u32::acquire:
        amoxor.w.aq       a0, a1, (a0)
        ret

asm_test::xor::u32::relaxed:
        amoxor.w          a0, a1, (a0)
        ret

asm_test::xor::u32::release:
        amoxor.w.rl       a0, a1, (a0)
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

asm_test::load::bool::seqcst:
        fence             rw, rw
        lb                a0, 0x0(a0)
        fence             r, rw
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::load::bool::acquire:
        lb                a0, 0x0(a0)
        fence             r, rw
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::load::bool::relaxed:
        lb                a0, 0x0(a0)
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::swap::u8::acqrel:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u8::seqcst:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u8::acquire:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u8::relaxed:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u8::release:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u16::acqrel:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        sh                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u16::seqcst:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        sh                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u16::acquire:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        sh                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u16::relaxed:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        sh                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u16::release:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        sh                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
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

asm_test::swap::bool::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        beqz              a1, 0f
        li                a1, 0x1
        sll               a1, a1, a0
        amoor.w.aqrl      a1, a1, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret
0:
        li                a3, 0xff
        sll               a3, a3, a0
        not               a3, a3
        sll               a1, a1, a0
        or                a1, a1, a3
        amoand.w.aqrl     a1, a1, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::swap::bool::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        beqz              a1, 0f
        li                a1, 0x1
        sll               a1, a1, a0
        amoor.w.aqrl      a1, a1, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret
0:
        li                a3, 0xff
        sll               a3, a3, a0
        not               a3, a3
        sll               a1, a1, a0
        or                a1, a1, a3
        amoand.w.aqrl     a1, a1, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::swap::bool::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        beqz              a1, 0f
        li                a1, 0x1
        sll               a1, a1, a0
        amoor.w.aq        a1, a1, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret
0:
        li                a3, 0xff
        sll               a3, a3, a0
        not               a3, a3
        sll               a1, a1, a0
        or                a1, a1, a3
        amoand.w.aq       a1, a1, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::swap::bool::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        beqz              a1, 0f
        li                a1, 0x1
        sll               a1, a1, a0
        amoor.w           a1, a1, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret
0:
        li                a3, 0xff
        sll               a3, a3, a0
        not               a3, a3
        sll               a1, a1, a0
        or                a1, a1, a3
        amoand.w          a1, a1, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::swap::bool::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        beqz              a1, 0f
        li                a1, 0x1
        sll               a1, a1, a0
        amoor.w.rl        a1, a1, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret
0:
        li                a3, 0xff
        sll               a3, a3, a0
        not               a3, a3
        sll               a1, a1, a0
        or                a1, a1, a3
        amoand.w.rl       a1, a1, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
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
        andi              a2, a0, -0x3
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoor.w.aqrl      a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_or::u16::seqcst:
        andi              a2, a0, -0x3
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoor.w.aqrl      a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_or::u16::acquire:
        andi              a2, a0, -0x3
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoor.w.aq        a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_or::u16::relaxed:
        andi              a2, a0, -0x3
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoor.w           a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_or::u16::release:
        andi              a2, a0, -0x3
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

asm_test::fetch_or::bool::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoor.w.aqrl      a1, a1, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_or::bool::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoor.w.aqrl      a1, a1, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_or::bool::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoor.w.aq        a1, a1, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_or::bool::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoor.w           a1, a1, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_or::bool::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoor.w.rl        a1, a1, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_add::u8::acqrel:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        add               a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u8::seqcst:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        add               a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u8::acquire:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        add               a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u8::relaxed:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        add               a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u8::release:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        add               a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u16::acqrel:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        add               a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u16::seqcst:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        add               a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u16::acquire:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        add               a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u16::relaxed:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        add               a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u16::release:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        add               a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
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
        andi              a2, a0, -0x3
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
        andi              a2, a0, -0x3
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
        andi              a2, a0, -0x3
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
        andi              a2, a0, -0x3
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
        andi              a2, a0, -0x3
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

asm_test::fetch_and::bool::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        not               a3, a3
        sll               a1, a1, a0
        or                a1, a1, a3
        amoand.w.aqrl     a1, a1, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_and::bool::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        not               a3, a3
        sll               a1, a1, a0
        or                a1, a1, a3
        amoand.w.aqrl     a1, a1, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_and::bool::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        not               a3, a3
        sll               a1, a1, a0
        or                a1, a1, a3
        amoand.w.aq       a1, a1, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_and::bool::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        not               a3, a3
        sll               a1, a1, a0
        or                a1, a1, a3
        amoand.w          a1, a1, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_and::bool::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a0
        not               a3, a3
        sll               a1, a1, a0
        or                a1, a1, a3
        amoand.w.rl       a1, a1, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_max::i8::acqrel:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lb                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_max::i8::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lb                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_max::i8::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lb                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_max::i8::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lb                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_max::i8::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lb                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_max::i16::acqrel:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lh                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_max::i16::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lh                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_max::i16::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lh                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_max::i16::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lh                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_max::i16::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lh                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              mstatus, a3
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
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lb                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_min::i8::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lb                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_min::i8::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lb                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_min::i8::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lb                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_min::i8::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lb                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_min::i16::acqrel:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lh                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_min::i16::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lh                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_min::i16::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lh                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_min::i16::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lh                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              mstatus, a3
        ret

asm_test::fetch_min::i16::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lh                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              mstatus, a3
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
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        neg               a3, a1
        sb                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u8::seqcst:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        neg               a3, a1
        sb                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u8::acquire:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        neg               a3, a1
        sb                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u8::relaxed:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        neg               a3, a1
        sb                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u8::release:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        neg               a3, a1
        sb                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u16::acqrel:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        neg               a3, a1
        sh                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u16::seqcst:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        neg               a3, a1
        sh                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u16::acquire:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        neg               a3, a1
        sh                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u16::relaxed:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        neg               a3, a1
        sh                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u16::release:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        neg               a3, a1
        sh                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u32::acqrel:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        neg               a3, a1
        sw                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u32::seqcst:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        neg               a3, a1
        sw                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u32::acquire:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        neg               a3, a1
        sw                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u32::relaxed:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        neg               a3, a1
        sw                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u32::release:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        neg               a3, a1
        sw                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
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
        andi              a1, a0, -0x3
        slli              a0, a0, 0x3
        lui               a2, 0x10
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        amoxor.w.aqrl     a1, a2, (a1)
        srl               a0, a1, a0
        ret

asm_test::fetch_not::u16::seqcst:
        andi              a1, a0, -0x3
        slli              a0, a0, 0x3
        lui               a2, 0x10
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        amoxor.w.aqrl     a1, a2, (a1)
        srl               a0, a1, a0
        ret

asm_test::fetch_not::u16::acquire:
        andi              a1, a0, -0x3
        slli              a0, a0, 0x3
        lui               a2, 0x10
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        amoxor.w.aq       a1, a2, (a1)
        srl               a0, a1, a0
        ret

asm_test::fetch_not::u16::relaxed:
        andi              a1, a0, -0x3
        slli              a0, a0, 0x3
        lui               a2, 0x10
        addi              a2, a2, -0x1
        sll               a2, a2, a0
        amoxor.w          a1, a2, (a1)
        srl               a0, a1, a0
        ret

asm_test::fetch_not::u16::release:
        andi              a1, a0, -0x3
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

asm_test::fetch_not::bool::acqrel:
        andi              a1, a0, -0x4
        slli              a0, a0, 0x3
        li                a2, 0x1
        sll               a2, a2, a0
        amoxor.w.aqrl     a1, a2, (a1)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_not::bool::seqcst:
        andi              a1, a0, -0x4
        slli              a0, a0, 0x3
        li                a2, 0x1
        sll               a2, a2, a0
        amoxor.w.aqrl     a1, a2, (a1)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_not::bool::acquire:
        andi              a1, a0, -0x4
        slli              a0, a0, 0x3
        li                a2, 0x1
        sll               a2, a2, a0
        amoxor.w.aq       a1, a2, (a1)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_not::bool::relaxed:
        andi              a1, a0, -0x4
        slli              a0, a0, 0x3
        li                a2, 0x1
        sll               a2, a2, a0
        amoxor.w          a1, a2, (a1)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_not::bool::release:
        andi              a1, a0, -0x4
        slli              a0, a0, 0x3
        li                a2, 0x1
        sll               a2, a2, a0
        amoxor.w.rl       a1, a2, (a1)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_sub::u8::acqrel:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sub               a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u8::seqcst:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sub               a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u8::acquire:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sub               a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u8::relaxed:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sub               a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u8::release:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sub               a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u16::acqrel:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        sub               a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u16::seqcst:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        sub               a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u16::acquire:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        sub               a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u16::relaxed:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        sub               a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u16::release:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        sub               a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
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
        andi              a2, a0, -0x3
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoxor.w.aqrl     a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_xor::u16::seqcst:
        andi              a2, a0, -0x3
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoxor.w.aqrl     a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_xor::u16::acquire:
        andi              a2, a0, -0x3
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoxor.w.aq       a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_xor::u16::relaxed:
        andi              a2, a0, -0x3
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoxor.w          a1, a1, (a2)
        srl               a0, a1, a0
        ret

asm_test::fetch_xor::u16::release:
        andi              a2, a0, -0x3
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

asm_test::fetch_xor::bool::acqrel:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoxor.w.aqrl     a1, a1, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_xor::bool::seqcst:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoxor.w.aqrl     a1, a1, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_xor::bool::acquire:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoxor.w.aq       a1, a1, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_xor::bool::relaxed:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoxor.w          a1, a1, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_xor::bool::release:
        andi              a2, a0, -0x4
        slli              a0, a0, 0x3
        sll               a1, a1, a0
        amoxor.w.rl       a1, a1, (a2)
        srl               a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret


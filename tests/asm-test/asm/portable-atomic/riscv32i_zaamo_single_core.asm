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
        sll               a5, a5, a0
        not               a5, a5
        sll               a2, a2, a0
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
        and               a0, a1, a0
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
        and               a0, a1, a0
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
        and               a0, a1, a0
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
        and               a0, a1, a0
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
        and               a0, a1, a0
        snez              a0, a0
        ret

asm_test::bit_toggle::u16::acqrel:
        andi              a1, a1, 0xf
        li                a2, 0x1
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a3, a1, a2
        amoxor.w.aqrl     a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a1, a0
        snez              a0, a0
        ret

asm_test::bit_toggle::u16::seqcst:
        andi              a1, a1, 0xf
        li                a2, 0x1
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a3, a1, a2
        amoxor.w.aqrl     a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a1, a0
        snez              a0, a0
        ret

asm_test::bit_toggle::u16::acquire:
        andi              a1, a1, 0xf
        li                a2, 0x1
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a3, a1, a2
        amoxor.w.aq       a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a1, a0
        snez              a0, a0
        ret

asm_test::bit_toggle::u16::relaxed:
        andi              a1, a1, 0xf
        li                a2, 0x1
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a3, a1, a2
        amoxor.w          a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a1, a0
        snez              a0, a0
        ret

asm_test::bit_toggle::u16::release:
        andi              a1, a1, 0xf
        li                a2, 0x1
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a3, a1, a2
        amoxor.w.rl       a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a1, a0
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

asm_test::fetch_nand::u8::acqrel_all:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sb                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_nand::u8::seqcst_all:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sb                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_nand::u8::acqrel_zero:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        li                a3, -0x1
        sb                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_nand::u8::acquire_all:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sb                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_nand::u8::relaxed_all:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sb                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_nand::u8::release_all:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sb                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_nand::u8::seqcst_zero:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        li                a3, -0x1
        sb                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_nand::u8::acquire_zero:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        li                a3, -0x1
        sb                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_nand::u8::relaxed_zero:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        li                a3, -0x1
        sb                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_nand::u8::release_zero:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        li                a3, -0x1
        sb                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_nand::u8::acqrel:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        not               a1, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u8::seqcst:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        not               a1, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u8::acquire:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        not               a1, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u8::relaxed:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        not               a1, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u8::release:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        not               a1, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u16::acqrel_all:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sh                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_nand::u16::seqcst_all:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sh                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_nand::u16::acqrel_zero:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        li                a3, -0x1
        sh                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_nand::u16::acquire_all:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sh                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_nand::u16::relaxed_all:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sh                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_nand::u16::release_all:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sh                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_nand::u16::seqcst_zero:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        li                a3, -0x1
        sh                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_nand::u16::acquire_zero:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        li                a3, -0x1
        sh                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_nand::u16::relaxed_zero:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        li                a3, -0x1
        sh                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_nand::u16::release_zero:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        li                a3, -0x1
        sh                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_nand::u16::acqrel:
        csrrci            a3, mstatus, 0x8
        lhu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        not               a1, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u16::seqcst:
        csrrci            a3, mstatus, 0x8
        lhu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        not               a1, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u16::acquire:
        csrrci            a3, mstatus, 0x8
        lhu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        not               a1, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u16::relaxed:
        csrrci            a3, mstatus, 0x8
        lhu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        not               a1, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u16::release:
        csrrci            a3, mstatus, 0x8
        lhu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        not               a1, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u32::acqrel_all:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sw                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_nand::u32::seqcst_all:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sw                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_nand::u32::acqrel_zero:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        li                a3, -0x1
        sw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_nand::u32::acquire_all:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sw                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_nand::u32::relaxed_all:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sw                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_nand::u32::release_all:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sw                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_nand::u32::seqcst_zero:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        li                a3, -0x1
        sw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_nand::u32::acquire_zero:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        li                a3, -0x1
        sw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_nand::u32::relaxed_zero:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        li                a3, -0x1
        sw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_nand::u32::release_zero:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        li                a3, -0x1
        sw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_nand::u32::acqrel:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        not               a1, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u32::seqcst:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        not               a1, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u32::acquire:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        not               a1, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u32::relaxed:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        not               a1, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u32::release:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        not               a1, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::bool::acqrel_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_nand::bool::seqcst_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_nand::bool::acqrel_false:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_nand::bool::acquire_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aq       a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_nand::bool::relaxed_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w          a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_nand::bool::release_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.rl       a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_nand::bool::seqcst_false:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_nand::bool::acquire_false:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_nand::bool::relaxed_false:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w           a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_nand::bool::release_false:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.rl        a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_nand::bool::acqrel:
        slli              a2, a0, 0x3
        li                a3, 0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a2
        beqz              a1, 0f
        amoxor.w.aqrl     a0, a3, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret
0:
        amoor.w.aqrl      a0, a3, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_nand::bool::seqcst:
        slli              a2, a0, 0x3
        li                a3, 0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a2
        beqz              a1, 0f
        amoxor.w.aqrl     a0, a3, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret
0:
        amoor.w.aqrl      a0, a3, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_nand::bool::acquire:
        slli              a2, a0, 0x3
        li                a3, 0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a2
        beqz              a1, 0f
        amoxor.w.aq       a0, a3, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret
0:
        amoor.w.aq        a0, a3, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_nand::bool::relaxed:
        slli              a2, a0, 0x3
        li                a3, 0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a2
        beqz              a1, 0f
        amoxor.w          a0, a3, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret
0:
        amoor.w           a0, a3, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_nand::bool::release:
        slli              a2, a0, 0x3
        li                a3, 0x1
        andi              a0, a0, -0x4
        sll               a3, a3, a2
        beqz              a1, 0f
        amoxor.w.rl       a0, a3, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret
0:
        amoor.w.rl        a0, a3, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_umax::u8::acqrel:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lbu               a0, 0x0(a0)
        mv                a4, a0
        bltu              a1, a0, 0f
        mv                a4, a1
0:
        sb                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umax::u8::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lbu               a0, 0x0(a0)
        mv                a4, a0
        bltu              a1, a0, 0f
        mv                a4, a1
0:
        sb                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umax::u8::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lbu               a0, 0x0(a0)
        mv                a4, a0
        bltu              a1, a0, 0f
        mv                a4, a1
0:
        sb                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umax::u8::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lbu               a0, 0x0(a0)
        mv                a4, a0
        bltu              a1, a0, 0f
        mv                a4, a1
0:
        sb                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umax::u8::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lbu               a0, 0x0(a0)
        mv                a4, a0
        bltu              a1, a0, 0f
        mv                a4, a1
0:
        sb                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umax::u16::acqrel:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lhu               a0, 0x0(a0)
        mv                a4, a0
        bltu              a1, a0, 0f
        mv                a4, a1
0:
        sh                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umax::u16::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lhu               a0, 0x0(a0)
        mv                a4, a0
        bltu              a1, a0, 0f
        mv                a4, a1
0:
        sh                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umax::u16::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lhu               a0, 0x0(a0)
        mv                a4, a0
        bltu              a1, a0, 0f
        mv                a4, a1
0:
        sh                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umax::u16::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lhu               a0, 0x0(a0)
        mv                a4, a0
        bltu              a1, a0, 0f
        mv                a4, a1
0:
        sh                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umax::u16::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lhu               a0, 0x0(a0)
        mv                a4, a0
        bltu              a1, a0, 0f
        mv                a4, a1
0:
        sh                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
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
        mv                a4, a0
        bltu              a0, a1, 0f
        mv                a4, a1
0:
        sb                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u8::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lbu               a0, 0x0(a0)
        mv                a4, a0
        bltu              a0, a1, 0f
        mv                a4, a1
0:
        sb                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u8::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lbu               a0, 0x0(a0)
        mv                a4, a0
        bltu              a0, a1, 0f
        mv                a4, a1
0:
        sb                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u8::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lbu               a0, 0x0(a0)
        mv                a4, a0
        bltu              a0, a1, 0f
        mv                a4, a1
0:
        sb                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u8::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lbu               a0, 0x0(a0)
        mv                a4, a0
        bltu              a0, a1, 0f
        mv                a4, a1
0:
        sb                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u16::acqrel:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lhu               a0, 0x0(a0)
        mv                a4, a0
        bltu              a0, a1, 0f
        mv                a4, a1
0:
        sh                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u16::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lhu               a0, 0x0(a0)
        mv                a4, a0
        bltu              a0, a1, 0f
        mv                a4, a1
0:
        sh                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u16::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lhu               a0, 0x0(a0)
        mv                a4, a0
        bltu              a0, a1, 0f
        mv                a4, a1
0:
        sh                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u16::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lhu               a0, 0x0(a0)
        mv                a4, a0
        bltu              a0, a1, 0f
        mv                a4, a1
0:
        sh                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u16::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lhu               a0, 0x0(a0)
        mv                a4, a0
        bltu              a0, a1, 0f
        mv                a4, a1
0:
        sh                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
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
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::seqcst_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::acqrel_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::acqrel_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::acquire_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::relaxed_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::release_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::seqcst_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::seqcst_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::acquire_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::acquire_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::relaxed_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::relaxed_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::release_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::release_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::f32::acqrel_seqcst:
        csrrci            a4, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        sw                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::f32::seqcst_seqcst:
        csrrci            a4, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        sw                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::f32::acqrel_acquire:
        csrrci            a4, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        sw                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::f32::acqrel_relaxed:
        csrrci            a4, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        sw                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::f32::acquire_seqcst:
        csrrci            a4, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        sw                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::f32::relaxed_seqcst:
        csrrci            a4, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        sw                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::f32::release_seqcst:
        csrrci            a4, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        sw                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::f32::seqcst_acquire:
        csrrci            a4, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        sw                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::f32::seqcst_relaxed:
        csrrci            a4, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        sw                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::f32::acquire_acquire:
        csrrci            a4, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        sw                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::f32::acquire_relaxed:
        csrrci            a4, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        sw                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::f32::relaxed_acquire:
        csrrci            a4, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        sw                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::f32::relaxed_relaxed:
        csrrci            a4, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        sw                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::f32::release_acquire:
        csrrci            a4, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        sw                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::f32::release_relaxed:
        csrrci            a4, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        sw                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::acqrel_seqcst:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::seqcst_seqcst:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::acqrel_acquire:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::acqrel_relaxed:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::acquire_seqcst:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::relaxed_seqcst:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::release_seqcst:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::seqcst_acquire:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::seqcst_relaxed:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::acquire_acquire:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::acquire_relaxed:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::relaxed_acquire:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::relaxed_relaxed:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::release_acquire:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::release_relaxed:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::acqrel_seqcst:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::seqcst_seqcst:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::acqrel_acquire:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::acqrel_relaxed:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::acquire_seqcst:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::relaxed_seqcst:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::release_seqcst:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::seqcst_acquire:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::seqcst_relaxed:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::acquire_acquire:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::acquire_relaxed:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::relaxed_acquire:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::relaxed_relaxed:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::release_acquire:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::release_relaxed:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
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

asm_test::compare_exchange::bool::acqrel_seqcst_true_true:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a1, a0
        seqz              a0, a1
        snez              a1, a1
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_true_true:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a1, a0
        seqz              a0, a1
        snez              a1, a1
        ret

asm_test::compare_exchange::bool::acqrel_acquire_true_true:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a1, a0
        seqz              a0, a1
        snez              a1, a1
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_true_true:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a1, a0
        seqz              a0, a1
        snez              a1, a1
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_false_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_true_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a1, a0
        seqz              a0, a1
        snez              a1, a1
        ret

asm_test::compare_exchange::bool::acquire_seqcst_true_true:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a1, a0
        seqz              a0, a1
        snez              a1, a1
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_true_true:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a1, a0
        seqz              a0, a1
        snez              a1, a1
        ret

asm_test::compare_exchange::bool::release_seqcst_true_true:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a1, a0
        seqz              a0, a1
        snez              a1, a1
        ret

asm_test::compare_exchange::bool::seqcst_acquire_true_true:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a1, a0
        seqz              a0, a1
        snez              a1, a1
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_true_true:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a1, a0
        seqz              a0, a1
        snez              a1, a1
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_false_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_true_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a1, a0
        seqz              a0, a1
        snez              a1, a1
        ret

asm_test::compare_exchange::bool::acqrel_acquire_false_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acqrel_acquire_true_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a1, a0
        seqz              a0, a1
        snez              a1, a1
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_false_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_true_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a1, a0
        seqz              a0, a1
        snez              a1, a1
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_false_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acquire_acquire_true_true:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a1, a0
        seqz              a0, a1
        snez              a1, a1
        ret

asm_test::compare_exchange::bool::acquire_relaxed_true_true:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a1, a0
        seqz              a0, a1
        snez              a1, a1
        ret

asm_test::compare_exchange::bool::acquire_seqcst_false_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acquire_seqcst_true_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a1, a0
        seqz              a0, a1
        snez              a1, a1
        ret

asm_test::compare_exchange::bool::relaxed_acquire_true_true:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a1, a0
        seqz              a0, a1
        snez              a1, a1
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_true_true:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w           a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a1, a0
        seqz              a0, a1
        snez              a1, a1
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_false_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_true_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a1, a0
        seqz              a0, a1
        snez              a1, a1
        ret

asm_test::compare_exchange::bool::release_acquire_true_true:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a1, a0
        seqz              a0, a1
        snez              a1, a1
        ret

asm_test::compare_exchange::bool::release_relaxed_true_true:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.rl        a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a1, a0
        seqz              a0, a1
        snez              a1, a1
        ret

asm_test::compare_exchange::bool::release_seqcst_false_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::release_seqcst_true_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a1, a0
        seqz              a0, a1
        snez              a1, a1
        ret

asm_test::compare_exchange::bool::seqcst_acquire_false_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::seqcst_acquire_true_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a1, a0
        seqz              a0, a1
        snez              a1, a1
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_false_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_true_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a1, a0
        seqz              a0, a1
        snez              a1, a1
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_false_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acqrel_acquire_false_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_false_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acquire_acquire_false_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acquire_acquire_true_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aq       a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a1, a0
        seqz              a0, a1
        snez              a1, a1
        ret

asm_test::compare_exchange::bool::acquire_relaxed_false_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acquire_relaxed_true_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aq       a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a1, a0
        seqz              a0, a1
        snez              a1, a1
        ret

asm_test::compare_exchange::bool::acquire_seqcst_false_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::relaxed_acquire_false_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::relaxed_acquire_true_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aq       a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a1, a0
        seqz              a0, a1
        snez              a1, a1
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_false_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w           a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_true_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w          a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a1, a0
        seqz              a0, a1
        snez              a1, a1
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_false_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::release_acquire_false_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::release_acquire_true_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a1, a0
        seqz              a0, a1
        snez              a1, a1
        ret

asm_test::compare_exchange::bool::release_relaxed_false_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.rl        a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::release_relaxed_true_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.rl       a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a1, a0
        seqz              a0, a1
        snez              a1, a1
        ret

asm_test::compare_exchange::bool::release_seqcst_false_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::seqcst_acquire_false_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_false_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acquire_acquire_false_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acquire_relaxed_false_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::relaxed_acquire_false_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_false_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w           a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::release_acquire_false_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::release_relaxed_false_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.rl        a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange_weak::u8::acqrel_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::seqcst_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::acqrel_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::acqrel_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::acquire_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::relaxed_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::release_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::seqcst_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::seqcst_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::acquire_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::acquire_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::relaxed_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::relaxed_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::release_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::release_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f32::acqrel_seqcst:
        csrrci            a4, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        sw                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f32::seqcst_seqcst:
        csrrci            a4, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        sw                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f32::acqrel_acquire:
        csrrci            a4, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        sw                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f32::acqrel_relaxed:
        csrrci            a4, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        sw                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f32::acquire_seqcst:
        csrrci            a4, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        sw                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f32::relaxed_seqcst:
        csrrci            a4, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        sw                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f32::release_seqcst:
        csrrci            a4, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        sw                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f32::seqcst_acquire:
        csrrci            a4, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        sw                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f32::seqcst_relaxed:
        csrrci            a4, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        sw                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f32::acquire_acquire:
        csrrci            a4, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        sw                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f32::acquire_relaxed:
        csrrci            a4, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        sw                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f32::relaxed_acquire:
        csrrci            a4, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        sw                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f32::relaxed_relaxed:
        csrrci            a4, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        sw                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f32::release_acquire:
        csrrci            a4, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        sw                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f32::release_relaxed:
        csrrci            a4, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        sw                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::acqrel_seqcst:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::seqcst_seqcst:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::acqrel_acquire:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::acqrel_relaxed:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::acquire_seqcst:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::relaxed_seqcst:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::release_seqcst:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::seqcst_acquire:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::seqcst_relaxed:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::acquire_acquire:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::acquire_relaxed:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::relaxed_acquire:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::relaxed_relaxed:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::release_acquire:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::release_relaxed:
        csrrci            a5, mstatus, 0x8
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::acqrel_seqcst:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::seqcst_seqcst:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::acqrel_acquire:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::acqrel_relaxed:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::acquire_seqcst:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::relaxed_seqcst:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::release_seqcst:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::seqcst_acquire:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::seqcst_relaxed:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::acquire_acquire:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::acquire_relaxed:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::relaxed_acquire:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::relaxed_relaxed:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::release_acquire:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::release_relaxed:
        csrrci            a5, mstatus, 0x8
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        andi              a5, a5, 0x8
        csrs              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        andi              a5, a5, 0x8
        csrs              mstatus, a5
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

asm_test::or::u8::acqrel_all:
        li                a1, 0xff
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        ret

asm_test::or::u8::seqcst_all:
        li                a1, 0xff
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        ret

asm_test::or::u8::acqrel_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        ret

asm_test::or::u8::acquire_all:
        li                a1, 0xff
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        ret

asm_test::or::u8::relaxed_all:
        li                a1, 0xff
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w           a0, a1, (a0)
        ret

asm_test::or::u8::release_all:
        li                a1, 0xff
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.rl        a0, a1, (a0)
        ret

asm_test::or::u8::seqcst_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        ret

asm_test::or::u8::acquire_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        ret

asm_test::or::u8::relaxed_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w           a0, a1, (a0)
        ret

asm_test::or::u8::release_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.rl        a0, a1, (a0)
        ret

asm_test::or::u8::acqrel:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        ret

asm_test::or::u8::seqcst:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        ret

asm_test::or::u8::acquire:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        ret

asm_test::or::u8::relaxed:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w           a0, a1, (a0)
        ret

asm_test::or::u8::release:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.rl        a0, a1, (a0)
        ret

asm_test::or::u16::acqrel_all:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        ret

asm_test::or::u16::seqcst_all:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        ret

asm_test::or::u16::acqrel_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        ret

asm_test::or::u16::acquire_all:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        ret

asm_test::or::u16::relaxed_all:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoor.w           a0, a1, (a0)
        ret

asm_test::or::u16::release_all:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoor.w.rl        a0, a1, (a0)
        ret

asm_test::or::u16::seqcst_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        ret

asm_test::or::u16::acquire_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        ret

asm_test::or::u16::relaxed_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoor.w           a0, a1, (a0)
        ret

asm_test::or::u16::release_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoor.w.rl        a0, a1, (a0)
        ret

asm_test::or::u16::acqrel:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        ret

asm_test::or::u16::seqcst:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        ret

asm_test::or::u16::acquire:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        ret

asm_test::or::u16::relaxed:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoor.w           a0, a1, (a0)
        ret

asm_test::or::u16::release:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoor.w.rl        a0, a1, (a0)
        ret

asm_test::or::u32::acqrel_all:
        li                a1, -0x1
        amoor.w.aqrl      a0, a1, (a0)
        ret

asm_test::or::u32::seqcst_all:
        li                a1, -0x1
        amoor.w.aqrl      a0, a1, (a0)
        ret

asm_test::or::u32::acqrel_zero:
        li                a1, 0x0
        amoor.w.aqrl      a0, a1, (a0)
        ret

asm_test::or::u32::acquire_all:
        li                a1, -0x1
        amoor.w.aq        a0, a1, (a0)
        ret

asm_test::or::u32::relaxed_all:
        li                a1, -0x1
        amoor.w           a0, a1, (a0)
        ret

asm_test::or::u32::release_all:
        li                a1, -0x1
        amoor.w.rl        a0, a1, (a0)
        ret

asm_test::or::u32::seqcst_zero:
        li                a1, 0x0
        amoor.w.aqrl      a0, a1, (a0)
        ret

asm_test::or::u32::acquire_zero:
        li                a1, 0x0
        amoor.w.aq        a0, a1, (a0)
        ret

asm_test::or::u32::relaxed_zero:
        li                a1, 0x0
        amoor.w           a0, a1, (a0)
        ret

asm_test::or::u32::release_zero:
        li                a1, 0x0
        amoor.w.rl        a0, a1, (a0)
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

asm_test::or::bool::acqrel_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        ret

asm_test::or::bool::seqcst_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        ret

asm_test::or::bool::acqrel_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        ret

asm_test::or::bool::acquire_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        ret

asm_test::or::bool::relaxed_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w           a0, a1, (a0)
        ret

asm_test::or::bool::release_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.rl        a0, a1, (a0)
        ret

asm_test::or::bool::seqcst_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        ret

asm_test::or::bool::acquire_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        ret

asm_test::or::bool::relaxed_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w           a0, a1, (a0)
        ret

asm_test::or::bool::release_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.rl        a0, a1, (a0)
        ret

asm_test::or::bool::acqrel:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        ret

asm_test::or::bool::seqcst:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        ret

asm_test::or::bool::acquire:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        ret

asm_test::or::bool::relaxed:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w           a0, a1, (a0)
        ret

asm_test::or::bool::release:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.rl        a0, a1, (a0)
        ret

asm_test::add::u8::acqrel_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::add::u8::seqcst_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::add::u8::acquire_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::add::u8::relaxed_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::add::u8::release_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::add::u8::acqrel:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        add               a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::add::u8::seqcst:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        add               a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::add::u8::acquire:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        add               a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::add::u8::relaxed:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        add               a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::add::u8::release:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        add               a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::add::u16::acqrel_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::add::u16::seqcst_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::add::u16::acquire_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::add::u16::relaxed_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::add::u16::release_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::add::u16::acqrel:
        csrrci            a2, mstatus, 0x8
        lh                a3, 0x0(a0)
        andi              a2, a2, 0x8
        add               a1, a3, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::add::u16::seqcst:
        csrrci            a2, mstatus, 0x8
        lh                a3, 0x0(a0)
        andi              a2, a2, 0x8
        add               a1, a3, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::add::u16::acquire:
        csrrci            a2, mstatus, 0x8
        lh                a3, 0x0(a0)
        andi              a2, a2, 0x8
        add               a1, a3, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::add::u16::relaxed:
        csrrci            a2, mstatus, 0x8
        lh                a3, 0x0(a0)
        andi              a2, a2, 0x8
        add               a1, a3, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::add::u16::release:
        csrrci            a2, mstatus, 0x8
        lh                a3, 0x0(a0)
        andi              a2, a2, 0x8
        add               a1, a3, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::add::u32::acqrel_zero:
        li                a1, 0x0
        amoadd.w.aqrl     a0, a1, (a0)
        ret

asm_test::add::u32::seqcst_zero:
        li                a1, 0x0
        amoadd.w.aqrl     a0, a1, (a0)
        ret

asm_test::add::u32::acquire_zero:
        li                a1, 0x0
        amoadd.w.aq       a0, a1, (a0)
        ret

asm_test::add::u32::relaxed_zero:
        li                a1, 0x0
        amoadd.w          a0, a1, (a0)
        ret

asm_test::add::u32::release_zero:
        li                a1, 0x0
        amoadd.w.rl       a0, a1, (a0)
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

asm_test::and::u8::acqrel_all:
        li                a1, -0x1
        andi              a0, a0, -0x4
        amoand.w.aqrl     a0, a1, (a0)
        ret

asm_test::and::u8::seqcst_all:
        li                a1, -0x1
        andi              a0, a0, -0x4
        amoand.w.aqrl     a0, a1, (a0)
        ret

asm_test::and::u8::acqrel_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        ret

asm_test::and::u8::acquire_all:
        li                a1, -0x1
        andi              a0, a0, -0x4
        amoand.w.aq       a0, a1, (a0)
        ret

asm_test::and::u8::relaxed_all:
        li                a1, -0x1
        andi              a0, a0, -0x4
        amoand.w          a0, a1, (a0)
        ret

asm_test::and::u8::release_all:
        li                a1, -0x1
        andi              a0, a0, -0x4
        amoand.w.rl       a0, a1, (a0)
        ret

asm_test::and::u8::seqcst_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        ret

asm_test::and::u8::acquire_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aq       a0, a1, (a0)
        ret

asm_test::and::u8::relaxed_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w          a0, a1, (a0)
        ret

asm_test::and::u8::release_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.rl       a0, a1, (a0)
        ret

asm_test::and::u8::acqrel:
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        ret

asm_test::and::u8::seqcst:
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        ret

asm_test::and::u8::acquire:
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aq       a0, a1, (a0)
        ret

asm_test::and::u8::relaxed:
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w          a0, a1, (a0)
        ret

asm_test::and::u8::release:
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.rl       a0, a1, (a0)
        ret

asm_test::and::u16::acqrel_all:
        li                a1, -0x1
        andi              a0, a0, -0x3
        amoand.w.aqrl     a0, a1, (a0)
        ret

asm_test::and::u16::seqcst_all:
        li                a1, -0x1
        andi              a0, a0, -0x3
        amoand.w.aqrl     a0, a1, (a0)
        ret

asm_test::and::u16::acqrel_zero:
        li                a1, 0x0
        lui               a2, 0x10
        slli              a3, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a3
        not               a2, a2
        sll               a1, a1, a3
        andi              a0, a0, -0x3
        or                a1, a1, a2
        amoand.w.aqrl     a0, a1, (a0)
        ret

asm_test::and::u16::acquire_all:
        li                a1, -0x1
        andi              a0, a0, -0x3
        amoand.w.aq       a0, a1, (a0)
        ret

asm_test::and::u16::relaxed_all:
        li                a1, -0x1
        andi              a0, a0, -0x3
        amoand.w          a0, a1, (a0)
        ret

asm_test::and::u16::release_all:
        li                a1, -0x1
        andi              a0, a0, -0x3
        amoand.w.rl       a0, a1, (a0)
        ret

asm_test::and::u16::seqcst_zero:
        li                a1, 0x0
        lui               a2, 0x10
        slli              a3, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a3
        not               a2, a2
        sll               a1, a1, a3
        andi              a0, a0, -0x3
        or                a1, a1, a2
        amoand.w.aqrl     a0, a1, (a0)
        ret

asm_test::and::u16::acquire_zero:
        li                a1, 0x0
        lui               a2, 0x10
        slli              a3, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a3
        not               a2, a2
        sll               a1, a1, a3
        andi              a0, a0, -0x3
        or                a1, a1, a2
        amoand.w.aq       a0, a1, (a0)
        ret

asm_test::and::u16::relaxed_zero:
        li                a1, 0x0
        lui               a2, 0x10
        slli              a3, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a3
        not               a2, a2
        sll               a1, a1, a3
        andi              a0, a0, -0x3
        or                a1, a1, a2
        amoand.w          a0, a1, (a0)
        ret

asm_test::and::u16::release_zero:
        li                a1, 0x0
        lui               a2, 0x10
        slli              a3, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a3
        not               a2, a2
        sll               a1, a1, a3
        andi              a0, a0, -0x3
        or                a1, a1, a2
        amoand.w.rl       a0, a1, (a0)
        ret

asm_test::and::u16::acqrel:
        lui               a2, 0x10
        slli              a3, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a3
        not               a2, a2
        sll               a1, a1, a3
        andi              a0, a0, -0x3
        or                a1, a1, a2
        amoand.w.aqrl     a0, a1, (a0)
        ret

asm_test::and::u16::seqcst:
        lui               a2, 0x10
        slli              a3, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a3
        not               a2, a2
        sll               a1, a1, a3
        andi              a0, a0, -0x3
        or                a1, a1, a2
        amoand.w.aqrl     a0, a1, (a0)
        ret

asm_test::and::u16::acquire:
        lui               a2, 0x10
        slli              a3, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a3
        not               a2, a2
        sll               a1, a1, a3
        andi              a0, a0, -0x3
        or                a1, a1, a2
        amoand.w.aq       a0, a1, (a0)
        ret

asm_test::and::u16::relaxed:
        lui               a2, 0x10
        slli              a3, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a3
        not               a2, a2
        sll               a1, a1, a3
        andi              a0, a0, -0x3
        or                a1, a1, a2
        amoand.w          a0, a1, (a0)
        ret

asm_test::and::u16::release:
        lui               a2, 0x10
        slli              a3, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a3
        not               a2, a2
        sll               a1, a1, a3
        andi              a0, a0, -0x3
        or                a1, a1, a2
        amoand.w.rl       a0, a1, (a0)
        ret

asm_test::and::u32::acqrel_all:
        li                a1, -0x1
        amoand.w.aqrl     a0, a1, (a0)
        ret

asm_test::and::u32::seqcst_all:
        li                a1, -0x1
        amoand.w.aqrl     a0, a1, (a0)
        ret

asm_test::and::u32::acqrel_zero:
        li                a1, 0x0
        amoand.w.aqrl     a0, a1, (a0)
        ret

asm_test::and::u32::acquire_all:
        li                a1, -0x1
        amoand.w.aq       a0, a1, (a0)
        ret

asm_test::and::u32::relaxed_all:
        li                a1, -0x1
        amoand.w          a0, a1, (a0)
        ret

asm_test::and::u32::release_all:
        li                a1, -0x1
        amoand.w.rl       a0, a1, (a0)
        ret

asm_test::and::u32::seqcst_zero:
        li                a1, 0x0
        amoand.w.aqrl     a0, a1, (a0)
        ret

asm_test::and::u32::acquire_zero:
        li                a1, 0x0
        amoand.w.aq       a0, a1, (a0)
        ret

asm_test::and::u32::relaxed_zero:
        li                a1, 0x0
        amoand.w          a0, a1, (a0)
        ret

asm_test::and::u32::release_zero:
        li                a1, 0x0
        amoand.w.rl       a0, a1, (a0)
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

asm_test::and::bool::acqrel_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a2, a3, a2
        andi              a0, a0, -0x4
        or                a1, a2, a1
        amoand.w.aqrl     a0, a1, (a0)
        ret

asm_test::and::bool::seqcst_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a2, a3, a2
        andi              a0, a0, -0x4
        or                a1, a2, a1
        amoand.w.aqrl     a0, a1, (a0)
        ret

asm_test::and::bool::acqrel_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        ret

asm_test::and::bool::acquire_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a2, a3, a2
        andi              a0, a0, -0x4
        or                a1, a2, a1
        amoand.w.aq       a0, a1, (a0)
        ret

asm_test::and::bool::relaxed_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a2, a3, a2
        andi              a0, a0, -0x4
        or                a1, a2, a1
        amoand.w          a0, a1, (a0)
        ret

asm_test::and::bool::release_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a2, a3, a2
        andi              a0, a0, -0x4
        or                a1, a2, a1
        amoand.w.rl       a0, a1, (a0)
        ret

asm_test::and::bool::seqcst_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        ret

asm_test::and::bool::acquire_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aq       a0, a1, (a0)
        ret

asm_test::and::bool::relaxed_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w          a0, a1, (a0)
        ret

asm_test::and::bool::release_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.rl       a0, a1, (a0)
        ret

asm_test::and::bool::acqrel:
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        ret

asm_test::and::bool::seqcst:
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        ret

asm_test::and::bool::acquire:
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aq       a0, a1, (a0)
        ret

asm_test::and::bool::relaxed:
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w          a0, a1, (a0)
        ret

asm_test::and::bool::release:
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.rl       a0, a1, (a0)
        ret

asm_test::neg::u8::acqrel:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        neg               a2, a2
        sb                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::neg::u8::seqcst:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        neg               a2, a2
        sb                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::neg::u8::acquire:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        neg               a2, a2
        sb                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::neg::u8::relaxed:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        neg               a2, a2
        sb                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::neg::u8::release:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        neg               a2, a2
        sb                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::neg::u16::acqrel:
        csrrci            a1, mstatus, 0x8
        lh                a2, 0x0(a0)
        andi              a1, a1, 0x8
        neg               a2, a2
        sh                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::neg::u16::seqcst:
        csrrci            a1, mstatus, 0x8
        lh                a2, 0x0(a0)
        andi              a1, a1, 0x8
        neg               a2, a2
        sh                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::neg::u16::acquire:
        csrrci            a1, mstatus, 0x8
        lh                a2, 0x0(a0)
        andi              a1, a1, 0x8
        neg               a2, a2
        sh                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::neg::u16::relaxed:
        csrrci            a1, mstatus, 0x8
        lh                a2, 0x0(a0)
        andi              a1, a1, 0x8
        neg               a2, a2
        sh                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::neg::u16::release:
        csrrci            a1, mstatus, 0x8
        lh                a2, 0x0(a0)
        andi              a1, a1, 0x8
        neg               a2, a2
        sh                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::neg::u32::acqrel:
        csrrci            a1, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a1, a1, 0x8
        neg               a2, a2
        sw                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::neg::u32::seqcst:
        csrrci            a1, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a1, a1, 0x8
        neg               a2, a2
        sw                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::neg::u32::acquire:
        csrrci            a1, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a1, a1, 0x8
        neg               a2, a2
        sw                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::neg::u32::relaxed:
        csrrci            a1, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a1, a1, 0x8
        neg               a2, a2
        sw                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::neg::u32::release:
        csrrci            a1, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a1, a1, 0x8
        neg               a2, a2
        sw                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::not::u8::acqrel:
        li                a1, 0xff
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::not::u8::seqcst:
        li                a1, 0xff
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::not::u8::acquire:
        li                a1, 0xff
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aq       a0, a1, (a0)
        ret

asm_test::not::u8::relaxed:
        li                a1, 0xff
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w          a0, a1, (a0)
        ret

asm_test::not::u8::release:
        li                a1, 0xff
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.rl       a0, a1, (a0)
        ret

asm_test::not::u16::acqrel:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::not::u16::seqcst:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::not::u16::acquire:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoxor.w.aq       a0, a1, (a0)
        ret

asm_test::not::u16::relaxed:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoxor.w          a0, a1, (a0)
        ret

asm_test::not::u16::release:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoxor.w.rl       a0, a1, (a0)
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

asm_test::not::bool::acqrel:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::not::bool::seqcst:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::not::bool::acquire:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aq       a0, a1, (a0)
        ret

asm_test::not::bool::relaxed:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w          a0, a1, (a0)
        ret

asm_test::not::bool::release:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.rl       a0, a1, (a0)
        ret

asm_test::sub::u8::acqrel_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::sub::u8::seqcst_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::sub::u8::acquire_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::sub::u8::relaxed_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::sub::u8::release_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::sub::u8::acqrel:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        sub               a3, a3, a1
        sb                a3, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::sub::u8::seqcst:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        sub               a3, a3, a1
        sb                a3, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::sub::u8::acquire:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        sub               a3, a3, a1
        sb                a3, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::sub::u8::relaxed:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        sub               a3, a3, a1
        sb                a3, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::sub::u8::release:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        sub               a3, a3, a1
        sb                a3, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::sub::u16::acqrel_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::sub::u16::seqcst_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::sub::u16::acquire_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::sub::u16::relaxed_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::sub::u16::release_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::sub::u16::acqrel:
        csrrci            a2, mstatus, 0x8
        lh                a3, 0x0(a0)
        andi              a2, a2, 0x8
        sub               a3, a3, a1
        sh                a3, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::sub::u16::seqcst:
        csrrci            a2, mstatus, 0x8
        lh                a3, 0x0(a0)
        andi              a2, a2, 0x8
        sub               a3, a3, a1
        sh                a3, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::sub::u16::acquire:
        csrrci            a2, mstatus, 0x8
        lh                a3, 0x0(a0)
        andi              a2, a2, 0x8
        sub               a3, a3, a1
        sh                a3, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::sub::u16::relaxed:
        csrrci            a2, mstatus, 0x8
        lh                a3, 0x0(a0)
        andi              a2, a2, 0x8
        sub               a3, a3, a1
        sh                a3, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::sub::u16::release:
        csrrci            a2, mstatus, 0x8
        lh                a3, 0x0(a0)
        andi              a2, a2, 0x8
        sub               a3, a3, a1
        sh                a3, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::sub::u32::acqrel_zero:
        li                a1, 0x0
        amoadd.w.aqrl     a0, a1, (a0)
        ret

asm_test::sub::u32::seqcst_zero:
        li                a1, 0x0
        amoadd.w.aqrl     a0, a1, (a0)
        ret

asm_test::sub::u32::acquire_zero:
        li                a1, 0x0
        amoadd.w.aq       a0, a1, (a0)
        ret

asm_test::sub::u32::relaxed_zero:
        li                a1, 0x0
        amoadd.w          a0, a1, (a0)
        ret

asm_test::sub::u32::release_zero:
        li                a1, 0x0
        amoadd.w.rl       a0, a1, (a0)
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

asm_test::xor::u8::acqrel_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::xor::u8::seqcst_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::xor::u8::acquire_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aq       a0, a1, (a0)
        ret

asm_test::xor::u8::relaxed_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w          a0, a1, (a0)
        ret

asm_test::xor::u8::release_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.rl       a0, a1, (a0)
        ret

asm_test::xor::u8::acqrel:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::xor::u8::seqcst:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::xor::u8::acquire:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aq       a0, a1, (a0)
        ret

asm_test::xor::u8::relaxed:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w          a0, a1, (a0)
        ret

asm_test::xor::u8::release:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.rl       a0, a1, (a0)
        ret

asm_test::xor::u16::acqrel_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::xor::u16::seqcst_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::xor::u16::acquire_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoxor.w.aq       a0, a1, (a0)
        ret

asm_test::xor::u16::relaxed_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoxor.w          a0, a1, (a0)
        ret

asm_test::xor::u16::release_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoxor.w.rl       a0, a1, (a0)
        ret

asm_test::xor::u16::acqrel:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::xor::u16::seqcst:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::xor::u16::acquire:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoxor.w.aq       a0, a1, (a0)
        ret

asm_test::xor::u16::relaxed:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoxor.w          a0, a1, (a0)
        ret

asm_test::xor::u16::release:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoxor.w.rl       a0, a1, (a0)
        ret

asm_test::xor::u32::acqrel_zero:
        li                a1, 0x0
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::xor::u32::seqcst_zero:
        li                a1, 0x0
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::xor::u32::acquire_zero:
        li                a1, 0x0
        amoxor.w.aq       a0, a1, (a0)
        ret

asm_test::xor::u32::relaxed_zero:
        li                a1, 0x0
        amoxor.w          a0, a1, (a0)
        ret

asm_test::xor::u32::release_zero:
        li                a1, 0x0
        amoxor.w.rl       a0, a1, (a0)
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

asm_test::xor::bool::acqrel_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::xor::bool::seqcst_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::xor::bool::acqrel_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::xor::bool::acquire_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aq       a0, a1, (a0)
        ret

asm_test::xor::bool::relaxed_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w          a0, a1, (a0)
        ret

asm_test::xor::bool::release_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.rl       a0, a1, (a0)
        ret

asm_test::xor::bool::seqcst_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::xor::bool::acquire_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aq       a0, a1, (a0)
        ret

asm_test::xor::bool::relaxed_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w          a0, a1, (a0)
        ret

asm_test::xor::bool::release_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.rl       a0, a1, (a0)
        ret

asm_test::xor::bool::acqrel:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::xor::bool::seqcst:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::xor::bool::acquire:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aq       a0, a1, (a0)
        ret

asm_test::xor::bool::relaxed:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w          a0, a1, (a0)
        ret

asm_test::xor::bool::release:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
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
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u8::seqcst:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u8::acquire:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u8::relaxed:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u8::release:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
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

asm_test::swap::u16::acqrel:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        sh                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u16::seqcst:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        sh                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u16::acquire:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        sh                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u16::relaxed:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        sh                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u16::release:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        sh                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
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

asm_test::swap::bool::acqrel_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::swap::bool::seqcst_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::swap::bool::acqrel_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::swap::bool::acquire_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::swap::bool::relaxed_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w           a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::swap::bool::release_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.rl        a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::swap::bool::seqcst_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::swap::bool::acquire_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aq       a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::swap::bool::relaxed_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w          a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::swap::bool::release_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.rl       a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
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

asm_test::bit_set::u8::acqrel:
        andi              a1, a1, 0x7
        li                a2, 0x1
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a3, a1, a2
        amoor.w.aqrl      a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a1, a0
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
        and               a0, a1, a0
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
        and               a0, a1, a0
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
        and               a0, a1, a0
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
        and               a0, a1, a0
        snez              a0, a0
        ret

asm_test::bit_set::u16::acqrel:
        andi              a1, a1, 0xf
        li                a2, 0x1
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a3, a1, a2
        amoor.w.aqrl      a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a1, a0
        snez              a0, a0
        ret

asm_test::bit_set::u16::seqcst:
        andi              a1, a1, 0xf
        li                a2, 0x1
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a3, a1, a2
        amoor.w.aqrl      a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a1, a0
        snez              a0, a0
        ret

asm_test::bit_set::u16::acquire:
        andi              a1, a1, 0xf
        li                a2, 0x1
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a3, a1, a2
        amoor.w.aq        a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a1, a0
        snez              a0, a0
        ret

asm_test::bit_set::u16::relaxed:
        andi              a1, a1, 0xf
        li                a2, 0x1
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a3, a1, a2
        amoor.w           a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a1, a0
        snez              a0, a0
        ret

asm_test::bit_set::u16::release:
        andi              a1, a1, 0xf
        li                a2, 0x1
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a3, a1, a2
        amoor.w.rl        a0, a3, (a0)
        srl               a0, a0, a2
        and               a0, a1, a0
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
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
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
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u8::acquire_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u8::relaxed_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w           a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u8::release_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.rl        a0, a1, (a0)
        srl               a0, a0, a2
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
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u16::seqcst_all:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u16::acqrel_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u16::acquire_all:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u16::relaxed_all:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoor.w           a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u16::release_all:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoor.w.rl        a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u16::seqcst_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u16::acquire_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u16::relaxed_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoor.w           a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u16::release_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoor.w.rl        a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u16::acqrel:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u16::seqcst:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u16::acquire:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u16::relaxed:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoor.w           a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u16::release:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoor.w.rl        a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_or::u32::acqrel_all:
        li                a1, -0x1
        amoor.w.aqrl      a0, a1, (a0)
        ret

asm_test::fetch_or::u32::seqcst_all:
        li                a1, -0x1
        amoor.w.aqrl      a0, a1, (a0)
        ret

asm_test::fetch_or::u32::acqrel_zero:
        li                a1, 0x0
        amoor.w.aqrl      a0, a1, (a0)
        ret

asm_test::fetch_or::u32::acquire_all:
        li                a1, -0x1
        amoor.w.aq        a0, a1, (a0)
        ret

asm_test::fetch_or::u32::relaxed_all:
        li                a1, -0x1
        amoor.w           a0, a1, (a0)
        ret

asm_test::fetch_or::u32::release_all:
        li                a1, -0x1
        amoor.w.rl        a0, a1, (a0)
        ret

asm_test::fetch_or::u32::seqcst_zero:
        li                a1, 0x0
        amoor.w.aqrl      a0, a1, (a0)
        ret

asm_test::fetch_or::u32::acquire_zero:
        li                a1, 0x0
        amoor.w.aq        a0, a1, (a0)
        ret

asm_test::fetch_or::u32::relaxed_zero:
        li                a1, 0x0
        amoor.w           a0, a1, (a0)
        ret

asm_test::fetch_or::u32::release_zero:
        li                a1, 0x0
        amoor.w.rl        a0, a1, (a0)
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

asm_test::fetch_or::bool::acqrel_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_or::bool::seqcst_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_or::bool::acqrel_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_or::bool::acquire_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_or::bool::relaxed_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w           a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_or::bool::release_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.rl        a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_or::bool::seqcst_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_or::bool::acquire_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_or::bool::relaxed_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w           a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_or::bool::release_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.rl        a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_or::bool::acqrel:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_or::bool::seqcst:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aqrl      a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_or::bool::acquire:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.aq        a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_or::bool::relaxed:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w           a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_or::bool::release:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoor.w.rl        a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::bit_clear::u8::acqrel:
        li                a2, 0x1
        andi              a1, a1, 0x7
        sll               a1, a2, a1
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        xori              a4, a1, 0xff
        not               a3, a3
        sll               a4, a4, a2
        andi              a0, a0, -0x4
        or                a3, a4, a3
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
        sll               a3, a3, a2
        xori              a4, a1, 0xff
        not               a3, a3
        sll               a4, a4, a2
        andi              a0, a0, -0x4
        or                a3, a4, a3
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
        sll               a3, a3, a2
        xori              a4, a1, 0xff
        not               a3, a3
        sll               a4, a4, a2
        andi              a0, a0, -0x4
        or                a3, a4, a3
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
        sll               a3, a3, a2
        xori              a4, a1, 0xff
        not               a3, a3
        sll               a4, a4, a2
        andi              a0, a0, -0x4
        or                a3, a4, a3
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
        sll               a3, a3, a2
        xori              a4, a1, 0xff
        not               a3, a3
        sll               a4, a4, a2
        andi              a0, a0, -0x4
        or                a3, a4, a3
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
        slli              a2, a0, 0x3
        addi              a3, a3, -0x1
        sll               a4, a3, a2
        xor               a3, a1, a3
        not               a4, a4
        sll               a3, a3, a2
        andi              a0, a0, -0x3
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
        slli              a2, a0, 0x3
        addi              a3, a3, -0x1
        sll               a4, a3, a2
        xor               a3, a1, a3
        not               a4, a4
        sll               a3, a3, a2
        andi              a0, a0, -0x3
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
        slli              a2, a0, 0x3
        addi              a3, a3, -0x1
        sll               a4, a3, a2
        xor               a3, a1, a3
        not               a4, a4
        sll               a3, a3, a2
        andi              a0, a0, -0x3
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
        slli              a2, a0, 0x3
        addi              a3, a3, -0x1
        sll               a4, a3, a2
        xor               a3, a1, a3
        not               a4, a4
        sll               a3, a3, a2
        andi              a0, a0, -0x3
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
        slli              a2, a0, 0x3
        addi              a3, a3, -0x1
        sll               a4, a3, a2
        xor               a3, a1, a3
        not               a4, a4
        sll               a3, a3, a2
        andi              a0, a0, -0x3
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

asm_test::fetch_add::u8::acqrel_zero:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_add::u8::seqcst_zero:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_add::u8::acquire_zero:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_add::u8::relaxed_zero:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_add::u8::release_zero:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_add::u8::acqrel:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        add               a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u8::seqcst:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        add               a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u8::acquire:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        add               a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u8::relaxed:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        add               a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u8::release:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        add               a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::f32::acqrel_zero:
        addi              sp, sp, -0x10
        sw                ra, 0xc(sp)
        sw                s0, 0x8(sp)
        sw                s1, 0x4(sp)
        sw                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a1, s2, 0x8
        csrs              mstatus, a1
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        lw                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
        li                a1, 0x0
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sw                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
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
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a1, s2, 0x8
        csrs              mstatus, a1
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        lw                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
        li                a1, 0x0
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sw                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
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
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a1, s2, 0x8
        csrs              mstatus, a1
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        lw                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
        li                a1, 0x0
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sw                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
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
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a1, s2, 0x8
        csrs              mstatus, a1
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        lw                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
        li                a1, 0x0
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sw                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
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
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a1, s2, 0x8
        csrs              mstatus, a1
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        lw                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
        li                a1, 0x0
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sw                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        lw                ra, 0xc(sp)
        lw                s0, 0x8(sp)
        lw                s1, 0x4(sp)
        lw                s2, 0x0(sp)
        addi              sp, sp, 0x10
        ret

asm_test::fetch_add::f32::acqrel:
        addi              sp, sp, -0x10
        sw                ra, 0xc(sp)
        sw                s0, 0x8(sp)
        sw                s1, 0x4(sp)
        sw                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a2, 0x0(a0)
        mv                a0, a1
        beq               a2, s1, 1f
0:
        andi              a1, s2, 0x8
        csrs              mstatus, a1
        csrrci            s2, mstatus, 0x8
        mv                s1, a2
        lw                a2, 0x0(s0)
        bne               a2, s1, 0b
1:
        mv                a1, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sw                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        lw                ra, 0xc(sp)
        lw                s0, 0x8(sp)
        lw                s1, 0x4(sp)
        lw                s2, 0x0(sp)
        addi              sp, sp, 0x10
        ret

asm_test::fetch_add::f32::seqcst:
        addi              sp, sp, -0x10
        sw                ra, 0xc(sp)
        sw                s0, 0x8(sp)
        sw                s1, 0x4(sp)
        sw                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a2, 0x0(a0)
        mv                a0, a1
        beq               a2, s1, 1f
0:
        andi              a1, s2, 0x8
        csrs              mstatus, a1
        csrrci            s2, mstatus, 0x8
        mv                s1, a2
        lw                a2, 0x0(s0)
        bne               a2, s1, 0b
1:
        mv                a1, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sw                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        lw                ra, 0xc(sp)
        lw                s0, 0x8(sp)
        lw                s1, 0x4(sp)
        lw                s2, 0x0(sp)
        addi              sp, sp, 0x10
        ret

asm_test::fetch_add::f32::acquire:
        addi              sp, sp, -0x10
        sw                ra, 0xc(sp)
        sw                s0, 0x8(sp)
        sw                s1, 0x4(sp)
        sw                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a2, 0x0(a0)
        mv                a0, a1
        beq               a2, s1, 1f
0:
        andi              a1, s2, 0x8
        csrs              mstatus, a1
        csrrci            s2, mstatus, 0x8
        mv                s1, a2
        lw                a2, 0x0(s0)
        bne               a2, s1, 0b
1:
        mv                a1, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sw                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        lw                ra, 0xc(sp)
        lw                s0, 0x8(sp)
        lw                s1, 0x4(sp)
        lw                s2, 0x0(sp)
        addi              sp, sp, 0x10
        ret

asm_test::fetch_add::f32::relaxed:
        addi              sp, sp, -0x10
        sw                ra, 0xc(sp)
        sw                s0, 0x8(sp)
        sw                s1, 0x4(sp)
        sw                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a2, 0x0(a0)
        mv                a0, a1
        beq               a2, s1, 1f
0:
        andi              a1, s2, 0x8
        csrs              mstatus, a1
        csrrci            s2, mstatus, 0x8
        mv                s1, a2
        lw                a2, 0x0(s0)
        bne               a2, s1, 0b
1:
        mv                a1, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sw                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        lw                ra, 0xc(sp)
        lw                s0, 0x8(sp)
        lw                s1, 0x4(sp)
        lw                s2, 0x0(sp)
        addi              sp, sp, 0x10
        ret

asm_test::fetch_add::f32::release:
        addi              sp, sp, -0x10
        sw                ra, 0xc(sp)
        sw                s0, 0x8(sp)
        sw                s1, 0x4(sp)
        sw                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a2, 0x0(a0)
        mv                a0, a1
        beq               a2, s1, 1f
0:
        andi              a1, s2, 0x8
        csrs              mstatus, a1
        csrrci            s2, mstatus, 0x8
        mv                s1, a2
        lw                a2, 0x0(s0)
        bne               a2, s1, 0b
1:
        mv                a1, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sw                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        lw                ra, 0xc(sp)
        lw                s0, 0x8(sp)
        lw                s1, 0x4(sp)
        lw                s2, 0x0(sp)
        addi              sp, sp, 0x10
        ret

asm_test::fetch_add::u16::acqrel_zero:
        csrrci            a1, mstatus, 0x8
        lh                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_add::u16::seqcst_zero:
        csrrci            a1, mstatus, 0x8
        lh                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_add::u16::acquire_zero:
        csrrci            a1, mstatus, 0x8
        lh                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_add::u16::relaxed_zero:
        csrrci            a1, mstatus, 0x8
        lh                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_add::u16::release_zero:
        csrrci            a1, mstatus, 0x8
        lh                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_add::u16::acqrel:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        andi              a3, a3, 0x8
        add               a1, a2, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u16::seqcst:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        andi              a3, a3, 0x8
        add               a1, a2, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u16::acquire:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        andi              a3, a3, 0x8
        add               a1, a2, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u16::relaxed:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        andi              a3, a3, 0x8
        add               a1, a2, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u16::release:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        andi              a3, a3, 0x8
        add               a1, a2, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u32::acqrel_zero:
        li                a1, 0x0
        amoadd.w.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_add::u32::seqcst_zero:
        li                a1, 0x0
        amoadd.w.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_add::u32::acquire_zero:
        li                a1, 0x0
        amoadd.w.aq       a0, a1, (a0)
        ret

asm_test::fetch_add::u32::relaxed_zero:
        li                a1, 0x0
        amoadd.w          a0, a1, (a0)
        ret

asm_test::fetch_add::u32::release_zero:
        li                a1, 0x0
        amoadd.w.rl       a0, a1, (a0)
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

asm_test::fetch_and::u8::acqrel_all:
        li                a1, -0x1
        andi              a2, a0, -0x4
        amoand.w.aqrl     a1, a1, (a2)
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_and::u8::seqcst_all:
        li                a1, -0x1
        andi              a2, a0, -0x4
        amoand.w.aqrl     a1, a1, (a2)
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_and::u8::acqrel_zero:
        li                a1, 0x0
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

asm_test::fetch_and::u8::acquire_all:
        li                a1, -0x1
        andi              a2, a0, -0x4
        amoand.w.aq       a1, a1, (a2)
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_and::u8::relaxed_all:
        li                a1, -0x1
        andi              a2, a0, -0x4
        amoand.w          a1, a1, (a2)
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_and::u8::release_all:
        li                a1, -0x1
        andi              a2, a0, -0x4
        amoand.w.rl       a1, a1, (a2)
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_and::u8::seqcst_zero:
        li                a1, 0x0
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

asm_test::fetch_and::u8::acquire_zero:
        li                a1, 0x0
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

asm_test::fetch_and::u8::relaxed_zero:
        li                a1, 0x0
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

asm_test::fetch_and::u8::release_zero:
        li                a1, 0x0
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
        li                a1, -0x1
        andi              a2, a0, -0x3
        amoand.w.aqrl     a1, a1, (a2)
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_and::u16::seqcst_all:
        li                a1, -0x1
        andi              a2, a0, -0x3
        amoand.w.aqrl     a1, a1, (a2)
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_and::u16::acqrel_zero:
        li                a1, 0x0
        lui               a2, 0x10
        slli              a3, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a3
        not               a2, a2
        sll               a1, a1, a3
        andi              a0, a0, -0x3
        or                a1, a1, a2
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a3
        ret

asm_test::fetch_and::u16::acquire_all:
        li                a1, -0x1
        andi              a2, a0, -0x3
        amoand.w.aq       a1, a1, (a2)
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_and::u16::relaxed_all:
        li                a1, -0x1
        andi              a2, a0, -0x3
        amoand.w          a1, a1, (a2)
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_and::u16::release_all:
        li                a1, -0x1
        andi              a2, a0, -0x3
        amoand.w.rl       a1, a1, (a2)
        slli              a0, a0, 0x3
        srl               a0, a1, a0
        ret

asm_test::fetch_and::u16::seqcst_zero:
        li                a1, 0x0
        lui               a2, 0x10
        slli              a3, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a3
        not               a2, a2
        sll               a1, a1, a3
        andi              a0, a0, -0x3
        or                a1, a1, a2
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a3
        ret

asm_test::fetch_and::u16::acquire_zero:
        li                a1, 0x0
        lui               a2, 0x10
        slli              a3, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a3
        not               a2, a2
        sll               a1, a1, a3
        andi              a0, a0, -0x3
        or                a1, a1, a2
        amoand.w.aq       a0, a1, (a0)
        srl               a0, a0, a3
        ret

asm_test::fetch_and::u16::relaxed_zero:
        li                a1, 0x0
        lui               a2, 0x10
        slli              a3, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a3
        not               a2, a2
        sll               a1, a1, a3
        andi              a0, a0, -0x3
        or                a1, a1, a2
        amoand.w          a0, a1, (a0)
        srl               a0, a0, a3
        ret

asm_test::fetch_and::u16::release_zero:
        li                a1, 0x0
        lui               a2, 0x10
        slli              a3, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a3
        not               a2, a2
        sll               a1, a1, a3
        andi              a0, a0, -0x3
        or                a1, a1, a2
        amoand.w.rl       a0, a1, (a0)
        srl               a0, a0, a3
        ret

asm_test::fetch_and::u16::acqrel:
        lui               a2, 0x10
        slli              a3, a0, 0x3
        addi              a2, a2, -0x1
        sll               a2, a2, a3
        not               a2, a2
        sll               a1, a1, a3
        andi              a0, a0, -0x3
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
        andi              a0, a0, -0x3
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
        andi              a0, a0, -0x3
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
        andi              a0, a0, -0x3
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
        andi              a0, a0, -0x3
        or                a1, a1, a2
        amoand.w.rl       a0, a1, (a0)
        srl               a0, a0, a3
        ret

asm_test::fetch_and::u32::acqrel_all:
        li                a1, -0x1
        amoand.w.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_and::u32::seqcst_all:
        li                a1, -0x1
        amoand.w.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_and::u32::acqrel_zero:
        li                a1, 0x0
        amoand.w.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_and::u32::acquire_all:
        li                a1, -0x1
        amoand.w.aq       a0, a1, (a0)
        ret

asm_test::fetch_and::u32::relaxed_all:
        li                a1, -0x1
        amoand.w          a0, a1, (a0)
        ret

asm_test::fetch_and::u32::release_all:
        li                a1, -0x1
        amoand.w.rl       a0, a1, (a0)
        ret

asm_test::fetch_and::u32::seqcst_zero:
        li                a1, 0x0
        amoand.w.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_and::u32::acquire_zero:
        li                a1, 0x0
        amoand.w.aq       a0, a1, (a0)
        ret

asm_test::fetch_and::u32::relaxed_zero:
        li                a1, 0x0
        amoand.w          a0, a1, (a0)
        ret

asm_test::fetch_and::u32::release_zero:
        li                a1, 0x0
        amoand.w.rl       a0, a1, (a0)
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

asm_test::fetch_and::bool::acqrel_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a3, a3, a2
        andi              a0, a0, -0x4
        or                a1, a3, a1
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_and::bool::seqcst_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a3, a3, a2
        andi              a0, a0, -0x4
        or                a1, a3, a1
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_and::bool::acqrel_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_and::bool::acquire_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a3, a3, a2
        andi              a0, a0, -0x4
        or                a1, a3, a1
        amoand.w.aq       a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_and::bool::relaxed_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a3, a3, a2
        andi              a0, a0, -0x4
        or                a1, a3, a1
        amoand.w          a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_and::bool::release_true:
        li                a1, 0xff
        slli              a2, a0, 0x3
        sll               a1, a1, a2
        li                a3, 0x1
        not               a1, a1
        sll               a3, a3, a2
        andi              a0, a0, -0x4
        or                a1, a3, a1
        amoand.w.rl       a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_and::bool::seqcst_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_and::bool::acquire_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.aq       a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_and::bool::relaxed_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w          a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_and::bool::release_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        li                a3, 0xff
        sll               a3, a3, a2
        not               a3, a3
        sll               a1, a1, a2
        andi              a0, a0, -0x4
        or                a1, a1, a3
        amoand.w.rl       a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
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
        zext.b            a0, a0
        snez              a0, a0
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
        zext.b            a0, a0
        snez              a0, a0
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
        zext.b            a0, a0
        snez              a0, a0
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
        zext.b            a0, a0
        snez              a0, a0
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
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_max::i8::acqrel:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lb                a0, 0x0(a0)
        mv                a4, a0
        blt               a1, a0, 0f
        mv                a4, a1
0:
        sb                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_max::i8::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lb                a0, 0x0(a0)
        mv                a4, a0
        blt               a1, a0, 0f
        mv                a4, a1
0:
        sb                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_max::i8::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lb                a0, 0x0(a0)
        mv                a4, a0
        blt               a1, a0, 0f
        mv                a4, a1
0:
        sb                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_max::i8::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lb                a0, 0x0(a0)
        mv                a4, a0
        blt               a1, a0, 0f
        mv                a4, a1
0:
        sb                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_max::i8::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lb                a0, 0x0(a0)
        mv                a4, a0
        blt               a1, a0, 0f
        mv                a4, a1
0:
        sb                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_max::f32::acqrel:
        addi              sp, sp, -0x10
        sw                ra, 0xc(sp)
        sw                s0, 0x8(sp)
        sw                s1, 0x4(sp)
        sw                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a2, s2, 0x8
        csrs              mstatus, a2
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        lw                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sw                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        lw                ra, 0xc(sp)
        lw                s0, 0x8(sp)
        lw                s1, 0x4(sp)
        lw                s2, 0x0(sp)
        addi              sp, sp, 0x10
        ret

asm_test::fetch_max::f32::seqcst:
        addi              sp, sp, -0x10
        sw                ra, 0xc(sp)
        sw                s0, 0x8(sp)
        sw                s1, 0x4(sp)
        sw                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a2, s2, 0x8
        csrs              mstatus, a2
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        lw                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sw                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        lw                ra, 0xc(sp)
        lw                s0, 0x8(sp)
        lw                s1, 0x4(sp)
        lw                s2, 0x0(sp)
        addi              sp, sp, 0x10
        ret

asm_test::fetch_max::f32::acquire:
        addi              sp, sp, -0x10
        sw                ra, 0xc(sp)
        sw                s0, 0x8(sp)
        sw                s1, 0x4(sp)
        sw                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a2, s2, 0x8
        csrs              mstatus, a2
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        lw                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sw                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        lw                ra, 0xc(sp)
        lw                s0, 0x8(sp)
        lw                s1, 0x4(sp)
        lw                s2, 0x0(sp)
        addi              sp, sp, 0x10
        ret

asm_test::fetch_max::f32::relaxed:
        addi              sp, sp, -0x10
        sw                ra, 0xc(sp)
        sw                s0, 0x8(sp)
        sw                s1, 0x4(sp)
        sw                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a2, s2, 0x8
        csrs              mstatus, a2
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        lw                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sw                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        lw                ra, 0xc(sp)
        lw                s0, 0x8(sp)
        lw                s1, 0x4(sp)
        lw                s2, 0x0(sp)
        addi              sp, sp, 0x10
        ret

asm_test::fetch_max::f32::release:
        addi              sp, sp, -0x10
        sw                ra, 0xc(sp)
        sw                s0, 0x8(sp)
        sw                s1, 0x4(sp)
        sw                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a2, s2, 0x8
        csrs              mstatus, a2
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        lw                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sw                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        lw                ra, 0xc(sp)
        lw                s0, 0x8(sp)
        lw                s1, 0x4(sp)
        lw                s2, 0x0(sp)
        addi              sp, sp, 0x10
        ret

asm_test::fetch_max::i16::acqrel:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lh                a0, 0x0(a0)
        mv                a4, a0
        blt               a1, a0, 0f
        mv                a4, a1
0:
        sh                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_max::i16::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lh                a0, 0x0(a0)
        mv                a4, a0
        blt               a1, a0, 0f
        mv                a4, a1
0:
        sh                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_max::i16::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lh                a0, 0x0(a0)
        mv                a4, a0
        blt               a1, a0, 0f
        mv                a4, a1
0:
        sh                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_max::i16::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lh                a0, 0x0(a0)
        mv                a4, a0
        blt               a1, a0, 0f
        mv                a4, a1
0:
        sh                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_max::i16::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lh                a0, 0x0(a0)
        mv                a4, a0
        blt               a1, a0, 0f
        mv                a4, a1
0:
        sh                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
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
        mv                a4, a0
        blt               a0, a1, 0f
        mv                a4, a1
0:
        sb                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::i8::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lb                a0, 0x0(a0)
        mv                a4, a0
        blt               a0, a1, 0f
        mv                a4, a1
0:
        sb                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::i8::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lb                a0, 0x0(a0)
        mv                a4, a0
        blt               a0, a1, 0f
        mv                a4, a1
0:
        sb                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::i8::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lb                a0, 0x0(a0)
        mv                a4, a0
        blt               a0, a1, 0f
        mv                a4, a1
0:
        sb                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::i8::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lb                a0, 0x0(a0)
        mv                a4, a0
        blt               a0, a1, 0f
        mv                a4, a1
0:
        sb                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::f32::acqrel:
        addi              sp, sp, -0x10
        sw                ra, 0xc(sp)
        sw                s0, 0x8(sp)
        sw                s1, 0x4(sp)
        sw                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a2, s2, 0x8
        csrs              mstatus, a2
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        lw                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sw                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        lw                ra, 0xc(sp)
        lw                s0, 0x8(sp)
        lw                s1, 0x4(sp)
        lw                s2, 0x0(sp)
        addi              sp, sp, 0x10
        ret

asm_test::fetch_min::f32::seqcst:
        addi              sp, sp, -0x10
        sw                ra, 0xc(sp)
        sw                s0, 0x8(sp)
        sw                s1, 0x4(sp)
        sw                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a2, s2, 0x8
        csrs              mstatus, a2
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        lw                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sw                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        lw                ra, 0xc(sp)
        lw                s0, 0x8(sp)
        lw                s1, 0x4(sp)
        lw                s2, 0x0(sp)
        addi              sp, sp, 0x10
        ret

asm_test::fetch_min::f32::acquire:
        addi              sp, sp, -0x10
        sw                ra, 0xc(sp)
        sw                s0, 0x8(sp)
        sw                s1, 0x4(sp)
        sw                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a2, s2, 0x8
        csrs              mstatus, a2
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        lw                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sw                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        lw                ra, 0xc(sp)
        lw                s0, 0x8(sp)
        lw                s1, 0x4(sp)
        lw                s2, 0x0(sp)
        addi              sp, sp, 0x10
        ret

asm_test::fetch_min::f32::relaxed:
        addi              sp, sp, -0x10
        sw                ra, 0xc(sp)
        sw                s0, 0x8(sp)
        sw                s1, 0x4(sp)
        sw                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a2, s2, 0x8
        csrs              mstatus, a2
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        lw                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sw                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        lw                ra, 0xc(sp)
        lw                s0, 0x8(sp)
        lw                s1, 0x4(sp)
        lw                s2, 0x0(sp)
        addi              sp, sp, 0x10
        ret

asm_test::fetch_min::f32::release:
        addi              sp, sp, -0x10
        sw                ra, 0xc(sp)
        sw                s0, 0x8(sp)
        sw                s1, 0x4(sp)
        sw                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a2, s2, 0x8
        csrs              mstatus, a2
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        lw                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sw                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        lw                ra, 0xc(sp)
        lw                s0, 0x8(sp)
        lw                s1, 0x4(sp)
        lw                s2, 0x0(sp)
        addi              sp, sp, 0x10
        ret

asm_test::fetch_min::i16::acqrel:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lh                a0, 0x0(a0)
        mv                a4, a0
        blt               a0, a1, 0f
        mv                a4, a1
0:
        sh                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::i16::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lh                a0, 0x0(a0)
        mv                a4, a0
        blt               a0, a1, 0f
        mv                a4, a1
0:
        sh                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::i16::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lh                a0, 0x0(a0)
        mv                a4, a0
        blt               a0, a1, 0f
        mv                a4, a1
0:
        sh                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::i16::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lh                a0, 0x0(a0)
        mv                a4, a0
        blt               a0, a1, 0f
        mv                a4, a1
0:
        sh                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::i16::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lh                a0, 0x0(a0)
        mv                a4, a0
        blt               a0, a1, 0f
        mv                a4, a1
0:
        sh                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
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
        andi              a2, a2, 0x8
        neg               a3, a1
        sb                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u8::seqcst:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        andi              a2, a2, 0x8
        neg               a3, a1
        sb                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u8::acquire:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        andi              a2, a2, 0x8
        neg               a3, a1
        sb                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u8::relaxed:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        andi              a2, a2, 0x8
        neg               a3, a1
        sb                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u8::release:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        andi              a2, a2, 0x8
        neg               a3, a1
        sb                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
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

asm_test::fetch_neg::u16::acqrel:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        andi              a2, a2, 0x8
        neg               a3, a1
        sh                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u16::seqcst:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        andi              a2, a2, 0x8
        neg               a3, a1
        sh                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u16::acquire:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        andi              a2, a2, 0x8
        neg               a3, a1
        sh                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u16::relaxed:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        andi              a2, a2, 0x8
        neg               a3, a1
        sh                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u16::release:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        andi              a2, a2, 0x8
        neg               a3, a1
        sh                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u32::acqrel:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        andi              a2, a2, 0x8
        neg               a3, a1
        sw                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u32::seqcst:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        andi              a2, a2, 0x8
        neg               a3, a1
        sw                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u32::acquire:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        andi              a2, a2, 0x8
        neg               a3, a1
        sw                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u32::relaxed:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        andi              a2, a2, 0x8
        neg               a3, a1
        sw                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u32::release:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        andi              a2, a2, 0x8
        neg               a3, a1
        sw                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
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
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_not::u16::seqcst:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_not::u16::acquire:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoxor.w.aq       a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_not::u16::relaxed:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoxor.w          a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_not::u16::release:
        lui               a1, 0x10
        slli              a2, a0, 0x3
        addi              a1, a1, -0x1
        andi              a0, a0, -0x3
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

asm_test::fetch_not::bool::acqrel:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_not::bool::seqcst:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_not::bool::acquire:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aq       a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_not::bool::relaxed:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w          a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_not::bool::release:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.rl       a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_sub::u8::acqrel_zero:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_sub::u8::seqcst_zero:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_sub::u8::acquire_zero:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_sub::u8::relaxed_zero:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_sub::u8::release_zero:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_sub::u8::acqrel:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        sub               a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u8::seqcst:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        sub               a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u8::acquire:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        sub               a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u8::relaxed:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        sub               a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u8::release:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        sub               a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::f32::acqrel_zero:
        lw                a1, 0x0(a0)
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        beq               a3, a1, 1f
0:
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        csrrci            a2, mstatus, 0x8
        mv                a1, a3
        lw                a3, 0x0(a0)
        bne               a3, a1, 0b
1:
        sw                a1, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_sub::f32::seqcst_zero:
        lw                a1, 0x0(a0)
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        beq               a3, a1, 1f
0:
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        csrrci            a2, mstatus, 0x8
        mv                a1, a3
        lw                a3, 0x0(a0)
        bne               a3, a1, 0b
1:
        sw                a1, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_sub::f32::acquire_zero:
        lw                a1, 0x0(a0)
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        beq               a3, a1, 1f
0:
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        csrrci            a2, mstatus, 0x8
        mv                a1, a3
        lw                a3, 0x0(a0)
        bne               a3, a1, 0b
1:
        sw                a1, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_sub::f32::relaxed_zero:
        lw                a1, 0x0(a0)
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        beq               a3, a1, 1f
0:
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        csrrci            a2, mstatus, 0x8
        mv                a1, a3
        lw                a3, 0x0(a0)
        bne               a3, a1, 0b
1:
        sw                a1, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_sub::f32::release_zero:
        lw                a1, 0x0(a0)
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        beq               a3, a1, 1f
0:
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        csrrci            a2, mstatus, 0x8
        mv                a1, a3
        lw                a3, 0x0(a0)
        bne               a3, a1, 0b
1:
        sw                a1, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_sub::f32::acqrel:
        addi              sp, sp, -0x10
        sw                ra, 0xc(sp)
        sw                s0, 0x8(sp)
        sw                s1, 0x4(sp)
        sw                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a2, s2, 0x8
        csrs              mstatus, a2
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        lw                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sw                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        lw                ra, 0xc(sp)
        lw                s0, 0x8(sp)
        lw                s1, 0x4(sp)
        lw                s2, 0x0(sp)
        addi              sp, sp, 0x10
        ret

asm_test::fetch_sub::f32::seqcst:
        addi              sp, sp, -0x10
        sw                ra, 0xc(sp)
        sw                s0, 0x8(sp)
        sw                s1, 0x4(sp)
        sw                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a2, s2, 0x8
        csrs              mstatus, a2
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        lw                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sw                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        lw                ra, 0xc(sp)
        lw                s0, 0x8(sp)
        lw                s1, 0x4(sp)
        lw                s2, 0x0(sp)
        addi              sp, sp, 0x10
        ret

asm_test::fetch_sub::f32::acquire:
        addi              sp, sp, -0x10
        sw                ra, 0xc(sp)
        sw                s0, 0x8(sp)
        sw                s1, 0x4(sp)
        sw                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a2, s2, 0x8
        csrs              mstatus, a2
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        lw                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sw                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        lw                ra, 0xc(sp)
        lw                s0, 0x8(sp)
        lw                s1, 0x4(sp)
        lw                s2, 0x0(sp)
        addi              sp, sp, 0x10
        ret

asm_test::fetch_sub::f32::relaxed:
        addi              sp, sp, -0x10
        sw                ra, 0xc(sp)
        sw                s0, 0x8(sp)
        sw                s1, 0x4(sp)
        sw                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a2, s2, 0x8
        csrs              mstatus, a2
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        lw                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sw                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        lw                ra, 0xc(sp)
        lw                s0, 0x8(sp)
        lw                s1, 0x4(sp)
        lw                s2, 0x0(sp)
        addi              sp, sp, 0x10
        ret

asm_test::fetch_sub::f32::release:
        addi              sp, sp, -0x10
        sw                ra, 0xc(sp)
        sw                s0, 0x8(sp)
        sw                s1, 0x4(sp)
        sw                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a2, s2, 0x8
        csrs              mstatus, a2
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        lw                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sw                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        lw                ra, 0xc(sp)
        lw                s0, 0x8(sp)
        lw                s1, 0x4(sp)
        lw                s2, 0x0(sp)
        addi              sp, sp, 0x10
        ret

asm_test::fetch_sub::u16::acqrel_zero:
        csrrci            a1, mstatus, 0x8
        lh                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_sub::u16::seqcst_zero:
        csrrci            a1, mstatus, 0x8
        lh                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_sub::u16::acquire_zero:
        csrrci            a1, mstatus, 0x8
        lh                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_sub::u16::relaxed_zero:
        csrrci            a1, mstatus, 0x8
        lh                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_sub::u16::release_zero:
        csrrci            a1, mstatus, 0x8
        lh                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_sub::u16::acqrel:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        andi              a3, a3, 0x8
        sub               a1, a2, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u16::seqcst:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        andi              a3, a3, 0x8
        sub               a1, a2, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u16::acquire:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        andi              a3, a3, 0x8
        sub               a1, a2, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u16::relaxed:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        andi              a3, a3, 0x8
        sub               a1, a2, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u16::release:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        andi              a3, a3, 0x8
        sub               a1, a2, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u32::acqrel_zero:
        li                a1, 0x0
        amoadd.w.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_sub::u32::seqcst_zero:
        li                a1, 0x0
        amoadd.w.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_sub::u32::acquire_zero:
        li                a1, 0x0
        amoadd.w.aq       a0, a1, (a0)
        ret

asm_test::fetch_sub::u32::relaxed_zero:
        li                a1, 0x0
        amoadd.w          a0, a1, (a0)
        ret

asm_test::fetch_sub::u32::release_zero:
        li                a1, 0x0
        amoadd.w.rl       a0, a1, (a0)
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

asm_test::fetch_xor::u8::acqrel_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_xor::u8::seqcst_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_xor::u8::acquire_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aq       a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_xor::u8::relaxed_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w          a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_xor::u8::release_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.rl       a0, a1, (a0)
        srl               a0, a0, a2
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
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_xor::u16::seqcst_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_xor::u16::acquire_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoxor.w.aq       a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_xor::u16::relaxed_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoxor.w          a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_xor::u16::release_zero:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoxor.w.rl       a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_xor::u16::acqrel:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_xor::u16::seqcst:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_xor::u16::acquire:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoxor.w.aq       a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_xor::u16::relaxed:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoxor.w          a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_xor::u16::release:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x3
        sll               a1, a1, a2
        amoxor.w.rl       a0, a1, (a0)
        srl               a0, a0, a2
        ret

asm_test::fetch_xor::u32::acqrel_zero:
        li                a1, 0x0
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_xor::u32::seqcst_zero:
        li                a1, 0x0
        amoxor.w.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_xor::u32::acquire_zero:
        li                a1, 0x0
        amoxor.w.aq       a0, a1, (a0)
        ret

asm_test::fetch_xor::u32::relaxed_zero:
        li                a1, 0x0
        amoxor.w          a0, a1, (a0)
        ret

asm_test::fetch_xor::u32::release_zero:
        li                a1, 0x0
        amoxor.w.rl       a0, a1, (a0)
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

asm_test::fetch_xor::bool::acqrel_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_xor::bool::seqcst_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_xor::bool::acqrel_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_xor::bool::acquire_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aq       a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_xor::bool::relaxed_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w          a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_xor::bool::release_true:
        li                a1, 0x1
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.rl       a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_xor::bool::seqcst_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_xor::bool::acquire_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aq       a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_xor::bool::relaxed_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w          a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_xor::bool::release_false:
        li                a1, 0x0
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.rl       a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_xor::bool::acqrel:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_xor::bool::seqcst:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aqrl     a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_xor::bool::acquire:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.aq       a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_xor::bool::relaxed:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w          a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_xor::bool::release:
        slli              a2, a0, 0x3
        andi              a0, a0, -0x4
        sll               a1, a1, a2
        amoxor.w.rl       a0, a1, (a0)
        srl               a0, a0, a2
        zext.b            a0, a0
        snez              a0, a0
        ret

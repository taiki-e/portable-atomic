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
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        li                a4, 0x1
        andi              a1, a1, 0x7
        sll               a1, a4, a1
        xor               a4, a3, a1
        sb                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_toggle::u8::seqcst:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        li                a4, 0x1
        andi              a1, a1, 0x7
        sll               a1, a4, a1
        xor               a4, a3, a1
        sb                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_toggle::u8::acquire:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        li                a4, 0x1
        andi              a1, a1, 0x7
        sll               a1, a4, a1
        xor               a4, a3, a1
        sb                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_toggle::u8::relaxed:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        li                a4, 0x1
        andi              a1, a1, 0x7
        sll               a1, a4, a1
        xor               a4, a3, a1
        sb                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_toggle::u8::release:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        li                a4, 0x1
        andi              a1, a1, 0x7
        sll               a1, a4, a1
        xor               a4, a3, a1
        sb                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_toggle::u16::acqrel:
        csrrci            a2, mstatus, 0x8
        lhu               a3, 0x0(a0)
        li                a4, 0x1
        andi              a1, a1, 0xf
        sll               a1, a4, a1
        xor               a4, a3, a1
        sh                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_toggle::u16::seqcst:
        csrrci            a2, mstatus, 0x8
        lhu               a3, 0x0(a0)
        li                a4, 0x1
        andi              a1, a1, 0xf
        sll               a1, a4, a1
        xor               a4, a3, a1
        sh                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_toggle::u16::acquire:
        csrrci            a2, mstatus, 0x8
        lhu               a3, 0x0(a0)
        li                a4, 0x1
        andi              a1, a1, 0xf
        sll               a1, a4, a1
        xor               a4, a3, a1
        sh                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_toggle::u16::relaxed:
        csrrci            a2, mstatus, 0x8
        lhu               a3, 0x0(a0)
        li                a4, 0x1
        andi              a1, a1, 0xf
        sll               a1, a4, a1
        xor               a4, a3, a1
        sh                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_toggle::u16::release:
        csrrci            a2, mstatus, 0x8
        lhu               a3, 0x0(a0)
        li                a4, 0x1
        andi              a1, a1, 0xf
        sll               a1, a4, a1
        xor               a4, a3, a1
        sh                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_toggle::u32::acqrel:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        li                a4, 0x1
        sll               a1, a4, a1
        xor               a4, a3, a1
        sw                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_toggle::u32::seqcst:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        li                a4, 0x1
        sll               a1, a4, a1
        xor               a4, a3, a1
        sw                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_toggle::u32::acquire:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        li                a4, 0x1
        sll               a1, a4, a1
        xor               a4, a3, a1
        sw                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_toggle::u32::relaxed:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        li                a4, 0x1
        sll               a1, a4, a1
        xor               a4, a3, a1
        sw                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_toggle::u32::release:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        li                a4, 0x1
        sll               a1, a4, a1
        xor               a4, a3, a1
        sw                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
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
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        xori              a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_nand::bool::seqcst_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        xori              a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_nand::bool::acqrel_false:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_nand::bool::acquire_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        xori              a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_nand::bool::relaxed_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        xori              a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_nand::bool::release_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        xori              a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_nand::bool::seqcst_false:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_nand::bool::acquire_false:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_nand::bool::relaxed_false:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_nand::bool::release_false:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_nand::bool::acqrel:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        beqz              a1, 0f
        xori              a1, a2, 0x1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        snez              a0, a2
        ret
0:
        ori               a1, a2, 0x1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        snez              a0, a2
        ret

asm_test::fetch_nand::bool::seqcst:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        beqz              a1, 0f
        xori              a1, a2, 0x1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        snez              a0, a2
        ret
0:
        ori               a1, a2, 0x1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        snez              a0, a2
        ret

asm_test::fetch_nand::bool::acquire:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        beqz              a1, 0f
        xori              a1, a2, 0x1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        snez              a0, a2
        ret
0:
        ori               a1, a2, 0x1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        snez              a0, a2
        ret

asm_test::fetch_nand::bool::relaxed:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        beqz              a1, 0f
        xori              a1, a2, 0x1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        snez              a0, a2
        ret
0:
        ori               a1, a2, 0x1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        snez              a0, a2
        ret

asm_test::fetch_nand::bool::release:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        beqz              a1, 0f
        xori              a1, a2, 0x1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        snez              a0, a2
        ret
0:
        ori               a1, a2, 0x1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        snez              a0, a2
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
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        mv                a4, a0
        bltu              a1, a0, 0f
        mv                a4, a1
0:
        sw                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umax::u32::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        mv                a4, a0
        bltu              a1, a0, 0f
        mv                a4, a1
0:
        sw                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umax::u32::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        mv                a4, a0
        bltu              a1, a0, 0f
        mv                a4, a1
0:
        sw                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umax::u32::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        mv                a4, a0
        bltu              a1, a0, 0f
        mv                a4, a1
0:
        sw                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umax::u32::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        mv                a4, a0
        bltu              a1, a0, 0f
        mv                a4, a1
0:
        sw                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
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
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        mv                a4, a0
        bltu              a0, a1, 0f
        mv                a4, a1
0:
        sw                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u32::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        mv                a4, a0
        bltu              a0, a1, 0f
        mv                a4, a1
0:
        sw                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u32::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        mv                a4, a0
        bltu              a0, a1, 0f
        mv                a4, a1
0:
        sw                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u32::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        mv                a4, a0
        bltu              a0, a1, 0f
        mv                a4, a1
0:
        sw                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u32::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        mv                a4, a0
        bltu              a0, a1, 0f
        mv                a4, a1
0:
        sw                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
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
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::seqcst_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::acqrel_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::acqrel_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::acquire_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::relaxed_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::release_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::seqcst_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::seqcst_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::acquire_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::acquire_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::relaxed_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::relaxed_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::release_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::release_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_true_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        seqz              a0, a2
        snez              a1, a2
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_true_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        seqz              a0, a2
        snez              a1, a2
        ret

asm_test::compare_exchange::bool::acqrel_acquire_true_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        seqz              a0, a2
        snez              a1, a2
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_true_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        seqz              a0, a2
        snez              a1, a2
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_false_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_true_false:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        seqz              a0, a2
        snez              a1, a2
        ret

asm_test::compare_exchange::bool::acquire_seqcst_true_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        seqz              a0, a2
        snez              a1, a2
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_true_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        seqz              a0, a2
        snez              a1, a2
        ret

asm_test::compare_exchange::bool::release_seqcst_true_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        seqz              a0, a2
        snez              a1, a2
        ret

asm_test::compare_exchange::bool::seqcst_acquire_true_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        seqz              a0, a2
        snez              a1, a2
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_true_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        seqz              a0, a2
        snez              a1, a2
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_false_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_true_false:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        seqz              a0, a2
        snez              a1, a2
        ret

asm_test::compare_exchange::bool::acqrel_acquire_false_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acqrel_acquire_true_false:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        seqz              a0, a2
        snez              a1, a2
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_false_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_true_false:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        seqz              a0, a2
        snez              a1, a2
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_false_false:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acquire_acquire_true_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        seqz              a0, a2
        snez              a1, a2
        ret

asm_test::compare_exchange::bool::acquire_relaxed_true_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        seqz              a0, a2
        snez              a1, a2
        ret

asm_test::compare_exchange::bool::acquire_seqcst_false_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acquire_seqcst_true_false:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        seqz              a0, a2
        snez              a1, a2
        ret

asm_test::compare_exchange::bool::relaxed_acquire_true_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        seqz              a0, a2
        snez              a1, a2
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_true_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        seqz              a0, a2
        snez              a1, a2
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_false_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_true_false:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        seqz              a0, a2
        snez              a1, a2
        ret

asm_test::compare_exchange::bool::release_acquire_true_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        seqz              a0, a2
        snez              a1, a2
        ret

asm_test::compare_exchange::bool::release_relaxed_true_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        seqz              a0, a2
        snez              a1, a2
        ret

asm_test::compare_exchange::bool::release_seqcst_false_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::release_seqcst_true_false:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        seqz              a0, a2
        snez              a1, a2
        ret

asm_test::compare_exchange::bool::seqcst_acquire_false_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::seqcst_acquire_true_false:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        seqz              a0, a2
        snez              a1, a2
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_false_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_true_false:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        seqz              a0, a2
        snez              a1, a2
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_false_false:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acqrel_acquire_false_false:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_false_false:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acquire_acquire_false_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acquire_acquire_true_false:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        seqz              a0, a2
        snez              a1, a2
        ret

asm_test::compare_exchange::bool::acquire_relaxed_false_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acquire_relaxed_true_false:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        seqz              a0, a2
        snez              a1, a2
        ret

asm_test::compare_exchange::bool::acquire_seqcst_false_false:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::relaxed_acquire_false_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::relaxed_acquire_true_false:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        seqz              a0, a2
        snez              a1, a2
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_false_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_true_false:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        seqz              a0, a2
        snez              a1, a2
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_false_false:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::release_acquire_false_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::release_acquire_true_false:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        seqz              a0, a2
        snez              a1, a2
        ret

asm_test::compare_exchange::bool::release_relaxed_false_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::release_relaxed_true_false:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        seqz              a0, a2
        snez              a1, a2
        ret

asm_test::compare_exchange::bool::release_seqcst_false_false:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::seqcst_acquire_false_false:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_false_false:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acquire_acquire_false_false:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::acquire_relaxed_false_false:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::relaxed_acquire_false_false:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_false_false:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::release_acquire_false_false:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a0
        mv                a1, a0
        ret

asm_test::compare_exchange::bool::release_relaxed_false_false:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
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
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::seqcst_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::acqrel_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::acqrel_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::acquire_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::relaxed_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::release_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::seqcst_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::seqcst_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::acquire_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::acquire_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::relaxed_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::relaxed_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::release_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::release_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::or::u8::acqrel_all:
        csrrci            a1, mstatus, 0x8
        li                a2, -0x1
        sb                a2, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::or::u8::seqcst_all:
        csrrci            a1, mstatus, 0x8
        li                a2, -0x1
        sb                a2, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::or::u8::acqrel_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::or::u8::acquire_all:
        csrrci            a1, mstatus, 0x8
        li                a2, -0x1
        sb                a2, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::or::u8::relaxed_all:
        csrrci            a1, mstatus, 0x8
        li                a2, -0x1
        sb                a2, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::or::u8::release_all:
        csrrci            a1, mstatus, 0x8
        li                a2, -0x1
        sb                a2, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::or::u8::seqcst_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::or::u8::acquire_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::or::u8::relaxed_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::or::u8::release_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::or::u8::acqrel:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        or                a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::or::u8::seqcst:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        or                a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::or::u8::acquire:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        or                a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::or::u8::relaxed:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        or                a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::or::u8::release:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        or                a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::or::u16::acqrel_all:
        csrrci            a1, mstatus, 0x8
        li                a2, -0x1
        sh                a2, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::or::u16::seqcst_all:
        csrrci            a1, mstatus, 0x8
        li                a2, -0x1
        sh                a2, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::or::u16::acqrel_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::or::u16::acquire_all:
        csrrci            a1, mstatus, 0x8
        li                a2, -0x1
        sh                a2, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::or::u16::relaxed_all:
        csrrci            a1, mstatus, 0x8
        li                a2, -0x1
        sh                a2, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::or::u16::release_all:
        csrrci            a1, mstatus, 0x8
        li                a2, -0x1
        sh                a2, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::or::u16::seqcst_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::or::u16::acquire_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::or::u16::relaxed_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::or::u16::release_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::or::u16::acqrel:
        csrrci            a2, mstatus, 0x8
        lh                a3, 0x0(a0)
        andi              a2, a2, 0x8
        or                a1, a3, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::or::u16::seqcst:
        csrrci            a2, mstatus, 0x8
        lh                a3, 0x0(a0)
        andi              a2, a2, 0x8
        or                a1, a3, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::or::u16::acquire:
        csrrci            a2, mstatus, 0x8
        lh                a3, 0x0(a0)
        andi              a2, a2, 0x8
        or                a1, a3, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::or::u16::relaxed:
        csrrci            a2, mstatus, 0x8
        lh                a3, 0x0(a0)
        andi              a2, a2, 0x8
        or                a1, a3, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::or::u16::release:
        csrrci            a2, mstatus, 0x8
        lh                a3, 0x0(a0)
        andi              a2, a2, 0x8
        or                a1, a3, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::or::u32::acqrel_all:
        csrrci            a1, mstatus, 0x8
        li                a2, -0x1
        sw                a2, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::or::u32::seqcst_all:
        csrrci            a1, mstatus, 0x8
        li                a2, -0x1
        sw                a2, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::or::u32::acqrel_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::or::u32::acquire_all:
        csrrci            a1, mstatus, 0x8
        li                a2, -0x1
        sw                a2, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::or::u32::relaxed_all:
        csrrci            a1, mstatus, 0x8
        li                a2, -0x1
        sw                a2, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::or::u32::release_all:
        csrrci            a1, mstatus, 0x8
        li                a2, -0x1
        sw                a2, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::or::u32::seqcst_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::or::u32::acquire_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::or::u32::relaxed_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::or::u32::release_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::or::u32::acqrel:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        or                a1, a3, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::or::u32::seqcst:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        or                a1, a3, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::or::u32::acquire:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        or                a1, a3, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::or::u32::relaxed:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        or                a1, a3, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::or::u32::release:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        or                a1, a3, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::or::bool::acqrel_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a2, a2, 0x1
        sb                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::or::bool::seqcst_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a2, a2, 0x1
        sb                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::or::bool::acqrel_false:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::or::bool::acquire_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a2, a2, 0x1
        sb                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::or::bool::relaxed_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a2, a2, 0x1
        sb                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::or::bool::release_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a2, a2, 0x1
        sb                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::or::bool::seqcst_false:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::or::bool::acquire_false:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::or::bool::relaxed_false:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::or::bool::release_false:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::or::bool::acqrel:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        or                a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::or::bool::seqcst:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        or                a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::or::bool::acquire:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        or                a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::or::bool::relaxed:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        or                a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::or::bool::release:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        or                a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
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
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::add::u32::seqcst_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::add::u32::acquire_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::add::u32::relaxed_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::add::u32::release_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::add::u32::acqrel:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        add               a1, a3, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::add::u32::seqcst:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        add               a1, a3, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::add::u32::acquire:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        add               a1, a3, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::add::u32::relaxed:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        add               a1, a3, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::add::u32::release:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        add               a1, a3, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::and::u8::acqrel_all:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::and::u8::seqcst_all:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::and::u8::acqrel_zero:
        csrrci            a1, mstatus, 0x8
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::and::u8::acquire_all:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::and::u8::relaxed_all:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::and::u8::release_all:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::and::u8::seqcst_zero:
        csrrci            a1, mstatus, 0x8
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::and::u8::acquire_zero:
        csrrci            a1, mstatus, 0x8
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::and::u8::relaxed_zero:
        csrrci            a1, mstatus, 0x8
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::and::u8::release_zero:
        csrrci            a1, mstatus, 0x8
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::and::u8::acqrel:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::and::u8::seqcst:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::and::u8::acquire:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::and::u8::relaxed:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::and::u8::release:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::and::u16::acqrel_all:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::and::u16::seqcst_all:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::and::u16::acqrel_zero:
        csrrci            a1, mstatus, 0x8
        sh                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::and::u16::acquire_all:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::and::u16::relaxed_all:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::and::u16::release_all:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::and::u16::seqcst_zero:
        csrrci            a1, mstatus, 0x8
        sh                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::and::u16::acquire_zero:
        csrrci            a1, mstatus, 0x8
        sh                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::and::u16::relaxed_zero:
        csrrci            a1, mstatus, 0x8
        sh                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::and::u16::release_zero:
        csrrci            a1, mstatus, 0x8
        sh                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::and::u16::acqrel:
        csrrci            a2, mstatus, 0x8
        lhu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::and::u16::seqcst:
        csrrci            a2, mstatus, 0x8
        lhu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::and::u16::acquire:
        csrrci            a2, mstatus, 0x8
        lhu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::and::u16::relaxed:
        csrrci            a2, mstatus, 0x8
        lhu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::and::u16::release:
        csrrci            a2, mstatus, 0x8
        lhu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::and::u32::acqrel_all:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::and::u32::seqcst_all:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::and::u32::acqrel_zero:
        csrrci            a1, mstatus, 0x8
        sw                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::and::u32::acquire_all:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::and::u32::relaxed_all:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::and::u32::release_all:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::and::u32::seqcst_zero:
        csrrci            a1, mstatus, 0x8
        sw                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::and::u32::acquire_zero:
        csrrci            a1, mstatus, 0x8
        sw                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::and::u32::relaxed_zero:
        csrrci            a1, mstatus, 0x8
        sw                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::and::u32::release_zero:
        csrrci            a1, mstatus, 0x8
        sw                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::and::u32::acqrel:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::and::u32::seqcst:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::and::u32::acquire:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::and::u32::relaxed:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::and::u32::release:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::and::bool::acqrel_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        andi              a2, a2, 0x1
        sb                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::and::bool::seqcst_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        andi              a2, a2, 0x1
        sb                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::and::bool::acqrel_false:
        csrrci            a1, mstatus, 0x8
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::and::bool::acquire_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        andi              a2, a2, 0x1
        sb                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::and::bool::relaxed_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        andi              a2, a2, 0x1
        sb                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::and::bool::release_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        andi              a2, a2, 0x1
        sb                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::and::bool::seqcst_false:
        csrrci            a1, mstatus, 0x8
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::and::bool::acquire_false:
        csrrci            a1, mstatus, 0x8
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::and::bool::relaxed_false:
        csrrci            a1, mstatus, 0x8
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::and::bool::release_false:
        csrrci            a1, mstatus, 0x8
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::and::bool::acqrel:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a1, a3
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::and::bool::seqcst:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a1, a3
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::and::bool::acquire:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a1, a3
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::and::bool::relaxed:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a1, a3
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::and::bool::release:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a1, a3
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
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
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        not               a2, a2
        sb                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::not::u8::seqcst:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        not               a2, a2
        sb                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::not::u8::acquire:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        not               a2, a2
        sb                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::not::u8::relaxed:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        not               a2, a2
        sb                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::not::u8::release:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        not               a2, a2
        sb                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::not::u16::acqrel:
        csrrci            a1, mstatus, 0x8
        lh                a2, 0x0(a0)
        andi              a1, a1, 0x8
        not               a2, a2
        sh                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::not::u16::seqcst:
        csrrci            a1, mstatus, 0x8
        lh                a2, 0x0(a0)
        andi              a1, a1, 0x8
        not               a2, a2
        sh                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::not::u16::acquire:
        csrrci            a1, mstatus, 0x8
        lh                a2, 0x0(a0)
        andi              a1, a1, 0x8
        not               a2, a2
        sh                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::not::u16::relaxed:
        csrrci            a1, mstatus, 0x8
        lh                a2, 0x0(a0)
        andi              a1, a1, 0x8
        not               a2, a2
        sh                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::not::u16::release:
        csrrci            a1, mstatus, 0x8
        lh                a2, 0x0(a0)
        andi              a1, a1, 0x8
        not               a2, a2
        sh                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::not::u32::acqrel:
        csrrci            a1, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a1, a1, 0x8
        not               a2, a2
        sw                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::not::u32::seqcst:
        csrrci            a1, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a1, a1, 0x8
        not               a2, a2
        sw                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::not::u32::acquire:
        csrrci            a1, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a1, a1, 0x8
        not               a2, a2
        sw                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::not::u32::relaxed:
        csrrci            a1, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a1, a1, 0x8
        not               a2, a2
        sw                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::not::u32::release:
        csrrci            a1, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a1, a1, 0x8
        not               a2, a2
        sw                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::not::bool::acqrel:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        xori              a2, a2, 0x1
        sb                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::not::bool::seqcst:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        xori              a2, a2, 0x1
        sb                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::not::bool::acquire:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        xori              a2, a2, 0x1
        sb                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::not::bool::relaxed:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        xori              a2, a2, 0x1
        sb                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::not::bool::release:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        xori              a2, a2, 0x1
        sb                a2, 0x0(a0)
        csrs              mstatus, a1
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
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::sub::u32::seqcst_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::sub::u32::acquire_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::sub::u32::relaxed_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::sub::u32::release_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::sub::u32::acqrel:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        sub               a3, a3, a1
        sw                a3, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::sub::u32::seqcst:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        sub               a3, a3, a1
        sw                a3, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::sub::u32::acquire:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        sub               a3, a3, a1
        sw                a3, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::sub::u32::relaxed:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        sub               a3, a3, a1
        sw                a3, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::sub::u32::release:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        sub               a3, a3, a1
        sw                a3, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::xor::u8::acqrel_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::xor::u8::seqcst_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::xor::u8::acquire_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::xor::u8::relaxed_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::xor::u8::release_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::xor::u8::acqrel:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        xor               a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::xor::u8::seqcst:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        xor               a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::xor::u8::acquire:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        xor               a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::xor::u8::relaxed:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        xor               a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::xor::u8::release:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        xor               a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::xor::u16::acqrel_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::xor::u16::seqcst_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::xor::u16::acquire_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::xor::u16::relaxed_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::xor::u16::release_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::xor::u16::acqrel:
        csrrci            a2, mstatus, 0x8
        lh                a3, 0x0(a0)
        andi              a2, a2, 0x8
        xor               a1, a3, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::xor::u16::seqcst:
        csrrci            a2, mstatus, 0x8
        lh                a3, 0x0(a0)
        andi              a2, a2, 0x8
        xor               a1, a3, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::xor::u16::acquire:
        csrrci            a2, mstatus, 0x8
        lh                a3, 0x0(a0)
        andi              a2, a2, 0x8
        xor               a1, a3, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::xor::u16::relaxed:
        csrrci            a2, mstatus, 0x8
        lh                a3, 0x0(a0)
        andi              a2, a2, 0x8
        xor               a1, a3, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::xor::u16::release:
        csrrci            a2, mstatus, 0x8
        lh                a3, 0x0(a0)
        andi              a2, a2, 0x8
        xor               a1, a3, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::xor::u32::acqrel_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::xor::u32::seqcst_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::xor::u32::acquire_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::xor::u32::relaxed_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::xor::u32::release_zero:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::xor::u32::acqrel:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        xor               a1, a3, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::xor::u32::seqcst:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        xor               a1, a3, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::xor::u32::acquire:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        xor               a1, a3, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::xor::u32::relaxed:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        xor               a1, a3, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::xor::u32::release:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        xor               a1, a3, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::xor::bool::acqrel_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        xori              a2, a2, 0x1
        sb                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::xor::bool::seqcst_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        xori              a2, a2, 0x1
        sb                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::xor::bool::acqrel_false:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::xor::bool::acquire_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        xori              a2, a2, 0x1
        sb                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::xor::bool::relaxed_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        xori              a2, a2, 0x1
        sb                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::xor::bool::release_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        xori              a2, a2, 0x1
        sb                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::xor::bool::seqcst_false:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::xor::bool::acquire_false:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::xor::bool::relaxed_false:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::xor::bool::release_false:
        csrrci            a0, mstatus, 0x8
        andi              a0, a0, 0x8
        csrs              mstatus, a0
        ret

asm_test::xor::bool::acqrel:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        xor               a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::xor::bool::seqcst:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        xor               a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::xor::bool::acquire:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        xor               a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::xor::bool::relaxed:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        xor               a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::xor::bool::release:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        xor               a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
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
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        sw                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::f32::seqcst:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        sw                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::f32::acquire:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        sw                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::f32::relaxed:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        sw                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::f32::release:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        sw                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
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
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        sw                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u32::seqcst:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        sw                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u32::acquire:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        sw                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u32::relaxed:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        sw                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u32::release:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        sw                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::bool::acqrel_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::swap::bool::seqcst_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::swap::bool::acqrel_false:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::swap::bool::acquire_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::swap::bool::relaxed_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::swap::bool::release_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::swap::bool::seqcst_false:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::swap::bool::acquire_false:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::swap::bool::relaxed_false:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::swap::bool::release_false:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::swap::bool::acqrel:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        beqz              a1, 0f
        ori               a1, a2, 0x1
        sb                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        snez              a0, a2
        ret
0:
        sb                zero, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        snez              a0, a2
        ret

asm_test::swap::bool::seqcst:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        beqz              a1, 0f
        ori               a1, a2, 0x1
        sb                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        snez              a0, a2
        ret
0:
        sb                zero, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        snez              a0, a2
        ret

asm_test::swap::bool::acquire:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        beqz              a1, 0f
        ori               a1, a2, 0x1
        sb                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        snez              a0, a2
        ret
0:
        sb                zero, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        snez              a0, a2
        ret

asm_test::swap::bool::relaxed:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        beqz              a1, 0f
        ori               a1, a2, 0x1
        sb                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        snez              a0, a2
        ret
0:
        sb                zero, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        snez              a0, a2
        ret

asm_test::swap::bool::release:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        beqz              a1, 0f
        ori               a1, a2, 0x1
        sb                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        snez              a0, a2
        ret
0:
        sb                zero, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        snez              a0, a2
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
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        li                a4, 0x1
        andi              a1, a1, 0x7
        sll               a1, a4, a1
        or                a4, a3, a1
        sb                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_set::u8::seqcst:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        li                a4, 0x1
        andi              a1, a1, 0x7
        sll               a1, a4, a1
        or                a4, a3, a1
        sb                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_set::u8::acquire:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        li                a4, 0x1
        andi              a1, a1, 0x7
        sll               a1, a4, a1
        or                a4, a3, a1
        sb                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_set::u8::relaxed:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        li                a4, 0x1
        andi              a1, a1, 0x7
        sll               a1, a4, a1
        or                a4, a3, a1
        sb                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_set::u8::release:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        li                a4, 0x1
        andi              a1, a1, 0x7
        sll               a1, a4, a1
        or                a4, a3, a1
        sb                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_set::u16::acqrel:
        csrrci            a2, mstatus, 0x8
        lhu               a3, 0x0(a0)
        li                a4, 0x1
        andi              a1, a1, 0xf
        sll               a1, a4, a1
        or                a4, a3, a1
        sh                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_set::u16::seqcst:
        csrrci            a2, mstatus, 0x8
        lhu               a3, 0x0(a0)
        li                a4, 0x1
        andi              a1, a1, 0xf
        sll               a1, a4, a1
        or                a4, a3, a1
        sh                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_set::u16::acquire:
        csrrci            a2, mstatus, 0x8
        lhu               a3, 0x0(a0)
        li                a4, 0x1
        andi              a1, a1, 0xf
        sll               a1, a4, a1
        or                a4, a3, a1
        sh                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_set::u16::relaxed:
        csrrci            a2, mstatus, 0x8
        lhu               a3, 0x0(a0)
        li                a4, 0x1
        andi              a1, a1, 0xf
        sll               a1, a4, a1
        or                a4, a3, a1
        sh                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_set::u16::release:
        csrrci            a2, mstatus, 0x8
        lhu               a3, 0x0(a0)
        li                a4, 0x1
        andi              a1, a1, 0xf
        sll               a1, a4, a1
        or                a4, a3, a1
        sh                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_set::u32::acqrel:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        li                a4, 0x1
        sll               a1, a4, a1
        or                a4, a3, a1
        sw                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_set::u32::seqcst:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        li                a4, 0x1
        sll               a1, a4, a1
        or                a4, a3, a1
        sw                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_set::u32::acquire:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        li                a4, 0x1
        sll               a1, a4, a1
        or                a4, a3, a1
        sw                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_set::u32::relaxed:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        li                a4, 0x1
        sll               a1, a4, a1
        or                a4, a3, a1
        sw                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_set::u32::release:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        li                a4, 0x1
        sll               a1, a4, a1
        or                a4, a3, a1
        sw                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::fetch_or::u8::acqrel_all:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        li                a3, -0x1
        sb                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_or::u8::seqcst_all:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        li                a3, -0x1
        sb                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_or::u8::acqrel_zero:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_or::u8::acquire_all:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        li                a3, -0x1
        sb                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_or::u8::relaxed_all:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        li                a3, -0x1
        sb                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_or::u8::release_all:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        li                a3, -0x1
        sb                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_or::u8::seqcst_zero:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_or::u8::acquire_zero:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_or::u8::relaxed_zero:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_or::u8::release_zero:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_or::u8::acqrel:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        or                a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::u8::seqcst:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        or                a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::u8::acquire:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        or                a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::u8::relaxed:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        or                a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::u8::release:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        or                a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::u16::acqrel_all:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        li                a3, -0x1
        sh                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_or::u16::seqcst_all:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        li                a3, -0x1
        sh                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_or::u16::acqrel_zero:
        csrrci            a1, mstatus, 0x8
        lh                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_or::u16::acquire_all:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        li                a3, -0x1
        sh                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_or::u16::relaxed_all:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        li                a3, -0x1
        sh                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_or::u16::release_all:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        li                a3, -0x1
        sh                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_or::u16::seqcst_zero:
        csrrci            a1, mstatus, 0x8
        lh                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_or::u16::acquire_zero:
        csrrci            a1, mstatus, 0x8
        lh                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_or::u16::relaxed_zero:
        csrrci            a1, mstatus, 0x8
        lh                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_or::u16::release_zero:
        csrrci            a1, mstatus, 0x8
        lh                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_or::u16::acqrel:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        andi              a3, a3, 0x8
        or                a1, a2, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::u16::seqcst:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        andi              a3, a3, 0x8
        or                a1, a2, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::u16::acquire:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        andi              a3, a3, 0x8
        or                a1, a2, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::u16::relaxed:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        andi              a3, a3, 0x8
        or                a1, a2, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::u16::release:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        andi              a3, a3, 0x8
        or                a1, a2, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::u32::acqrel_all:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        li                a3, -0x1
        sw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_or::u32::seqcst_all:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        li                a3, -0x1
        sw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_or::u32::acqrel_zero:
        csrrci            a1, mstatus, 0x8
        lw                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_or::u32::acquire_all:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        li                a3, -0x1
        sw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_or::u32::relaxed_all:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        li                a3, -0x1
        sw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_or::u32::release_all:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        li                a3, -0x1
        sw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_or::u32::seqcst_zero:
        csrrci            a1, mstatus, 0x8
        lw                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_or::u32::acquire_zero:
        csrrci            a1, mstatus, 0x8
        lw                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_or::u32::relaxed_zero:
        csrrci            a1, mstatus, 0x8
        lw                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_or::u32::release_zero:
        csrrci            a1, mstatus, 0x8
        lw                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_or::u32::acqrel:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a3, a3, 0x8
        or                a1, a2, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::u32::seqcst:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a3, a3, 0x8
        or                a1, a2, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::u32::acquire:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a3, a3, 0x8
        or                a1, a2, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::u32::relaxed:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a3, a3, 0x8
        or                a1, a2, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::u32::release:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a3, a3, 0x8
        or                a1, a2, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::bool::acqrel_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_or::bool::seqcst_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_or::bool::acqrel_false:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a0
        ret

asm_test::fetch_or::bool::acquire_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_or::bool::relaxed_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_or::bool::release_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        ori               a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_or::bool::seqcst_false:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a0
        ret

asm_test::fetch_or::bool::acquire_false:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a0
        ret

asm_test::fetch_or::bool::relaxed_false:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a0
        ret

asm_test::fetch_or::bool::release_false:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a0
        ret

asm_test::fetch_or::bool::acqrel:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        or                a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        snez              a0, a3
        ret

asm_test::fetch_or::bool::seqcst:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        or                a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        snez              a0, a3
        ret

asm_test::fetch_or::bool::acquire:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        or                a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        snez              a0, a3
        ret

asm_test::fetch_or::bool::relaxed:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        or                a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        snez              a0, a3
        ret

asm_test::fetch_or::bool::release:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        or                a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        snez              a0, a3
        ret

asm_test::bit_clear::u8::acqrel:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        li                a4, 0x1
        andi              a1, a1, 0x7
        sll               a1, a4, a1
        not               a4, a1
        and               a4, a3, a4
        sb                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_clear::u8::seqcst:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        li                a4, 0x1
        andi              a1, a1, 0x7
        sll               a1, a4, a1
        not               a4, a1
        and               a4, a3, a4
        sb                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_clear::u8::acquire:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        li                a4, 0x1
        andi              a1, a1, 0x7
        sll               a1, a4, a1
        not               a4, a1
        and               a4, a3, a4
        sb                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_clear::u8::relaxed:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        li                a4, 0x1
        andi              a1, a1, 0x7
        sll               a1, a4, a1
        not               a4, a1
        and               a4, a3, a4
        sb                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_clear::u8::release:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        li                a4, 0x1
        andi              a1, a1, 0x7
        sll               a1, a4, a1
        not               a4, a1
        and               a4, a3, a4
        sb                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_clear::u16::acqrel:
        csrrci            a2, mstatus, 0x8
        lhu               a3, 0x0(a0)
        li                a4, 0x1
        andi              a1, a1, 0xf
        sll               a1, a4, a1
        not               a4, a1
        and               a4, a3, a4
        sh                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_clear::u16::seqcst:
        csrrci            a2, mstatus, 0x8
        lhu               a3, 0x0(a0)
        li                a4, 0x1
        andi              a1, a1, 0xf
        sll               a1, a4, a1
        not               a4, a1
        and               a4, a3, a4
        sh                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_clear::u16::acquire:
        csrrci            a2, mstatus, 0x8
        lhu               a3, 0x0(a0)
        li                a4, 0x1
        andi              a1, a1, 0xf
        sll               a1, a4, a1
        not               a4, a1
        and               a4, a3, a4
        sh                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_clear::u16::relaxed:
        csrrci            a2, mstatus, 0x8
        lhu               a3, 0x0(a0)
        li                a4, 0x1
        andi              a1, a1, 0xf
        sll               a1, a4, a1
        not               a4, a1
        and               a4, a3, a4
        sh                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_clear::u16::release:
        csrrci            a2, mstatus, 0x8
        lhu               a3, 0x0(a0)
        li                a4, 0x1
        andi              a1, a1, 0xf
        sll               a1, a4, a1
        not               a4, a1
        and               a4, a3, a4
        sh                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_clear::u32::acqrel:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        li                a4, 0x1
        sll               a1, a4, a1
        not               a4, a1
        and               a4, a3, a4
        sw                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_clear::u32::seqcst:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        li                a4, 0x1
        sll               a1, a4, a1
        not               a4, a1
        and               a4, a3, a4
        sw                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_clear::u32::acquire:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        li                a4, 0x1
        sll               a1, a4, a1
        not               a4, a1
        and               a4, a3, a4
        sw                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_clear::u32::relaxed:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        li                a4, 0x1
        sll               a1, a4, a1
        not               a4, a1
        and               a4, a3, a4
        sw                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_clear::u32::release:
        csrrci            a2, mstatus, 0x8
        lw                a3, 0x0(a0)
        li                a4, 0x1
        sll               a1, a4, a1
        not               a4, a1
        and               a4, a3, a4
        sw                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::fetch_abs::f32::acqrel:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        andi              a2, a2, 0x8
        slli              a3, a1, 0x1
        srli              a3, a3, 0x1
        sw                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_abs::f32::seqcst:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        andi              a2, a2, 0x8
        slli              a3, a1, 0x1
        srli              a3, a3, 0x1
        sw                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_abs::f32::acquire:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        andi              a2, a2, 0x8
        slli              a3, a1, 0x1
        srli              a3, a3, 0x1
        sw                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_abs::f32::relaxed:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        andi              a2, a2, 0x8
        slli              a3, a1, 0x1
        srli              a3, a3, 0x1
        sw                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_abs::f32::release:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        andi              a2, a2, 0x8
        slli              a3, a1, 0x1
        srli              a3, a3, 0x1
        sw                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
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
        csrrci            a1, mstatus, 0x8
        lw                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_add::u32::seqcst_zero:
        csrrci            a1, mstatus, 0x8
        lw                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_add::u32::acquire_zero:
        csrrci            a1, mstatus, 0x8
        lw                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_add::u32::relaxed_zero:
        csrrci            a1, mstatus, 0x8
        lw                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_add::u32::release_zero:
        csrrci            a1, mstatus, 0x8
        lw                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_add::u32::acqrel:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a3, a3, 0x8
        add               a1, a2, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u32::seqcst:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a3, a3, 0x8
        add               a1, a2, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u32::acquire:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a3, a3, 0x8
        add               a1, a2, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u32::relaxed:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a3, a3, 0x8
        add               a1, a2, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u32::release:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a3, a3, 0x8
        add               a1, a2, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u8::acqrel_all:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_and::u8::seqcst_all:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_and::u8::acqrel_zero:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        sb                zero, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_and::u8::acquire_all:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_and::u8::relaxed_all:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_and::u8::release_all:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_and::u8::seqcst_zero:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        sb                zero, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_and::u8::acquire_zero:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        sb                zero, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_and::u8::relaxed_zero:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        sb                zero, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_and::u8::release_zero:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        sb                zero, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_and::u8::acqrel:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u8::seqcst:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u8::acquire:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u8::relaxed:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u8::release:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u16::acqrel_all:
        csrrci            a1, mstatus, 0x8
        lh                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_and::u16::seqcst_all:
        csrrci            a1, mstatus, 0x8
        lh                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_and::u16::acqrel_zero:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        sh                zero, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_and::u16::acquire_all:
        csrrci            a1, mstatus, 0x8
        lh                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_and::u16::relaxed_all:
        csrrci            a1, mstatus, 0x8
        lh                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_and::u16::release_all:
        csrrci            a1, mstatus, 0x8
        lh                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_and::u16::seqcst_zero:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        sh                zero, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_and::u16::acquire_zero:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        sh                zero, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_and::u16::relaxed_zero:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        sh                zero, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_and::u16::release_zero:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        sh                zero, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_and::u16::acqrel:
        csrrci            a3, mstatus, 0x8
        lhu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u16::seqcst:
        csrrci            a3, mstatus, 0x8
        lhu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u16::acquire:
        csrrci            a3, mstatus, 0x8
        lhu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u16::relaxed:
        csrrci            a3, mstatus, 0x8
        lhu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u16::release:
        csrrci            a3, mstatus, 0x8
        lhu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u32::acqrel_all:
        csrrci            a1, mstatus, 0x8
        lw                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_and::u32::seqcst_all:
        csrrci            a1, mstatus, 0x8
        lw                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_and::u32::acqrel_zero:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        sw                zero, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_and::u32::acquire_all:
        csrrci            a1, mstatus, 0x8
        lw                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_and::u32::relaxed_all:
        csrrci            a1, mstatus, 0x8
        lw                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_and::u32::release_all:
        csrrci            a1, mstatus, 0x8
        lw                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_and::u32::seqcst_zero:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        sw                zero, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_and::u32::acquire_zero:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        sw                zero, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_and::u32::relaxed_zero:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        sw                zero, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_and::u32::release_zero:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        sw                zero, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_and::u32::acqrel:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u32::seqcst:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u32::acquire:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u32::relaxed:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u32::release:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::bool::acqrel_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        andi              a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_and::bool::seqcst_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        andi              a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_and::bool::acqrel_false:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_and::bool::acquire_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        andi              a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_and::bool::relaxed_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        andi              a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_and::bool::release_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        andi              a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_and::bool::seqcst_false:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_and::bool::acquire_false:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_and::bool::relaxed_false:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_and::bool::release_false:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                zero, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_and::bool::acqrel:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a1, a3
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        snez              a0, a3
        ret

asm_test::fetch_and::bool::seqcst:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a1, a3
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        snez              a0, a3
        ret

asm_test::fetch_and::bool::acquire:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a1, a3
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        snez              a0, a3
        ret

asm_test::fetch_and::bool::relaxed:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a1, a3
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        snez              a0, a3
        ret

asm_test::fetch_and::bool::release:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a1, a3
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        snez              a0, a3
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
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        mv                a4, a0
        blt               a1, a0, 0f
        mv                a4, a1
0:
        sw                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_max::i32::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        mv                a4, a0
        blt               a1, a0, 0f
        mv                a4, a1
0:
        sw                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_max::i32::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        mv                a4, a0
        blt               a1, a0, 0f
        mv                a4, a1
0:
        sw                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_max::i32::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        mv                a4, a0
        blt               a1, a0, 0f
        mv                a4, a1
0:
        sw                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_max::i32::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        mv                a4, a0
        blt               a1, a0, 0f
        mv                a4, a1
0:
        sw                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
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
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        mv                a4, a0
        blt               a0, a1, 0f
        mv                a4, a1
0:
        sw                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::i32::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        mv                a4, a0
        blt               a0, a1, 0f
        mv                a4, a1
0:
        sw                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::i32::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        mv                a4, a0
        blt               a0, a1, 0f
        mv                a4, a1
0:
        sw                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::i32::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        mv                a4, a0
        blt               a0, a1, 0f
        mv                a4, a1
0:
        sw                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::i32::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        mv                a4, a0
        blt               a0, a1, 0f
        mv                a4, a1
0:
        sw                a4, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
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
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        lui               a3, 0x80000
        xor               a3, a1, a3
        sw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::f32::seqcst:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        lui               a3, 0x80000
        xor               a3, a1, a3
        sw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::f32::acquire:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        lui               a3, 0x80000
        xor               a3, a1, a3
        sw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::f32::relaxed:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        lui               a3, 0x80000
        xor               a3, a1, a3
        sw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::f32::release:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        lui               a3, 0x80000
        xor               a3, a1, a3
        sw                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
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
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sb                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u8::seqcst:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sb                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u8::acquire:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sb                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u8::relaxed:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sb                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u8::release:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sb                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u16::acqrel:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sh                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u16::seqcst:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sh                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u16::acquire:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sh                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u16::relaxed:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sh                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u16::release:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sh                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u32::acqrel:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sw                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u32::seqcst:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sw                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u32::acquire:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sw                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u32::relaxed:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sw                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u32::release:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sw                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::bool::acqrel:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        xori              a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_not::bool::seqcst:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        xori              a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_not::bool::acquire:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        xori              a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_not::bool::relaxed:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        xori              a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_not::bool::release:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        xori              a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
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
        csrrci            a1, mstatus, 0x8
        lw                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_sub::u32::seqcst_zero:
        csrrci            a1, mstatus, 0x8
        lw                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_sub::u32::acquire_zero:
        csrrci            a1, mstatus, 0x8
        lw                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_sub::u32::relaxed_zero:
        csrrci            a1, mstatus, 0x8
        lw                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_sub::u32::release_zero:
        csrrci            a1, mstatus, 0x8
        lw                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_sub::u32::acqrel:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a3, a3, 0x8
        sub               a1, a2, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u32::seqcst:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a3, a3, 0x8
        sub               a1, a2, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u32::acquire:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a3, a3, 0x8
        sub               a1, a2, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u32::relaxed:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a3, a3, 0x8
        sub               a1, a2, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u32::release:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a3, a3, 0x8
        sub               a1, a2, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u8::acqrel_zero:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_xor::u8::seqcst_zero:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_xor::u8::acquire_zero:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_xor::u8::relaxed_zero:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_xor::u8::release_zero:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_xor::u8::acqrel:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        xor               a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u8::seqcst:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        xor               a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u8::acquire:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        xor               a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u8::relaxed:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        xor               a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u8::release:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        xor               a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u16::acqrel_zero:
        csrrci            a1, mstatus, 0x8
        lh                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_xor::u16::seqcst_zero:
        csrrci            a1, mstatus, 0x8
        lh                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_xor::u16::acquire_zero:
        csrrci            a1, mstatus, 0x8
        lh                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_xor::u16::relaxed_zero:
        csrrci            a1, mstatus, 0x8
        lh                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_xor::u16::release_zero:
        csrrci            a1, mstatus, 0x8
        lh                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_xor::u16::acqrel:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        andi              a3, a3, 0x8
        xor               a1, a2, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u16::seqcst:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        andi              a3, a3, 0x8
        xor               a1, a2, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u16::acquire:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        andi              a3, a3, 0x8
        xor               a1, a2, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u16::relaxed:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        andi              a3, a3, 0x8
        xor               a1, a2, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u16::release:
        csrrci            a3, mstatus, 0x8
        lh                a2, 0x0(a0)
        andi              a3, a3, 0x8
        xor               a1, a2, a1
        sh                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u32::acqrel_zero:
        csrrci            a1, mstatus, 0x8
        lw                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_xor::u32::seqcst_zero:
        csrrci            a1, mstatus, 0x8
        lw                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_xor::u32::acquire_zero:
        csrrci            a1, mstatus, 0x8
        lw                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_xor::u32::relaxed_zero:
        csrrci            a1, mstatus, 0x8
        lw                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_xor::u32::release_zero:
        csrrci            a1, mstatus, 0x8
        lw                a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        ret

asm_test::fetch_xor::u32::acqrel:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a3, a3, 0x8
        xor               a1, a2, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u32::seqcst:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a3, a3, 0x8
        xor               a1, a2, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u32::acquire:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a3, a3, 0x8
        xor               a1, a2, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u32::relaxed:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a3, a3, 0x8
        xor               a1, a2, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u32::release:
        csrrci            a3, mstatus, 0x8
        lw                a2, 0x0(a0)
        andi              a3, a3, 0x8
        xor               a1, a2, a1
        sw                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::bool::acqrel_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        xori              a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_xor::bool::seqcst_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        xori              a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_xor::bool::acqrel_false:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a0
        ret

asm_test::fetch_xor::bool::acquire_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        xori              a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_xor::bool::relaxed_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        xori              a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_xor::bool::release_true:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a1, a1, 0x8
        xori              a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_xor::bool::seqcst_false:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a0
        ret

asm_test::fetch_xor::bool::acquire_false:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a0
        ret

asm_test::fetch_xor::bool::relaxed_false:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a0
        ret

asm_test::fetch_xor::bool::release_false:
        csrrci            a1, mstatus, 0x8
        lbu               a0, 0x0(a0)
        andi              a1, a1, 0x8
        csrs              mstatus, a1
        snez              a0, a0
        ret

asm_test::fetch_xor::bool::acqrel:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        xor               a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        snez              a0, a3
        ret

asm_test::fetch_xor::bool::seqcst:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        xor               a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        snez              a0, a3
        ret

asm_test::fetch_xor::bool::acquire:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        xor               a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        snez              a0, a3
        ret

asm_test::fetch_xor::bool::relaxed:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        xor               a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        snez              a0, a3
        ret

asm_test::fetch_xor::bool::release:
        csrrci            a2, mstatus, 0x8
        lbu               a3, 0x0(a0)
        andi              a2, a2, 0x8
        xor               a1, a3, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a2
        snez              a0, a3
        ret

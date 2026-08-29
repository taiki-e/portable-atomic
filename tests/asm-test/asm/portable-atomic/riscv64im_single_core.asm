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
        sllw              a1, a4, a1
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
        sllw              a1, a4, a1
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
        sllw              a1, a4, a1
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
        sllw              a1, a4, a1
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
        sllw              a1, a4, a1
        xor               a4, a3, a1
        sw                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_toggle::u64::acqrel:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        li                a4, 0x1
        sll               a1, a4, a1
        xor               a4, a3, a1
        sd                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_toggle::u64::seqcst:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        li                a4, 0x1
        sll               a1, a4, a1
        xor               a4, a3, a1
        sd                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_toggle::u64::acquire:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        li                a4, 0x1
        sll               a1, a4, a1
        xor               a4, a3, a1
        sd                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_toggle::u64::relaxed:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        li                a4, 0x1
        sll               a1, a4, a1
        xor               a4, a3, a1
        sd                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_toggle::u64::release:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        li                a4, 0x1
        sll               a1, a4, a1
        xor               a4, a3, a1
        sd                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
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

asm_test::fetch_nand::u64::acqrel:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        not               a1, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u64::seqcst:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        not               a1, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u64::acquire:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        not               a1, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u64::relaxed:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        not               a1, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u64::release:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        not               a1, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::bool::acqrel:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        beqz              a1, 0f
        xori              a1, a2, 0x1
        sb                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        andi              a0, a2, 0x1
        ret
0:
        li                a1, 0x1
        sb                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        andi              a0, a2, 0x1
        ret

asm_test::fetch_nand::bool::seqcst:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        beqz              a1, 0f
        xori              a1, a2, 0x1
        sb                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        andi              a0, a2, 0x1
        ret
0:
        li                a1, 0x1
        sb                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        andi              a0, a2, 0x1
        ret

asm_test::fetch_nand::bool::acquire:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        beqz              a1, 0f
        xori              a1, a2, 0x1
        sb                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        andi              a0, a2, 0x1
        ret
0:
        li                a1, 0x1
        sb                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        andi              a0, a2, 0x1
        ret

asm_test::fetch_nand::bool::relaxed:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        beqz              a1, 0f
        xori              a1, a2, 0x1
        sb                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        andi              a0, a2, 0x1
        ret
0:
        li                a1, 0x1
        sb                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        andi              a0, a2, 0x1
        ret

asm_test::fetch_nand::bool::release:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        beqz              a1, 0f
        xori              a1, a2, 0x1
        sb                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        andi              a0, a2, 0x1
        ret
0:
        li                a1, 0x1
        sb                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        andi              a0, a2, 0x1
        ret

asm_test::fetch_umax::u8::acqrel:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lbu               a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umax::u8::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lbu               a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umax::u8::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lbu               a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umax::u8::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lbu               a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umax::u8::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lbu               a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umax::u16::acqrel:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lhu               a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umax::u16::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lhu               a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umax::u16::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lhu               a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umax::u16::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lhu               a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umax::u16::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lhu               a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umax::u32::acqrel:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umax::u32::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umax::u32::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umax::u32::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umax::u32::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umax::u64::acqrel:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        ld                a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sd                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umax::u64::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        ld                a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sd                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umax::u64::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        ld                a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sd                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umax::u64::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        ld                a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sd                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umax::u64::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        ld                a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sd                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u8::acqrel:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lbu               a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u8::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lbu               a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u8::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lbu               a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u8::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lbu               a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u8::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lbu               a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u16::acqrel:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lhu               a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u16::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lhu               a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u16::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lhu               a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u16::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lhu               a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u16::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lhu               a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u32::acqrel:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u32::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u32::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u32::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u32::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u64::acqrel:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        ld                a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sd                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u64::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        ld                a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sd                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u64::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        ld                a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sd                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u64::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        ld                a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sd                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_umin::u64::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        ld                a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sd                a1, 0x0(a2)
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
        sext.w            a1, a1
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
        sext.w            a1, a1
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
        sext.w            a1, a1
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
        sext.w            a1, a1
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
        sext.w            a1, a1
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
        sext.w            a1, a1
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
        sext.w            a1, a1
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
        sext.w            a1, a1
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
        sext.w            a1, a1
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
        sext.w            a1, a1
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
        sext.w            a1, a1
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
        sext.w            a1, a1
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
        sext.w            a1, a1
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
        sext.w            a1, a1
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
        sext.w            a1, a1
        bne               a3, a1, 0f
        sw                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::f64::acqrel_seqcst:
        csrrci            a4, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        sd                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::f64::seqcst_seqcst:
        csrrci            a4, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        sd                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::f64::acqrel_acquire:
        csrrci            a4, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        sd                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::f64::acqrel_relaxed:
        csrrci            a4, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        sd                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::f64::acquire_seqcst:
        csrrci            a4, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        sd                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::f64::relaxed_seqcst:
        csrrci            a4, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        sd                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::f64::release_seqcst:
        csrrci            a4, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        sd                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::f64::seqcst_acquire:
        csrrci            a4, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        sd                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::f64::seqcst_relaxed:
        csrrci            a4, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        sd                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::f64::acquire_acquire:
        csrrci            a4, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        sd                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::f64::acquire_relaxed:
        csrrci            a4, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        sd                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::f64::relaxed_acquire:
        csrrci            a4, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        sd                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::f64::relaxed_relaxed:
        csrrci            a4, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        sd                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::f64::release_acquire:
        csrrci            a4, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        sd                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange::f64::release_relaxed:
        csrrci            a4, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        sd                a2, 0x0(a0)
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

asm_test::compare_exchange::u64::acqrel_seqcst:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
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

asm_test::compare_exchange::u64::seqcst_seqcst:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
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

asm_test::compare_exchange::u64::acqrel_acquire:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
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

asm_test::compare_exchange::u64::acqrel_relaxed:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
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

asm_test::compare_exchange::u64::acquire_seqcst:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
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

asm_test::compare_exchange::u64::relaxed_seqcst:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
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

asm_test::compare_exchange::u64::release_seqcst:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
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

asm_test::compare_exchange::u64::seqcst_acquire:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
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

asm_test::compare_exchange::u64::seqcst_relaxed:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
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

asm_test::compare_exchange::u64::acquire_acquire:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
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

asm_test::compare_exchange::u64::acquire_relaxed:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
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

asm_test::compare_exchange::u64::relaxed_acquire:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
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

asm_test::compare_exchange::u64::relaxed_relaxed:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
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

asm_test::compare_exchange::u64::release_acquire:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
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

asm_test::compare_exchange::u64::release_relaxed:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
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
        beq               a3, a1, 0f
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret
0:
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::bool::seqcst_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a3, a1, 0f
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret
0:
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::bool::acqrel_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a3, a1, 0f
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret
0:
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::bool::acqrel_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a3, a1, 0f
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret
0:
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::bool::acquire_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a3, a1, 0f
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret
0:
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::bool::relaxed_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a3, a1, 0f
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret
0:
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::bool::release_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a3, a1, 0f
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret
0:
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::bool::seqcst_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a3, a1, 0f
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret
0:
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::bool::seqcst_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a3, a1, 0f
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret
0:
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::bool::acquire_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a3, a1, 0f
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret
0:
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::bool::acquire_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a3, a1, 0f
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret
0:
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::bool::relaxed_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a3, a1, 0f
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret
0:
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::bool::relaxed_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a3, a1, 0f
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret
0:
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::bool::release_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a3, a1, 0f
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret
0:
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::bool::release_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a3, a1, 0f
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret
0:
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
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
        sext.w            a1, a1
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
        sext.w            a1, a1
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
        sext.w            a1, a1
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
        sext.w            a1, a1
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
        sext.w            a1, a1
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
        sext.w            a1, a1
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
        sext.w            a1, a1
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
        sext.w            a1, a1
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
        sext.w            a1, a1
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
        sext.w            a1, a1
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
        sext.w            a1, a1
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
        sext.w            a1, a1
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
        sext.w            a1, a1
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
        sext.w            a1, a1
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
        sext.w            a1, a1
        bne               a3, a1, 0f
        sw                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f64::acqrel_seqcst:
        csrrci            a4, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        sd                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f64::seqcst_seqcst:
        csrrci            a4, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        sd                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f64::acqrel_acquire:
        csrrci            a4, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        sd                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f64::acqrel_relaxed:
        csrrci            a4, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        sd                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f64::acquire_seqcst:
        csrrci            a4, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        sd                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f64::relaxed_seqcst:
        csrrci            a4, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        sd                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f64::release_seqcst:
        csrrci            a4, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        sd                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f64::seqcst_acquire:
        csrrci            a4, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        sd                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f64::seqcst_relaxed:
        csrrci            a4, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        sd                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f64::acquire_acquire:
        csrrci            a4, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        sd                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f64::acquire_relaxed:
        csrrci            a4, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        sd                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f64::relaxed_acquire:
        csrrci            a4, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        sd                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f64::relaxed_relaxed:
        csrrci            a4, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        sd                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f64::release_acquire:
        csrrci            a4, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        sd                a2, 0x0(a0)
0:
        xor               a1, a3, a1
        andi              a4, a4, 0x8
        snez              a0, a1
        csrs              mstatus, a4
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::f64::release_relaxed:
        csrrci            a4, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        sd                a2, 0x0(a0)
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

asm_test::compare_exchange_weak::u64::acqrel_seqcst:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
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

asm_test::compare_exchange_weak::u64::seqcst_seqcst:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
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

asm_test::compare_exchange_weak::u64::acqrel_acquire:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
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

asm_test::compare_exchange_weak::u64::acqrel_relaxed:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
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

asm_test::compare_exchange_weak::u64::acquire_seqcst:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
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

asm_test::compare_exchange_weak::u64::relaxed_seqcst:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
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

asm_test::compare_exchange_weak::u64::release_seqcst:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
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

asm_test::compare_exchange_weak::u64::seqcst_acquire:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
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

asm_test::compare_exchange_weak::u64::seqcst_relaxed:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
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

asm_test::compare_exchange_weak::u64::acquire_acquire:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
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

asm_test::compare_exchange_weak::u64::acquire_relaxed:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
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

asm_test::compare_exchange_weak::u64::relaxed_acquire:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
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

asm_test::compare_exchange_weak::u64::relaxed_relaxed:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
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

asm_test::compare_exchange_weak::u64::release_acquire:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
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

asm_test::compare_exchange_weak::u64::release_relaxed:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
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
        beq               a3, a1, 0f
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret
0:
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::bool::seqcst_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a3, a1, 0f
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret
0:
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::bool::acqrel_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a3, a1, 0f
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret
0:
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::bool::acqrel_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a3, a1, 0f
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret
0:
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::bool::acquire_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a3, a1, 0f
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret
0:
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::bool::relaxed_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a3, a1, 0f
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret
0:
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::bool::release_seqcst:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a3, a1, 0f
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret
0:
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::bool::seqcst_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a3, a1, 0f
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret
0:
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::bool::seqcst_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a3, a1, 0f
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret
0:
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::bool::acquire_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a3, a1, 0f
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret
0:
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::bool::acquire_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a3, a1, 0f
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret
0:
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::bool::relaxed_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a3, a1, 0f
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret
0:
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::bool::relaxed_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a3, a1, 0f
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret
0:
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::bool::release_acquire:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a3, a1, 0f
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret
0:
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::bool::release_relaxed:
        csrrci            a4, mstatus, 0x8
        lbu               a3, 0x0(a0)
        beq               a3, a1, 0f
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret
0:
        sb                a2, 0x0(a0)
        andi              a4, a4, 0x8
        csrs              mstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
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

asm_test::or::u64::acqrel:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        andi              a2, a2, 0x8
        or                a1, a3, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::or::u64::seqcst:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        andi              a2, a2, 0x8
        or                a1, a3, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::or::u64::acquire:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        andi              a2, a2, 0x8
        or                a1, a3, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::or::u64::relaxed:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        andi              a2, a2, 0x8
        or                a1, a3, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::or::u64::release:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        andi              a2, a2, 0x8
        or                a1, a3, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a2
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

asm_test::add::u64::acqrel:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        andi              a2, a2, 0x8
        add               a1, a3, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::add::u64::seqcst:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        andi              a2, a2, 0x8
        add               a1, a3, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::add::u64::acquire:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        andi              a2, a2, 0x8
        add               a1, a3, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::add::u64::relaxed:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        andi              a2, a2, 0x8
        add               a1, a3, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::add::u64::release:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        andi              a2, a2, 0x8
        add               a1, a3, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a2
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

asm_test::and::u64::acqrel:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::and::u64::seqcst:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::and::u64::acquire:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::and::u64::relaxed:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::and::u64::release:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a2
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

asm_test::neg::u64::acqrel:
        csrrci            a1, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a1, a1, 0x8
        neg               a2, a2
        sd                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::neg::u64::seqcst:
        csrrci            a1, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a1, a1, 0x8
        neg               a2, a2
        sd                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::neg::u64::acquire:
        csrrci            a1, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a1, a1, 0x8
        neg               a2, a2
        sd                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::neg::u64::relaxed:
        csrrci            a1, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a1, a1, 0x8
        neg               a2, a2
        sd                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::neg::u64::release:
        csrrci            a1, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a1, a1, 0x8
        neg               a2, a2
        sd                a2, 0x0(a0)
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

asm_test::not::u64::acqrel:
        csrrci            a1, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a1, a1, 0x8
        not               a2, a2
        sd                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::not::u64::seqcst:
        csrrci            a1, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a1, a1, 0x8
        not               a2, a2
        sd                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::not::u64::acquire:
        csrrci            a1, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a1, a1, 0x8
        not               a2, a2
        sd                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::not::u64::relaxed:
        csrrci            a1, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a1, a1, 0x8
        not               a2, a2
        sd                a2, 0x0(a0)
        csrs              mstatus, a1
        ret

asm_test::not::u64::release:
        csrrci            a1, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a1, a1, 0x8
        not               a2, a2
        sd                a2, 0x0(a0)
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

asm_test::sub::u64::acqrel:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        andi              a2, a2, 0x8
        sub               a3, a3, a1
        sd                a3, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::sub::u64::seqcst:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        andi              a2, a2, 0x8
        sub               a3, a3, a1
        sd                a3, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::sub::u64::acquire:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        andi              a2, a2, 0x8
        sub               a3, a3, a1
        sd                a3, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::sub::u64::relaxed:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        andi              a2, a2, 0x8
        sub               a3, a3, a1
        sd                a3, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::sub::u64::release:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        andi              a2, a2, 0x8
        sub               a3, a3, a1
        sd                a3, 0x0(a0)
        csrs              mstatus, a2
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

asm_test::xor::u64::acqrel:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        andi              a2, a2, 0x8
        xor               a1, a3, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::xor::u64::seqcst:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        andi              a2, a2, 0x8
        xor               a1, a3, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::xor::u64::acquire:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        andi              a2, a2, 0x8
        xor               a1, a3, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::xor::u64::relaxed:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        andi              a2, a2, 0x8
        xor               a1, a3, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a2
        ret

asm_test::xor::u64::release:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        andi              a2, a2, 0x8
        xor               a1, a3, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a2
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

asm_test::load::f64::seqcst:
        fence             rw, rw
        ld                a0, 0x0(a0)
        fence             r, rw
        ret

asm_test::load::f64::acquire:
        ld                a0, 0x0(a0)
        fence             r, rw
        ret

asm_test::load::f64::relaxed:
        ld                a0, 0x0(a0)
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
        fence             rw, rw
        ld                a0, 0x0(a0)
        fence             r, rw
        ret

asm_test::load::u64::acquire:
        ld                a0, 0x0(a0)
        fence             r, rw
        ret

asm_test::load::u64::relaxed:
        ld                a0, 0x0(a0)
        ret

asm_test::load::bool::seqcst:
        fence             rw, rw
        lb                a0, 0x0(a0)
        fence             r, rw
        andi              a0, a0, 0x1
        ret

asm_test::load::bool::acquire:
        lb                a0, 0x0(a0)
        fence             r, rw
        andi              a0, a0, 0x1
        ret

asm_test::load::bool::relaxed:
        lb                a0, 0x0(a0)
        andi              a0, a0, 0x1
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

asm_test::swap::f64::acqrel:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        sd                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::f64::seqcst:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        sd                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::f64::acquire:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        sd                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::f64::relaxed:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        sd                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::f64::release:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        sd                a1, 0x0(a0)
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

asm_test::swap::u64::acqrel:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        sd                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u64::seqcst:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        sd                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u64::acquire:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        sd                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u64::relaxed:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        sd                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u64::release:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        sd                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::bool::acqrel:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::bool::seqcst:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::bool::acquire:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::bool::relaxed:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::swap::bool::release:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        sb                a1, 0x0(a0)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        mv                a0, a2
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
        fence             rw, w
        sd                a1, 0x0(a0)
        fence             rw, rw
        ret

asm_test::store::f64::relaxed:
        sd                a1, 0x0(a0)
        ret

asm_test::store::f64::release:
        fence             rw, w
        sd                a1, 0x0(a0)
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
        fence             rw, w
        sd                a1, 0x0(a0)
        fence             rw, rw
        ret

asm_test::store::u64::relaxed:
        sd                a1, 0x0(a0)
        ret

asm_test::store::u64::release:
        fence             rw, w
        sd                a1, 0x0(a0)
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
        sllw              a1, a4, a1
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
        sllw              a1, a4, a1
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
        sllw              a1, a4, a1
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
        sllw              a1, a4, a1
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
        sllw              a1, a4, a1
        or                a4, a3, a1
        sw                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_set::u64::acqrel:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        li                a4, 0x1
        sll               a1, a4, a1
        or                a4, a3, a1
        sd                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_set::u64::seqcst:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        li                a4, 0x1
        sll               a1, a4, a1
        or                a4, a3, a1
        sd                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_set::u64::acquire:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        li                a4, 0x1
        sll               a1, a4, a1
        or                a4, a3, a1
        sd                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_set::u64::relaxed:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        li                a4, 0x1
        sll               a1, a4, a1
        or                a4, a3, a1
        sd                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_set::u64::release:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        li                a4, 0x1
        sll               a1, a4, a1
        or                a4, a3, a1
        sd                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
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

asm_test::fetch_or::u64::acqrel:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a3, a3, 0x8
        or                a1, a2, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::u64::seqcst:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a3, a3, 0x8
        or                a1, a2, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::u64::acquire:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a3, a3, 0x8
        or                a1, a2, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::u64::relaxed:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a3, a3, 0x8
        or                a1, a2, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::u64::release:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a3, a3, 0x8
        or                a1, a2, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::bool::acqrel:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        or                a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::bool::seqcst:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        or                a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::bool::acquire:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        or                a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::bool::relaxed:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        or                a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::bool::release:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        or                a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
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
        sllw              a1, a4, a1
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
        sllw              a1, a4, a1
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
        sllw              a1, a4, a1
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
        sllw              a1, a4, a1
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
        sllw              a1, a4, a1
        not               a4, a1
        and               a4, a3, a4
        sw                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_clear::u64::acqrel:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        li                a4, 0x1
        sll               a1, a4, a1
        not               a4, a1
        and               a4, a3, a4
        sd                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_clear::u64::seqcst:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        li                a4, 0x1
        sll               a1, a4, a1
        not               a4, a1
        and               a4, a3, a4
        sd                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_clear::u64::acquire:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        li                a4, 0x1
        sll               a1, a4, a1
        not               a4, a1
        and               a4, a3, a4
        sd                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_clear::u64::relaxed:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        li                a4, 0x1
        sll               a1, a4, a1
        not               a4, a1
        and               a4, a3, a4
        sd                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::bit_clear::u64::release:
        csrrci            a2, mstatus, 0x8
        ld                a3, 0x0(a0)
        li                a4, 0x1
        sll               a1, a4, a1
        not               a4, a1
        and               a4, a3, a4
        sd                a4, 0x0(a0)
        andi              a2, a2, 0x8
        and               a1, a3, a1
        csrs              mstatus, a2
        snez              a0, a1
        ret

asm_test::fetch_abs::f32::acqrel:
        csrrci            a2, mstatus, 0x8
        lwu               a1, 0x0(a0)
        andi              a2, a2, 0x8
        slli              a3, a1, 0x21
        srli              a3, a3, 0x21
        sw                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_abs::f32::seqcst:
        csrrci            a2, mstatus, 0x8
        lwu               a1, 0x0(a0)
        andi              a2, a2, 0x8
        slli              a3, a1, 0x21
        srli              a3, a3, 0x21
        sw                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_abs::f32::acquire:
        csrrci            a2, mstatus, 0x8
        lwu               a1, 0x0(a0)
        andi              a2, a2, 0x8
        slli              a3, a1, 0x21
        srli              a3, a3, 0x21
        sw                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_abs::f32::relaxed:
        csrrci            a2, mstatus, 0x8
        lwu               a1, 0x0(a0)
        andi              a2, a2, 0x8
        slli              a3, a1, 0x21
        srli              a3, a3, 0x21
        sw                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_abs::f32::release:
        csrrci            a2, mstatus, 0x8
        lwu               a1, 0x0(a0)
        andi              a2, a2, 0x8
        slli              a3, a1, 0x21
        srli              a3, a3, 0x21
        sw                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_abs::f64::acqrel:
        csrrci            a2, mstatus, 0x8
        ld                a1, 0x0(a0)
        andi              a2, a2, 0x8
        slli              a3, a1, 0x1
        srli              a3, a3, 0x1
        sd                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_abs::f64::seqcst:
        csrrci            a2, mstatus, 0x8
        ld                a1, 0x0(a0)
        andi              a2, a2, 0x8
        slli              a3, a1, 0x1
        srli              a3, a3, 0x1
        sd                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_abs::f64::acquire:
        csrrci            a2, mstatus, 0x8
        ld                a1, 0x0(a0)
        andi              a2, a2, 0x8
        slli              a3, a1, 0x1
        srli              a3, a3, 0x1
        sd                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_abs::f64::relaxed:
        csrrci            a2, mstatus, 0x8
        ld                a1, 0x0(a0)
        andi              a2, a2, 0x8
        slli              a3, a1, 0x1
        srli              a3, a3, 0x1
        sd                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_abs::f64::release:
        csrrci            a2, mstatus, 0x8
        ld                a1, 0x0(a0)
        andi              a2, a2, 0x8
        slli              a3, a1, 0x1
        srli              a3, a3, 0x1
        sd                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
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

asm_test::fetch_add::f32::acqrel:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a2, 0x0(a0)
        sext.w            a3, s1
        mv                a0, a1
        beq               a2, a3, 1f
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
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_add::f32::seqcst:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a2, 0x0(a0)
        sext.w            a3, s1
        mv                a0, a1
        beq               a2, a3, 1f
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
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_add::f32::acquire:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a2, 0x0(a0)
        sext.w            a3, s1
        mv                a0, a1
        beq               a2, a3, 1f
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
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_add::f32::relaxed:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a2, 0x0(a0)
        sext.w            a3, s1
        mv                a0, a1
        beq               a2, a3, 1f
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
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_add::f32::release:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a2, 0x0(a0)
        sext.w            a3, s1
        mv                a0, a1
        beq               a2, a3, 1f
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
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_add::f64::acqrel:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        ld                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        ld                a2, 0x0(a0)
        mv                a0, a1
        beq               a2, s1, 1f
0:
        andi              a1, s2, 0x8
        csrs              mstatus, a1
        csrrci            s2, mstatus, 0x8
        mv                s1, a2
        ld                a2, 0x0(s0)
        bne               a2, s1, 0b
1:
        mv                a1, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sd                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_add::f64::seqcst:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        ld                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        ld                a2, 0x0(a0)
        mv                a0, a1
        beq               a2, s1, 1f
0:
        andi              a1, s2, 0x8
        csrs              mstatus, a1
        csrrci            s2, mstatus, 0x8
        mv                s1, a2
        ld                a2, 0x0(s0)
        bne               a2, s1, 0b
1:
        mv                a1, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sd                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_add::f64::acquire:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        ld                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        ld                a2, 0x0(a0)
        mv                a0, a1
        beq               a2, s1, 1f
0:
        andi              a1, s2, 0x8
        csrs              mstatus, a1
        csrrci            s2, mstatus, 0x8
        mv                s1, a2
        ld                a2, 0x0(s0)
        bne               a2, s1, 0b
1:
        mv                a1, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sd                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_add::f64::relaxed:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        ld                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        ld                a2, 0x0(a0)
        mv                a0, a1
        beq               a2, s1, 1f
0:
        andi              a1, s2, 0x8
        csrs              mstatus, a1
        csrrci            s2, mstatus, 0x8
        mv                s1, a2
        ld                a2, 0x0(s0)
        bne               a2, s1, 0b
1:
        mv                a1, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sd                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_add::f64::release:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        ld                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        ld                a2, 0x0(a0)
        mv                a0, a1
        beq               a2, s1, 1f
0:
        andi              a1, s2, 0x8
        csrs              mstatus, a1
        csrrci            s2, mstatus, 0x8
        mv                s1, a2
        ld                a2, 0x0(s0)
        bne               a2, s1, 0b
1:
        mv                a1, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sd                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
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

asm_test::fetch_add::u64::acqrel:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a3, a3, 0x8
        add               a1, a2, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u64::seqcst:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a3, a3, 0x8
        add               a1, a2, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u64::acquire:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a3, a3, 0x8
        add               a1, a2, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u64::relaxed:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a3, a3, 0x8
        add               a1, a2, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u64::release:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a3, a3, 0x8
        add               a1, a2, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
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

asm_test::fetch_and::u64::acqrel:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u64::seqcst:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u64::acquire:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u64::relaxed:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u64::release:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a2, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::bool::acqrel:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a1, a2
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::bool::seqcst:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a1, a2
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::bool::acquire:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a1, a2
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::bool::relaxed:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a1, a2
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::bool::release:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        and               a1, a1, a2
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_max::i8::acqrel:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lb                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_max::i8::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lb                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_max::i8::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lb                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_max::i8::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lb                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_max::i8::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lb                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_max::f32::acqrel:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        sext.w            a2, s1
        beq               a0, a2, 1f
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
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_max::f32::seqcst:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        sext.w            a2, s1
        beq               a0, a2, 1f
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
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_max::f32::acquire:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        sext.w            a2, s1
        beq               a0, a2, 1f
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
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_max::f32::relaxed:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        sext.w            a2, s1
        beq               a0, a2, 1f
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
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_max::f32::release:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        sext.w            a2, s1
        beq               a0, a2, 1f
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
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_max::f64::acqrel:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        ld                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        ld                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a2, s2, 0x8
        csrs              mstatus, a2
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        ld                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sd                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_max::f64::seqcst:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        ld                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        ld                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a2, s2, 0x8
        csrs              mstatus, a2
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        ld                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sd                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_max::f64::acquire:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        ld                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        ld                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a2, s2, 0x8
        csrs              mstatus, a2
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        ld                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sd                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_max::f64::relaxed:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        ld                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        ld                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a2, s2, 0x8
        csrs              mstatus, a2
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        ld                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sd                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_max::f64::release:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        ld                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        ld                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a2, s2, 0x8
        csrs              mstatus, a2
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        ld                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sd                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_max::i16::acqrel:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lh                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_max::i16::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lh                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_max::i16::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lh                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_max::i16::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lh                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_max::i16::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lh                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_max::i32::acqrel:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_max::i32::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_max::i32::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_max::i32::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_max::i32::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_max::i64::acqrel:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        ld                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sd                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_max::i64::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        ld                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sd                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_max::i64::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        ld                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sd                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_max::i64::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        ld                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sd                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_max::i64::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        ld                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sd                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::i8::acqrel:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lb                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::i8::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lb                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::i8::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lb                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::i8::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lb                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::i8::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lb                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::f32::acqrel:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        sext.w            a2, s1
        beq               a0, a2, 1f
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
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_min::f32::seqcst:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        sext.w            a2, s1
        beq               a0, a2, 1f
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
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_min::f32::acquire:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        sext.w            a2, s1
        beq               a0, a2, 1f
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
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_min::f32::relaxed:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        sext.w            a2, s1
        beq               a0, a2, 1f
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
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_min::f32::release:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        sext.w            a2, s1
        beq               a0, a2, 1f
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
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_min::f64::acqrel:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        ld                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        ld                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a2, s2, 0x8
        csrs              mstatus, a2
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        ld                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sd                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_min::f64::seqcst:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        ld                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        ld                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a2, s2, 0x8
        csrs              mstatus, a2
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        ld                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sd                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_min::f64::acquire:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        ld                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        ld                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a2, s2, 0x8
        csrs              mstatus, a2
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        ld                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sd                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_min::f64::relaxed:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        ld                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        ld                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a2, s2, 0x8
        csrs              mstatus, a2
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        ld                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sd                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_min::f64::release:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        ld                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        ld                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a2, s2, 0x8
        csrs              mstatus, a2
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        ld                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sd                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_min::i16::acqrel:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lh                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::i16::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lh                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::i16::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lh                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::i16::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lh                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::i16::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lh                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::i32::acqrel:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::i32::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::i32::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::i32::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::i32::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        lw                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::i64::acqrel:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        ld                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sd                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::i64::seqcst:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        ld                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sd                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::i64::acquire:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        ld                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sd                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::i64::relaxed:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        ld                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sd                a1, 0x0(a2)
        andi              a3, a3, 0x8
        csrs              mstatus, a3
        ret

asm_test::fetch_min::i64::release:
        mv                a2, a0
        csrrci            a3, mstatus, 0x8
        ld                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sd                a1, 0x0(a2)
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

asm_test::fetch_neg::f64::acqrel:
        csrrci            a2, mstatus, 0x8
        ld                a1, 0x0(a0)
        li                a3, -0x1
        slli              a3, a3, 0x3f
        xor               a3, a1, a3
        sd                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::f64::seqcst:
        csrrci            a2, mstatus, 0x8
        ld                a1, 0x0(a0)
        li                a3, -0x1
        slli              a3, a3, 0x3f
        xor               a3, a1, a3
        sd                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::f64::acquire:
        csrrci            a2, mstatus, 0x8
        ld                a1, 0x0(a0)
        li                a3, -0x1
        slli              a3, a3, 0x3f
        xor               a3, a1, a3
        sd                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::f64::relaxed:
        csrrci            a2, mstatus, 0x8
        ld                a1, 0x0(a0)
        li                a3, -0x1
        slli              a3, a3, 0x3f
        xor               a3, a1, a3
        sd                a3, 0x0(a0)
        andi              a2, a2, 0x8
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::f64::release:
        csrrci            a2, mstatus, 0x8
        ld                a1, 0x0(a0)
        li                a3, -0x1
        slli              a3, a3, 0x3f
        xor               a3, a1, a3
        sd                a3, 0x0(a0)
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

asm_test::fetch_neg::u64::acqrel:
        csrrci            a2, mstatus, 0x8
        ld                a1, 0x0(a0)
        andi              a2, a2, 0x8
        neg               a3, a1
        sd                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u64::seqcst:
        csrrci            a2, mstatus, 0x8
        ld                a1, 0x0(a0)
        andi              a2, a2, 0x8
        neg               a3, a1
        sd                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u64::acquire:
        csrrci            a2, mstatus, 0x8
        ld                a1, 0x0(a0)
        andi              a2, a2, 0x8
        neg               a3, a1
        sd                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u64::relaxed:
        csrrci            a2, mstatus, 0x8
        ld                a1, 0x0(a0)
        andi              a2, a2, 0x8
        neg               a3, a1
        sd                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u64::release:
        csrrci            a2, mstatus, 0x8
        ld                a1, 0x0(a0)
        andi              a2, a2, 0x8
        neg               a3, a1
        sd                a3, 0x0(a0)
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

asm_test::fetch_not::u64::acqrel:
        csrrci            a2, mstatus, 0x8
        ld                a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sd                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u64::seqcst:
        csrrci            a2, mstatus, 0x8
        ld                a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sd                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u64::acquire:
        csrrci            a2, mstatus, 0x8
        ld                a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sd                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u64::relaxed:
        csrrci            a2, mstatus, 0x8
        ld                a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sd                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u64::release:
        csrrci            a2, mstatus, 0x8
        ld                a1, 0x0(a0)
        andi              a2, a2, 0x8
        not               a3, a1
        sd                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::bool::acqrel:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        andi              a2, a2, 0x8
        xori              a3, a1, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::bool::seqcst:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        andi              a2, a2, 0x8
        xori              a3, a1, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::bool::acquire:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        andi              a2, a2, 0x8
        xori              a3, a1, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::bool::relaxed:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        andi              a2, a2, 0x8
        xori              a3, a1, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::bool::release:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        andi              a2, a2, 0x8
        xori              a3, a1, 0x1
        sb                a3, 0x0(a0)
        csrs              mstatus, a2
        mv                a0, a1
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

asm_test::fetch_sub::f32::acqrel:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        sext.w            a2, s1
        beq               a0, a2, 1f
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
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_sub::f32::seqcst:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        sext.w            a2, s1
        beq               a0, a2, 1f
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
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_sub::f32::acquire:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        sext.w            a2, s1
        beq               a0, a2, 1f
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
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_sub::f32::relaxed:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        sext.w            a2, s1
        beq               a0, a2, 1f
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
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_sub::f32::release:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        lw                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        lw                a0, 0x0(a0)
        sext.w            a2, s1
        beq               a0, a2, 1f
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
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_sub::f64::acqrel:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        ld                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        ld                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a2, s2, 0x8
        csrs              mstatus, a2
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        ld                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sd                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_sub::f64::seqcst:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        ld                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        ld                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a2, s2, 0x8
        csrs              mstatus, a2
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        ld                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sd                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_sub::f64::acquire:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        ld                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        ld                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a2, s2, 0x8
        csrs              mstatus, a2
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        ld                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sd                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_sub::f64::relaxed:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        ld                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        ld                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a2, s2, 0x8
        csrs              mstatus, a2
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        ld                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sd                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
        ret

asm_test::fetch_sub::f64::release:
        addi              sp, sp, -0x20
        sd                ra, 0x18(sp)
        sd                s0, 0x10(sp)
        sd                s1, 0x8(sp)
        sd                s2, 0x0(sp)
        mv                s0, a0
        ld                s1, 0x0(a0)
        csrrci            s2, mstatus, 0x8
        ld                a0, 0x0(a0)
        beq               a0, s1, 1f
0:
        andi              a2, s2, 0x8
        csrs              mstatus, a2
        csrrci            s2, mstatus, 0x8
        mv                s1, a0
        ld                a0, 0x0(s0)
        bne               a0, s1, 0b
1:
        mv                a0, s1
2:
        auipc             ra, 0x0
        jalr              r2b
        andi              a1, s2, 0x8
        sd                a0, 0x0(s0)
        csrs              mstatus, a1
        mv                a0, s1
        ld                ra, 0x18(sp)
        ld                s0, 0x10(sp)
        ld                s1, 0x8(sp)
        ld                s2, 0x0(sp)
        addi              sp, sp, 0x20
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

asm_test::fetch_sub::u64::acqrel:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a3, a3, 0x8
        sub               a1, a2, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u64::seqcst:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a3, a3, 0x8
        sub               a1, a2, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u64::acquire:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a3, a3, 0x8
        sub               a1, a2, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u64::relaxed:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a3, a3, 0x8
        sub               a1, a2, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u64::release:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a3, a3, 0x8
        sub               a1, a2, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
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

asm_test::fetch_xor::u64::acqrel:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a3, a3, 0x8
        xor               a1, a2, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u64::seqcst:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a3, a3, 0x8
        xor               a1, a2, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u64::acquire:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a3, a3, 0x8
        xor               a1, a2, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u64::relaxed:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a3, a3, 0x8
        xor               a1, a2, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u64::release:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        andi              a3, a3, 0x8
        xor               a1, a2, a1
        sd                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::bool::acqrel:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        xor               a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::bool::seqcst:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        xor               a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::bool::acquire:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        xor               a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::bool::relaxed:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        xor               a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::bool::release:
        csrrci            a3, mstatus, 0x8
        lbu               a2, 0x0(a0)
        andi              a3, a3, 0x8
        xor               a1, a2, a1
        sb                a1, 0x0(a0)
        csrs              mstatus, a3
        mv                a0, a2
        ret

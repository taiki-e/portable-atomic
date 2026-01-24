asm_test::fetch_nand::u8::acqrel:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u8::seqcst:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u8::acquire:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u8::relaxed:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u8::release:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u16::acqrel:
        csrrci            a3, sstatus, 0x2
        lhu               a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u16::seqcst:
        csrrci            a3, sstatus, 0x2
        lhu               a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u16::acquire:
        csrrci            a3, sstatus, 0x2
        lhu               a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u16::relaxed:
        csrrci            a3, sstatus, 0x2
        lhu               a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u16::release:
        csrrci            a3, sstatus, 0x2
        lhu               a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u32::acqrel:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u32::seqcst:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u32::acquire:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u32::relaxed:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u32::release:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::bool::acqrel:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        beqz              a1, 0f
        xori              a1, a2, 0x1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        snez              a0, a2
        ret
0:
        ori               a1, a2, 0x1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        snez              a0, a2
        ret

asm_test::fetch_nand::bool::seqcst:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        beqz              a1, 0f
        xori              a1, a2, 0x1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        snez              a0, a2
        ret
0:
        ori               a1, a2, 0x1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        snez              a0, a2
        ret

asm_test::fetch_nand::bool::acquire:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        beqz              a1, 0f
        xori              a1, a2, 0x1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        snez              a0, a2
        ret
0:
        ori               a1, a2, 0x1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        snez              a0, a2
        ret

asm_test::fetch_nand::bool::relaxed:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        beqz              a1, 0f
        xori              a1, a2, 0x1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        snez              a0, a2
        ret
0:
        ori               a1, a2, 0x1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        snez              a0, a2
        ret

asm_test::fetch_nand::bool::release:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        beqz              a1, 0f
        xori              a1, a2, 0x1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        snez              a0, a2
        ret
0:
        ori               a1, a2, 0x1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        snez              a0, a2
        ret

asm_test::fetch_umax::u8::acqrel:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lbu               a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_umax::u8::seqcst:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lbu               a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_umax::u8::acquire:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lbu               a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_umax::u8::relaxed:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lbu               a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_umax::u8::release:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lbu               a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_umax::u16::acqrel:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lhu               a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_umax::u16::seqcst:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lhu               a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_umax::u16::acquire:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lhu               a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_umax::u16::relaxed:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lhu               a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_umax::u16::release:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lhu               a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_umax::u32::acqrel:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lw                a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_umax::u32::seqcst:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lw                a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_umax::u32::acquire:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lw                a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_umax::u32::relaxed:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lw                a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_umax::u32::release:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lw                a0, 0x0(a0)
        bltu              a0, a1, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_umin::u8::acqrel:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lbu               a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_umin::u8::seqcst:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lbu               a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_umin::u8::acquire:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lbu               a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_umin::u8::relaxed:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lbu               a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_umin::u8::release:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lbu               a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_umin::u16::acqrel:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lhu               a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_umin::u16::seqcst:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lhu               a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_umin::u16::acquire:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lhu               a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_umin::u16::relaxed:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lhu               a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_umin::u16::release:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lhu               a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_umin::u32::acqrel:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lw                a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_umin::u32::seqcst:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lw                a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_umin::u32::acquire:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lw                a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_umin::u32::relaxed:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lw                a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_umin::u32::release:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lw                a0, 0x0(a0)
        bltu              a1, a0, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::compare_exchange::u8::acqrel_seqcst:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              sstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::seqcst_seqcst:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              sstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::acqrel_acquire:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              sstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::acqrel_relaxed:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              sstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::acquire_seqcst:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              sstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::relaxed_seqcst:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              sstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::release_seqcst:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              sstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::seqcst_acquire:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              sstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::seqcst_relaxed:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              sstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::acquire_acquire:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              sstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::acquire_relaxed:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              sstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::relaxed_acquire:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              sstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::relaxed_relaxed:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              sstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::release_acquire:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              sstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u8::release_relaxed:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              sstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::acqrel_seqcst:
        csrrci            a5, sstatus, 0x2
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::seqcst_seqcst:
        csrrci            a5, sstatus, 0x2
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::acqrel_acquire:
        csrrci            a5, sstatus, 0x2
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::acqrel_relaxed:
        csrrci            a5, sstatus, 0x2
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::acquire_seqcst:
        csrrci            a5, sstatus, 0x2
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::relaxed_seqcst:
        csrrci            a5, sstatus, 0x2
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::release_seqcst:
        csrrci            a5, sstatus, 0x2
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::seqcst_acquire:
        csrrci            a5, sstatus, 0x2
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::seqcst_relaxed:
        csrrci            a5, sstatus, 0x2
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::acquire_acquire:
        csrrci            a5, sstatus, 0x2
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::acquire_relaxed:
        csrrci            a5, sstatus, 0x2
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::relaxed_acquire:
        csrrci            a5, sstatus, 0x2
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::relaxed_relaxed:
        csrrci            a5, sstatus, 0x2
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::release_acquire:
        csrrci            a5, sstatus, 0x2
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u16::release_relaxed:
        csrrci            a5, sstatus, 0x2
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::acqrel_seqcst:
        csrrci            a5, sstatus, 0x2
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::seqcst_seqcst:
        csrrci            a5, sstatus, 0x2
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::acqrel_acquire:
        csrrci            a5, sstatus, 0x2
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::acqrel_relaxed:
        csrrci            a5, sstatus, 0x2
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::acquire_seqcst:
        csrrci            a5, sstatus, 0x2
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::relaxed_seqcst:
        csrrci            a5, sstatus, 0x2
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::release_seqcst:
        csrrci            a5, sstatus, 0x2
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::seqcst_acquire:
        csrrci            a5, sstatus, 0x2
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::seqcst_relaxed:
        csrrci            a5, sstatus, 0x2
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::acquire_acquire:
        csrrci            a5, sstatus, 0x2
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::acquire_relaxed:
        csrrci            a5, sstatus, 0x2
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::relaxed_acquire:
        csrrci            a5, sstatus, 0x2
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::relaxed_relaxed:
        csrrci            a5, sstatus, 0x2
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::release_acquire:
        csrrci            a5, sstatus, 0x2
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u32::release_relaxed:
        csrrci            a5, sstatus, 0x2
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::bool::acqrel_seqcst:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::seqcst_seqcst:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::acqrel_acquire:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::acqrel_relaxed:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::acquire_seqcst:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::relaxed_seqcst:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::release_seqcst:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::seqcst_acquire:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::seqcst_relaxed:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::acquire_acquire:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::acquire_relaxed:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::relaxed_acquire:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::relaxed_relaxed:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::release_acquire:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::release_relaxed:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::u8::acqrel_seqcst:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              sstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::seqcst_seqcst:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              sstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::acqrel_acquire:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              sstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::acqrel_relaxed:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              sstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::acquire_seqcst:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              sstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::relaxed_seqcst:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              sstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::release_seqcst:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              sstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::seqcst_acquire:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              sstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::seqcst_relaxed:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              sstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::acquire_acquire:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              sstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::acquire_relaxed:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              sstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::relaxed_acquire:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              sstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::relaxed_relaxed:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              sstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::release_acquire:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              sstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u8::release_relaxed:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        bne               a3, a1, 0f
        sb                a2, 0x0(a0)
0:
        csrw              sstatus, a4
        xor               a1, a3, a1
        snez              a0, a1
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::acqrel_seqcst:
        csrrci            a5, sstatus, 0x2
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::seqcst_seqcst:
        csrrci            a5, sstatus, 0x2
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::acqrel_acquire:
        csrrci            a5, sstatus, 0x2
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::acqrel_relaxed:
        csrrci            a5, sstatus, 0x2
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::acquire_seqcst:
        csrrci            a5, sstatus, 0x2
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::relaxed_seqcst:
        csrrci            a5, sstatus, 0x2
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::release_seqcst:
        csrrci            a5, sstatus, 0x2
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::seqcst_acquire:
        csrrci            a5, sstatus, 0x2
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::seqcst_relaxed:
        csrrci            a5, sstatus, 0x2
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::acquire_acquire:
        csrrci            a5, sstatus, 0x2
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::acquire_relaxed:
        csrrci            a5, sstatus, 0x2
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::relaxed_acquire:
        csrrci            a5, sstatus, 0x2
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::relaxed_relaxed:
        csrrci            a5, sstatus, 0x2
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::release_acquire:
        csrrci            a5, sstatus, 0x2
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u16::release_relaxed:
        csrrci            a5, sstatus, 0x2
        lhu               a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sh                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::acqrel_seqcst:
        csrrci            a5, sstatus, 0x2
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::seqcst_seqcst:
        csrrci            a5, sstatus, 0x2
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::acqrel_acquire:
        csrrci            a5, sstatus, 0x2
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::acqrel_relaxed:
        csrrci            a5, sstatus, 0x2
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::acquire_seqcst:
        csrrci            a5, sstatus, 0x2
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::relaxed_seqcst:
        csrrci            a5, sstatus, 0x2
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::release_seqcst:
        csrrci            a5, sstatus, 0x2
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::seqcst_acquire:
        csrrci            a5, sstatus, 0x2
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::seqcst_relaxed:
        csrrci            a5, sstatus, 0x2
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::acquire_acquire:
        csrrci            a5, sstatus, 0x2
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::acquire_relaxed:
        csrrci            a5, sstatus, 0x2
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::relaxed_acquire:
        csrrci            a5, sstatus, 0x2
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::relaxed_relaxed:
        csrrci            a5, sstatus, 0x2
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::release_acquire:
        csrrci            a5, sstatus, 0x2
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u32::release_relaxed:
        csrrci            a5, sstatus, 0x2
        lw                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sw                a2, 0x0(a4)
        csrw              sstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              sstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::bool::acqrel_seqcst:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::seqcst_seqcst:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::acqrel_acquire:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::acqrel_relaxed:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::acquire_seqcst:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::relaxed_seqcst:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::release_seqcst:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::seqcst_acquire:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::seqcst_relaxed:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::acquire_acquire:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::acquire_relaxed:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::relaxed_acquire:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::relaxed_relaxed:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::release_acquire:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::release_relaxed:
        csrrci            a4, sstatus, 0x2
        lbu               a3, 0x0(a0)
        beq               a1, a2, 0f
        beqz              a2, 1f
        ori               a2, a3, 0x1
        sb                a2, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        sb                zero, 0x0(a0)
        csrw              sstatus, a4
        snez              a2, a3
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::or::u8::acqrel:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        or                a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::or::u8::seqcst:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        or                a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::or::u8::acquire:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        or                a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::or::u8::relaxed:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        or                a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::or::u8::release:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        or                a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::or::u16::acqrel:
        csrrci            a2, sstatus, 0x2
        lh                a3, 0x0(a0)
        or                a1, a3, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::or::u16::seqcst:
        csrrci            a2, sstatus, 0x2
        lh                a3, 0x0(a0)
        or                a1, a3, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::or::u16::acquire:
        csrrci            a2, sstatus, 0x2
        lh                a3, 0x0(a0)
        or                a1, a3, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::or::u16::relaxed:
        csrrci            a2, sstatus, 0x2
        lh                a3, 0x0(a0)
        or                a1, a3, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::or::u16::release:
        csrrci            a2, sstatus, 0x2
        lh                a3, 0x0(a0)
        or                a1, a3, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::or::u32::acqrel:
        csrrci            a2, sstatus, 0x2
        lw                a3, 0x0(a0)
        or                a1, a3, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::or::u32::seqcst:
        csrrci            a2, sstatus, 0x2
        lw                a3, 0x0(a0)
        or                a1, a3, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::or::u32::acquire:
        csrrci            a2, sstatus, 0x2
        lw                a3, 0x0(a0)
        or                a1, a3, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::or::u32::relaxed:
        csrrci            a2, sstatus, 0x2
        lw                a3, 0x0(a0)
        or                a1, a3, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::or::u32::release:
        csrrci            a2, sstatus, 0x2
        lw                a3, 0x0(a0)
        or                a1, a3, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::add::u8::acqrel:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        add               a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::add::u8::seqcst:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        add               a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::add::u8::acquire:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        add               a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::add::u8::relaxed:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        add               a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::add::u8::release:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        add               a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::add::u16::acqrel:
        csrrci            a2, sstatus, 0x2
        lh                a3, 0x0(a0)
        add               a1, a3, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::add::u16::seqcst:
        csrrci            a2, sstatus, 0x2
        lh                a3, 0x0(a0)
        add               a1, a3, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::add::u16::acquire:
        csrrci            a2, sstatus, 0x2
        lh                a3, 0x0(a0)
        add               a1, a3, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::add::u16::relaxed:
        csrrci            a2, sstatus, 0x2
        lh                a3, 0x0(a0)
        add               a1, a3, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::add::u16::release:
        csrrci            a2, sstatus, 0x2
        lh                a3, 0x0(a0)
        add               a1, a3, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::add::u32::acqrel:
        csrrci            a2, sstatus, 0x2
        lw                a3, 0x0(a0)
        add               a1, a3, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::add::u32::seqcst:
        csrrci            a2, sstatus, 0x2
        lw                a3, 0x0(a0)
        add               a1, a3, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::add::u32::acquire:
        csrrci            a2, sstatus, 0x2
        lw                a3, 0x0(a0)
        add               a1, a3, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::add::u32::relaxed:
        csrrci            a2, sstatus, 0x2
        lw                a3, 0x0(a0)
        add               a1, a3, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::add::u32::release:
        csrrci            a2, sstatus, 0x2
        lw                a3, 0x0(a0)
        add               a1, a3, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::and::u8::acqrel:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        and               a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::and::u8::seqcst:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        and               a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::and::u8::acquire:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        and               a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::and::u8::relaxed:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        and               a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::and::u8::release:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        and               a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::and::u16::acqrel:
        csrrci            a2, sstatus, 0x2
        lhu               a3, 0x0(a0)
        and               a1, a3, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::and::u16::seqcst:
        csrrci            a2, sstatus, 0x2
        lhu               a3, 0x0(a0)
        and               a1, a3, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::and::u16::acquire:
        csrrci            a2, sstatus, 0x2
        lhu               a3, 0x0(a0)
        and               a1, a3, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::and::u16::relaxed:
        csrrci            a2, sstatus, 0x2
        lhu               a3, 0x0(a0)
        and               a1, a3, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::and::u16::release:
        csrrci            a2, sstatus, 0x2
        lhu               a3, 0x0(a0)
        and               a1, a3, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::and::u32::acqrel:
        csrrci            a2, sstatus, 0x2
        lw                a3, 0x0(a0)
        and               a1, a3, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::and::u32::seqcst:
        csrrci            a2, sstatus, 0x2
        lw                a3, 0x0(a0)
        and               a1, a3, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::and::u32::acquire:
        csrrci            a2, sstatus, 0x2
        lw                a3, 0x0(a0)
        and               a1, a3, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::and::u32::relaxed:
        csrrci            a2, sstatus, 0x2
        lw                a3, 0x0(a0)
        and               a1, a3, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::and::u32::release:
        csrrci            a2, sstatus, 0x2
        lw                a3, 0x0(a0)
        and               a1, a3, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::neg::u8::acqrel:
        csrrci            a1, sstatus, 0x2
        lbu               a2, 0x0(a0)
        neg               a2, a2
        sb                a2, 0x0(a0)
        csrw              sstatus, a1
        ret

asm_test::neg::u8::seqcst:
        csrrci            a1, sstatus, 0x2
        lbu               a2, 0x0(a0)
        neg               a2, a2
        sb                a2, 0x0(a0)
        csrw              sstatus, a1
        ret

asm_test::neg::u8::acquire:
        csrrci            a1, sstatus, 0x2
        lbu               a2, 0x0(a0)
        neg               a2, a2
        sb                a2, 0x0(a0)
        csrw              sstatus, a1
        ret

asm_test::neg::u8::relaxed:
        csrrci            a1, sstatus, 0x2
        lbu               a2, 0x0(a0)
        neg               a2, a2
        sb                a2, 0x0(a0)
        csrw              sstatus, a1
        ret

asm_test::neg::u8::release:
        csrrci            a1, sstatus, 0x2
        lbu               a2, 0x0(a0)
        neg               a2, a2
        sb                a2, 0x0(a0)
        csrw              sstatus, a1
        ret

asm_test::neg::u16::acqrel:
        csrrci            a1, sstatus, 0x2
        lh                a2, 0x0(a0)
        neg               a2, a2
        sh                a2, 0x0(a0)
        csrw              sstatus, a1
        ret

asm_test::neg::u16::seqcst:
        csrrci            a1, sstatus, 0x2
        lh                a2, 0x0(a0)
        neg               a2, a2
        sh                a2, 0x0(a0)
        csrw              sstatus, a1
        ret

asm_test::neg::u16::acquire:
        csrrci            a1, sstatus, 0x2
        lh                a2, 0x0(a0)
        neg               a2, a2
        sh                a2, 0x0(a0)
        csrw              sstatus, a1
        ret

asm_test::neg::u16::relaxed:
        csrrci            a1, sstatus, 0x2
        lh                a2, 0x0(a0)
        neg               a2, a2
        sh                a2, 0x0(a0)
        csrw              sstatus, a1
        ret

asm_test::neg::u16::release:
        csrrci            a1, sstatus, 0x2
        lh                a2, 0x0(a0)
        neg               a2, a2
        sh                a2, 0x0(a0)
        csrw              sstatus, a1
        ret

asm_test::neg::u32::acqrel:
        csrrci            a1, sstatus, 0x2
        lw                a2, 0x0(a0)
        neg               a2, a2
        sw                a2, 0x0(a0)
        csrw              sstatus, a1
        ret

asm_test::neg::u32::seqcst:
        csrrci            a1, sstatus, 0x2
        lw                a2, 0x0(a0)
        neg               a2, a2
        sw                a2, 0x0(a0)
        csrw              sstatus, a1
        ret

asm_test::neg::u32::acquire:
        csrrci            a1, sstatus, 0x2
        lw                a2, 0x0(a0)
        neg               a2, a2
        sw                a2, 0x0(a0)
        csrw              sstatus, a1
        ret

asm_test::neg::u32::relaxed:
        csrrci            a1, sstatus, 0x2
        lw                a2, 0x0(a0)
        neg               a2, a2
        sw                a2, 0x0(a0)
        csrw              sstatus, a1
        ret

asm_test::neg::u32::release:
        csrrci            a1, sstatus, 0x2
        lw                a2, 0x0(a0)
        neg               a2, a2
        sw                a2, 0x0(a0)
        csrw              sstatus, a1
        ret

asm_test::not::u8::acqrel:
        csrrci            a1, sstatus, 0x2
        lbu               a2, 0x0(a0)
        not               a2, a2
        sb                a2, 0x0(a0)
        csrw              sstatus, a1
        ret

asm_test::not::u8::seqcst:
        csrrci            a1, sstatus, 0x2
        lbu               a2, 0x0(a0)
        not               a2, a2
        sb                a2, 0x0(a0)
        csrw              sstatus, a1
        ret

asm_test::not::u8::acquire:
        csrrci            a1, sstatus, 0x2
        lbu               a2, 0x0(a0)
        not               a2, a2
        sb                a2, 0x0(a0)
        csrw              sstatus, a1
        ret

asm_test::not::u8::relaxed:
        csrrci            a1, sstatus, 0x2
        lbu               a2, 0x0(a0)
        not               a2, a2
        sb                a2, 0x0(a0)
        csrw              sstatus, a1
        ret

asm_test::not::u8::release:
        csrrci            a1, sstatus, 0x2
        lbu               a2, 0x0(a0)
        not               a2, a2
        sb                a2, 0x0(a0)
        csrw              sstatus, a1
        ret

asm_test::not::u16::acqrel:
        csrrci            a1, sstatus, 0x2
        lh                a2, 0x0(a0)
        not               a2, a2
        sh                a2, 0x0(a0)
        csrw              sstatus, a1
        ret

asm_test::not::u16::seqcst:
        csrrci            a1, sstatus, 0x2
        lh                a2, 0x0(a0)
        not               a2, a2
        sh                a2, 0x0(a0)
        csrw              sstatus, a1
        ret

asm_test::not::u16::acquire:
        csrrci            a1, sstatus, 0x2
        lh                a2, 0x0(a0)
        not               a2, a2
        sh                a2, 0x0(a0)
        csrw              sstatus, a1
        ret

asm_test::not::u16::relaxed:
        csrrci            a1, sstatus, 0x2
        lh                a2, 0x0(a0)
        not               a2, a2
        sh                a2, 0x0(a0)
        csrw              sstatus, a1
        ret

asm_test::not::u16::release:
        csrrci            a1, sstatus, 0x2
        lh                a2, 0x0(a0)
        not               a2, a2
        sh                a2, 0x0(a0)
        csrw              sstatus, a1
        ret

asm_test::not::u32::acqrel:
        csrrci            a1, sstatus, 0x2
        lw                a2, 0x0(a0)
        not               a2, a2
        sw                a2, 0x0(a0)
        csrw              sstatus, a1
        ret

asm_test::not::u32::seqcst:
        csrrci            a1, sstatus, 0x2
        lw                a2, 0x0(a0)
        not               a2, a2
        sw                a2, 0x0(a0)
        csrw              sstatus, a1
        ret

asm_test::not::u32::acquire:
        csrrci            a1, sstatus, 0x2
        lw                a2, 0x0(a0)
        not               a2, a2
        sw                a2, 0x0(a0)
        csrw              sstatus, a1
        ret

asm_test::not::u32::relaxed:
        csrrci            a1, sstatus, 0x2
        lw                a2, 0x0(a0)
        not               a2, a2
        sw                a2, 0x0(a0)
        csrw              sstatus, a1
        ret

asm_test::not::u32::release:
        csrrci            a1, sstatus, 0x2
        lw                a2, 0x0(a0)
        not               a2, a2
        sw                a2, 0x0(a0)
        csrw              sstatus, a1
        ret

asm_test::sub::u8::acqrel:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        sub               a3, a3, a1
        sb                a3, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::sub::u8::seqcst:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        sub               a3, a3, a1
        sb                a3, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::sub::u8::acquire:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        sub               a3, a3, a1
        sb                a3, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::sub::u8::relaxed:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        sub               a3, a3, a1
        sb                a3, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::sub::u8::release:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        sub               a3, a3, a1
        sb                a3, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::sub::u16::acqrel:
        csrrci            a2, sstatus, 0x2
        lh                a3, 0x0(a0)
        sub               a3, a3, a1
        sh                a3, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::sub::u16::seqcst:
        csrrci            a2, sstatus, 0x2
        lh                a3, 0x0(a0)
        sub               a3, a3, a1
        sh                a3, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::sub::u16::acquire:
        csrrci            a2, sstatus, 0x2
        lh                a3, 0x0(a0)
        sub               a3, a3, a1
        sh                a3, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::sub::u16::relaxed:
        csrrci            a2, sstatus, 0x2
        lh                a3, 0x0(a0)
        sub               a3, a3, a1
        sh                a3, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::sub::u16::release:
        csrrci            a2, sstatus, 0x2
        lh                a3, 0x0(a0)
        sub               a3, a3, a1
        sh                a3, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::sub::u32::acqrel:
        csrrci            a2, sstatus, 0x2
        lw                a3, 0x0(a0)
        sub               a3, a3, a1
        sw                a3, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::sub::u32::seqcst:
        csrrci            a2, sstatus, 0x2
        lw                a3, 0x0(a0)
        sub               a3, a3, a1
        sw                a3, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::sub::u32::acquire:
        csrrci            a2, sstatus, 0x2
        lw                a3, 0x0(a0)
        sub               a3, a3, a1
        sw                a3, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::sub::u32::relaxed:
        csrrci            a2, sstatus, 0x2
        lw                a3, 0x0(a0)
        sub               a3, a3, a1
        sw                a3, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::sub::u32::release:
        csrrci            a2, sstatus, 0x2
        lw                a3, 0x0(a0)
        sub               a3, a3, a1
        sw                a3, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::xor::u8::acqrel:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        xor               a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::xor::u8::seqcst:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        xor               a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::xor::u8::acquire:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        xor               a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::xor::u8::relaxed:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        xor               a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::xor::u8::release:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        xor               a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::xor::u16::acqrel:
        csrrci            a2, sstatus, 0x2
        lh                a3, 0x0(a0)
        xor               a1, a3, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::xor::u16::seqcst:
        csrrci            a2, sstatus, 0x2
        lh                a3, 0x0(a0)
        xor               a1, a3, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::xor::u16::acquire:
        csrrci            a2, sstatus, 0x2
        lh                a3, 0x0(a0)
        xor               a1, a3, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::xor::u16::relaxed:
        csrrci            a2, sstatus, 0x2
        lh                a3, 0x0(a0)
        xor               a1, a3, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::xor::u16::release:
        csrrci            a2, sstatus, 0x2
        lh                a3, 0x0(a0)
        xor               a1, a3, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::xor::u32::acqrel:
        csrrci            a2, sstatus, 0x2
        lw                a3, 0x0(a0)
        xor               a1, a3, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::xor::u32::seqcst:
        csrrci            a2, sstatus, 0x2
        lw                a3, 0x0(a0)
        xor               a1, a3, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::xor::u32::acquire:
        csrrci            a2, sstatus, 0x2
        lw                a3, 0x0(a0)
        xor               a1, a3, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::xor::u32::relaxed:
        csrrci            a2, sstatus, 0x2
        lw                a3, 0x0(a0)
        xor               a1, a3, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a2
        ret

asm_test::xor::u32::release:
        csrrci            a2, sstatus, 0x2
        lw                a3, 0x0(a0)
        xor               a1, a3, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a2
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
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u8::seqcst:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u8::acquire:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u8::relaxed:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u8::release:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u16::acqrel:
        csrrci            a3, sstatus, 0x2
        lh                a2, 0x0(a0)
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u16::seqcst:
        csrrci            a3, sstatus, 0x2
        lh                a2, 0x0(a0)
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u16::acquire:
        csrrci            a3, sstatus, 0x2
        lh                a2, 0x0(a0)
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u16::relaxed:
        csrrci            a3, sstatus, 0x2
        lh                a2, 0x0(a0)
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u16::release:
        csrrci            a3, sstatus, 0x2
        lh                a2, 0x0(a0)
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u32::acqrel:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u32::seqcst:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u32::acquire:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u32::relaxed:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::swap::u32::release:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::swap::bool::acqrel:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        beqz              a1, 0f
        ori               a1, a2, 0x1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        snez              a0, a2
        ret
0:
        sb                zero, 0x0(a0)
        csrw              sstatus, a3
        snez              a0, a2
        ret

asm_test::swap::bool::seqcst:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        beqz              a1, 0f
        ori               a1, a2, 0x1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        snez              a0, a2
        ret
0:
        sb                zero, 0x0(a0)
        csrw              sstatus, a3
        snez              a0, a2
        ret

asm_test::swap::bool::acquire:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        beqz              a1, 0f
        ori               a1, a2, 0x1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        snez              a0, a2
        ret
0:
        sb                zero, 0x0(a0)
        csrw              sstatus, a3
        snez              a0, a2
        ret

asm_test::swap::bool::relaxed:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        beqz              a1, 0f
        ori               a1, a2, 0x1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        snez              a0, a2
        ret
0:
        sb                zero, 0x0(a0)
        csrw              sstatus, a3
        snez              a0, a2
        ret

asm_test::swap::bool::release:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        beqz              a1, 0f
        ori               a1, a2, 0x1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        snez              a0, a2
        ret
0:
        sb                zero, 0x0(a0)
        csrw              sstatus, a3
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
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        or                a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::u8::seqcst:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        or                a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::u8::acquire:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        or                a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::u8::relaxed:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        or                a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::u8::release:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        or                a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::u16::acqrel:
        csrrci            a3, sstatus, 0x2
        lh                a2, 0x0(a0)
        or                a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::u16::seqcst:
        csrrci            a3, sstatus, 0x2
        lh                a2, 0x0(a0)
        or                a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::u16::acquire:
        csrrci            a3, sstatus, 0x2
        lh                a2, 0x0(a0)
        or                a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::u16::relaxed:
        csrrci            a3, sstatus, 0x2
        lh                a2, 0x0(a0)
        or                a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::u16::release:
        csrrci            a3, sstatus, 0x2
        lh                a2, 0x0(a0)
        or                a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::u32::acqrel:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        or                a1, a2, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::u32::seqcst:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        or                a1, a2, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::u32::acquire:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        or                a1, a2, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::u32::relaxed:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        or                a1, a2, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::u32::release:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        or                a1, a2, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_or::bool::acqrel:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        or                a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        snez              a0, a3
        ret

asm_test::fetch_or::bool::seqcst:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        or                a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        snez              a0, a3
        ret

asm_test::fetch_or::bool::acquire:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        or                a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        snez              a0, a3
        ret

asm_test::fetch_or::bool::relaxed:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        or                a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        snez              a0, a3
        ret

asm_test::fetch_or::bool::release:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        or                a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        snez              a0, a3
        ret

asm_test::fetch_add::u8::acqrel:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        add               a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u8::seqcst:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        add               a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u8::acquire:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        add               a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u8::relaxed:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        add               a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u8::release:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        add               a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u16::acqrel:
        csrrci            a3, sstatus, 0x2
        lh                a2, 0x0(a0)
        add               a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u16::seqcst:
        csrrci            a3, sstatus, 0x2
        lh                a2, 0x0(a0)
        add               a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u16::acquire:
        csrrci            a3, sstatus, 0x2
        lh                a2, 0x0(a0)
        add               a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u16::relaxed:
        csrrci            a3, sstatus, 0x2
        lh                a2, 0x0(a0)
        add               a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u16::release:
        csrrci            a3, sstatus, 0x2
        lh                a2, 0x0(a0)
        add               a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u32::acqrel:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        add               a1, a2, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u32::seqcst:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        add               a1, a2, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u32::acquire:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        add               a1, a2, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u32::relaxed:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        add               a1, a2, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_add::u32::release:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        add               a1, a2, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u8::acqrel:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        and               a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u8::seqcst:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        and               a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u8::acquire:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        and               a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u8::relaxed:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        and               a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u8::release:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        and               a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u16::acqrel:
        csrrci            a3, sstatus, 0x2
        lhu               a2, 0x0(a0)
        and               a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u16::seqcst:
        csrrci            a3, sstatus, 0x2
        lhu               a2, 0x0(a0)
        and               a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u16::acquire:
        csrrci            a3, sstatus, 0x2
        lhu               a2, 0x0(a0)
        and               a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u16::relaxed:
        csrrci            a3, sstatus, 0x2
        lhu               a2, 0x0(a0)
        and               a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u16::release:
        csrrci            a3, sstatus, 0x2
        lhu               a2, 0x0(a0)
        and               a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u32::acqrel:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        and               a1, a2, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u32::seqcst:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        and               a1, a2, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u32::acquire:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        and               a1, a2, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u32::relaxed:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        and               a1, a2, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::u32::release:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        and               a1, a2, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_and::bool::acqrel:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        and               a1, a1, a3
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        snez              a0, a3
        ret

asm_test::fetch_and::bool::seqcst:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        and               a1, a1, a3
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        snez              a0, a3
        ret

asm_test::fetch_and::bool::acquire:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        and               a1, a1, a3
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        snez              a0, a3
        ret

asm_test::fetch_and::bool::relaxed:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        and               a1, a1, a3
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        snez              a0, a3
        ret

asm_test::fetch_and::bool::release:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        and               a1, a1, a3
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        snez              a0, a3
        ret

asm_test::fetch_max::i8::acqrel:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lb                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_max::i8::seqcst:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lb                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_max::i8::acquire:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lb                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_max::i8::relaxed:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lb                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_max::i8::release:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lb                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_max::i16::acqrel:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lh                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_max::i16::seqcst:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lh                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_max::i16::acquire:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lh                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_max::i16::relaxed:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lh                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_max::i16::release:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lh                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_max::i32::acqrel:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lw                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_max::i32::seqcst:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lw                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_max::i32::acquire:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lw                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_max::i32::relaxed:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lw                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_max::i32::release:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lw                a0, 0x0(a0)
        blt               a0, a1, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_min::i8::acqrel:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lb                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_min::i8::seqcst:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lb                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_min::i8::acquire:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lb                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_min::i8::relaxed:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lb                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_min::i8::release:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lb                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sb                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_min::i16::acqrel:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lh                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_min::i16::seqcst:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lh                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_min::i16::acquire:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lh                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_min::i16::relaxed:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lh                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_min::i16::release:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lh                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sh                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_min::i32::acqrel:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lw                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_min::i32::seqcst:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lw                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_min::i32::acquire:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lw                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_min::i32::relaxed:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lw                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_min::i32::release:
        mv                a2, a0
        csrrci            a3, sstatus, 0x2
        lw                a0, 0x0(a0)
        blt               a1, a0, 0f
        mv                a1, a0
0:
        sw                a1, 0x0(a2)
        csrw              sstatus, a3
        ret

asm_test::fetch_neg::u8::acqrel:
        csrrci            a2, sstatus, 0x2
        lbu               a1, 0x0(a0)
        neg               a3, a1
        sb                a3, 0x0(a0)
        csrw              sstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u8::seqcst:
        csrrci            a2, sstatus, 0x2
        lbu               a1, 0x0(a0)
        neg               a3, a1
        sb                a3, 0x0(a0)
        csrw              sstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u8::acquire:
        csrrci            a2, sstatus, 0x2
        lbu               a1, 0x0(a0)
        neg               a3, a1
        sb                a3, 0x0(a0)
        csrw              sstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u8::relaxed:
        csrrci            a2, sstatus, 0x2
        lbu               a1, 0x0(a0)
        neg               a3, a1
        sb                a3, 0x0(a0)
        csrw              sstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u8::release:
        csrrci            a2, sstatus, 0x2
        lbu               a1, 0x0(a0)
        neg               a3, a1
        sb                a3, 0x0(a0)
        csrw              sstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u16::acqrel:
        csrrci            a2, sstatus, 0x2
        lh                a1, 0x0(a0)
        neg               a3, a1
        sh                a3, 0x0(a0)
        csrw              sstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u16::seqcst:
        csrrci            a2, sstatus, 0x2
        lh                a1, 0x0(a0)
        neg               a3, a1
        sh                a3, 0x0(a0)
        csrw              sstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u16::acquire:
        csrrci            a2, sstatus, 0x2
        lh                a1, 0x0(a0)
        neg               a3, a1
        sh                a3, 0x0(a0)
        csrw              sstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u16::relaxed:
        csrrci            a2, sstatus, 0x2
        lh                a1, 0x0(a0)
        neg               a3, a1
        sh                a3, 0x0(a0)
        csrw              sstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u16::release:
        csrrci            a2, sstatus, 0x2
        lh                a1, 0x0(a0)
        neg               a3, a1
        sh                a3, 0x0(a0)
        csrw              sstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u32::acqrel:
        csrrci            a2, sstatus, 0x2
        lw                a1, 0x0(a0)
        neg               a3, a1
        sw                a3, 0x0(a0)
        csrw              sstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u32::seqcst:
        csrrci            a2, sstatus, 0x2
        lw                a1, 0x0(a0)
        neg               a3, a1
        sw                a3, 0x0(a0)
        csrw              sstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u32::acquire:
        csrrci            a2, sstatus, 0x2
        lw                a1, 0x0(a0)
        neg               a3, a1
        sw                a3, 0x0(a0)
        csrw              sstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u32::relaxed:
        csrrci            a2, sstatus, 0x2
        lw                a1, 0x0(a0)
        neg               a3, a1
        sw                a3, 0x0(a0)
        csrw              sstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u32::release:
        csrrci            a2, sstatus, 0x2
        lw                a1, 0x0(a0)
        neg               a3, a1
        sw                a3, 0x0(a0)
        csrw              sstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u8::acqrel:
        csrrci            a2, sstatus, 0x2
        lbu               a1, 0x0(a0)
        not               a3, a1
        sb                a3, 0x0(a0)
        csrw              sstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u8::seqcst:
        csrrci            a2, sstatus, 0x2
        lbu               a1, 0x0(a0)
        not               a3, a1
        sb                a3, 0x0(a0)
        csrw              sstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u8::acquire:
        csrrci            a2, sstatus, 0x2
        lbu               a1, 0x0(a0)
        not               a3, a1
        sb                a3, 0x0(a0)
        csrw              sstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u8::relaxed:
        csrrci            a2, sstatus, 0x2
        lbu               a1, 0x0(a0)
        not               a3, a1
        sb                a3, 0x0(a0)
        csrw              sstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u8::release:
        csrrci            a2, sstatus, 0x2
        lbu               a1, 0x0(a0)
        not               a3, a1
        sb                a3, 0x0(a0)
        csrw              sstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u16::acqrel:
        csrrci            a2, sstatus, 0x2
        lh                a1, 0x0(a0)
        not               a3, a1
        sh                a3, 0x0(a0)
        csrw              sstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u16::seqcst:
        csrrci            a2, sstatus, 0x2
        lh                a1, 0x0(a0)
        not               a3, a1
        sh                a3, 0x0(a0)
        csrw              sstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u16::acquire:
        csrrci            a2, sstatus, 0x2
        lh                a1, 0x0(a0)
        not               a3, a1
        sh                a3, 0x0(a0)
        csrw              sstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u16::relaxed:
        csrrci            a2, sstatus, 0x2
        lh                a1, 0x0(a0)
        not               a3, a1
        sh                a3, 0x0(a0)
        csrw              sstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u16::release:
        csrrci            a2, sstatus, 0x2
        lh                a1, 0x0(a0)
        not               a3, a1
        sh                a3, 0x0(a0)
        csrw              sstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u32::acqrel:
        csrrci            a2, sstatus, 0x2
        lw                a1, 0x0(a0)
        not               a3, a1
        sw                a3, 0x0(a0)
        csrw              sstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u32::seqcst:
        csrrci            a2, sstatus, 0x2
        lw                a1, 0x0(a0)
        not               a3, a1
        sw                a3, 0x0(a0)
        csrw              sstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u32::acquire:
        csrrci            a2, sstatus, 0x2
        lw                a1, 0x0(a0)
        not               a3, a1
        sw                a3, 0x0(a0)
        csrw              sstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u32::relaxed:
        csrrci            a2, sstatus, 0x2
        lw                a1, 0x0(a0)
        not               a3, a1
        sw                a3, 0x0(a0)
        csrw              sstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u32::release:
        csrrci            a2, sstatus, 0x2
        lw                a1, 0x0(a0)
        not               a3, a1
        sw                a3, 0x0(a0)
        csrw              sstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::bool::acqrel:
        csrrci            a1, sstatus, 0x2
        lbu               a2, 0x0(a0)
        xori              a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrw              sstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_not::bool::seqcst:
        csrrci            a1, sstatus, 0x2
        lbu               a2, 0x0(a0)
        xori              a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrw              sstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_not::bool::acquire:
        csrrci            a1, sstatus, 0x2
        lbu               a2, 0x0(a0)
        xori              a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrw              sstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_not::bool::relaxed:
        csrrci            a1, sstatus, 0x2
        lbu               a2, 0x0(a0)
        xori              a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrw              sstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_not::bool::release:
        csrrci            a1, sstatus, 0x2
        lbu               a2, 0x0(a0)
        xori              a3, a2, 0x1
        sb                a3, 0x0(a0)
        csrw              sstatus, a1
        snez              a0, a2
        ret

asm_test::fetch_sub::u8::acqrel:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        sub               a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u8::seqcst:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        sub               a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u8::acquire:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        sub               a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u8::relaxed:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        sub               a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u8::release:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        sub               a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u16::acqrel:
        csrrci            a3, sstatus, 0x2
        lh                a2, 0x0(a0)
        sub               a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u16::seqcst:
        csrrci            a3, sstatus, 0x2
        lh                a2, 0x0(a0)
        sub               a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u16::acquire:
        csrrci            a3, sstatus, 0x2
        lh                a2, 0x0(a0)
        sub               a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u16::relaxed:
        csrrci            a3, sstatus, 0x2
        lh                a2, 0x0(a0)
        sub               a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u16::release:
        csrrci            a3, sstatus, 0x2
        lh                a2, 0x0(a0)
        sub               a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u32::acqrel:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        sub               a1, a2, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u32::seqcst:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        sub               a1, a2, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u32::acquire:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        sub               a1, a2, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u32::relaxed:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        sub               a1, a2, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_sub::u32::release:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        sub               a1, a2, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u8::acqrel:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        xor               a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u8::seqcst:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        xor               a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u8::acquire:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        xor               a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u8::relaxed:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        xor               a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u8::release:
        csrrci            a3, sstatus, 0x2
        lbu               a2, 0x0(a0)
        xor               a1, a2, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u16::acqrel:
        csrrci            a3, sstatus, 0x2
        lh                a2, 0x0(a0)
        xor               a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u16::seqcst:
        csrrci            a3, sstatus, 0x2
        lh                a2, 0x0(a0)
        xor               a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u16::acquire:
        csrrci            a3, sstatus, 0x2
        lh                a2, 0x0(a0)
        xor               a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u16::relaxed:
        csrrci            a3, sstatus, 0x2
        lh                a2, 0x0(a0)
        xor               a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u16::release:
        csrrci            a3, sstatus, 0x2
        lh                a2, 0x0(a0)
        xor               a1, a2, a1
        sh                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u32::acqrel:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        xor               a1, a2, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u32::seqcst:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        xor               a1, a2, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u32::acquire:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        xor               a1, a2, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u32::relaxed:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        xor               a1, a2, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::u32::release:
        csrrci            a3, sstatus, 0x2
        lw                a2, 0x0(a0)
        xor               a1, a2, a1
        sw                a1, 0x0(a0)
        csrw              sstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_xor::bool::acqrel:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        xor               a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        snez              a0, a3
        ret

asm_test::fetch_xor::bool::seqcst:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        xor               a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        snez              a0, a3
        ret

asm_test::fetch_xor::bool::acquire:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        xor               a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        snez              a0, a3
        ret

asm_test::fetch_xor::bool::relaxed:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        xor               a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        snez              a0, a3
        ret

asm_test::fetch_xor::bool::release:
        csrrci            a2, sstatus, 0x2
        lbu               a3, 0x0(a0)
        xor               a1, a3, a1
        sb                a1, 0x0(a0)
        csrw              sstatus, a2
        snez              a0, a3
        ret


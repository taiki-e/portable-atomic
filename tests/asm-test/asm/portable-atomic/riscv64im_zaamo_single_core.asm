<portable_atomic::AtomicBool>::compare_exchange:
        slli              a5, a4, 0x3
        auipc             a6, 0x0
        mv                a6, a6
        add               a5, a6, a5
        ld                a5, 0x0(a5)
        jr                a5
        beqz              a3, 0x40 <.Lpcrel_hi0+0x3c>
        li                a5, 0x1
        bne               a3, a5, 0x58 <.Lpcrel_hi0+0x54>
        li                a3, 0x4
        beq               a4, a3, 0x30 <.Lpcrel_hi0+0x2c>
        li                a3, 0x1
        li                a5, 0x2
        bne               a4, a5, 0x64 <.Lpcrel_hi0+0x60>
        li                a3, 0x3
        j                 0x64 <.Lpcrel_hi0+0x60>
        li                a3, 0x2
        beq               a4, a3, 0x64 <.Lpcrel_hi0+0x60>
        addi              a4, a4, -0x4
        seqz              a3, a4
        slli              a3, a3, 0x2
        j                 0x64 <.Lpcrel_hi0+0x60>
        li                a5, 0x4
        bne               a4, a5, 0x64 <.Lpcrel_hi0+0x60>
        li                a3, 0x4
        andi              a4, a0, -0x4
        slliw             a0, a0, 0x3
        beq               a1, a2, 0xac <.Lpcrel_hi0+0xa8>
        beqz              a2, 0xe4 <.Lpcrel_hi0+0xe0>
        li                a2, 0x1
        li                a5, 0x2
        sllw              a2, a2, a0
        blt               a5, a3, 0x17c <.Lpcrel_hi0+0x178>
        beqz              a3, 0x1b4 <.Lpcrel_hi0+0x1b0>
        li                a5, 0x1
        bne               a3, a5, 0x1ec <.Lpcrel_hi0+0x1e8>
        amoor.w.rl        a2, a2, (a4)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
        li                a2, 0x0
        li                a5, 0x2
        sllw              a2, a2, a0
        blt               a5, a3, 0x128 <.Lpcrel_hi0+0x124>
        beqz              a3, 0x144 <.Lpcrel_hi0+0x140>
        li                a5, 0x1
        bne               a3, a5, 0x160 <.Lpcrel_hi0+0x15c>
        amoor.w.rl        a2, a2, (a4)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
        li                a5, 0xff
        sllw              a2, a2, a0
        sllw              a5, a5, a0
        not               a5, a5
        li                a6, 0x2
        or                a2, a2, a5
        blt               a6, a3, 0x198 <.Lpcrel_hi0+0x194>
        beqz              a3, 0x1d0 <.Lpcrel_hi0+0x1cc>
        li                a5, 0x1
        bne               a3, a5, 0x208 <.Lpcrel_hi0+0x204>
        amoand.w.rl       a2, a2, (a4)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
        amoor.w.aqrl      a2, a2, (a4)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
        amoor.w           a2, a2, (a4)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
        amoor.w.aq        a2, a2, (a4)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
        amoor.w.aqrl      a2, a2, (a4)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
        amoand.w.aqrl     a2, a2, (a4)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
        amoor.w           a2, a2, (a4)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
        amoand.w          a2, a2, (a4)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
        amoor.w.aq        a2, a2, (a4)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
        amoand.w.aq       a2, a2, (a4)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
        auipc             a0, 0x0
        auipc             a1, 0x0
        mv                a0, a0
        mv                a2, a1
        li                a1, 0x34
        auipc             ra, 0x0
        jalr              ra <.Lpcrel_hi2+0x10>
        auipc             a0, 0x0
        auipc             a1, 0x0
        mv                a0, a0
        mv                a2, a1
        li                a1, 0x3d
        auipc             ra, 0x0
        jalr              ra <.Lpcrel_hi4+0x10>

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

asm_test::fetch_nand::u64::acqrel:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sd                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u64::seqcst:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sd                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u64::acquire:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sd                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u64::relaxed:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sd                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::u64::release:
        csrrci            a3, mstatus, 0x8
        ld                a2, 0x0(a0)
        and               a1, a2, a1
        not               a1, a1
        sd                a1, 0x0(a0)
        csrw              mstatus, a3
        mv                a0, a2
        ret

asm_test::fetch_nand::bool::acqrel:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        li                a3, 0x1
        sllw              a3, a3, a0
        beqz              a1, 0f
        amoxor.w.aqrl     a1, a3, (a2)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret
0:
        amoor.w.aqrl      a1, a3, (a2)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_nand::bool::seqcst:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        li                a3, 0x1
        sllw              a3, a3, a0
        beqz              a1, 0f
        amoxor.w.aqrl     a1, a3, (a2)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret
0:
        amoor.w.aqrl      a1, a3, (a2)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_nand::bool::acquire:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        li                a3, 0x1
        sllw              a3, a3, a0
        beqz              a1, 0f
        amoxor.w.aq       a1, a3, (a2)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret
0:
        amoor.w.aq        a1, a3, (a2)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_nand::bool::relaxed:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        li                a3, 0x1
        sllw              a3, a3, a0
        beqz              a1, 0f
        amoxor.w          a1, a3, (a2)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret
0:
        amoor.w           a1, a3, (a2)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_nand::bool::release:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        li                a3, 0x1
        sllw              a3, a3, a0
        beqz              a1, 0f
        amoxor.w.rl       a1, a3, (a2)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret
0:
        amoor.w.rl        a1, a3, (a2)
        srlw              a0, a1, a0
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

asm_test::fetch_umax::u64::acqrel:
        amomaxu.d.aqrl    a0, a1, (a0)
        ret

asm_test::fetch_umax::u64::seqcst:
        amomaxu.d.aqrl    a0, a1, (a0)
        ret

asm_test::fetch_umax::u64::acquire:
        amomaxu.d.aq      a0, a1, (a0)
        ret

asm_test::fetch_umax::u64::relaxed:
        amomaxu.d         a0, a1, (a0)
        ret

asm_test::fetch_umax::u64::release:
        amomaxu.d.rl      a0, a1, (a0)
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

asm_test::fetch_umin::u64::acqrel:
        amominu.d.aqrl    a0, a1, (a0)
        ret

asm_test::fetch_umin::u64::seqcst:
        amominu.d.aqrl    a0, a1, (a0)
        ret

asm_test::fetch_umin::u64::acquire:
        amominu.d.aq      a0, a1, (a0)
        ret

asm_test::fetch_umin::u64::relaxed:
        amominu.d         a0, a1, (a0)
        ret

asm_test::fetch_umin::u64::release:
        amominu.d.rl      a0, a1, (a0)
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

asm_test::compare_exchange::u64::acqrel_seqcst:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u64::seqcst_seqcst:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u64::acqrel_acquire:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u64::acqrel_relaxed:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u64::acquire_seqcst:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u64::relaxed_seqcst:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u64::release_seqcst:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u64::seqcst_acquire:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u64::seqcst_relaxed:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u64::acquire_acquire:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u64::acquire_relaxed:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u64::relaxed_acquire:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u64::relaxed_relaxed:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u64::release_acquire:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange::u64::release_relaxed:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
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
        slliw             a0, a0, 0x3
        beq               a1, a2, 0f
        beqz              a2, 1f
        li                a2, 0x1
        sllw              a2, a2, a0
        amoor.w.aqrl      a2, a2, (a3)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        li                a2, 0x0
        sllw              a2, a2, a0
        amoor.w.aqrl      a2, a2, (a3)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        li                a4, 0xff
        sllw              a4, a4, a0
        not               a4, a4
        sllw              a2, a2, a0
        or                a2, a2, a4
        amoand.w.aqrl     a2, a2, (a3)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange::bool::seqcst_seqcst:
        andi              a3, a0, -0x4
        slliw             a0, a0, 0x3
        beq               a1, a2, 0f
        beqz              a2, 1f
        li                a2, 0x1
        sllw              a2, a2, a0
        amoor.w.aqrl      a2, a2, (a3)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        li                a2, 0x0
        sllw              a2, a2, a0
        amoor.w.aqrl      a2, a2, (a3)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        li                a4, 0xff
        sllw              a4, a4, a0
        not               a4, a4
        sllw              a2, a2, a0
        or                a2, a2, a4
        amoand.w.aqrl     a2, a2, (a3)
        srlw              a0, a2, a0
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
        slliw             a0, a0, 0x3
        beq               a1, a2, 0f
        beqz              a2, 1f
        li                a2, 0x1
        sllw              a2, a2, a0
        amoor.w.aqrl      a2, a2, (a3)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        li                a2, 0x0
        sllw              a2, a2, a0
        amoor.w.aqrl      a2, a2, (a3)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        li                a4, 0xff
        sllw              a4, a4, a0
        not               a4, a4
        sllw              a2, a2, a0
        or                a2, a2, a4
        amoand.w.aqrl     a2, a2, (a3)
        srlw              a0, a2, a0
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
        slliw             a0, a0, 0x3
        beq               a1, a2, 0f
        beqz              a2, 1f
        li                a2, 0x1
        sllw              a2, a2, a0
        amoor.w.aq        a2, a2, (a3)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        li                a2, 0x0
        sllw              a2, a2, a0
        amoor.w.aq        a2, a2, (a3)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        li                a4, 0xff
        sllw              a4, a4, a0
        not               a4, a4
        sllw              a2, a2, a0
        or                a2, a2, a4
        amoand.w.aq       a2, a2, (a3)
        srlw              a0, a2, a0
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
        slliw             a0, a0, 0x3
        beq               a1, a2, 0f
        beqz              a2, 1f
        li                a2, 0x1
        sllw              a2, a2, a0
        amoor.w.aqrl      a2, a2, (a3)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        li                a2, 0x0
        sllw              a2, a2, a0
        amoor.w.aqrl      a2, a2, (a3)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        li                a4, 0xff
        sllw              a4, a4, a0
        not               a4, a4
        sllw              a2, a2, a0
        or                a2, a2, a4
        amoand.w.aqrl     a2, a2, (a3)
        srlw              a0, a2, a0
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

asm_test::compare_exchange_weak::u64::acqrel_seqcst:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u64::seqcst_seqcst:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u64::acqrel_acquire:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u64::acqrel_relaxed:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u64::acquire_seqcst:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u64::relaxed_seqcst:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u64::release_seqcst:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u64::seqcst_acquire:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u64::seqcst_relaxed:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u64::acquire_acquire:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u64::acquire_relaxed:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u64::relaxed_acquire:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u64::relaxed_relaxed:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u64::release_acquire:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
        csrw              mstatus, a5
        mv                a1, a3
        ret
0:
        li                a0, 0x1
        csrw              mstatus, a5
        mv                a1, a3
        ret

asm_test::compare_exchange_weak::u64::release_relaxed:
        csrrci            a5, mstatus, 0x8
        ld                a3, 0x0(a0)
        bne               a3, a1, 0f
        mv                a4, a0
        li                a0, 0x0
        sd                a2, 0x0(a4)
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
        slliw             a0, a0, 0x3
        beq               a1, a2, 0f
        beqz              a2, 1f
        li                a2, 0x1
        sllw              a2, a2, a0
        amoor.w.aqrl      a2, a2, (a3)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        li                a2, 0x0
        sllw              a2, a2, a0
        amoor.w.aqrl      a2, a2, (a3)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        li                a4, 0xff
        sllw              a4, a4, a0
        not               a4, a4
        sllw              a2, a2, a0
        or                a2, a2, a4
        amoand.w.aqrl     a2, a2, (a3)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret

asm_test::compare_exchange_weak::bool::seqcst_seqcst:
        andi              a3, a0, -0x4
        slliw             a0, a0, 0x3
        beq               a1, a2, 0f
        beqz              a2, 1f
        li                a2, 0x1
        sllw              a2, a2, a0
        amoor.w.aqrl      a2, a2, (a3)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        li                a2, 0x0
        sllw              a2, a2, a0
        amoor.w.aqrl      a2, a2, (a3)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        li                a4, 0xff
        sllw              a4, a4, a0
        not               a4, a4
        sllw              a2, a2, a0
        or                a2, a2, a4
        amoand.w.aqrl     a2, a2, (a3)
        srlw              a0, a2, a0
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
        slliw             a0, a0, 0x3
        beq               a1, a2, 0f
        beqz              a2, 1f
        li                a2, 0x1
        sllw              a2, a2, a0
        amoor.w.aqrl      a2, a2, (a3)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        li                a2, 0x0
        sllw              a2, a2, a0
        amoor.w.aqrl      a2, a2, (a3)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        li                a4, 0xff
        sllw              a4, a4, a0
        not               a4, a4
        sllw              a2, a2, a0
        or                a2, a2, a4
        amoand.w.aqrl     a2, a2, (a3)
        srlw              a0, a2, a0
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
        slliw             a0, a0, 0x3
        beq               a1, a2, 0f
        beqz              a2, 1f
        li                a2, 0x1
        sllw              a2, a2, a0
        amoor.w.aq        a2, a2, (a3)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        li                a2, 0x0
        sllw              a2, a2, a0
        amoor.w.aq        a2, a2, (a3)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        li                a4, 0xff
        sllw              a4, a4, a0
        not               a4, a4
        sllw              a2, a2, a0
        or                a2, a2, a4
        amoand.w.aq       a2, a2, (a3)
        srlw              a0, a2, a0
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
        slliw             a0, a0, 0x3
        beq               a1, a2, 0f
        beqz              a2, 1f
        li                a2, 0x1
        sllw              a2, a2, a0
        amoor.w.aqrl      a2, a2, (a3)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
0:
        li                a2, 0x0
        sllw              a2, a2, a0
        amoor.w.aqrl      a2, a2, (a3)
        srlw              a0, a2, a0
        zext.b            a0, a0
        snez              a2, a0
        xor               a0, a1, a2
        mv                a1, a2
        ret
1:
        li                a4, 0xff
        sllw              a4, a4, a0
        not               a4, a4
        sllw              a2, a2, a0
        or                a2, a2, a4
        amoand.w.aqrl     a2, a2, (a3)
        srlw              a0, a2, a0
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
        slliw             a0, a0, 0x3
        sllw              a0, a1, a0
        amoor.w.aqrl      a0, a0, (a2)
        ret

asm_test::or::u8::seqcst:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        sllw              a0, a1, a0
        amoor.w.aqrl      a0, a0, (a2)
        ret

asm_test::or::u8::acquire:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        sllw              a0, a1, a0
        amoor.w.aq        a0, a0, (a2)
        ret

asm_test::or::u8::relaxed:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        sllw              a0, a1, a0
        amoor.w           a0, a0, (a2)
        ret

asm_test::or::u8::release:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        sllw              a0, a1, a0
        amoor.w.rl        a0, a0, (a2)
        ret

asm_test::or::u16::acqrel:
        andi              a2, a0, -0x3
        slliw             a0, a0, 0x3
        sllw              a0, a1, a0
        amoor.w.aqrl      a0, a0, (a2)
        ret

asm_test::or::u16::seqcst:
        andi              a2, a0, -0x3
        slliw             a0, a0, 0x3
        sllw              a0, a1, a0
        amoor.w.aqrl      a0, a0, (a2)
        ret

asm_test::or::u16::acquire:
        andi              a2, a0, -0x3
        slliw             a0, a0, 0x3
        sllw              a0, a1, a0
        amoor.w.aq        a0, a0, (a2)
        ret

asm_test::or::u16::relaxed:
        andi              a2, a0, -0x3
        slliw             a0, a0, 0x3
        sllw              a0, a1, a0
        amoor.w           a0, a0, (a2)
        ret

asm_test::or::u16::release:
        andi              a2, a0, -0x3
        slliw             a0, a0, 0x3
        sllw              a0, a1, a0
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

asm_test::or::u64::acqrel:
        amoor.d.aqrl      a0, a1, (a0)
        ret

asm_test::or::u64::seqcst:
        amoor.d.aqrl      a0, a1, (a0)
        ret

asm_test::or::u64::acquire:
        amoor.d.aq        a0, a1, (a0)
        ret

asm_test::or::u64::relaxed:
        amoor.d           a0, a1, (a0)
        ret

asm_test::or::u64::release:
        amoor.d.rl        a0, a1, (a0)
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

asm_test::add::u64::acqrel:
        amoadd.d.aqrl     a0, a1, (a0)
        ret

asm_test::add::u64::seqcst:
        amoadd.d.aqrl     a0, a1, (a0)
        ret

asm_test::add::u64::acquire:
        amoadd.d.aq       a0, a1, (a0)
        ret

asm_test::add::u64::relaxed:
        amoadd.d          a0, a1, (a0)
        ret

asm_test::add::u64::release:
        amoadd.d.rl       a0, a1, (a0)
        ret

asm_test::and::u8::acqrel:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        li                a3, 0xff
        sllw              a3, a3, a0
        not               a3, a3
        sllw              a0, a1, a0
        or                a0, a0, a3
        amoand.w.aqrl     a0, a0, (a2)
        ret

asm_test::and::u8::seqcst:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        li                a3, 0xff
        sllw              a3, a3, a0
        not               a3, a3
        sllw              a0, a1, a0
        or                a0, a0, a3
        amoand.w.aqrl     a0, a0, (a2)
        ret

asm_test::and::u8::acquire:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        li                a3, 0xff
        sllw              a3, a3, a0
        not               a3, a3
        sllw              a0, a1, a0
        or                a0, a0, a3
        amoand.w.aq       a0, a0, (a2)
        ret

asm_test::and::u8::relaxed:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        li                a3, 0xff
        sllw              a3, a3, a0
        not               a3, a3
        sllw              a0, a1, a0
        or                a0, a0, a3
        amoand.w          a0, a0, (a2)
        ret

asm_test::and::u8::release:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        li                a3, 0xff
        sllw              a3, a3, a0
        not               a3, a3
        sllw              a0, a1, a0
        or                a0, a0, a3
        amoand.w.rl       a0, a0, (a2)
        ret

asm_test::and::u16::acqrel:
        andi              a2, a0, -0x3
        slliw             a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sllw              a3, a3, a0
        not               a3, a3
        sllw              a0, a1, a0
        or                a0, a0, a3
        amoand.w.aqrl     a0, a0, (a2)
        ret

asm_test::and::u16::seqcst:
        andi              a2, a0, -0x3
        slliw             a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sllw              a3, a3, a0
        not               a3, a3
        sllw              a0, a1, a0
        or                a0, a0, a3
        amoand.w.aqrl     a0, a0, (a2)
        ret

asm_test::and::u16::acquire:
        andi              a2, a0, -0x3
        slliw             a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sllw              a3, a3, a0
        not               a3, a3
        sllw              a0, a1, a0
        or                a0, a0, a3
        amoand.w.aq       a0, a0, (a2)
        ret

asm_test::and::u16::relaxed:
        andi              a2, a0, -0x3
        slliw             a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sllw              a3, a3, a0
        not               a3, a3
        sllw              a0, a1, a0
        or                a0, a0, a3
        amoand.w          a0, a0, (a2)
        ret

asm_test::and::u16::release:
        andi              a2, a0, -0x3
        slliw             a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sllw              a3, a3, a0
        not               a3, a3
        sllw              a0, a1, a0
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

asm_test::and::u64::acqrel:
        amoand.d.aqrl     a0, a1, (a0)
        ret

asm_test::and::u64::seqcst:
        amoand.d.aqrl     a0, a1, (a0)
        ret

asm_test::and::u64::acquire:
        amoand.d.aq       a0, a1, (a0)
        ret

asm_test::and::u64::relaxed:
        amoand.d          a0, a1, (a0)
        ret

asm_test::and::u64::release:
        amoand.d.rl       a0, a1, (a0)
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

asm_test::neg::u64::acqrel:
        csrrci            a1, mstatus, 0x8
        ld                a2, 0x0(a0)
        neg               a2, a2
        sd                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::neg::u64::seqcst:
        csrrci            a1, mstatus, 0x8
        ld                a2, 0x0(a0)
        neg               a2, a2
        sd                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::neg::u64::acquire:
        csrrci            a1, mstatus, 0x8
        ld                a2, 0x0(a0)
        neg               a2, a2
        sd                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::neg::u64::relaxed:
        csrrci            a1, mstatus, 0x8
        ld                a2, 0x0(a0)
        neg               a2, a2
        sd                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::neg::u64::release:
        csrrci            a1, mstatus, 0x8
        ld                a2, 0x0(a0)
        neg               a2, a2
        sd                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::not::u8::acqrel:
        andi              a1, a0, -0x4
        slliw             a0, a0, 0x3
        li                a2, 0xff
        sllw              a0, a2, a0
        amoxor.w.aqrl     a0, a0, (a1)
        ret

asm_test::not::u8::seqcst:
        andi              a1, a0, -0x4
        slliw             a0, a0, 0x3
        li                a2, 0xff
        sllw              a0, a2, a0
        amoxor.w.aqrl     a0, a0, (a1)
        ret

asm_test::not::u8::acquire:
        andi              a1, a0, -0x4
        slliw             a0, a0, 0x3
        li                a2, 0xff
        sllw              a0, a2, a0
        amoxor.w.aq       a0, a0, (a1)
        ret

asm_test::not::u8::relaxed:
        andi              a1, a0, -0x4
        slliw             a0, a0, 0x3
        li                a2, 0xff
        sllw              a0, a2, a0
        amoxor.w          a0, a0, (a1)
        ret

asm_test::not::u8::release:
        andi              a1, a0, -0x4
        slliw             a0, a0, 0x3
        li                a2, 0xff
        sllw              a0, a2, a0
        amoxor.w.rl       a0, a0, (a1)
        ret

asm_test::not::u16::acqrel:
        andi              a1, a0, -0x3
        slliw             a0, a0, 0x3
        lui               a2, 0x10
        addi              a2, a2, -0x1
        sllw              a0, a2, a0
        amoxor.w.aqrl     a0, a0, (a1)
        ret

asm_test::not::u16::seqcst:
        andi              a1, a0, -0x3
        slliw             a0, a0, 0x3
        lui               a2, 0x10
        addi              a2, a2, -0x1
        sllw              a0, a2, a0
        amoxor.w.aqrl     a0, a0, (a1)
        ret

asm_test::not::u16::acquire:
        andi              a1, a0, -0x3
        slliw             a0, a0, 0x3
        lui               a2, 0x10
        addi              a2, a2, -0x1
        sllw              a0, a2, a0
        amoxor.w.aq       a0, a0, (a1)
        ret

asm_test::not::u16::relaxed:
        andi              a1, a0, -0x3
        slliw             a0, a0, 0x3
        lui               a2, 0x10
        addi              a2, a2, -0x1
        sllw              a0, a2, a0
        amoxor.w          a0, a0, (a1)
        ret

asm_test::not::u16::release:
        andi              a1, a0, -0x3
        slliw             a0, a0, 0x3
        lui               a2, 0x10
        addi              a2, a2, -0x1
        sllw              a0, a2, a0
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

asm_test::not::u64::acqrel:
        li                a1, -0x1
        amoxor.d.aqrl     a0, a1, (a0)
        ret

asm_test::not::u64::seqcst:
        li                a1, -0x1
        amoxor.d.aqrl     a0, a1, (a0)
        ret

asm_test::not::u64::acquire:
        li                a1, -0x1
        amoxor.d.aq       a0, a1, (a0)
        ret

asm_test::not::u64::relaxed:
        li                a1, -0x1
        amoxor.d          a0, a1, (a0)
        ret

asm_test::not::u64::release:
        li                a1, -0x1
        amoxor.d.rl       a0, a1, (a0)
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
        negw              a1, a1
        amoadd.w.aqrl     a0, a1, (a0)
        ret

asm_test::sub::u32::seqcst:
        negw              a1, a1
        amoadd.w.aqrl     a0, a1, (a0)
        ret

asm_test::sub::u32::acquire:
        negw              a1, a1
        amoadd.w.aq       a0, a1, (a0)
        ret

asm_test::sub::u32::relaxed:
        negw              a1, a1
        amoadd.w          a0, a1, (a0)
        ret

asm_test::sub::u32::release:
        negw              a1, a1
        amoadd.w.rl       a0, a1, (a0)
        ret

asm_test::sub::u64::acqrel:
        neg               a1, a1
        amoadd.d.aqrl     a0, a1, (a0)
        ret

asm_test::sub::u64::seqcst:
        neg               a1, a1
        amoadd.d.aqrl     a0, a1, (a0)
        ret

asm_test::sub::u64::acquire:
        neg               a1, a1
        amoadd.d.aq       a0, a1, (a0)
        ret

asm_test::sub::u64::relaxed:
        neg               a1, a1
        amoadd.d          a0, a1, (a0)
        ret

asm_test::sub::u64::release:
        neg               a1, a1
        amoadd.d.rl       a0, a1, (a0)
        ret

asm_test::xor::u8::acqrel:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        sllw              a0, a1, a0
        amoxor.w.aqrl     a0, a0, (a2)
        ret

asm_test::xor::u8::seqcst:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        sllw              a0, a1, a0
        amoxor.w.aqrl     a0, a0, (a2)
        ret

asm_test::xor::u8::acquire:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        sllw              a0, a1, a0
        amoxor.w.aq       a0, a0, (a2)
        ret

asm_test::xor::u8::relaxed:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        sllw              a0, a1, a0
        amoxor.w          a0, a0, (a2)
        ret

asm_test::xor::u8::release:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        sllw              a0, a1, a0
        amoxor.w.rl       a0, a0, (a2)
        ret

asm_test::xor::u16::acqrel:
        andi              a2, a0, -0x3
        slliw             a0, a0, 0x3
        sllw              a0, a1, a0
        amoxor.w.aqrl     a0, a0, (a2)
        ret

asm_test::xor::u16::seqcst:
        andi              a2, a0, -0x3
        slliw             a0, a0, 0x3
        sllw              a0, a1, a0
        amoxor.w.aqrl     a0, a0, (a2)
        ret

asm_test::xor::u16::acquire:
        andi              a2, a0, -0x3
        slliw             a0, a0, 0x3
        sllw              a0, a1, a0
        amoxor.w.aq       a0, a0, (a2)
        ret

asm_test::xor::u16::relaxed:
        andi              a2, a0, -0x3
        slliw             a0, a0, 0x3
        sllw              a0, a1, a0
        amoxor.w          a0, a0, (a2)
        ret

asm_test::xor::u16::release:
        andi              a2, a0, -0x3
        slliw             a0, a0, 0x3
        sllw              a0, a1, a0
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

asm_test::xor::u64::acqrel:
        amoxor.d.aqrl     a0, a1, (a0)
        ret

asm_test::xor::u64::seqcst:
        amoxor.d.aqrl     a0, a1, (a0)
        ret

asm_test::xor::u64::acquire:
        amoxor.d.aq       a0, a1, (a0)
        ret

asm_test::xor::u64::relaxed:
        amoxor.d          a0, a1, (a0)
        ret

asm_test::xor::u64::release:
        amoxor.d.rl       a0, a1, (a0)
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

asm_test::swap::u64::acqrel:
        amoswap.d.aqrl    a0, a1, (a0)
        ret

asm_test::swap::u64::seqcst:
        amoswap.d.aqrl    a0, a1, (a0)
        ret

asm_test::swap::u64::acquire:
        amoswap.d.aq      a0, a1, (a0)
        ret

asm_test::swap::u64::relaxed:
        amoswap.d         a0, a1, (a0)
        ret

asm_test::swap::u64::release:
        amoswap.d.rl      a0, a1, (a0)
        ret

asm_test::swap::bool::acqrel:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        beqz              a1, 0f
        li                a1, 0x1
        sllw              a1, a1, a0
        amoor.w.aqrl      a1, a1, (a2)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret
0:
        li                a3, 0xff
        sllw              a3, a3, a0
        not               a3, a3
        sllw              a1, a1, a0
        or                a1, a1, a3
        amoand.w.aqrl     a1, a1, (a2)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::swap::bool::seqcst:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        beqz              a1, 0f
        li                a1, 0x1
        sllw              a1, a1, a0
        amoor.w.aqrl      a1, a1, (a2)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret
0:
        li                a3, 0xff
        sllw              a3, a3, a0
        not               a3, a3
        sllw              a1, a1, a0
        or                a1, a1, a3
        amoand.w.aqrl     a1, a1, (a2)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::swap::bool::acquire:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        beqz              a1, 0f
        li                a1, 0x1
        sllw              a1, a1, a0
        amoor.w.aq        a1, a1, (a2)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret
0:
        li                a3, 0xff
        sllw              a3, a3, a0
        not               a3, a3
        sllw              a1, a1, a0
        or                a1, a1, a3
        amoand.w.aq       a1, a1, (a2)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::swap::bool::relaxed:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        beqz              a1, 0f
        li                a1, 0x1
        sllw              a1, a1, a0
        amoor.w           a1, a1, (a2)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret
0:
        li                a3, 0xff
        sllw              a3, a3, a0
        not               a3, a3
        sllw              a1, a1, a0
        or                a1, a1, a3
        amoand.w          a1, a1, (a2)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::swap::bool::release:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        beqz              a1, 0f
        li                a1, 0x1
        sllw              a1, a1, a0
        amoor.w.rl        a1, a1, (a2)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret
0:
        li                a3, 0xff
        sllw              a3, a3, a0
        not               a3, a3
        sllw              a1, a1, a0
        or                a1, a1, a3
        amoand.w.rl       a1, a1, (a2)
        srlw              a0, a1, a0
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

asm_test::fetch_or::u8::acqrel:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        sllw              a1, a1, a0
        amoor.w.aqrl      a1, a1, (a2)
        srlw              a0, a1, a0
        ret

asm_test::fetch_or::u8::seqcst:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        sllw              a1, a1, a0
        amoor.w.aqrl      a1, a1, (a2)
        srlw              a0, a1, a0
        ret

asm_test::fetch_or::u8::acquire:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        sllw              a1, a1, a0
        amoor.w.aq        a1, a1, (a2)
        srlw              a0, a1, a0
        ret

asm_test::fetch_or::u8::relaxed:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        sllw              a1, a1, a0
        amoor.w           a1, a1, (a2)
        srlw              a0, a1, a0
        ret

asm_test::fetch_or::u8::release:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        sllw              a1, a1, a0
        amoor.w.rl        a1, a1, (a2)
        srlw              a0, a1, a0
        ret

asm_test::fetch_or::u16::acqrel:
        andi              a2, a0, -0x3
        slliw             a0, a0, 0x3
        sllw              a1, a1, a0
        amoor.w.aqrl      a1, a1, (a2)
        srlw              a0, a1, a0
        ret

asm_test::fetch_or::u16::seqcst:
        andi              a2, a0, -0x3
        slliw             a0, a0, 0x3
        sllw              a1, a1, a0
        amoor.w.aqrl      a1, a1, (a2)
        srlw              a0, a1, a0
        ret

asm_test::fetch_or::u16::acquire:
        andi              a2, a0, -0x3
        slliw             a0, a0, 0x3
        sllw              a1, a1, a0
        amoor.w.aq        a1, a1, (a2)
        srlw              a0, a1, a0
        ret

asm_test::fetch_or::u16::relaxed:
        andi              a2, a0, -0x3
        slliw             a0, a0, 0x3
        sllw              a1, a1, a0
        amoor.w           a1, a1, (a2)
        srlw              a0, a1, a0
        ret

asm_test::fetch_or::u16::release:
        andi              a2, a0, -0x3
        slliw             a0, a0, 0x3
        sllw              a1, a1, a0
        amoor.w.rl        a1, a1, (a2)
        srlw              a0, a1, a0
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
        amoor.d.aqrl      a0, a1, (a0)
        ret

asm_test::fetch_or::u64::seqcst:
        amoor.d.aqrl      a0, a1, (a0)
        ret

asm_test::fetch_or::u64::acquire:
        amoor.d.aq        a0, a1, (a0)
        ret

asm_test::fetch_or::u64::relaxed:
        amoor.d           a0, a1, (a0)
        ret

asm_test::fetch_or::u64::release:
        amoor.d.rl        a0, a1, (a0)
        ret

asm_test::fetch_or::bool::acqrel:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        sllw              a1, a1, a0
        amoor.w.aqrl      a1, a1, (a2)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_or::bool::seqcst:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        sllw              a1, a1, a0
        amoor.w.aqrl      a1, a1, (a2)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_or::bool::acquire:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        sllw              a1, a1, a0
        amoor.w.aq        a1, a1, (a2)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_or::bool::relaxed:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        sllw              a1, a1, a0
        amoor.w           a1, a1, (a2)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_or::bool::release:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        sllw              a1, a1, a0
        amoor.w.rl        a1, a1, (a2)
        srlw              a0, a1, a0
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

asm_test::fetch_add::u64::acqrel:
        amoadd.d.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_add::u64::seqcst:
        amoadd.d.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_add::u64::acquire:
        amoadd.d.aq       a0, a1, (a0)
        ret

asm_test::fetch_add::u64::relaxed:
        amoadd.d          a0, a1, (a0)
        ret

asm_test::fetch_add::u64::release:
        amoadd.d.rl       a0, a1, (a0)
        ret

asm_test::fetch_and::u8::acqrel:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        li                a3, 0xff
        sllw              a3, a3, a0
        not               a3, a3
        sllw              a1, a1, a0
        or                a1, a1, a3
        amoand.w.aqrl     a1, a1, (a2)
        srlw              a0, a1, a0
        ret

asm_test::fetch_and::u8::seqcst:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        li                a3, 0xff
        sllw              a3, a3, a0
        not               a3, a3
        sllw              a1, a1, a0
        or                a1, a1, a3
        amoand.w.aqrl     a1, a1, (a2)
        srlw              a0, a1, a0
        ret

asm_test::fetch_and::u8::acquire:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        li                a3, 0xff
        sllw              a3, a3, a0
        not               a3, a3
        sllw              a1, a1, a0
        or                a1, a1, a3
        amoand.w.aq       a1, a1, (a2)
        srlw              a0, a1, a0
        ret

asm_test::fetch_and::u8::relaxed:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        li                a3, 0xff
        sllw              a3, a3, a0
        not               a3, a3
        sllw              a1, a1, a0
        or                a1, a1, a3
        amoand.w          a1, a1, (a2)
        srlw              a0, a1, a0
        ret

asm_test::fetch_and::u8::release:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        li                a3, 0xff
        sllw              a3, a3, a0
        not               a3, a3
        sllw              a1, a1, a0
        or                a1, a1, a3
        amoand.w.rl       a1, a1, (a2)
        srlw              a0, a1, a0
        ret

asm_test::fetch_and::u16::acqrel:
        andi              a2, a0, -0x3
        slliw             a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sllw              a3, a3, a0
        not               a3, a3
        sllw              a1, a1, a0
        or                a1, a1, a3
        amoand.w.aqrl     a1, a1, (a2)
        srlw              a0, a1, a0
        ret

asm_test::fetch_and::u16::seqcst:
        andi              a2, a0, -0x3
        slliw             a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sllw              a3, a3, a0
        not               a3, a3
        sllw              a1, a1, a0
        or                a1, a1, a3
        amoand.w.aqrl     a1, a1, (a2)
        srlw              a0, a1, a0
        ret

asm_test::fetch_and::u16::acquire:
        andi              a2, a0, -0x3
        slliw             a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sllw              a3, a3, a0
        not               a3, a3
        sllw              a1, a1, a0
        or                a1, a1, a3
        amoand.w.aq       a1, a1, (a2)
        srlw              a0, a1, a0
        ret

asm_test::fetch_and::u16::relaxed:
        andi              a2, a0, -0x3
        slliw             a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sllw              a3, a3, a0
        not               a3, a3
        sllw              a1, a1, a0
        or                a1, a1, a3
        amoand.w          a1, a1, (a2)
        srlw              a0, a1, a0
        ret

asm_test::fetch_and::u16::release:
        andi              a2, a0, -0x3
        slliw             a0, a0, 0x3
        lui               a3, 0x10
        addi              a3, a3, -0x1
        sllw              a3, a3, a0
        not               a3, a3
        sllw              a1, a1, a0
        or                a1, a1, a3
        amoand.w.rl       a1, a1, (a2)
        srlw              a0, a1, a0
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
        amoand.d.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_and::u64::seqcst:
        amoand.d.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_and::u64::acquire:
        amoand.d.aq       a0, a1, (a0)
        ret

asm_test::fetch_and::u64::relaxed:
        amoand.d          a0, a1, (a0)
        ret

asm_test::fetch_and::u64::release:
        amoand.d.rl       a0, a1, (a0)
        ret

asm_test::fetch_and::bool::acqrel:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        li                a3, 0xff
        sllw              a3, a3, a0
        not               a3, a3
        sllw              a1, a1, a0
        or                a1, a1, a3
        amoand.w.aqrl     a1, a1, (a2)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_and::bool::seqcst:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        li                a3, 0xff
        sllw              a3, a3, a0
        not               a3, a3
        sllw              a1, a1, a0
        or                a1, a1, a3
        amoand.w.aqrl     a1, a1, (a2)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_and::bool::acquire:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        li                a3, 0xff
        sllw              a3, a3, a0
        not               a3, a3
        sllw              a1, a1, a0
        or                a1, a1, a3
        amoand.w.aq       a1, a1, (a2)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_and::bool::relaxed:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        li                a3, 0xff
        sllw              a3, a3, a0
        not               a3, a3
        sllw              a1, a1, a0
        or                a1, a1, a3
        amoand.w          a1, a1, (a2)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_and::bool::release:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        li                a3, 0xff
        sllw              a3, a3, a0
        not               a3, a3
        sllw              a1, a1, a0
        or                a1, a1, a3
        amoand.w.rl       a1, a1, (a2)
        srlw              a0, a1, a0
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

asm_test::fetch_max::i64::acqrel:
        amomax.d.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_max::i64::seqcst:
        amomax.d.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_max::i64::acquire:
        amomax.d.aq       a0, a1, (a0)
        ret

asm_test::fetch_max::i64::relaxed:
        amomax.d          a0, a1, (a0)
        ret

asm_test::fetch_max::i64::release:
        amomax.d.rl       a0, a1, (a0)
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

asm_test::fetch_min::i64::acqrel:
        amomin.d.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_min::i64::seqcst:
        amomin.d.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_min::i64::acquire:
        amomin.d.aq       a0, a1, (a0)
        ret

asm_test::fetch_min::i64::relaxed:
        amomin.d          a0, a1, (a0)
        ret

asm_test::fetch_min::i64::release:
        amomin.d.rl       a0, a1, (a0)
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

asm_test::fetch_neg::u64::acqrel:
        csrrci            a2, mstatus, 0x8
        ld                a1, 0x0(a0)
        neg               a3, a1
        sd                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u64::seqcst:
        csrrci            a2, mstatus, 0x8
        ld                a1, 0x0(a0)
        neg               a3, a1
        sd                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u64::acquire:
        csrrci            a2, mstatus, 0x8
        ld                a1, 0x0(a0)
        neg               a3, a1
        sd                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u64::relaxed:
        csrrci            a2, mstatus, 0x8
        ld                a1, 0x0(a0)
        neg               a3, a1
        sd                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u64::release:
        csrrci            a2, mstatus, 0x8
        ld                a1, 0x0(a0)
        neg               a3, a1
        sd                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_not::u8::acqrel:
        andi              a1, a0, -0x4
        slliw             a0, a0, 0x3
        li                a2, 0xff
        sllw              a2, a2, a0
        amoxor.w.aqrl     a1, a2, (a1)
        srlw              a0, a1, a0
        ret

asm_test::fetch_not::u8::seqcst:
        andi              a1, a0, -0x4
        slliw             a0, a0, 0x3
        li                a2, 0xff
        sllw              a2, a2, a0
        amoxor.w.aqrl     a1, a2, (a1)
        srlw              a0, a1, a0
        ret

asm_test::fetch_not::u8::acquire:
        andi              a1, a0, -0x4
        slliw             a0, a0, 0x3
        li                a2, 0xff
        sllw              a2, a2, a0
        amoxor.w.aq       a1, a2, (a1)
        srlw              a0, a1, a0
        ret

asm_test::fetch_not::u8::relaxed:
        andi              a1, a0, -0x4
        slliw             a0, a0, 0x3
        li                a2, 0xff
        sllw              a2, a2, a0
        amoxor.w          a1, a2, (a1)
        srlw              a0, a1, a0
        ret

asm_test::fetch_not::u8::release:
        andi              a1, a0, -0x4
        slliw             a0, a0, 0x3
        li                a2, 0xff
        sllw              a2, a2, a0
        amoxor.w.rl       a1, a2, (a1)
        srlw              a0, a1, a0
        ret

asm_test::fetch_not::u16::acqrel:
        andi              a1, a0, -0x3
        slliw             a0, a0, 0x3
        lui               a2, 0x10
        addi              a2, a2, -0x1
        sllw              a2, a2, a0
        amoxor.w.aqrl     a1, a2, (a1)
        srlw              a0, a1, a0
        ret

asm_test::fetch_not::u16::seqcst:
        andi              a1, a0, -0x3
        slliw             a0, a0, 0x3
        lui               a2, 0x10
        addi              a2, a2, -0x1
        sllw              a2, a2, a0
        amoxor.w.aqrl     a1, a2, (a1)
        srlw              a0, a1, a0
        ret

asm_test::fetch_not::u16::acquire:
        andi              a1, a0, -0x3
        slliw             a0, a0, 0x3
        lui               a2, 0x10
        addi              a2, a2, -0x1
        sllw              a2, a2, a0
        amoxor.w.aq       a1, a2, (a1)
        srlw              a0, a1, a0
        ret

asm_test::fetch_not::u16::relaxed:
        andi              a1, a0, -0x3
        slliw             a0, a0, 0x3
        lui               a2, 0x10
        addi              a2, a2, -0x1
        sllw              a2, a2, a0
        amoxor.w          a1, a2, (a1)
        srlw              a0, a1, a0
        ret

asm_test::fetch_not::u16::release:
        andi              a1, a0, -0x3
        slliw             a0, a0, 0x3
        lui               a2, 0x10
        addi              a2, a2, -0x1
        sllw              a2, a2, a0
        amoxor.w.rl       a1, a2, (a1)
        srlw              a0, a1, a0
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
        li                a1, -0x1
        amoxor.d.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_not::u64::seqcst:
        li                a1, -0x1
        amoxor.d.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_not::u64::acquire:
        li                a1, -0x1
        amoxor.d.aq       a0, a1, (a0)
        ret

asm_test::fetch_not::u64::relaxed:
        li                a1, -0x1
        amoxor.d          a0, a1, (a0)
        ret

asm_test::fetch_not::u64::release:
        li                a1, -0x1
        amoxor.d.rl       a0, a1, (a0)
        ret

asm_test::fetch_not::bool::acqrel:
        andi              a1, a0, -0x4
        slliw             a0, a0, 0x3
        li                a2, 0x1
        sllw              a2, a2, a0
        amoxor.w.aqrl     a1, a2, (a1)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_not::bool::seqcst:
        andi              a1, a0, -0x4
        slliw             a0, a0, 0x3
        li                a2, 0x1
        sllw              a2, a2, a0
        amoxor.w.aqrl     a1, a2, (a1)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_not::bool::acquire:
        andi              a1, a0, -0x4
        slliw             a0, a0, 0x3
        li                a2, 0x1
        sllw              a2, a2, a0
        amoxor.w.aq       a1, a2, (a1)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_not::bool::relaxed:
        andi              a1, a0, -0x4
        slliw             a0, a0, 0x3
        li                a2, 0x1
        sllw              a2, a2, a0
        amoxor.w          a1, a2, (a1)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_not::bool::release:
        andi              a1, a0, -0x4
        slliw             a0, a0, 0x3
        li                a2, 0x1
        sllw              a2, a2, a0
        amoxor.w.rl       a1, a2, (a1)
        srlw              a0, a1, a0
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
        negw              a1, a1
        amoadd.w.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_sub::u32::seqcst:
        negw              a1, a1
        amoadd.w.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_sub::u32::acquire:
        negw              a1, a1
        amoadd.w.aq       a0, a1, (a0)
        ret

asm_test::fetch_sub::u32::relaxed:
        negw              a1, a1
        amoadd.w          a0, a1, (a0)
        ret

asm_test::fetch_sub::u32::release:
        negw              a1, a1
        amoadd.w.rl       a0, a1, (a0)
        ret

asm_test::fetch_sub::u64::acqrel:
        neg               a1, a1
        amoadd.d.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_sub::u64::seqcst:
        neg               a1, a1
        amoadd.d.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_sub::u64::acquire:
        neg               a1, a1
        amoadd.d.aq       a0, a1, (a0)
        ret

asm_test::fetch_sub::u64::relaxed:
        neg               a1, a1
        amoadd.d          a0, a1, (a0)
        ret

asm_test::fetch_sub::u64::release:
        neg               a1, a1
        amoadd.d.rl       a0, a1, (a0)
        ret

asm_test::fetch_xor::u8::acqrel:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        sllw              a1, a1, a0
        amoxor.w.aqrl     a1, a1, (a2)
        srlw              a0, a1, a0
        ret

asm_test::fetch_xor::u8::seqcst:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        sllw              a1, a1, a0
        amoxor.w.aqrl     a1, a1, (a2)
        srlw              a0, a1, a0
        ret

asm_test::fetch_xor::u8::acquire:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        sllw              a1, a1, a0
        amoxor.w.aq       a1, a1, (a2)
        srlw              a0, a1, a0
        ret

asm_test::fetch_xor::u8::relaxed:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        sllw              a1, a1, a0
        amoxor.w          a1, a1, (a2)
        srlw              a0, a1, a0
        ret

asm_test::fetch_xor::u8::release:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        sllw              a1, a1, a0
        amoxor.w.rl       a1, a1, (a2)
        srlw              a0, a1, a0
        ret

asm_test::fetch_xor::u16::acqrel:
        andi              a2, a0, -0x3
        slliw             a0, a0, 0x3
        sllw              a1, a1, a0
        amoxor.w.aqrl     a1, a1, (a2)
        srlw              a0, a1, a0
        ret

asm_test::fetch_xor::u16::seqcst:
        andi              a2, a0, -0x3
        slliw             a0, a0, 0x3
        sllw              a1, a1, a0
        amoxor.w.aqrl     a1, a1, (a2)
        srlw              a0, a1, a0
        ret

asm_test::fetch_xor::u16::acquire:
        andi              a2, a0, -0x3
        slliw             a0, a0, 0x3
        sllw              a1, a1, a0
        amoxor.w.aq       a1, a1, (a2)
        srlw              a0, a1, a0
        ret

asm_test::fetch_xor::u16::relaxed:
        andi              a2, a0, -0x3
        slliw             a0, a0, 0x3
        sllw              a1, a1, a0
        amoxor.w          a1, a1, (a2)
        srlw              a0, a1, a0
        ret

asm_test::fetch_xor::u16::release:
        andi              a2, a0, -0x3
        slliw             a0, a0, 0x3
        sllw              a1, a1, a0
        amoxor.w.rl       a1, a1, (a2)
        srlw              a0, a1, a0
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
        amoxor.d.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_xor::u64::seqcst:
        amoxor.d.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_xor::u64::acquire:
        amoxor.d.aq       a0, a1, (a0)
        ret

asm_test::fetch_xor::u64::relaxed:
        amoxor.d          a0, a1, (a0)
        ret

asm_test::fetch_xor::u64::release:
        amoxor.d.rl       a0, a1, (a0)
        ret

asm_test::fetch_xor::bool::acqrel:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        sllw              a1, a1, a0
        amoxor.w.aqrl     a1, a1, (a2)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_xor::bool::seqcst:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        sllw              a1, a1, a0
        amoxor.w.aqrl     a1, a1, (a2)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_xor::bool::acquire:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        sllw              a1, a1, a0
        amoxor.w.aq       a1, a1, (a2)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_xor::bool::relaxed:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        sllw              a1, a1, a0
        amoxor.w          a1, a1, (a2)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret

asm_test::fetch_xor::bool::release:
        andi              a2, a0, -0x4
        slliw             a0, a0, 0x3
        sllw              a1, a1, a0
        amoxor.w.rl       a1, a1, (a2)
        srlw              a0, a1, a0
        zext.b            a0, a0
        snez              a0, a0
        ret


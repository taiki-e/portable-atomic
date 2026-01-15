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

asm_test::fetch_umax::u8::acqrel:
        amomaxu.b.aqrl    a0, a1, (a0)
        ret

asm_test::fetch_umax::u8::seqcst:
        amomaxu.b.aqrl    a0, a1, (a0)
        ret

asm_test::fetch_umax::u8::acquire:
        amomaxu.b.aq      a0, a1, (a0)
        ret

asm_test::fetch_umax::u8::relaxed:
        amomaxu.b         a0, a1, (a0)
        ret

asm_test::fetch_umax::u8::release:
        amomaxu.b.rl      a0, a1, (a0)
        ret

asm_test::fetch_umax::u16::acqrel:
        amomaxu.h.aqrl    a0, a1, (a0)
        ret

asm_test::fetch_umax::u16::seqcst:
        amomaxu.h.aqrl    a0, a1, (a0)
        ret

asm_test::fetch_umax::u16::acquire:
        amomaxu.h.aq      a0, a1, (a0)
        ret

asm_test::fetch_umax::u16::relaxed:
        amomaxu.h         a0, a1, (a0)
        ret

asm_test::fetch_umax::u16::release:
        amomaxu.h.rl      a0, a1, (a0)
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
        amominu.b.aqrl    a0, a1, (a0)
        ret

asm_test::fetch_umin::u8::seqcst:
        amominu.b.aqrl    a0, a1, (a0)
        ret

asm_test::fetch_umin::u8::acquire:
        amominu.b.aq      a0, a1, (a0)
        ret

asm_test::fetch_umin::u8::relaxed:
        amominu.b         a0, a1, (a0)
        ret

asm_test::fetch_umin::u8::release:
        amominu.b.rl      a0, a1, (a0)
        ret

asm_test::fetch_umin::u16::acqrel:
        amominu.h.aqrl    a0, a1, (a0)
        ret

asm_test::fetch_umin::u16::seqcst:
        amominu.h.aqrl    a0, a1, (a0)
        ret

asm_test::fetch_umin::u16::acquire:
        amominu.h.aq      a0, a1, (a0)
        ret

asm_test::fetch_umin::u16::relaxed:
        amominu.h         a0, a1, (a0)
        ret

asm_test::fetch_umin::u16::release:
        amominu.h.rl      a0, a1, (a0)
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

asm_test::or::u8::acqrel:
        amoor.b.aqrl      a0, a1, (a0)
        ret

asm_test::or::u8::seqcst:
        amoor.b.aqrl      a0, a1, (a0)
        ret

asm_test::or::u8::acquire:
        amoor.b.aq        a0, a1, (a0)
        ret

asm_test::or::u8::relaxed:
        amoor.b           a0, a1, (a0)
        ret

asm_test::or::u8::release:
        amoor.b.rl        a0, a1, (a0)
        ret

asm_test::or::u16::acqrel:
        amoor.h.aqrl      a0, a1, (a0)
        ret

asm_test::or::u16::seqcst:
        amoor.h.aqrl      a0, a1, (a0)
        ret

asm_test::or::u16::acquire:
        amoor.h.aq        a0, a1, (a0)
        ret

asm_test::or::u16::relaxed:
        amoor.h           a0, a1, (a0)
        ret

asm_test::or::u16::release:
        amoor.h.rl        a0, a1, (a0)
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
        amoadd.b.aqrl     a0, a1, (a0)
        ret

asm_test::add::u8::seqcst:
        amoadd.b.aqrl     a0, a1, (a0)
        ret

asm_test::add::u8::acquire:
        amoadd.b.aq       a0, a1, (a0)
        ret

asm_test::add::u8::relaxed:
        amoadd.b          a0, a1, (a0)
        ret

asm_test::add::u8::release:
        amoadd.b.rl       a0, a1, (a0)
        ret

asm_test::add::u16::acqrel:
        amoadd.h.aqrl     a0, a1, (a0)
        ret

asm_test::add::u16::seqcst:
        amoadd.h.aqrl     a0, a1, (a0)
        ret

asm_test::add::u16::acquire:
        amoadd.h.aq       a0, a1, (a0)
        ret

asm_test::add::u16::relaxed:
        amoadd.h          a0, a1, (a0)
        ret

asm_test::add::u16::release:
        amoadd.h.rl       a0, a1, (a0)
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
        amoand.b.aqrl     a0, a1, (a0)
        ret

asm_test::and::u8::seqcst:
        amoand.b.aqrl     a0, a1, (a0)
        ret

asm_test::and::u8::acquire:
        amoand.b.aq       a0, a1, (a0)
        ret

asm_test::and::u8::relaxed:
        amoand.b          a0, a1, (a0)
        ret

asm_test::and::u8::release:
        amoand.b.rl       a0, a1, (a0)
        ret

asm_test::and::u16::acqrel:
        amoand.h.aqrl     a0, a1, (a0)
        ret

asm_test::and::u16::seqcst:
        amoand.h.aqrl     a0, a1, (a0)
        ret

asm_test::and::u16::acquire:
        amoand.h.aq       a0, a1, (a0)
        ret

asm_test::and::u16::relaxed:
        amoand.h          a0, a1, (a0)
        ret

asm_test::and::u16::release:
        amoand.h.rl       a0, a1, (a0)
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
        negw              a2, a2
        sb                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::neg::u8::seqcst:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        negw              a2, a2
        sb                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::neg::u8::acquire:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        negw              a2, a2
        sb                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::neg::u8::relaxed:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        negw              a2, a2
        sb                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::neg::u8::release:
        csrrci            a1, mstatus, 0x8
        lbu               a2, 0x0(a0)
        negw              a2, a2
        sb                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::neg::u16::acqrel:
        csrrci            a1, mstatus, 0x8
        lh                a2, 0x0(a0)
        negw              a2, a2
        sh                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::neg::u16::seqcst:
        csrrci            a1, mstatus, 0x8
        lh                a2, 0x0(a0)
        negw              a2, a2
        sh                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::neg::u16::acquire:
        csrrci            a1, mstatus, 0x8
        lh                a2, 0x0(a0)
        negw              a2, a2
        sh                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::neg::u16::relaxed:
        csrrci            a1, mstatus, 0x8
        lh                a2, 0x0(a0)
        negw              a2, a2
        sh                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::neg::u16::release:
        csrrci            a1, mstatus, 0x8
        lh                a2, 0x0(a0)
        negw              a2, a2
        sh                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::neg::u32::acqrel:
        csrrci            a1, mstatus, 0x8
        lw                a2, 0x0(a0)
        negw              a2, a2
        sw                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::neg::u32::seqcst:
        csrrci            a1, mstatus, 0x8
        lw                a2, 0x0(a0)
        negw              a2, a2
        sw                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::neg::u32::acquire:
        csrrci            a1, mstatus, 0x8
        lw                a2, 0x0(a0)
        negw              a2, a2
        sw                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::neg::u32::relaxed:
        csrrci            a1, mstatus, 0x8
        lw                a2, 0x0(a0)
        negw              a2, a2
        sw                a2, 0x0(a0)
        csrw              mstatus, a1
        ret

asm_test::neg::u32::release:
        csrrci            a1, mstatus, 0x8
        lw                a2, 0x0(a0)
        negw              a2, a2
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
        li                a1, -0x1
        amoxor.b.aqrl     a0, a1, (a0)
        ret

asm_test::not::u8::seqcst:
        li                a1, -0x1
        amoxor.b.aqrl     a0, a1, (a0)
        ret

asm_test::not::u8::acquire:
        li                a1, -0x1
        amoxor.b.aq       a0, a1, (a0)
        ret

asm_test::not::u8::relaxed:
        li                a1, -0x1
        amoxor.b          a0, a1, (a0)
        ret

asm_test::not::u8::release:
        li                a1, -0x1
        amoxor.b.rl       a0, a1, (a0)
        ret

asm_test::not::u16::acqrel:
        li                a1, -0x1
        amoxor.h.aqrl     a0, a1, (a0)
        ret

asm_test::not::u16::seqcst:
        li                a1, -0x1
        amoxor.h.aqrl     a0, a1, (a0)
        ret

asm_test::not::u16::acquire:
        li                a1, -0x1
        amoxor.h.aq       a0, a1, (a0)
        ret

asm_test::not::u16::relaxed:
        li                a1, -0x1
        amoxor.h          a0, a1, (a0)
        ret

asm_test::not::u16::release:
        li                a1, -0x1
        amoxor.h.rl       a0, a1, (a0)
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
        neg               a1, a1
        amoadd.b.aqrl     a0, a1, (a0)
        ret

asm_test::sub::u8::seqcst:
        neg               a1, a1
        amoadd.b.aqrl     a0, a1, (a0)
        ret

asm_test::sub::u8::acquire:
        neg               a1, a1
        amoadd.b.aq       a0, a1, (a0)
        ret

asm_test::sub::u8::relaxed:
        neg               a1, a1
        amoadd.b          a0, a1, (a0)
        ret

asm_test::sub::u8::release:
        neg               a1, a1
        amoadd.b.rl       a0, a1, (a0)
        ret

asm_test::sub::u16::acqrel:
        neg               a1, a1
        amoadd.h.aqrl     a0, a1, (a0)
        ret

asm_test::sub::u16::seqcst:
        neg               a1, a1
        amoadd.h.aqrl     a0, a1, (a0)
        ret

asm_test::sub::u16::acquire:
        neg               a1, a1
        amoadd.h.aq       a0, a1, (a0)
        ret

asm_test::sub::u16::relaxed:
        neg               a1, a1
        amoadd.h          a0, a1, (a0)
        ret

asm_test::sub::u16::release:
        neg               a1, a1
        amoadd.h.rl       a0, a1, (a0)
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
        amoxor.b.aqrl     a0, a1, (a0)
        ret

asm_test::xor::u8::seqcst:
        amoxor.b.aqrl     a0, a1, (a0)
        ret

asm_test::xor::u8::acquire:
        amoxor.b.aq       a0, a1, (a0)
        ret

asm_test::xor::u8::relaxed:
        amoxor.b          a0, a1, (a0)
        ret

asm_test::xor::u8::release:
        amoxor.b.rl       a0, a1, (a0)
        ret

asm_test::xor::u16::acqrel:
        amoxor.h.aqrl     a0, a1, (a0)
        ret

asm_test::xor::u16::seqcst:
        amoxor.h.aqrl     a0, a1, (a0)
        ret

asm_test::xor::u16::acquire:
        amoxor.h.aq       a0, a1, (a0)
        ret

asm_test::xor::u16::relaxed:
        amoxor.h          a0, a1, (a0)
        ret

asm_test::xor::u16::release:
        amoxor.h.rl       a0, a1, (a0)
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

asm_test::swap::u8::acqrel:
        amoswap.b.aqrl    a0, a1, (a0)
        ret

asm_test::swap::u8::seqcst:
        amoswap.b.aqrl    a0, a1, (a0)
        ret

asm_test::swap::u8::acquire:
        amoswap.b.aq      a0, a1, (a0)
        ret

asm_test::swap::u8::relaxed:
        amoswap.b         a0, a1, (a0)
        ret

asm_test::swap::u8::release:
        amoswap.b.rl      a0, a1, (a0)
        ret

asm_test::swap::u16::acqrel:
        amoswap.h.aqrl    a0, a1, (a0)
        ret

asm_test::swap::u16::seqcst:
        amoswap.h.aqrl    a0, a1, (a0)
        ret

asm_test::swap::u16::acquire:
        amoswap.h.aq      a0, a1, (a0)
        ret

asm_test::swap::u16::relaxed:
        amoswap.h         a0, a1, (a0)
        ret

asm_test::swap::u16::release:
        amoswap.h.rl      a0, a1, (a0)
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

asm_test::fetch_or::u8::acqrel:
        amoor.b.aqrl      a0, a1, (a0)
        ret

asm_test::fetch_or::u8::seqcst:
        amoor.b.aqrl      a0, a1, (a0)
        ret

asm_test::fetch_or::u8::acquire:
        amoor.b.aq        a0, a1, (a0)
        ret

asm_test::fetch_or::u8::relaxed:
        amoor.b           a0, a1, (a0)
        ret

asm_test::fetch_or::u8::release:
        amoor.b.rl        a0, a1, (a0)
        ret

asm_test::fetch_or::u16::acqrel:
        amoor.h.aqrl      a0, a1, (a0)
        ret

asm_test::fetch_or::u16::seqcst:
        amoor.h.aqrl      a0, a1, (a0)
        ret

asm_test::fetch_or::u16::acquire:
        amoor.h.aq        a0, a1, (a0)
        ret

asm_test::fetch_or::u16::relaxed:
        amoor.h           a0, a1, (a0)
        ret

asm_test::fetch_or::u16::release:
        amoor.h.rl        a0, a1, (a0)
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

asm_test::fetch_add::u8::acqrel:
        amoadd.b.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_add::u8::seqcst:
        amoadd.b.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_add::u8::acquire:
        amoadd.b.aq       a0, a1, (a0)
        ret

asm_test::fetch_add::u8::relaxed:
        amoadd.b          a0, a1, (a0)
        ret

asm_test::fetch_add::u8::release:
        amoadd.b.rl       a0, a1, (a0)
        ret

asm_test::fetch_add::u16::acqrel:
        amoadd.h.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_add::u16::seqcst:
        amoadd.h.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_add::u16::acquire:
        amoadd.h.aq       a0, a1, (a0)
        ret

asm_test::fetch_add::u16::relaxed:
        amoadd.h          a0, a1, (a0)
        ret

asm_test::fetch_add::u16::release:
        amoadd.h.rl       a0, a1, (a0)
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
        amoand.b.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_and::u8::seqcst:
        amoand.b.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_and::u8::acquire:
        amoand.b.aq       a0, a1, (a0)
        ret

asm_test::fetch_and::u8::relaxed:
        amoand.b          a0, a1, (a0)
        ret

asm_test::fetch_and::u8::release:
        amoand.b.rl       a0, a1, (a0)
        ret

asm_test::fetch_and::u16::acqrel:
        amoand.h.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_and::u16::seqcst:
        amoand.h.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_and::u16::acquire:
        amoand.h.aq       a0, a1, (a0)
        ret

asm_test::fetch_and::u16::relaxed:
        amoand.h          a0, a1, (a0)
        ret

asm_test::fetch_and::u16::release:
        amoand.h.rl       a0, a1, (a0)
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

asm_test::fetch_max::i8::acqrel:
        amomax.b.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_max::i8::seqcst:
        amomax.b.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_max::i8::acquire:
        amomax.b.aq       a0, a1, (a0)
        ret

asm_test::fetch_max::i8::relaxed:
        amomax.b          a0, a1, (a0)
        ret

asm_test::fetch_max::i8::release:
        amomax.b.rl       a0, a1, (a0)
        ret

asm_test::fetch_max::i16::acqrel:
        amomax.h.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_max::i16::seqcst:
        amomax.h.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_max::i16::acquire:
        amomax.h.aq       a0, a1, (a0)
        ret

asm_test::fetch_max::i16::relaxed:
        amomax.h          a0, a1, (a0)
        ret

asm_test::fetch_max::i16::release:
        amomax.h.rl       a0, a1, (a0)
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
        amomin.b.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_min::i8::seqcst:
        amomin.b.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_min::i8::acquire:
        amomin.b.aq       a0, a1, (a0)
        ret

asm_test::fetch_min::i8::relaxed:
        amomin.b          a0, a1, (a0)
        ret

asm_test::fetch_min::i8::release:
        amomin.b.rl       a0, a1, (a0)
        ret

asm_test::fetch_min::i16::acqrel:
        amomin.h.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_min::i16::seqcst:
        amomin.h.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_min::i16::acquire:
        amomin.h.aq       a0, a1, (a0)
        ret

asm_test::fetch_min::i16::relaxed:
        amomin.h          a0, a1, (a0)
        ret

asm_test::fetch_min::i16::release:
        amomin.h.rl       a0, a1, (a0)
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
        negw              a3, a1
        sb                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u8::seqcst:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        negw              a3, a1
        sb                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u8::acquire:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        negw              a3, a1
        sb                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u8::relaxed:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        negw              a3, a1
        sb                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u8::release:
        csrrci            a2, mstatus, 0x8
        lbu               a1, 0x0(a0)
        negw              a3, a1
        sb                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u16::acqrel:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        negw              a3, a1
        sh                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u16::seqcst:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        negw              a3, a1
        sh                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u16::acquire:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        negw              a3, a1
        sh                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u16::relaxed:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        negw              a3, a1
        sh                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u16::release:
        csrrci            a2, mstatus, 0x8
        lh                a1, 0x0(a0)
        negw              a3, a1
        sh                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u32::acqrel:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        negw              a3, a1
        sw                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u32::seqcst:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        negw              a3, a1
        sw                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u32::acquire:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        negw              a3, a1
        sw                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u32::relaxed:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        negw              a3, a1
        sw                a3, 0x0(a0)
        csrw              mstatus, a2
        mv                a0, a1
        ret

asm_test::fetch_neg::u32::release:
        csrrci            a2, mstatus, 0x8
        lw                a1, 0x0(a0)
        negw              a3, a1
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
        li                a1, -0x1
        amoxor.b.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_not::u8::seqcst:
        li                a1, -0x1
        amoxor.b.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_not::u8::acquire:
        li                a1, -0x1
        amoxor.b.aq       a0, a1, (a0)
        ret

asm_test::fetch_not::u8::relaxed:
        li                a1, -0x1
        amoxor.b          a0, a1, (a0)
        ret

asm_test::fetch_not::u8::release:
        li                a1, -0x1
        amoxor.b.rl       a0, a1, (a0)
        ret

asm_test::fetch_not::u16::acqrel:
        li                a1, -0x1
        amoxor.h.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_not::u16::seqcst:
        li                a1, -0x1
        amoxor.h.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_not::u16::acquire:
        li                a1, -0x1
        amoxor.h.aq       a0, a1, (a0)
        ret

asm_test::fetch_not::u16::relaxed:
        li                a1, -0x1
        amoxor.h          a0, a1, (a0)
        ret

asm_test::fetch_not::u16::release:
        li                a1, -0x1
        amoxor.h.rl       a0, a1, (a0)
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

asm_test::fetch_sub::u8::acqrel:
        neg               a1, a1
        amoadd.b.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_sub::u8::seqcst:
        neg               a1, a1
        amoadd.b.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_sub::u8::acquire:
        neg               a1, a1
        amoadd.b.aq       a0, a1, (a0)
        ret

asm_test::fetch_sub::u8::relaxed:
        neg               a1, a1
        amoadd.b          a0, a1, (a0)
        ret

asm_test::fetch_sub::u8::release:
        neg               a1, a1
        amoadd.b.rl       a0, a1, (a0)
        ret

asm_test::fetch_sub::u16::acqrel:
        neg               a1, a1
        amoadd.h.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_sub::u16::seqcst:
        neg               a1, a1
        amoadd.h.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_sub::u16::acquire:
        neg               a1, a1
        amoadd.h.aq       a0, a1, (a0)
        ret

asm_test::fetch_sub::u16::relaxed:
        neg               a1, a1
        amoadd.h          a0, a1, (a0)
        ret

asm_test::fetch_sub::u16::release:
        neg               a1, a1
        amoadd.h.rl       a0, a1, (a0)
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
        amoxor.b.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_xor::u8::seqcst:
        amoxor.b.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_xor::u8::acquire:
        amoxor.b.aq       a0, a1, (a0)
        ret

asm_test::fetch_xor::u8::relaxed:
        amoxor.b          a0, a1, (a0)
        ret

asm_test::fetch_xor::u8::release:
        amoxor.b.rl       a0, a1, (a0)
        ret

asm_test::fetch_xor::u16::acqrel:
        amoxor.h.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_xor::u16::seqcst:
        amoxor.h.aqrl     a0, a1, (a0)
        ret

asm_test::fetch_xor::u16::acquire:
        amoxor.h.aq       a0, a1, (a0)
        ret

asm_test::fetch_xor::u16::relaxed:
        amoxor.h          a0, a1, (a0)
        ret

asm_test::fetch_xor::u16::release:
        amoxor.h.rl       a0, a1, (a0)
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


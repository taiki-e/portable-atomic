asm_test::fence::acqrel:
        dmb               ish
        ret

asm_test::fence::seqcst:
        dmb               ish
        ret

asm_test::fence::acquire:
        dmb               ishld
        ret

asm_test::fence::release:
        dmb               ish
        ret

asm_test::bit_toggle::u8::acqrel:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        and               x9, x1, #0x7
        lsl               w19, w8, w9
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_toggle::u8::seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        and               x9, x1, #0x7
        lsl               w19, w8, w9
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_toggle::u8::acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        and               x9, x1, #0x7
        lsl               w19, w8, w9
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_toggle::u8::relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        and               x9, x1, #0x7
        lsl               w19, w8, w9
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_toggle::u8::release:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        and               x9, x1, #0x7
        lsl               w19, w8, w9
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_toggle::u16::acqrel:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        and               x9, x1, #0xf
        lsl               w19, w8, w9
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_toggle::u16::seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        and               x9, x1, #0xf
        lsl               w19, w8, w9
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_toggle::u16::acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        and               x9, x1, #0xf
        lsl               w19, w8, w9
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_toggle::u16::relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        and               x9, x1, #0xf
        lsl               w19, w8, w9
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_toggle::u16::release:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        and               x9, x1, #0xf
        lsl               w19, w8, w9
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_toggle::u32::acqrel:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        lsl               w19, w8, w1
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_toggle::u32::seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        lsl               w19, w8, w1
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_toggle::u32::acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        lsl               w19, w8, w1
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_toggle::u32::relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        lsl               w19, w8, w1
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_toggle::u32::release:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        lsl               w19, w8, w1
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_toggle::u64::acqrel:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        lsl               x19, x8, x1
        mov               x1, x0
        mov               x0, x19
0:
        bl                0f
        tst               x0, x19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_toggle::u64::seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        lsl               x19, x8, x1
        mov               x1, x0
        mov               x0, x19
0:
        bl                0f
        tst               x0, x19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_toggle::u64::acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        lsl               x19, x8, x1
        mov               x1, x0
        mov               x0, x19
0:
        bl                0f
        tst               x0, x19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_toggle::u64::relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        lsl               x19, x8, x1
        mov               x1, x0
        mov               x0, x19
0:
        bl                0f
        tst               x0, x19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_toggle::u64::release:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        lsl               x19, x8, x1
        mov               x1, x0
        mov               x0, x19
0:
        bl                0f
        tst               x0, x19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_toggle::u128::acqrel:
        mov               w8, #0x1                // =1
        and               w9, w1, #0x7f
        lsl               x8, x8, x9
        tst               x9, #0x40
        csel              x9, xzr, x8, ne
        csel              x8, x8, xzr, ne
0:
        ldaxp             x10, x11, [x0]
        eor               x12, x10, x9
        eor               x13, x11, x8
        stlxp             w14, x12, x13, [x0]
        cbnz              w14, 0b
        and               x8, x11, x8
        and               x9, x10, x9
        orr               x8, x9, x8
        cmp               x8, #0x0
        cset              w0, ne
        ret

asm_test::bit_toggle::u128::seqcst:
        mov               w8, #0x1                // =1
        and               w9, w1, #0x7f
        lsl               x8, x8, x9
        tst               x9, #0x40
        csel              x9, xzr, x8, ne
        csel              x8, x8, xzr, ne
0:
        ldaxp             x10, x11, [x0]
        eor               x12, x10, x9
        eor               x13, x11, x8
        stlxp             w14, x12, x13, [x0]
        cbnz              w14, 0b
        and               x8, x11, x8
        and               x9, x10, x9
        orr               x8, x9, x8
        cmp               x8, #0x0
        cset              w0, ne
        ret

asm_test::bit_toggle::u128::acquire:
        mov               w8, #0x1                // =1
        and               w9, w1, #0x7f
        lsl               x8, x8, x9
        tst               x9, #0x40
        csel              x9, xzr, x8, ne
        csel              x8, x8, xzr, ne
0:
        ldaxp             x10, x11, [x0]
        eor               x12, x10, x9
        eor               x13, x11, x8
        stxp              w14, x12, x13, [x0]
        cbnz              w14, 0b
        and               x8, x11, x8
        and               x9, x10, x9
        orr               x8, x9, x8
        cmp               x8, #0x0
        cset              w0, ne
        ret

asm_test::bit_toggle::u128::relaxed:
        mov               w8, #0x1                // =1
        and               w9, w1, #0x7f
        lsl               x8, x8, x9
        tst               x9, #0x40
        csel              x9, xzr, x8, ne
        csel              x8, x8, xzr, ne
0:
        ldxp              x10, x11, [x0]
        eor               x12, x10, x9
        eor               x13, x11, x8
        stxp              w14, x12, x13, [x0]
        cbnz              w14, 0b
        and               x8, x11, x8
        and               x9, x10, x9
        orr               x8, x9, x8
        cmp               x8, #0x0
        cset              w0, ne
        ret

asm_test::bit_toggle::u128::release:
        mov               w8, #0x1                // =1
        and               w9, w1, #0x7f
        lsl               x8, x8, x9
        tst               x9, #0x40
        csel              x9, xzr, x8, ne
        csel              x8, x8, xzr, ne
0:
        ldxp              x10, x11, [x0]
        eor               x12, x10, x9
        eor               x13, x11, x8
        stlxp             w14, x12, x13, [x0]
        cbnz              w14, 0b
        and               x8, x11, x8
        and               x9, x10, x9
        orr               x8, x9, x8
        cmp               x8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_nand::u8::acqrel_all:
0:
        ldaxrb            w8, [x0]
        mvn               w9, w8
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u8::seqcst_all:
0:
        ldaxrb            w8, [x0]
        mvn               w9, w8
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u8::acqrel_zero:
        mov               w9, #0xff               // =255
0:
        ldaxrb            w8, [x0]
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u8::acquire_all:
0:
        ldaxrb            w8, [x0]
        mvn               w9, w8
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u8::relaxed_all:
0:
        ldxrb             w8, [x0]
        mvn               w9, w8
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u8::release_all:
0:
        ldxrb             w8, [x0]
        mvn               w9, w8
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u8::seqcst_zero:
        mov               w9, #0xff               // =255
0:
        ldaxrb            w8, [x0]
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u8::acquire_zero:
        mov               w9, #0xff               // =255
0:
        ldaxrb            w8, [x0]
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u8::relaxed_zero:
        mov               w9, #0xff               // =255
0:
        ldxrb             w8, [x0]
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u8::release_zero:
        mov               w9, #0xff               // =255
0:
        ldxrb             w8, [x0]
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u8::acqrel:
0:
        ldaxrb            w8, [x0]
        and               w9, w8, w1
        mvn               w9, w9
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u8::seqcst:
0:
        ldaxrb            w8, [x0]
        and               w9, w8, w1
        mvn               w9, w9
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u8::acquire:
0:
        ldaxrb            w8, [x0]
        and               w9, w8, w1
        mvn               w9, w9
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u8::relaxed:
0:
        ldxrb             w8, [x0]
        and               w9, w8, w1
        mvn               w9, w9
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u8::release:
0:
        ldxrb             w8, [x0]
        and               w9, w8, w1
        mvn               w9, w9
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u16::acqrel_all:
0:
        ldaxrh            w8, [x0]
        mvn               w9, w8
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u16::seqcst_all:
0:
        ldaxrh            w8, [x0]
        mvn               w9, w8
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u16::acqrel_zero:
        mov               w9, #0xffff             // =65535
0:
        ldaxrh            w8, [x0]
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u16::acquire_all:
0:
        ldaxrh            w8, [x0]
        mvn               w9, w8
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u16::relaxed_all:
0:
        ldxrh             w8, [x0]
        mvn               w9, w8
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u16::release_all:
0:
        ldxrh             w8, [x0]
        mvn               w9, w8
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u16::seqcst_zero:
        mov               w9, #0xffff             // =65535
0:
        ldaxrh            w8, [x0]
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u16::acquire_zero:
        mov               w9, #0xffff             // =65535
0:
        ldaxrh            w8, [x0]
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u16::relaxed_zero:
        mov               w9, #0xffff             // =65535
0:
        ldxrh             w8, [x0]
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u16::release_zero:
        mov               w9, #0xffff             // =65535
0:
        ldxrh             w8, [x0]
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u16::acqrel:
0:
        ldaxrh            w8, [x0]
        and               w9, w8, w1
        mvn               w9, w9
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u16::seqcst:
0:
        ldaxrh            w8, [x0]
        and               w9, w8, w1
        mvn               w9, w9
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u16::acquire:
0:
        ldaxrh            w8, [x0]
        and               w9, w8, w1
        mvn               w9, w9
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u16::relaxed:
0:
        ldxrh             w8, [x0]
        and               w9, w8, w1
        mvn               w9, w9
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u16::release:
0:
        ldxrh             w8, [x0]
        and               w9, w8, w1
        mvn               w9, w9
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u32::acqrel_all:
0:
        ldaxr             w8, [x0]
        mvn               w9, w8
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u32::seqcst_all:
0:
        ldaxr             w8, [x0]
        mvn               w9, w8
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u32::acqrel_zero:
        mov               w9, #-0x1               // =-1
0:
        ldaxr             w8, [x0]
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u32::acquire_all:
0:
        ldaxr             w8, [x0]
        mvn               w9, w8
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u32::relaxed_all:
0:
        ldxr              w8, [x0]
        mvn               w9, w8
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u32::release_all:
0:
        ldxr              w8, [x0]
        mvn               w9, w8
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u32::seqcst_zero:
        mov               w9, #-0x1               // =-1
0:
        ldaxr             w8, [x0]
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u32::acquire_zero:
        mov               w9, #-0x1               // =-1
0:
        ldaxr             w8, [x0]
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u32::relaxed_zero:
        mov               w9, #-0x1               // =-1
0:
        ldxr              w8, [x0]
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u32::release_zero:
        mov               w9, #-0x1               // =-1
0:
        ldxr              w8, [x0]
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u32::acqrel:
0:
        ldaxr             w8, [x0]
        and               w9, w8, w1
        mvn               w9, w9
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u32::seqcst:
0:
        ldaxr             w8, [x0]
        and               w9, w8, w1
        mvn               w9, w9
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u32::acquire:
0:
        ldaxr             w8, [x0]
        and               w9, w8, w1
        mvn               w9, w9
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u32::relaxed:
0:
        ldxr              w8, [x0]
        and               w9, w8, w1
        mvn               w9, w9
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u32::release:
0:
        ldxr              w8, [x0]
        and               w9, w8, w1
        mvn               w9, w9
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u64::acqrel_all:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        mvn               x9, x0
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_nand::u64::seqcst_all:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        mvn               x9, x0
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_nand::u64::acqrel_zero:
        mov               x9, #-0x1               // =-1
0:
        ldaxr             x8, [x0]
        stlxr             w10, x9, [x0]
        cbnz              w10, 0b
        mov               x0, x8
        ret

asm_test::fetch_nand::u64::acquire_all:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        mvn               x9, x0
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_nand::u64::relaxed_all:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        mvn               x9, x0
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_nand::u64::release_all:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        mvn               x9, x0
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_nand::u64::seqcst_zero:
        mov               x9, #-0x1               // =-1
0:
        ldaxr             x8, [x0]
        stlxr             w10, x9, [x0]
        cbnz              w10, 0b
        mov               x0, x8
        ret

asm_test::fetch_nand::u64::acquire_zero:
        mov               x9, #-0x1               // =-1
0:
        ldaxr             x8, [x0]
        stxr              w10, x9, [x0]
        cbnz              w10, 0b
        mov               x0, x8
        ret

asm_test::fetch_nand::u64::relaxed_zero:
        mov               x9, #-0x1               // =-1
0:
        ldxr              x8, [x0]
        stxr              w10, x9, [x0]
        cbnz              w10, 0b
        mov               x0, x8
        ret

asm_test::fetch_nand::u64::release_zero:
        mov               x9, #-0x1               // =-1
0:
        ldxr              x8, [x0]
        stlxr             w10, x9, [x0]
        cbnz              w10, 0b
        mov               x0, x8
        ret

asm_test::fetch_nand::u64::acqrel:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        and               x9, x0, x1
        mvn               x9, x9
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_nand::u64::seqcst:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        and               x9, x0, x1
        mvn               x9, x9
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_nand::u64::acquire:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        and               x9, x0, x1
        mvn               x9, x9
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_nand::u64::relaxed:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        and               x9, x0, x1
        mvn               x9, x9
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_nand::u64::release:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        and               x9, x0, x1
        mvn               x9, x9
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_nand::bool::acqrel_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_nand::bool::seqcst_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_nand::bool::acqrel_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_nand::bool::acquire_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_nand::bool::relaxed_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_nand::bool::release_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_nand::bool::seqcst_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_nand::bool::acquire_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_nand::bool::relaxed_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_nand::bool::release_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_nand::bool::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, #0x1                // =1
        tbz               w1, #0x0, 1f
        mov               x1, x8
0:
        bl                0f
        and               w0, w0, #0x1
        ldp               x29, x30, [sp], #0x10
        ret
1:
        mov               x1, x8
2:
        bl                2f
        and               w0, w0, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_nand::bool::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, #0x1                // =1
        tbz               w1, #0x0, 1f
        mov               x1, x8
0:
        bl                0f
        and               w0, w0, #0x1
        ldp               x29, x30, [sp], #0x10
        ret
1:
        mov               x1, x8
2:
        bl                2f
        and               w0, w0, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_nand::bool::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, #0x1                // =1
        tbz               w1, #0x0, 1f
        mov               x1, x8
0:
        bl                0f
        and               w0, w0, #0x1
        ldp               x29, x30, [sp], #0x10
        ret
1:
        mov               x1, x8
2:
        bl                2f
        and               w0, w0, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_nand::bool::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, #0x1                // =1
        tbz               w1, #0x0, 1f
        mov               x1, x8
0:
        bl                0f
        and               w0, w0, #0x1
        ldp               x29, x30, [sp], #0x10
        ret
1:
        mov               x1, x8
2:
        bl                2f
        and               w0, w0, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_nand::bool::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, #0x1                // =1
        tbz               w1, #0x0, 1f
        mov               x1, x8
0:
        bl                0f
        and               w0, w0, #0x1
        ldp               x29, x30, [sp], #0x10
        ret
1:
        mov               x1, x8
2:
        bl                2f
        and               w0, w0, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_nand::u128::acqrel_all:
        mov               x9, #-0x1               // =-1
0:
        ldaxp             x8, x1, [x0]
        and               x10, x8, x9
        and               x11, x1, x9
        mvn               x10, x10
        mvn               x11, x11
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_nand::u128::seqcst_all:
        mov               x9, #-0x1               // =-1
0:
        ldaxp             x8, x1, [x0]
        and               x10, x8, x9
        and               x11, x1, x9
        mvn               x10, x10
        mvn               x11, x11
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_nand::u128::acqrel_zero:
        mov               x9, xzr
0:
        ldaxp             x8, x1, [x0]
        and               x10, x8, x9
        and               x11, x1, x9
        mvn               x10, x10
        mvn               x11, x11
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_nand::u128::acquire_all:
        mov               x9, #-0x1               // =-1
0:
        ldaxp             x8, x1, [x0]
        and               x10, x8, x9
        and               x11, x1, x9
        mvn               x10, x10
        mvn               x11, x11
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_nand::u128::relaxed_all:
        mov               x9, #-0x1               // =-1
0:
        ldxp              x8, x1, [x0]
        and               x10, x8, x9
        and               x11, x1, x9
        mvn               x10, x10
        mvn               x11, x11
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_nand::u128::release_all:
        mov               x9, #-0x1               // =-1
0:
        ldxp              x8, x1, [x0]
        and               x10, x8, x9
        and               x11, x1, x9
        mvn               x10, x10
        mvn               x11, x11
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_nand::u128::seqcst_zero:
        mov               x9, xzr
0:
        ldaxp             x8, x1, [x0]
        and               x10, x8, x9
        and               x11, x1, x9
        mvn               x10, x10
        mvn               x11, x11
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_nand::u128::acquire_zero:
        mov               x9, xzr
0:
        ldaxp             x8, x1, [x0]
        and               x10, x8, x9
        and               x11, x1, x9
        mvn               x10, x10
        mvn               x11, x11
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_nand::u128::relaxed_zero:
        mov               x9, xzr
0:
        ldxp              x8, x1, [x0]
        and               x10, x8, x9
        and               x11, x1, x9
        mvn               x10, x10
        mvn               x11, x11
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_nand::u128::release_zero:
        mov               x9, xzr
0:
        ldxp              x8, x1, [x0]
        and               x10, x8, x9
        and               x11, x1, x9
        mvn               x10, x10
        mvn               x11, x11
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_nand::u128::acqrel:
0:
        ldaxp             x8, x1, [x0]
        and               x9, x8, x2
        and               x10, x1, x3
        mvn               x9, x9
        mvn               x10, x10
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_nand::u128::seqcst:
0:
        ldaxp             x8, x1, [x0]
        and               x9, x8, x2
        and               x10, x1, x3
        mvn               x9, x9
        mvn               x10, x10
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_nand::u128::acquire:
0:
        ldaxp             x8, x1, [x0]
        and               x9, x8, x2
        and               x10, x1, x3
        mvn               x9, x9
        mvn               x10, x10
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_nand::u128::relaxed:
0:
        ldxp              x8, x1, [x0]
        and               x9, x8, x2
        and               x10, x1, x3
        mvn               x9, x9
        mvn               x10, x10
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_nand::u128::release:
0:
        ldxp              x8, x1, [x0]
        and               x9, x8, x2
        and               x10, x1, x3
        mvn               x9, x9
        mvn               x10, x10
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_umax::u8::acqrel:
        and               w9, w1, #0xff
0:
        ldaxrb            w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, hi
        stlxrb            w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

asm_test::fetch_umax::u8::seqcst:
        and               w9, w1, #0xff
0:
        ldaxrb            w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, hi
        stlxrb            w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

asm_test::fetch_umax::u8::acquire:
        and               w9, w1, #0xff
0:
        ldaxrb            w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, hi
        stxrb             w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

asm_test::fetch_umax::u8::relaxed:
        and               w9, w1, #0xff
0:
        ldxrb             w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, hi
        stxrb             w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

asm_test::fetch_umax::u8::release:
        and               w9, w1, #0xff
0:
        ldxrb             w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, hi
        stlxrb            w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

asm_test::fetch_umax::u16::acqrel:
        and               w9, w1, #0xffff
0:
        ldaxrh            w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, hi
        stlxrh            w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

asm_test::fetch_umax::u16::seqcst:
        and               w9, w1, #0xffff
0:
        ldaxrh            w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, hi
        stlxrh            w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

asm_test::fetch_umax::u16::acquire:
        and               w9, w1, #0xffff
0:
        ldaxrh            w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, hi
        stxrh             w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

asm_test::fetch_umax::u16::relaxed:
        and               w9, w1, #0xffff
0:
        ldxrh             w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, hi
        stxrh             w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

asm_test::fetch_umax::u16::release:
        and               w9, w1, #0xffff
0:
        ldxrh             w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, hi
        stlxrh            w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

asm_test::fetch_umax::u32::acqrel:
0:
        ldaxr             w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, hi
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_umax::u32::seqcst:
0:
        ldaxr             w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, hi
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_umax::u32::acquire:
0:
        ldaxr             w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, hi
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_umax::u32::relaxed:
0:
        ldxr              w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, hi
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_umax::u32::release:
0:
        ldxr              w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, hi
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_umax::u64::acqrel:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, hi
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_umax::u64::seqcst:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, hi
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_umax::u64::acquire:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, hi
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_umax::u64::relaxed:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, hi
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_umax::u64::release:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, hi
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_umax::u128::acqrel:
0:
        ldaxp             x8, x1, [x0]
        cmp               x2, x8
        sbcs              xzr, x3, x1
        csel              x10, x1, x3, lo
        csel              x9, x8, x2, lo
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_umax::u128::seqcst:
0:
        ldaxp             x8, x1, [x0]
        cmp               x2, x8
        sbcs              xzr, x3, x1
        csel              x10, x1, x3, lo
        csel              x9, x8, x2, lo
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_umax::u128::acquire:
0:
        ldaxp             x8, x1, [x0]
        cmp               x2, x8
        sbcs              xzr, x3, x1
        csel              x10, x1, x3, lo
        csel              x9, x8, x2, lo
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_umax::u128::relaxed:
0:
        ldxp              x8, x1, [x0]
        cmp               x2, x8
        sbcs              xzr, x3, x1
        csel              x10, x1, x3, lo
        csel              x9, x8, x2, lo
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_umax::u128::release:
0:
        ldxp              x8, x1, [x0]
        cmp               x2, x8
        sbcs              xzr, x3, x1
        csel              x10, x1, x3, lo
        csel              x9, x8, x2, lo
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_umin::u8::acqrel:
        and               w9, w1, #0xff
0:
        ldaxrb            w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, ls
        stlxrb            w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

asm_test::fetch_umin::u8::seqcst:
        and               w9, w1, #0xff
0:
        ldaxrb            w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, ls
        stlxrb            w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

asm_test::fetch_umin::u8::acquire:
        and               w9, w1, #0xff
0:
        ldaxrb            w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, ls
        stxrb             w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

asm_test::fetch_umin::u8::relaxed:
        and               w9, w1, #0xff
0:
        ldxrb             w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, ls
        stxrb             w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

asm_test::fetch_umin::u8::release:
        and               w9, w1, #0xff
0:
        ldxrb             w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, ls
        stlxrb            w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

asm_test::fetch_umin::u16::acqrel:
        and               w9, w1, #0xffff
0:
        ldaxrh            w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, ls
        stlxrh            w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

asm_test::fetch_umin::u16::seqcst:
        and               w9, w1, #0xffff
0:
        ldaxrh            w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, ls
        stlxrh            w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

asm_test::fetch_umin::u16::acquire:
        and               w9, w1, #0xffff
0:
        ldaxrh            w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, ls
        stxrh             w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

asm_test::fetch_umin::u16::relaxed:
        and               w9, w1, #0xffff
0:
        ldxrh             w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, ls
        stxrh             w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

asm_test::fetch_umin::u16::release:
        and               w9, w1, #0xffff
0:
        ldxrh             w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, ls
        stlxrh            w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

asm_test::fetch_umin::u32::acqrel:
0:
        ldaxr             w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, ls
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_umin::u32::seqcst:
0:
        ldaxr             w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, ls
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_umin::u32::acquire:
0:
        ldaxr             w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, ls
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_umin::u32::relaxed:
0:
        ldxr              w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, ls
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_umin::u32::release:
0:
        ldxr              w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, ls
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_umin::u64::acqrel:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, ls
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_umin::u64::seqcst:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, ls
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_umin::u64::acquire:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, ls
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_umin::u64::relaxed:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, ls
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_umin::u64::release:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, ls
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_umin::u128::acqrel:
0:
        ldaxp             x8, x1, [x0]
        cmp               x2, x8
        sbcs              xzr, x3, x1
        csel              x10, x1, x3, hs
        csel              x9, x8, x2, hs
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_umin::u128::seqcst:
0:
        ldaxp             x8, x1, [x0]
        cmp               x2, x8
        sbcs              xzr, x3, x1
        csel              x10, x1, x3, hs
        csel              x9, x8, x2, hs
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_umin::u128::acquire:
0:
        ldaxp             x8, x1, [x0]
        cmp               x2, x8
        sbcs              xzr, x3, x1
        csel              x10, x1, x3, hs
        csel              x9, x8, x2, hs
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_umin::u128::relaxed:
0:
        ldxp              x8, x1, [x0]
        cmp               x2, x8
        sbcs              xzr, x3, x1
        csel              x10, x1, x3, hs
        csel              x9, x8, x2, hs
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_umin::u128::release:
0:
        ldxp              x8, x1, [x0]
        cmp               x2, x8
        sbcs              xzr, x3, x1
        csel              x10, x1, x3, hs
        csel              x9, x8, x2, hs
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::compare_exchange::u8::acqrel_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxtb
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u8::seqcst_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxtb
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u8::acqrel_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxtb
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u8::acqrel_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxtb
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u8::acquire_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxtb
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u8::relaxed_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxtb
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u8::release_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxtb
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u8::seqcst_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxtb
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u8::seqcst_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxtb
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u8::acquire_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxtb
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u8::acquire_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxtb
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u8::relaxed_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxtb
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u8::relaxed_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxtb
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u8::release_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxtb
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u8::release_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxtb
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::f32::acqrel_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              w19, s0
        fmov              w1, s1
        mov               x2, x0
        mov               w0, w19
0:
        bl                0f
        cmp               w0, w19
        fmov              s0, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::f32::seqcst_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              w19, s0
        fmov              w1, s1
        mov               x2, x0
        mov               w0, w19
0:
        bl                0f
        cmp               w0, w19
        fmov              s0, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::f32::acqrel_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              w19, s0
        fmov              w1, s1
        mov               x2, x0
        mov               w0, w19
0:
        bl                0f
        cmp               w0, w19
        fmov              s0, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::f32::acqrel_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              w19, s0
        fmov              w1, s1
        mov               x2, x0
        mov               w0, w19
0:
        bl                0f
        cmp               w0, w19
        fmov              s0, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::f32::acquire_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              w19, s0
        fmov              w1, s1
        mov               x2, x0
        mov               w0, w19
0:
        bl                0f
        cmp               w0, w19
        fmov              s0, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::f32::relaxed_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              w19, s0
        fmov              w1, s1
        mov               x2, x0
        mov               w0, w19
0:
        bl                0f
        cmp               w0, w19
        fmov              s0, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::f32::release_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              w19, s0
        fmov              w1, s1
        mov               x2, x0
        mov               w0, w19
0:
        bl                0f
        cmp               w0, w19
        fmov              s0, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::f32::seqcst_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              w19, s0
        fmov              w1, s1
        mov               x2, x0
        mov               w0, w19
0:
        bl                0f
        cmp               w0, w19
        fmov              s0, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::f32::seqcst_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              w19, s0
        fmov              w1, s1
        mov               x2, x0
        mov               w0, w19
0:
        bl                0f
        cmp               w0, w19
        fmov              s0, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::f32::acquire_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              w19, s0
        fmov              w1, s1
        mov               x2, x0
        mov               w0, w19
0:
        bl                0f
        cmp               w0, w19
        fmov              s0, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::f32::acquire_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              w19, s0
        fmov              w1, s1
        mov               x2, x0
        mov               w0, w19
0:
        bl                0f
        cmp               w0, w19
        fmov              s0, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::f32::relaxed_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              w19, s0
        fmov              w1, s1
        mov               x2, x0
        mov               w0, w19
0:
        bl                0f
        cmp               w0, w19
        fmov              s0, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::f32::relaxed_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              w19, s0
        fmov              w1, s1
        mov               x2, x0
        mov               w0, w19
0:
        bl                0f
        cmp               w0, w19
        fmov              s0, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::f32::release_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              w19, s0
        fmov              w1, s1
        mov               x2, x0
        mov               w0, w19
0:
        bl                0f
        cmp               w0, w19
        fmov              s0, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::f32::release_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              w19, s0
        fmov              w1, s1
        mov               x2, x0
        mov               w0, w19
0:
        bl                0f
        cmp               w0, w19
        fmov              s0, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::f64::acqrel_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              x19, d0
        fmov              x1, d1
        mov               x2, x0
        mov               x0, x19
0:
        bl                0f
        cmp               x0, x19
        fmov              d0, x0
        cset              w8, eq
        eor               w8, w8, #0x1
        mov               x0, x8
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::f64::seqcst_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              x19, d0
        fmov              x1, d1
        mov               x2, x0
        mov               x0, x19
0:
        bl                0f
        cmp               x0, x19
        fmov              d0, x0
        cset              w8, eq
        eor               w8, w8, #0x1
        mov               x0, x8
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::f64::acqrel_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              x19, d0
        fmov              x1, d1
        mov               x2, x0
        mov               x0, x19
0:
        bl                0f
        cmp               x0, x19
        fmov              d0, x0
        cset              w8, eq
        eor               w8, w8, #0x1
        mov               x0, x8
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::f64::acqrel_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              x19, d0
        fmov              x1, d1
        mov               x2, x0
        mov               x0, x19
0:
        bl                0f
        cmp               x0, x19
        fmov              d0, x0
        cset              w8, eq
        eor               w8, w8, #0x1
        mov               x0, x8
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::f64::acquire_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              x19, d0
        fmov              x1, d1
        mov               x2, x0
        mov               x0, x19
0:
        bl                0f
        cmp               x0, x19
        fmov              d0, x0
        cset              w8, eq
        eor               w8, w8, #0x1
        mov               x0, x8
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::f64::relaxed_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              x19, d0
        fmov              x1, d1
        mov               x2, x0
        mov               x0, x19
0:
        bl                0f
        cmp               x0, x19
        fmov              d0, x0
        cset              w8, eq
        eor               w8, w8, #0x1
        mov               x0, x8
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::f64::release_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              x19, d0
        fmov              x1, d1
        mov               x2, x0
        mov               x0, x19
0:
        bl                0f
        cmp               x0, x19
        fmov              d0, x0
        cset              w8, eq
        eor               w8, w8, #0x1
        mov               x0, x8
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::f64::seqcst_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              x19, d0
        fmov              x1, d1
        mov               x2, x0
        mov               x0, x19
0:
        bl                0f
        cmp               x0, x19
        fmov              d0, x0
        cset              w8, eq
        eor               w8, w8, #0x1
        mov               x0, x8
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::f64::seqcst_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              x19, d0
        fmov              x1, d1
        mov               x2, x0
        mov               x0, x19
0:
        bl                0f
        cmp               x0, x19
        fmov              d0, x0
        cset              w8, eq
        eor               w8, w8, #0x1
        mov               x0, x8
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::f64::acquire_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              x19, d0
        fmov              x1, d1
        mov               x2, x0
        mov               x0, x19
0:
        bl                0f
        cmp               x0, x19
        fmov              d0, x0
        cset              w8, eq
        eor               w8, w8, #0x1
        mov               x0, x8
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::f64::acquire_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              x19, d0
        fmov              x1, d1
        mov               x2, x0
        mov               x0, x19
0:
        bl                0f
        cmp               x0, x19
        fmov              d0, x0
        cset              w8, eq
        eor               w8, w8, #0x1
        mov               x0, x8
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::f64::relaxed_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              x19, d0
        fmov              x1, d1
        mov               x2, x0
        mov               x0, x19
0:
        bl                0f
        cmp               x0, x19
        fmov              d0, x0
        cset              w8, eq
        eor               w8, w8, #0x1
        mov               x0, x8
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::f64::relaxed_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              x19, d0
        fmov              x1, d1
        mov               x2, x0
        mov               x0, x19
0:
        bl                0f
        cmp               x0, x19
        fmov              d0, x0
        cset              w8, eq
        eor               w8, w8, #0x1
        mov               x0, x8
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::f64::release_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              x19, d0
        fmov              x1, d1
        mov               x2, x0
        mov               x0, x19
0:
        bl                0f
        cmp               x0, x19
        fmov              d0, x0
        cset              w8, eq
        eor               w8, w8, #0x1
        mov               x0, x8
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::f64::release_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              x19, d0
        fmov              x1, d1
        mov               x2, x0
        mov               x0, x19
0:
        bl                0f
        cmp               x0, x19
        fmov              d0, x0
        cset              w8, eq
        eor               w8, w8, #0x1
        mov               x0, x8
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u16::acqrel_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxth
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u16::seqcst_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxth
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u16::acqrel_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxth
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u16::acqrel_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxth
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u16::acquire_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxth
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u16::relaxed_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxth
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u16::release_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxth
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u16::seqcst_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxth
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u16::seqcst_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxth
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u16::acquire_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxth
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u16::acquire_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxth
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u16::relaxed_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxth
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u16::relaxed_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxth
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u16::release_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxth
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u16::release_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxth
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u32::acqrel_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u32::seqcst_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u32::acqrel_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u32::acqrel_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u32::acquire_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u32::relaxed_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u32::release_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u32::seqcst_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u32::seqcst_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u32::acquire_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u32::acquire_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u32::relaxed_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u32::relaxed_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u32::release_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u32::release_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u64::acqrel_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               x19, x1
        mov               x0, x1
        mov               x1, x2
        mov               x2, x8
0:
        bl                0f
        cmp               x0, x19
        mov               x1, x0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u64::seqcst_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               x19, x1
        mov               x0, x1
        mov               x1, x2
        mov               x2, x8
0:
        bl                0f
        cmp               x0, x19
        mov               x1, x0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u64::acqrel_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               x19, x1
        mov               x0, x1
        mov               x1, x2
        mov               x2, x8
0:
        bl                0f
        cmp               x0, x19
        mov               x1, x0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u64::acqrel_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               x19, x1
        mov               x0, x1
        mov               x1, x2
        mov               x2, x8
0:
        bl                0f
        cmp               x0, x19
        mov               x1, x0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u64::acquire_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               x19, x1
        mov               x0, x1
        mov               x1, x2
        mov               x2, x8
0:
        bl                0f
        cmp               x0, x19
        mov               x1, x0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u64::relaxed_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               x19, x1
        mov               x0, x1
        mov               x1, x2
        mov               x2, x8
0:
        bl                0f
        cmp               x0, x19
        mov               x1, x0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u64::release_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               x19, x1
        mov               x0, x1
        mov               x1, x2
        mov               x2, x8
0:
        bl                0f
        cmp               x0, x19
        mov               x1, x0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u64::seqcst_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               x19, x1
        mov               x0, x1
        mov               x1, x2
        mov               x2, x8
0:
        bl                0f
        cmp               x0, x19
        mov               x1, x0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u64::seqcst_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               x19, x1
        mov               x0, x1
        mov               x1, x2
        mov               x2, x8
0:
        bl                0f
        cmp               x0, x19
        mov               x1, x0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u64::acquire_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               x19, x1
        mov               x0, x1
        mov               x1, x2
        mov               x2, x8
0:
        bl                0f
        cmp               x0, x19
        mov               x1, x0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u64::acquire_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               x19, x1
        mov               x0, x1
        mov               x1, x2
        mov               x2, x8
0:
        bl                0f
        cmp               x0, x19
        mov               x1, x0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u64::relaxed_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               x19, x1
        mov               x0, x1
        mov               x1, x2
        mov               x2, x8
0:
        bl                0f
        cmp               x0, x19
        mov               x1, x0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u64::relaxed_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               x19, x1
        mov               x0, x1
        mov               x1, x2
        mov               x2, x8
0:
        bl                0f
        cmp               x0, x19
        mov               x1, x0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u64::release_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               x19, x1
        mov               x0, x1
        mov               x1, x2
        mov               x2, x8
0:
        bl                0f
        cmp               x0, x19
        mov               x1, x0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::u64::release_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               x19, x1
        mov               x0, x1
        mov               x1, x2
        mov               x2, x8
0:
        bl                0f
        cmp               x0, x19
        mov               x1, x0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::bool::acqrel_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::bool::seqcst_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::bool::acqrel_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::bool::acqrel_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::bool::acquire_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::bool::relaxed_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::bool::release_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::bool::seqcst_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::bool::seqcst_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::bool::acquire_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::bool::acquire_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::bool::relaxed_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::bool::relaxed_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::bool::release_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::bool::release_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_true_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, #0x1                // =1
        mov               w1, #0x1                // =1
0:
        bl                0f
        cmp               w0, #0x1
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_true_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, #0x1                // =1
        mov               w1, #0x1                // =1
0:
        bl                0f
        cmp               w0, #0x1
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::acqrel_acquire_true_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, #0x1                // =1
        mov               w1, #0x1                // =1
0:
        bl                0f
        cmp               w0, #0x1
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_true_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, #0x1                // =1
        mov               w1, #0x1                // =1
0:
        bl                0f
        cmp               w0, #0x1
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_false_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, wzr
        mov               w1, #0x1                // =1
0:
        bl                0f
        cmp               w0, #0x0
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_true_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, #0x1                // =1
        mov               w1, wzr
0:
        bl                0f
        cmp               w0, #0x1
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::acquire_seqcst_true_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, #0x1                // =1
        mov               w1, #0x1                // =1
0:
        bl                0f
        cmp               w0, #0x1
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_true_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, #0x1                // =1
        mov               w1, #0x1                // =1
0:
        bl                0f
        cmp               w0, #0x1
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::release_seqcst_true_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, #0x1                // =1
        mov               w1, #0x1                // =1
0:
        bl                0f
        cmp               w0, #0x1
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::seqcst_acquire_true_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, #0x1                // =1
        mov               w1, #0x1                // =1
0:
        bl                0f
        cmp               w0, #0x1
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_true_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, #0x1                // =1
        mov               w1, #0x1                // =1
0:
        bl                0f
        cmp               w0, #0x1
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_false_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, wzr
        mov               w1, #0x1                // =1
0:
        bl                0f
        cmp               w0, #0x0
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_true_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, #0x1                // =1
        mov               w1, wzr
0:
        bl                0f
        cmp               w0, #0x1
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::acqrel_acquire_false_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, wzr
        mov               w1, #0x1                // =1
0:
        bl                0f
        cmp               w0, #0x0
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::acqrel_acquire_true_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, #0x1                // =1
        mov               w1, wzr
0:
        bl                0f
        cmp               w0, #0x1
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_false_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, wzr
        mov               w1, #0x1                // =1
0:
        bl                0f
        cmp               w0, #0x0
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_true_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, #0x1                // =1
        mov               w1, wzr
0:
        bl                0f
        cmp               w0, #0x1
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::acqrel_seqcst_false_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, wzr
        mov               w1, wzr
0:
        bl                0f
        cmp               w0, #0x0
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::acquire_acquire_true_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, #0x1                // =1
        mov               w1, #0x1                // =1
0:
        bl                0f
        cmp               w0, #0x1
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::acquire_relaxed_true_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, #0x1                // =1
        mov               w1, #0x1                // =1
0:
        bl                0f
        cmp               w0, #0x1
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::acquire_seqcst_false_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, wzr
        mov               w1, #0x1                // =1
0:
        bl                0f
        cmp               w0, #0x0
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::acquire_seqcst_true_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, #0x1                // =1
        mov               w1, wzr
0:
        bl                0f
        cmp               w0, #0x1
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::relaxed_acquire_true_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, #0x1                // =1
        mov               w1, #0x1                // =1
0:
        bl                0f
        cmp               w0, #0x1
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_true_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, #0x1                // =1
        mov               w1, #0x1                // =1
0:
        bl                0f
        cmp               w0, #0x1
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_false_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, wzr
        mov               w1, #0x1                // =1
0:
        bl                0f
        cmp               w0, #0x0
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_true_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, #0x1                // =1
        mov               w1, wzr
0:
        bl                0f
        cmp               w0, #0x1
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::release_acquire_true_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, #0x1                // =1
        mov               w1, #0x1                // =1
0:
        bl                0f
        cmp               w0, #0x1
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::release_relaxed_true_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, #0x1                // =1
        mov               w1, #0x1                // =1
0:
        bl                0f
        cmp               w0, #0x1
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::release_seqcst_false_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, wzr
        mov               w1, #0x1                // =1
0:
        bl                0f
        cmp               w0, #0x0
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::release_seqcst_true_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, #0x1                // =1
        mov               w1, wzr
0:
        bl                0f
        cmp               w0, #0x1
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::seqcst_acquire_false_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, wzr
        mov               w1, #0x1                // =1
0:
        bl                0f
        cmp               w0, #0x0
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::seqcst_acquire_true_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, #0x1                // =1
        mov               w1, wzr
0:
        bl                0f
        cmp               w0, #0x1
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_false_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, wzr
        mov               w1, #0x1                // =1
0:
        bl                0f
        cmp               w0, #0x0
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_true_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, #0x1                // =1
        mov               w1, wzr
0:
        bl                0f
        cmp               w0, #0x1
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::seqcst_seqcst_false_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, wzr
        mov               w1, wzr
0:
        bl                0f
        cmp               w0, #0x0
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::acqrel_acquire_false_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, wzr
        mov               w1, wzr
0:
        bl                0f
        cmp               w0, #0x0
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::acqrel_relaxed_false_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, wzr
        mov               w1, wzr
0:
        bl                0f
        cmp               w0, #0x0
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::acquire_acquire_false_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, wzr
        mov               w1, #0x1                // =1
0:
        bl                0f
        cmp               w0, #0x0
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::acquire_acquire_true_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, #0x1                // =1
        mov               w1, wzr
0:
        bl                0f
        cmp               w0, #0x1
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::acquire_relaxed_false_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, wzr
        mov               w1, #0x1                // =1
0:
        bl                0f
        cmp               w0, #0x0
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::acquire_relaxed_true_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, #0x1                // =1
        mov               w1, wzr
0:
        bl                0f
        cmp               w0, #0x1
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::acquire_seqcst_false_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, wzr
        mov               w1, wzr
0:
        bl                0f
        cmp               w0, #0x0
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::relaxed_acquire_false_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, wzr
        mov               w1, #0x1                // =1
0:
        bl                0f
        cmp               w0, #0x0
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::relaxed_acquire_true_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, #0x1                // =1
        mov               w1, wzr
0:
        bl                0f
        cmp               w0, #0x1
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_false_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, wzr
        mov               w1, #0x1                // =1
0:
        bl                0f
        cmp               w0, #0x0
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_true_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, #0x1                // =1
        mov               w1, wzr
0:
        bl                0f
        cmp               w0, #0x1
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::relaxed_seqcst_false_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, wzr
        mov               w1, wzr
0:
        bl                0f
        cmp               w0, #0x0
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::release_acquire_false_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, wzr
        mov               w1, #0x1                // =1
0:
        bl                0f
        cmp               w0, #0x0
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::release_acquire_true_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, #0x1                // =1
        mov               w1, wzr
0:
        bl                0f
        cmp               w0, #0x1
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::release_relaxed_false_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, wzr
        mov               w1, #0x1                // =1
0:
        bl                0f
        cmp               w0, #0x0
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::release_relaxed_true_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, #0x1                // =1
        mov               w1, wzr
0:
        bl                0f
        cmp               w0, #0x1
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::release_seqcst_false_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, wzr
        mov               w1, wzr
0:
        bl                0f
        cmp               w0, #0x0
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::seqcst_acquire_false_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, wzr
        mov               w1, wzr
0:
        bl                0f
        cmp               w0, #0x0
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::seqcst_relaxed_false_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, wzr
        mov               w1, wzr
0:
        bl                0f
        cmp               w0, #0x0
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::acquire_acquire_false_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, wzr
        mov               w1, wzr
0:
        bl                0f
        cmp               w0, #0x0
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::acquire_relaxed_false_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, wzr
        mov               w1, wzr
0:
        bl                0f
        cmp               w0, #0x0
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::relaxed_acquire_false_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, wzr
        mov               w1, wzr
0:
        bl                0f
        cmp               w0, #0x0
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::relaxed_relaxed_false_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, wzr
        mov               w1, wzr
0:
        bl                0f
        cmp               w0, #0x0
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::release_acquire_false_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, wzr
        mov               w1, wzr
0:
        bl                0f
        cmp               w0, #0x0
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::bool::release_relaxed_false_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x2, x0
        mov               w0, wzr
        mov               w1, wzr
0:
        bl                0f
        cmp               w0, #0x0
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::compare_exchange::u128::acqrel_seqcst:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        csel              x12, x4, x9, eq
        csel              x13, x5, x10, eq
        stlxp             w11, x12, x13, [x0]
        cbnz              w11, 0b
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::seqcst_seqcst:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        csel              x12, x4, x9, eq
        csel              x13, x5, x10, eq
        stlxp             w11, x12, x13, [x0]
        cbnz              w11, 0b
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::acqrel_acquire:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        csel              x12, x4, x9, eq
        csel              x13, x5, x10, eq
        stlxp             w11, x12, x13, [x0]
        cbnz              w11, 0b
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::acqrel_relaxed:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        csel              x12, x4, x9, eq
        csel              x13, x5, x10, eq
        stlxp             w11, x12, x13, [x0]
        cbnz              w11, 0b
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::acquire_seqcst:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        csel              x12, x4, x9, eq
        csel              x13, x5, x10, eq
        stlxp             w11, x12, x13, [x0]
        cbnz              w11, 0b
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::relaxed_seqcst:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        csel              x12, x4, x9, eq
        csel              x13, x5, x10, eq
        stlxp             w11, x12, x13, [x0]
        cbnz              w11, 0b
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::release_seqcst:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        csel              x12, x4, x9, eq
        csel              x13, x5, x10, eq
        stlxp             w11, x12, x13, [x0]
        cbnz              w11, 0b
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::seqcst_acquire:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        csel              x12, x4, x9, eq
        csel              x13, x5, x10, eq
        stlxp             w11, x12, x13, [x0]
        cbnz              w11, 0b
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::seqcst_relaxed:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        csel              x12, x4, x9, eq
        csel              x13, x5, x10, eq
        stlxp             w11, x12, x13, [x0]
        cbnz              w11, 0b
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::acquire_acquire:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        csel              x12, x4, x9, eq
        csel              x13, x5, x10, eq
        stxp              w11, x12, x13, [x0]
        cbnz              w11, 0b
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::acquire_relaxed:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        csel              x12, x4, x9, eq
        csel              x13, x5, x10, eq
        stxp              w11, x12, x13, [x0]
        cbnz              w11, 0b
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::relaxed_acquire:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        csel              x12, x4, x9, eq
        csel              x13, x5, x10, eq
        stxp              w11, x12, x13, [x0]
        cbnz              w11, 0b
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::relaxed_relaxed:
0:
        ldxp              x9, x10, [x0]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        csel              x12, x4, x9, eq
        csel              x13, x5, x10, eq
        stxp              w11, x12, x13, [x0]
        cbnz              w11, 0b
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::release_acquire:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        csel              x12, x4, x9, eq
        csel              x13, x5, x10, eq
        stlxp             w11, x12, x13, [x0]
        cbnz              w11, 0b
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::release_relaxed:
0:
        ldxp              x9, x10, [x0]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        csel              x12, x4, x9, eq
        csel              x13, x5, x10, eq
        stlxp             w11, x12, x13, [x0]
        cbnz              w11, 0b
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u8::acqrel_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxtb
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u8::seqcst_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxtb
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u8::acqrel_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxtb
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u8::acqrel_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxtb
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u8::acquire_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxtb
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u8::relaxed_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxtb
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u8::release_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxtb
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u8::seqcst_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxtb
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u8::seqcst_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxtb
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u8::acquire_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxtb
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u8::acquire_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxtb
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u8::relaxed_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxtb
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u8::relaxed_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxtb
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u8::release_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxtb
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u8::release_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxtb
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::f32::acqrel_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              w19, s0
        fmov              w1, s1
        mov               x2, x0
        mov               w0, w19
0:
        bl                0f
        cmp               w0, w19
        fmov              s0, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::f32::seqcst_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              w19, s0
        fmov              w1, s1
        mov               x2, x0
        mov               w0, w19
0:
        bl                0f
        cmp               w0, w19
        fmov              s0, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::f32::acqrel_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              w19, s0
        fmov              w1, s1
        mov               x2, x0
        mov               w0, w19
0:
        bl                0f
        cmp               w0, w19
        fmov              s0, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::f32::acqrel_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              w19, s0
        fmov              w1, s1
        mov               x2, x0
        mov               w0, w19
0:
        bl                0f
        cmp               w0, w19
        fmov              s0, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::f32::acquire_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              w19, s0
        fmov              w1, s1
        mov               x2, x0
        mov               w0, w19
0:
        bl                0f
        cmp               w0, w19
        fmov              s0, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::f32::relaxed_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              w19, s0
        fmov              w1, s1
        mov               x2, x0
        mov               w0, w19
0:
        bl                0f
        cmp               w0, w19
        fmov              s0, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::f32::release_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              w19, s0
        fmov              w1, s1
        mov               x2, x0
        mov               w0, w19
0:
        bl                0f
        cmp               w0, w19
        fmov              s0, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::f32::seqcst_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              w19, s0
        fmov              w1, s1
        mov               x2, x0
        mov               w0, w19
0:
        bl                0f
        cmp               w0, w19
        fmov              s0, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::f32::seqcst_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              w19, s0
        fmov              w1, s1
        mov               x2, x0
        mov               w0, w19
0:
        bl                0f
        cmp               w0, w19
        fmov              s0, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::f32::acquire_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              w19, s0
        fmov              w1, s1
        mov               x2, x0
        mov               w0, w19
0:
        bl                0f
        cmp               w0, w19
        fmov              s0, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::f32::acquire_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              w19, s0
        fmov              w1, s1
        mov               x2, x0
        mov               w0, w19
0:
        bl                0f
        cmp               w0, w19
        fmov              s0, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::f32::relaxed_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              w19, s0
        fmov              w1, s1
        mov               x2, x0
        mov               w0, w19
0:
        bl                0f
        cmp               w0, w19
        fmov              s0, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::f32::relaxed_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              w19, s0
        fmov              w1, s1
        mov               x2, x0
        mov               w0, w19
0:
        bl                0f
        cmp               w0, w19
        fmov              s0, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::f32::release_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              w19, s0
        fmov              w1, s1
        mov               x2, x0
        mov               w0, w19
0:
        bl                0f
        cmp               w0, w19
        fmov              s0, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::f32::release_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              w19, s0
        fmov              w1, s1
        mov               x2, x0
        mov               w0, w19
0:
        bl                0f
        cmp               w0, w19
        fmov              s0, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::f64::acqrel_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              x19, d0
        fmov              x1, d1
        mov               x2, x0
        mov               x0, x19
0:
        bl                0f
        cmp               x0, x19
        fmov              d0, x0
        cset              w8, eq
        eor               w8, w8, #0x1
        mov               x0, x8
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::f64::seqcst_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              x19, d0
        fmov              x1, d1
        mov               x2, x0
        mov               x0, x19
0:
        bl                0f
        cmp               x0, x19
        fmov              d0, x0
        cset              w8, eq
        eor               w8, w8, #0x1
        mov               x0, x8
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::f64::acqrel_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              x19, d0
        fmov              x1, d1
        mov               x2, x0
        mov               x0, x19
0:
        bl                0f
        cmp               x0, x19
        fmov              d0, x0
        cset              w8, eq
        eor               w8, w8, #0x1
        mov               x0, x8
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::f64::acqrel_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              x19, d0
        fmov              x1, d1
        mov               x2, x0
        mov               x0, x19
0:
        bl                0f
        cmp               x0, x19
        fmov              d0, x0
        cset              w8, eq
        eor               w8, w8, #0x1
        mov               x0, x8
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::f64::acquire_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              x19, d0
        fmov              x1, d1
        mov               x2, x0
        mov               x0, x19
0:
        bl                0f
        cmp               x0, x19
        fmov              d0, x0
        cset              w8, eq
        eor               w8, w8, #0x1
        mov               x0, x8
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::f64::relaxed_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              x19, d0
        fmov              x1, d1
        mov               x2, x0
        mov               x0, x19
0:
        bl                0f
        cmp               x0, x19
        fmov              d0, x0
        cset              w8, eq
        eor               w8, w8, #0x1
        mov               x0, x8
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::f64::release_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              x19, d0
        fmov              x1, d1
        mov               x2, x0
        mov               x0, x19
0:
        bl                0f
        cmp               x0, x19
        fmov              d0, x0
        cset              w8, eq
        eor               w8, w8, #0x1
        mov               x0, x8
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::f64::seqcst_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              x19, d0
        fmov              x1, d1
        mov               x2, x0
        mov               x0, x19
0:
        bl                0f
        cmp               x0, x19
        fmov              d0, x0
        cset              w8, eq
        eor               w8, w8, #0x1
        mov               x0, x8
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::f64::seqcst_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              x19, d0
        fmov              x1, d1
        mov               x2, x0
        mov               x0, x19
0:
        bl                0f
        cmp               x0, x19
        fmov              d0, x0
        cset              w8, eq
        eor               w8, w8, #0x1
        mov               x0, x8
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::f64::acquire_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              x19, d0
        fmov              x1, d1
        mov               x2, x0
        mov               x0, x19
0:
        bl                0f
        cmp               x0, x19
        fmov              d0, x0
        cset              w8, eq
        eor               w8, w8, #0x1
        mov               x0, x8
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::f64::acquire_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              x19, d0
        fmov              x1, d1
        mov               x2, x0
        mov               x0, x19
0:
        bl                0f
        cmp               x0, x19
        fmov              d0, x0
        cset              w8, eq
        eor               w8, w8, #0x1
        mov               x0, x8
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::f64::relaxed_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              x19, d0
        fmov              x1, d1
        mov               x2, x0
        mov               x0, x19
0:
        bl                0f
        cmp               x0, x19
        fmov              d0, x0
        cset              w8, eq
        eor               w8, w8, #0x1
        mov               x0, x8
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::f64::relaxed_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              x19, d0
        fmov              x1, d1
        mov               x2, x0
        mov               x0, x19
0:
        bl                0f
        cmp               x0, x19
        fmov              d0, x0
        cset              w8, eq
        eor               w8, w8, #0x1
        mov               x0, x8
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::f64::release_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              x19, d0
        fmov              x1, d1
        mov               x2, x0
        mov               x0, x19
0:
        bl                0f
        cmp               x0, x19
        fmov              d0, x0
        cset              w8, eq
        eor               w8, w8, #0x1
        mov               x0, x8
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::f64::release_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        fmov              x19, d0
        fmov              x1, d1
        mov               x2, x0
        mov               x0, x19
0:
        bl                0f
        cmp               x0, x19
        fmov              d0, x0
        cset              w8, eq
        eor               w8, w8, #0x1
        mov               x0, x8
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u16::acqrel_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxth
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u16::seqcst_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxth
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u16::acqrel_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxth
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u16::acqrel_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxth
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u16::acquire_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxth
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u16::relaxed_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxth
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u16::release_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxth
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u16::seqcst_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxth
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u16::seqcst_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxth
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u16::acquire_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxth
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u16::acquire_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxth
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u16::relaxed_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxth
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u16::relaxed_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxth
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u16::release_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxth
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u16::release_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19, uxth
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u32::acqrel_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u32::seqcst_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u32::acqrel_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u32::acqrel_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u32::acquire_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u32::relaxed_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u32::release_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u32::seqcst_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u32::seqcst_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u32::acquire_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u32::acquire_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u32::relaxed_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u32::relaxed_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u32::release_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u32::release_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u64::acqrel_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               x19, x1
        mov               x0, x1
        mov               x1, x2
        mov               x2, x8
0:
        bl                0f
        cmp               x0, x19
        mov               x1, x0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u64::seqcst_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               x19, x1
        mov               x0, x1
        mov               x1, x2
        mov               x2, x8
0:
        bl                0f
        cmp               x0, x19
        mov               x1, x0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u64::acqrel_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               x19, x1
        mov               x0, x1
        mov               x1, x2
        mov               x2, x8
0:
        bl                0f
        cmp               x0, x19
        mov               x1, x0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u64::acqrel_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               x19, x1
        mov               x0, x1
        mov               x1, x2
        mov               x2, x8
0:
        bl                0f
        cmp               x0, x19
        mov               x1, x0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u64::acquire_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               x19, x1
        mov               x0, x1
        mov               x1, x2
        mov               x2, x8
0:
        bl                0f
        cmp               x0, x19
        mov               x1, x0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u64::relaxed_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               x19, x1
        mov               x0, x1
        mov               x1, x2
        mov               x2, x8
0:
        bl                0f
        cmp               x0, x19
        mov               x1, x0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u64::release_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               x19, x1
        mov               x0, x1
        mov               x1, x2
        mov               x2, x8
0:
        bl                0f
        cmp               x0, x19
        mov               x1, x0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u64::seqcst_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               x19, x1
        mov               x0, x1
        mov               x1, x2
        mov               x2, x8
0:
        bl                0f
        cmp               x0, x19
        mov               x1, x0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u64::seqcst_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               x19, x1
        mov               x0, x1
        mov               x1, x2
        mov               x2, x8
0:
        bl                0f
        cmp               x0, x19
        mov               x1, x0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u64::acquire_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               x19, x1
        mov               x0, x1
        mov               x1, x2
        mov               x2, x8
0:
        bl                0f
        cmp               x0, x19
        mov               x1, x0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u64::acquire_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               x19, x1
        mov               x0, x1
        mov               x1, x2
        mov               x2, x8
0:
        bl                0f
        cmp               x0, x19
        mov               x1, x0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u64::relaxed_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               x19, x1
        mov               x0, x1
        mov               x1, x2
        mov               x2, x8
0:
        bl                0f
        cmp               x0, x19
        mov               x1, x0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u64::relaxed_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               x19, x1
        mov               x0, x1
        mov               x1, x2
        mov               x2, x8
0:
        bl                0f
        cmp               x0, x19
        mov               x1, x0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u64::release_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               x19, x1
        mov               x0, x1
        mov               x1, x2
        mov               x2, x8
0:
        bl                0f
        cmp               x0, x19
        mov               x1, x0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u64::release_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               x19, x1
        mov               x0, x1
        mov               x1, x2
        mov               x2, x8
0:
        bl                0f
        cmp               x0, x19
        mov               x1, x0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::bool::acqrel_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::bool::seqcst_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::bool::acqrel_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::bool::acqrel_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::bool::acquire_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::bool::relaxed_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::bool::release_seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::bool::seqcst_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::bool::seqcst_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::bool::acquire_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::bool::acquire_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::bool::relaxed_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::bool::relaxed_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::bool::release_acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::bool::release_relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               x8, x0
        mov               w19, w1
        mov               w0, w1
        mov               w1, w2
        mov               x2, x8
0:
        bl                0f
        cmp               w0, w19
        mov               w1, w0
        cset              w8, eq
        eor               w0, w8, #0x1
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::compare_exchange_weak::u128::acqrel_seqcst:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        csel              x12, x4, x9, eq
        csel              x13, x5, x10, eq
        stlxp             w11, x12, x13, [x0]
        cbnz              w11, 0b
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::seqcst_seqcst:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        csel              x12, x4, x9, eq
        csel              x13, x5, x10, eq
        stlxp             w11, x12, x13, [x0]
        cbnz              w11, 0b
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::acqrel_acquire:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        csel              x12, x4, x9, eq
        csel              x13, x5, x10, eq
        stlxp             w11, x12, x13, [x0]
        cbnz              w11, 0b
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::acqrel_relaxed:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        csel              x12, x4, x9, eq
        csel              x13, x5, x10, eq
        stlxp             w11, x12, x13, [x0]
        cbnz              w11, 0b
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::acquire_seqcst:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        csel              x12, x4, x9, eq
        csel              x13, x5, x10, eq
        stlxp             w11, x12, x13, [x0]
        cbnz              w11, 0b
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::relaxed_seqcst:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        csel              x12, x4, x9, eq
        csel              x13, x5, x10, eq
        stlxp             w11, x12, x13, [x0]
        cbnz              w11, 0b
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::release_seqcst:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        csel              x12, x4, x9, eq
        csel              x13, x5, x10, eq
        stlxp             w11, x12, x13, [x0]
        cbnz              w11, 0b
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::seqcst_acquire:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        csel              x12, x4, x9, eq
        csel              x13, x5, x10, eq
        stlxp             w11, x12, x13, [x0]
        cbnz              w11, 0b
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::seqcst_relaxed:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        csel              x12, x4, x9, eq
        csel              x13, x5, x10, eq
        stlxp             w11, x12, x13, [x0]
        cbnz              w11, 0b
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::acquire_acquire:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        csel              x12, x4, x9, eq
        csel              x13, x5, x10, eq
        stxp              w11, x12, x13, [x0]
        cbnz              w11, 0b
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::acquire_relaxed:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        csel              x12, x4, x9, eq
        csel              x13, x5, x10, eq
        stxp              w11, x12, x13, [x0]
        cbnz              w11, 0b
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::relaxed_acquire:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        csel              x12, x4, x9, eq
        csel              x13, x5, x10, eq
        stxp              w11, x12, x13, [x0]
        cbnz              w11, 0b
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::relaxed_relaxed:
0:
        ldxp              x9, x10, [x0]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        csel              x12, x4, x9, eq
        csel              x13, x5, x10, eq
        stxp              w11, x12, x13, [x0]
        cbnz              w11, 0b
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::release_acquire:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        csel              x12, x4, x9, eq
        csel              x13, x5, x10, eq
        stlxp             w11, x12, x13, [x0]
        cbnz              w11, 0b
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::release_relaxed:
0:
        ldxp              x9, x10, [x0]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        csel              x12, x4, x9, eq
        csel              x13, x5, x10, eq
        stlxp             w11, x12, x13, [x0]
        cbnz              w11, 0b
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::or::u8::acqrel_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u8::seqcst_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u8::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u8::acquire_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u8::relaxed_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u8::release_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u8::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u8::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u8::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u8::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u8::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u8::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u8::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u8::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u8::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u16::acqrel_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u16::seqcst_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u16::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u16::acquire_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u16::relaxed_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u16::release_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u16::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u16::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u16::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u16::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u16::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u16::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u16::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u16::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u16::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u32::acqrel_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u32::seqcst_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u32::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u32::acquire_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u32::relaxed_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u32::release_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u32::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u32::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u32::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u32::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u32::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u32::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u32::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u32::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u32::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u64::acqrel_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u64::seqcst_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u64::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u64::acquire_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u64::relaxed_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u64::release_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u64::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u64::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u64::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u64::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u64::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u64::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u64::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u64::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u64::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::bool::acqrel_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::bool::seqcst_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::bool::acqrel_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::bool::acquire_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::bool::relaxed_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::bool::release_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::bool::seqcst_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::bool::acquire_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::bool::relaxed_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::bool::release_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::bool::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::bool::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::bool::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::bool::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::bool::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::or::u128::acqrel_all:
        mov               x8, #-0x1               // =-1
0:
        ldaxp             x9, x10, [x0]
        orr               x11, x9, x8
        orr               x12, x10, x8
        stlxp             w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::or::u128::seqcst_all:
        mov               x8, #-0x1               // =-1
0:
        ldaxp             x9, x10, [x0]
        orr               x11, x9, x8
        orr               x12, x10, x8
        stlxp             w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::or::u128::acqrel_zero:
        mov               x8, xzr
0:
        ldaxp             x9, x10, [x0]
        orr               x11, x9, x8
        orr               x12, x10, x8
        stlxp             w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::or::u128::acquire_all:
        mov               x8, #-0x1               // =-1
0:
        ldaxp             x9, x10, [x0]
        orr               x11, x9, x8
        orr               x12, x10, x8
        stxp              w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::or::u128::relaxed_all:
        mov               x8, #-0x1               // =-1
0:
        ldxp              x9, x10, [x0]
        orr               x11, x9, x8
        orr               x12, x10, x8
        stxp              w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::or::u128::release_all:
        mov               x8, #-0x1               // =-1
0:
        ldxp              x9, x10, [x0]
        orr               x11, x9, x8
        orr               x12, x10, x8
        stlxp             w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::or::u128::seqcst_zero:
        mov               x8, xzr
0:
        ldaxp             x9, x10, [x0]
        orr               x11, x9, x8
        orr               x12, x10, x8
        stlxp             w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::or::u128::acquire_zero:
        mov               x8, xzr
0:
        ldaxp             x9, x10, [x0]
        orr               x11, x9, x8
        orr               x12, x10, x8
        stxp              w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::or::u128::relaxed_zero:
        mov               x8, xzr
0:
        ldxp              x9, x10, [x0]
        orr               x11, x9, x8
        orr               x12, x10, x8
        stxp              w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::or::u128::release_zero:
        mov               x8, xzr
0:
        ldxp              x9, x10, [x0]
        orr               x11, x9, x8
        orr               x12, x10, x8
        stlxp             w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::or::u128::acqrel:
0:
        ldaxp             x8, x9, [x0]
        orr               x10, x8, x2
        orr               x11, x9, x3
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::or::u128::seqcst:
0:
        ldaxp             x8, x9, [x0]
        orr               x10, x8, x2
        orr               x11, x9, x3
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::or::u128::acquire:
0:
        ldaxp             x8, x9, [x0]
        orr               x10, x8, x2
        orr               x11, x9, x3
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::or::u128::relaxed:
0:
        ldxp              x8, x9, [x0]
        orr               x10, x8, x2
        orr               x11, x9, x3
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::or::u128::release:
0:
        ldxp              x8, x9, [x0]
        orr               x10, x8, x2
        orr               x11, x9, x3
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::add::u8::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u8::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u8::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u8::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u8::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u8::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u8::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u8::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u8::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u8::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u16::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u16::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u16::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u16::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u16::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u16::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u16::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u16::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u16::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u16::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u32::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u32::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u32::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u32::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u32::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u32::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u32::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u32::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u32::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u32::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u64::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u64::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u64::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u64::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u64::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u64::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u64::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u64::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u64::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u64::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::add::u128::acqrel_zero:
        mov               x8, xzr
0:
        ldaxp             x9, x10, [x0]
        adds              x11, x9, x8
        adc               x12, x10, x8
        stlxp             w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::add::u128::seqcst_zero:
        mov               x8, xzr
0:
        ldaxp             x9, x10, [x0]
        adds              x11, x9, x8
        adc               x12, x10, x8
        stlxp             w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::add::u128::acquire_zero:
        mov               x8, xzr
0:
        ldaxp             x9, x10, [x0]
        adds              x11, x9, x8
        adc               x12, x10, x8
        stxp              w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::add::u128::relaxed_zero:
        mov               x8, xzr
0:
        ldxp              x9, x10, [x0]
        adds              x11, x9, x8
        adc               x12, x10, x8
        stxp              w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::add::u128::release_zero:
        mov               x8, xzr
0:
        ldxp              x9, x10, [x0]
        adds              x11, x9, x8
        adc               x12, x10, x8
        stlxp             w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::add::u128::acqrel:
0:
        ldaxp             x8, x9, [x0]
        adds              x10, x8, x2
        adc               x11, x9, x3
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::add::u128::seqcst:
0:
        ldaxp             x8, x9, [x0]
        adds              x10, x8, x2
        adc               x11, x9, x3
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::add::u128::acquire:
0:
        ldaxp             x8, x9, [x0]
        adds              x10, x8, x2
        adc               x11, x9, x3
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::add::u128::relaxed:
0:
        ldxp              x8, x9, [x0]
        adds              x10, x8, x2
        adc               x11, x9, x3
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::add::u128::release:
0:
        ldxp              x8, x9, [x0]
        adds              x10, x8, x2
        adc               x11, x9, x3
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::and::u8::acqrel_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u8::seqcst_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u8::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u8::acquire_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u8::relaxed_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u8::release_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u8::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u8::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u8::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u8::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u8::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u8::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u8::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u8::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u8::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u16::acqrel_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u16::seqcst_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u16::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u16::acquire_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u16::relaxed_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u16::release_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u16::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u16::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u16::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u16::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u16::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u16::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u16::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u16::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u16::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u32::acqrel_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u32::seqcst_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u32::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u32::acquire_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u32::relaxed_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u32::release_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u32::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u32::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u32::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u32::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u32::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u32::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u32::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u32::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u32::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u64::acqrel_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u64::seqcst_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u64::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u64::acquire_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u64::relaxed_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u64::release_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u64::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u64::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u64::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u64::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u64::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u64::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u64::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u64::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u64::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::bool::acqrel_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x2               // =-2
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::bool::seqcst_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x2               // =-2
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::bool::acqrel_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::bool::acquire_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x2               // =-2
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::bool::relaxed_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x2               // =-2
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::bool::release_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x2               // =-2
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::bool::seqcst_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::bool::acquire_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::bool::relaxed_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::bool::release_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::bool::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::bool::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::bool::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::bool::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::bool::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::and::u128::acqrel_all:
        mov               x8, #-0x1               // =-1
0:
        ldaxp             x9, x10, [x0]
        and               x11, x9, x8
        and               x12, x10, x8
        stlxp             w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::and::u128::seqcst_all:
        mov               x8, #-0x1               // =-1
0:
        ldaxp             x9, x10, [x0]
        and               x11, x9, x8
        and               x12, x10, x8
        stlxp             w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::and::u128::acqrel_zero:
        mov               x8, xzr
0:
        ldaxp             x9, x10, [x0]
        and               x11, x9, x8
        and               x12, x10, x8
        stlxp             w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::and::u128::acquire_all:
        mov               x8, #-0x1               // =-1
0:
        ldaxp             x9, x10, [x0]
        and               x11, x9, x8
        and               x12, x10, x8
        stxp              w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::and::u128::relaxed_all:
        mov               x8, #-0x1               // =-1
0:
        ldxp              x9, x10, [x0]
        and               x11, x9, x8
        and               x12, x10, x8
        stxp              w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::and::u128::release_all:
        mov               x8, #-0x1               // =-1
0:
        ldxp              x9, x10, [x0]
        and               x11, x9, x8
        and               x12, x10, x8
        stlxp             w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::and::u128::seqcst_zero:
        mov               x8, xzr
0:
        ldaxp             x9, x10, [x0]
        and               x11, x9, x8
        and               x12, x10, x8
        stlxp             w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::and::u128::acquire_zero:
        mov               x8, xzr
0:
        ldaxp             x9, x10, [x0]
        and               x11, x9, x8
        and               x12, x10, x8
        stxp              w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::and::u128::relaxed_zero:
        mov               x8, xzr
0:
        ldxp              x9, x10, [x0]
        and               x11, x9, x8
        and               x12, x10, x8
        stxp              w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::and::u128::release_zero:
        mov               x8, xzr
0:
        ldxp              x9, x10, [x0]
        and               x11, x9, x8
        and               x12, x10, x8
        stlxp             w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::and::u128::acqrel:
0:
        ldaxp             x8, x9, [x0]
        and               x10, x8, x2
        and               x11, x9, x3
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::and::u128::seqcst:
0:
        ldaxp             x8, x9, [x0]
        and               x10, x8, x2
        and               x11, x9, x3
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::and::u128::acquire:
0:
        ldaxp             x8, x9, [x0]
        and               x10, x8, x2
        and               x11, x9, x3
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::and::u128::relaxed:
0:
        ldxp              x8, x9, [x0]
        and               x10, x8, x2
        and               x11, x9, x3
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::and::u128::release:
0:
        ldxp              x8, x9, [x0]
        and               x10, x8, x2
        and               x11, x9, x3
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::neg::u8::acqrel:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldrb              w20, [x0]
        mov               x19, x0
0:
        neg               w1, w20
        mov               w0, w20
        mov               x2, x19
1:
        bl                1f
        cmp               w0, w20, uxtb
        mov               w20, w0
        b.ne              0b
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::neg::u8::seqcst:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldrb              w20, [x0]
        mov               x19, x0
0:
        neg               w1, w20
        mov               w0, w20
        mov               x2, x19
1:
        bl                1f
        cmp               w0, w20, uxtb
        mov               w20, w0
        b.ne              0b
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::neg::u8::acquire:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldrb              w20, [x0]
        mov               x19, x0
0:
        neg               w1, w20
        mov               w0, w20
        mov               x2, x19
1:
        bl                1f
        cmp               w0, w20, uxtb
        mov               w20, w0
        b.ne              0b
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::neg::u8::relaxed:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldrb              w20, [x0]
        mov               x19, x0
0:
        neg               w1, w20
        mov               w0, w20
        mov               x2, x19
1:
        bl                1f
        cmp               w0, w20, uxtb
        mov               w20, w0
        b.ne              0b
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::neg::u8::release:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldrb              w20, [x0]
        mov               x19, x0
0:
        neg               w1, w20
        mov               w0, w20
        mov               x2, x19
1:
        bl                1f
        cmp               w0, w20, uxtb
        mov               w20, w0
        b.ne              0b
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::neg::u16::acqrel:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldrh              w20, [x0]
        mov               x19, x0
0:
        neg               w1, w20
        mov               w0, w20
        mov               x2, x19
1:
        bl                1f
        cmp               w0, w20, uxth
        mov               w20, w0
        b.ne              0b
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::neg::u16::seqcst:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldrh              w20, [x0]
        mov               x19, x0
0:
        neg               w1, w20
        mov               w0, w20
        mov               x2, x19
1:
        bl                1f
        cmp               w0, w20, uxth
        mov               w20, w0
        b.ne              0b
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::neg::u16::acquire:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldrh              w20, [x0]
        mov               x19, x0
0:
        neg               w1, w20
        mov               w0, w20
        mov               x2, x19
1:
        bl                1f
        cmp               w0, w20, uxth
        mov               w20, w0
        b.ne              0b
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::neg::u16::relaxed:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldrh              w20, [x0]
        mov               x19, x0
0:
        neg               w1, w20
        mov               w0, w20
        mov               x2, x19
1:
        bl                1f
        cmp               w0, w20, uxth
        mov               w20, w0
        b.ne              0b
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::neg::u16::release:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldrh              w20, [x0]
        mov               x19, x0
0:
        neg               w1, w20
        mov               w0, w20
        mov               x2, x19
1:
        bl                1f
        cmp               w0, w20, uxth
        mov               w20, w0
        b.ne              0b
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::neg::u32::acqrel:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldr               w20, [x0]
        mov               x19, x0
0:
        neg               w1, w20
        mov               w0, w20
        mov               x2, x19
1:
        bl                1f
        cmp               w0, w20
        mov               w20, w0
        b.ne              0b
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::neg::u32::seqcst:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldr               w20, [x0]
        mov               x19, x0
0:
        neg               w1, w20
        mov               w0, w20
        mov               x2, x19
1:
        bl                1f
        cmp               w0, w20
        mov               w20, w0
        b.ne              0b
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::neg::u32::acquire:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldr               w20, [x0]
        mov               x19, x0
0:
        neg               w1, w20
        mov               w0, w20
        mov               x2, x19
1:
        bl                1f
        cmp               w0, w20
        mov               w20, w0
        b.ne              0b
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::neg::u32::relaxed:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldr               w20, [x0]
        mov               x19, x0
0:
        neg               w1, w20
        mov               w0, w20
        mov               x2, x19
1:
        bl                1f
        cmp               w0, w20
        mov               w20, w0
        b.ne              0b
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::neg::u32::release:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldr               w20, [x0]
        mov               x19, x0
0:
        neg               w1, w20
        mov               w0, w20
        mov               x2, x19
1:
        bl                1f
        cmp               w0, w20
        mov               w20, w0
        b.ne              0b
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::neg::u64::acqrel:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldr               x20, [x0]
        mov               x19, x0
0:
        neg               x1, x20
        mov               x0, x20
        mov               x2, x19
1:
        bl                1f
        cmp               x0, x20
        mov               x20, x0
        b.ne              0b
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::neg::u64::seqcst:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldr               x20, [x0]
        mov               x19, x0
0:
        neg               x1, x20
        mov               x0, x20
        mov               x2, x19
1:
        bl                1f
        cmp               x0, x20
        mov               x20, x0
        b.ne              0b
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::neg::u64::acquire:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldr               x20, [x0]
        mov               x19, x0
0:
        neg               x1, x20
        mov               x0, x20
        mov               x2, x19
1:
        bl                1f
        cmp               x0, x20
        mov               x20, x0
        b.ne              0b
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::neg::u64::relaxed:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldr               x20, [x0]
        mov               x19, x0
0:
        neg               x1, x20
        mov               x0, x20
        mov               x2, x19
1:
        bl                1f
        cmp               x0, x20
        mov               x20, x0
        b.ne              0b
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::neg::u64::release:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldr               x20, [x0]
        mov               x19, x0
0:
        neg               x1, x20
        mov               x0, x20
        mov               x2, x19
1:
        bl                1f
        cmp               x0, x20
        mov               x20, x0
        b.ne              0b
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::neg::u128::acqrel:
0:
        ldaxp             x8, x9, [x0]
        negs              x10, x8
        ngc               x11, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::neg::u128::seqcst:
0:
        ldaxp             x8, x9, [x0]
        negs              x10, x8
        ngc               x11, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::neg::u128::acquire:
0:
        ldaxp             x8, x9, [x0]
        negs              x10, x8
        ngc               x11, x9
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::neg::u128::relaxed:
0:
        ldxp              x8, x9, [x0]
        negs              x10, x8
        ngc               x11, x9
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::neg::u128::release:
0:
        ldxp              x8, x9, [x0]
        negs              x10, x8
        ngc               x11, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::not::u8::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::not::u8::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::not::u8::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::not::u8::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::not::u8::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::not::u16::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::not::u16::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::not::u16::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::not::u16::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::not::u16::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::not::u32::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::not::u32::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::not::u32::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::not::u32::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::not::u32::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::not::u64::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::not::u64::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::not::u64::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::not::u64::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::not::u64::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::not::bool::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::not::bool::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::not::bool::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::not::bool::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::not::bool::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::not::u128::acqrel:
0:
        ldaxp             x8, x9, [x0]
        mvn               x10, x8
        mvn               x11, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::not::u128::seqcst:
0:
        ldaxp             x8, x9, [x0]
        mvn               x10, x8
        mvn               x11, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::not::u128::acquire:
0:
        ldaxp             x8, x9, [x0]
        mvn               x10, x8
        mvn               x11, x9
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::not::u128::relaxed:
0:
        ldxp              x8, x9, [x0]
        mvn               x10, x8
        mvn               x11, x9
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::not::u128::release:
0:
        ldxp              x8, x9, [x0]
        mvn               x10, x8
        mvn               x11, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::sub::u8::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u8::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u8::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u8::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u8::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u8::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u8::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u8::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u8::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u8::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u16::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u16::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u16::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u16::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u16::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u16::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u16::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u16::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u16::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u16::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u32::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u32::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u32::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u32::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u32::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u32::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u32::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u32::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u32::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u32::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u64::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u64::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u64::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u64::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u64::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u64::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u64::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u64::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u64::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u64::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::sub::u128::acqrel_zero:
        mov               x8, xzr
0:
        ldaxp             x9, x10, [x0]
        subs              x11, x9, x8
        sbc               x12, x10, x8
        stlxp             w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::sub::u128::seqcst_zero:
        mov               x8, xzr
0:
        ldaxp             x9, x10, [x0]
        subs              x11, x9, x8
        sbc               x12, x10, x8
        stlxp             w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::sub::u128::acquire_zero:
        mov               x8, xzr
0:
        ldaxp             x9, x10, [x0]
        subs              x11, x9, x8
        sbc               x12, x10, x8
        stxp              w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::sub::u128::relaxed_zero:
        mov               x8, xzr
0:
        ldxp              x9, x10, [x0]
        subs              x11, x9, x8
        sbc               x12, x10, x8
        stxp              w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::sub::u128::release_zero:
        mov               x8, xzr
0:
        ldxp              x9, x10, [x0]
        subs              x11, x9, x8
        sbc               x12, x10, x8
        stlxp             w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::sub::u128::acqrel:
0:
        ldaxp             x8, x9, [x0]
        subs              x10, x8, x2
        sbc               x11, x9, x3
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::sub::u128::seqcst:
0:
        ldaxp             x8, x9, [x0]
        subs              x10, x8, x2
        sbc               x11, x9, x3
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::sub::u128::acquire:
0:
        ldaxp             x8, x9, [x0]
        subs              x10, x8, x2
        sbc               x11, x9, x3
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::sub::u128::relaxed:
0:
        ldxp              x8, x9, [x0]
        subs              x10, x8, x2
        sbc               x11, x9, x3
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::sub::u128::release:
0:
        ldxp              x8, x9, [x0]
        subs              x10, x8, x2
        sbc               x11, x9, x3
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::xor::u8::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u8::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u8::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u8::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u8::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u8::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u8::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u8::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u8::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u8::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u16::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u16::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u16::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u16::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u16::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u16::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u16::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u16::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u16::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u16::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u32::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u32::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u32::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u32::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u32::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u32::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u32::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u32::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u32::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u32::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u64::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u64::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u64::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u64::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u64::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u64::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u64::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u64::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u64::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u64::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::bool::acqrel_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::bool::seqcst_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::bool::acqrel_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::bool::acquire_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::bool::relaxed_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::bool::release_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::bool::seqcst_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::bool::acquire_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::bool::relaxed_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::bool::release_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::bool::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::bool::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::bool::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::bool::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::bool::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::xor::u128::acqrel_zero:
        mov               x8, xzr
0:
        ldaxp             x9, x10, [x0]
        eor               x11, x9, x8
        eor               x12, x10, x8
        stlxp             w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::xor::u128::seqcst_zero:
        mov               x8, xzr
0:
        ldaxp             x9, x10, [x0]
        eor               x11, x9, x8
        eor               x12, x10, x8
        stlxp             w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::xor::u128::acquire_zero:
        mov               x8, xzr
0:
        ldaxp             x9, x10, [x0]
        eor               x11, x9, x8
        eor               x12, x10, x8
        stxp              w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::xor::u128::relaxed_zero:
        mov               x8, xzr
0:
        ldxp              x9, x10, [x0]
        eor               x11, x9, x8
        eor               x12, x10, x8
        stxp              w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::xor::u128::release_zero:
        mov               x8, xzr
0:
        ldxp              x9, x10, [x0]
        eor               x11, x9, x8
        eor               x12, x10, x8
        stlxp             w13, x11, x12, [x0]
        cbnz              w13, 0b
        ret

asm_test::xor::u128::acqrel:
0:
        ldaxp             x8, x9, [x0]
        eor               x10, x8, x2
        eor               x11, x9, x3
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::xor::u128::seqcst:
0:
        ldaxp             x8, x9, [x0]
        eor               x10, x8, x2
        eor               x11, x9, x3
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::xor::u128::acquire:
0:
        ldaxp             x8, x9, [x0]
        eor               x10, x8, x2
        eor               x11, x9, x3
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::xor::u128::relaxed:
0:
        ldxp              x8, x9, [x0]
        eor               x10, x8, x2
        eor               x11, x9, x3
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::xor::u128::release:
0:
        ldxp              x8, x9, [x0]
        eor               x10, x8, x2
        eor               x11, x9, x3
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::load::u8::seqcst:
        ldarb             w0, [x0]
        ret

asm_test::load::u8::acquire:
        ldarb             w0, [x0]
        ret

asm_test::load::u8::relaxed:
        ldrb              w0, [x0]
        ret

asm_test::load::f32::seqcst:
        ldar              w8, [x0]
        fmov              s0, w8
        ret

asm_test::load::f32::acquire:
        ldar              w8, [x0]
        fmov              s0, w8
        ret

asm_test::load::f32::relaxed:
        ldr               s0, [x0]
        ret

asm_test::load::f64::seqcst:
        ldar              x8, [x0]
        fmov              d0, x8
        ret

asm_test::load::f64::acquire:
        ldar              x8, [x0]
        fmov              d0, x8
        ret

asm_test::load::f64::relaxed:
        ldr               d0, [x0]
        ret

asm_test::load::u16::seqcst:
        ldarh             w0, [x0]
        ret

asm_test::load::u16::acquire:
        ldarh             w0, [x0]
        ret

asm_test::load::u16::relaxed:
        ldrh              w0, [x0]
        ret

asm_test::load::u32::seqcst:
        ldar              w0, [x0]
        ret

asm_test::load::u32::acquire:
        ldar              w0, [x0]
        ret

asm_test::load::u32::relaxed:
        ldr               w0, [x0]
        ret

asm_test::load::u64::seqcst:
        ldar              x0, [x0]
        ret

asm_test::load::u64::acquire:
        ldar              x0, [x0]
        ret

asm_test::load::u64::relaxed:
        ldr               x0, [x0]
        ret

asm_test::load::bool::seqcst:
        ldarb             w0, [x0]
        ret

asm_test::load::bool::acquire:
        ldarb             w0, [x0]
        ret

asm_test::load::bool::relaxed:
        ldrb              w0, [x0]
        ret

asm_test::load::u128::seqcst:
0:
        ldaxp             x8, x1, [x0]
        stlxp             w9, x8, x1, [x0]
        cbnz              w9, 0b
        mov               x0, x8
        ret

asm_test::load::u128::acquire:
0:
        ldaxp             x8, x1, [x0]
        stxp              w9, x8, x1, [x0]
        cbnz              w9, 0b
        mov               x0, x8
        ret

asm_test::load::u128::relaxed:
0:
        ldxp              x8, x1, [x0]
        stxp              w9, x8, x1, [x0]
        cbnz              w9, 0b
        mov               x0, x8
        ret

asm_test::swap::u8::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::u8::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::u8::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::u8::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::u8::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::f32::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        fmov              w0, s0
0:
        bl                0f
        fmov              s0, w0
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::f32::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        fmov              w0, s0
0:
        bl                0f
        fmov              s0, w0
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::f32::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        fmov              w0, s0
0:
        bl                0f
        fmov              s0, w0
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::f32::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        fmov              w0, s0
0:
        bl                0f
        fmov              s0, w0
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::f32::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        fmov              w0, s0
0:
        bl                0f
        fmov              s0, w0
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::f64::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        fmov              x0, d0
0:
        bl                0f
        fmov              d0, x0
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::f64::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        fmov              x0, d0
0:
        bl                0f
        fmov              d0, x0
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::f64::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        fmov              x0, d0
0:
        bl                0f
        fmov              d0, x0
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::f64::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        fmov              x0, d0
0:
        bl                0f
        fmov              d0, x0
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::f64::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        fmov              x0, d0
0:
        bl                0f
        fmov              d0, x0
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::u16::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::u16::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::u16::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::u16::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::u16::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::u32::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::u32::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::u32::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::u32::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::u32::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::u64::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::u64::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::u64::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::u64::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::u64::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::bool::acqrel_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::bool::seqcst_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::bool::acqrel_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::bool::acquire_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::bool::relaxed_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::bool::release_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::bool::seqcst_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::bool::acquire_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::bool::relaxed_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::bool::release_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::bool::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::bool::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::bool::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::bool::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::bool::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::swap::u128::acqrel:
0:
        ldaxp             x8, x1, [x0]
        stlxp             w9, x2, x3, [x0]
        cbnz              w9, 0b
        mov               x0, x8
        ret

asm_test::swap::u128::seqcst:
0:
        ldaxp             x8, x1, [x0]
        stlxp             w9, x2, x3, [x0]
        cbnz              w9, 0b
        mov               x0, x8
        ret

asm_test::swap::u128::acquire:
0:
        ldaxp             x8, x1, [x0]
        stxp              w9, x2, x3, [x0]
        cbnz              w9, 0b
        mov               x0, x8
        ret

asm_test::swap::u128::relaxed:
0:
        ldxp              x8, x1, [x0]
        stxp              w9, x2, x3, [x0]
        cbnz              w9, 0b
        mov               x0, x8
        ret

asm_test::swap::u128::release:
0:
        ldxp              x8, x1, [x0]
        stlxp             w9, x2, x3, [x0]
        cbnz              w9, 0b
        mov               x0, x8
        ret

asm_test::store::u8::seqcst:
        stlrb             w1, [x0]
        ret

asm_test::store::u8::relaxed:
        strb              w1, [x0]
        ret

asm_test::store::u8::release:
        stlrb             w1, [x0]
        ret

asm_test::store::f32::seqcst:
        fmov              w8, s0
        stlr              w8, [x0]
        ret

asm_test::store::f32::relaxed:
        str               s0, [x0]
        ret

asm_test::store::f32::release:
        fmov              w8, s0
        stlr              w8, [x0]
        ret

asm_test::store::f64::seqcst:
        fmov              x8, d0
        stlr              x8, [x0]
        ret

asm_test::store::f64::relaxed:
        str               d0, [x0]
        ret

asm_test::store::f64::release:
        fmov              x8, d0
        stlr              x8, [x0]
        ret

asm_test::store::u16::seqcst:
        stlrh             w1, [x0]
        ret

asm_test::store::u16::relaxed:
        strh              w1, [x0]
        ret

asm_test::store::u16::release:
        stlrh             w1, [x0]
        ret

asm_test::store::u32::seqcst:
        stlr              w1, [x0]
        ret

asm_test::store::u32::relaxed:
        str               w1, [x0]
        ret

asm_test::store::u32::release:
        stlr              w1, [x0]
        ret

asm_test::store::u64::seqcst:
        stlr              x1, [x0]
        ret

asm_test::store::u64::relaxed:
        str               x1, [x0]
        ret

asm_test::store::u64::release:
        stlr              x1, [x0]
        ret

asm_test::store::bool::seqcst:
        stlrb             w1, [x0]
        ret

asm_test::store::bool::relaxed:
        strb              w1, [x0]
        ret

asm_test::store::bool::release:
        stlrb             w1, [x0]
        ret

asm_test::store::u128::seqcst:
0:
        ldaxp             xzr, x8, [x0]
        stlxp             w8, x2, x3, [x0]
        cbnz              w8, 0b
        ret

asm_test::store::u128::relaxed:
0:
        ldxp              xzr, x8, [x0]
        stxp              w8, x2, x3, [x0]
        cbnz              w8, 0b
        ret

asm_test::store::u128::release:
0:
        ldxp              xzr, x8, [x0]
        stlxp             w8, x2, x3, [x0]
        cbnz              w8, 0b
        ret

asm_test::bit_set::u8::acqrel:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        and               x9, x1, #0x7
        lsl               w19, w8, w9
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_set::u8::seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        and               x9, x1, #0x7
        lsl               w19, w8, w9
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_set::u8::acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        and               x9, x1, #0x7
        lsl               w19, w8, w9
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_set::u8::relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        and               x9, x1, #0x7
        lsl               w19, w8, w9
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_set::u8::release:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        and               x9, x1, #0x7
        lsl               w19, w8, w9
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_set::u16::acqrel:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        and               x9, x1, #0xf
        lsl               w19, w8, w9
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_set::u16::seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        and               x9, x1, #0xf
        lsl               w19, w8, w9
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_set::u16::acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        and               x9, x1, #0xf
        lsl               w19, w8, w9
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_set::u16::relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        and               x9, x1, #0xf
        lsl               w19, w8, w9
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_set::u16::release:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        and               x9, x1, #0xf
        lsl               w19, w8, w9
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_set::u32::acqrel:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        lsl               w19, w8, w1
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_set::u32::seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        lsl               w19, w8, w1
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_set::u32::acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        lsl               w19, w8, w1
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_set::u32::relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        lsl               w19, w8, w1
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_set::u32::release:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        lsl               w19, w8, w1
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_set::u64::acqrel:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        lsl               x19, x8, x1
        mov               x1, x0
        mov               x0, x19
0:
        bl                0f
        tst               x0, x19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_set::u64::seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        lsl               x19, x8, x1
        mov               x1, x0
        mov               x0, x19
0:
        bl                0f
        tst               x0, x19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_set::u64::acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        lsl               x19, x8, x1
        mov               x1, x0
        mov               x0, x19
0:
        bl                0f
        tst               x0, x19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_set::u64::relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        lsl               x19, x8, x1
        mov               x1, x0
        mov               x0, x19
0:
        bl                0f
        tst               x0, x19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_set::u64::release:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        lsl               x19, x8, x1
        mov               x1, x0
        mov               x0, x19
0:
        bl                0f
        tst               x0, x19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_set::u128::acqrel:
        mov               w8, #0x1                // =1
        and               w9, w1, #0x7f
        lsl               x8, x8, x9
        tst               x9, #0x40
        csel              x9, xzr, x8, ne
        csel              x8, x8, xzr, ne
0:
        ldaxp             x10, x11, [x0]
        orr               x12, x10, x9
        orr               x13, x11, x8
        stlxp             w14, x12, x13, [x0]
        cbnz              w14, 0b
        and               x8, x11, x8
        and               x9, x10, x9
        orr               x8, x9, x8
        cmp               x8, #0x0
        cset              w0, ne
        ret

asm_test::bit_set::u128::seqcst:
        mov               w8, #0x1                // =1
        and               w9, w1, #0x7f
        lsl               x8, x8, x9
        tst               x9, #0x40
        csel              x9, xzr, x8, ne
        csel              x8, x8, xzr, ne
0:
        ldaxp             x10, x11, [x0]
        orr               x12, x10, x9
        orr               x13, x11, x8
        stlxp             w14, x12, x13, [x0]
        cbnz              w14, 0b
        and               x8, x11, x8
        and               x9, x10, x9
        orr               x8, x9, x8
        cmp               x8, #0x0
        cset              w0, ne
        ret

asm_test::bit_set::u128::acquire:
        mov               w8, #0x1                // =1
        and               w9, w1, #0x7f
        lsl               x8, x8, x9
        tst               x9, #0x40
        csel              x9, xzr, x8, ne
        csel              x8, x8, xzr, ne
0:
        ldaxp             x10, x11, [x0]
        orr               x12, x10, x9
        orr               x13, x11, x8
        stxp              w14, x12, x13, [x0]
        cbnz              w14, 0b
        and               x8, x11, x8
        and               x9, x10, x9
        orr               x8, x9, x8
        cmp               x8, #0x0
        cset              w0, ne
        ret

asm_test::bit_set::u128::relaxed:
        mov               w8, #0x1                // =1
        and               w9, w1, #0x7f
        lsl               x8, x8, x9
        tst               x9, #0x40
        csel              x9, xzr, x8, ne
        csel              x8, x8, xzr, ne
0:
        ldxp              x10, x11, [x0]
        orr               x12, x10, x9
        orr               x13, x11, x8
        stxp              w14, x12, x13, [x0]
        cbnz              w14, 0b
        and               x8, x11, x8
        and               x9, x10, x9
        orr               x8, x9, x8
        cmp               x8, #0x0
        cset              w0, ne
        ret

asm_test::bit_set::u128::release:
        mov               w8, #0x1                // =1
        and               w9, w1, #0x7f
        lsl               x8, x8, x9
        tst               x9, #0x40
        csel              x9, xzr, x8, ne
        csel              x8, x8, xzr, ne
0:
        ldxp              x10, x11, [x0]
        orr               x12, x10, x9
        orr               x13, x11, x8
        stlxp             w14, x12, x13, [x0]
        cbnz              w14, 0b
        and               x8, x11, x8
        and               x9, x10, x9
        orr               x8, x9, x8
        cmp               x8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_or::u8::acqrel_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u8::seqcst_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u8::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u8::acquire_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u8::relaxed_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u8::release_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u8::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u8::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u8::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u8::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u8::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u8::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u8::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u8::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u8::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u16::acqrel_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u16::seqcst_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u16::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u16::acquire_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u16::relaxed_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u16::release_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u16::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u16::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u16::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u16::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u16::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u16::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u16::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u16::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u16::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u32::acqrel_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u32::seqcst_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u32::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u32::acquire_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u32::relaxed_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u32::release_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u32::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u32::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u32::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u32::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u32::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u32::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u32::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u32::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u32::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u64::acqrel_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u64::seqcst_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u64::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u64::acquire_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u64::relaxed_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u64::release_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u64::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u64::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u64::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u64::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u64::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u64::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u64::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u64::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u64::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::bool::acqrel_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::bool::seqcst_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::bool::acqrel_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::bool::acquire_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::bool::relaxed_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::bool::release_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::bool::seqcst_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::bool::acquire_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::bool::relaxed_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::bool::release_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::bool::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::bool::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::bool::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::bool::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::bool::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_or::u128::acqrel_all:
        mov               x9, #-0x1               // =-1
0:
        ldaxp             x8, x1, [x0]
        orr               x10, x8, x9
        orr               x11, x1, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_or::u128::seqcst_all:
        mov               x9, #-0x1               // =-1
0:
        ldaxp             x8, x1, [x0]
        orr               x10, x8, x9
        orr               x11, x1, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_or::u128::acqrel_zero:
        mov               x9, xzr
0:
        ldaxp             x8, x1, [x0]
        orr               x10, x8, x9
        orr               x11, x1, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_or::u128::acquire_all:
        mov               x9, #-0x1               // =-1
0:
        ldaxp             x8, x1, [x0]
        orr               x10, x8, x9
        orr               x11, x1, x9
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_or::u128::relaxed_all:
        mov               x9, #-0x1               // =-1
0:
        ldxp              x8, x1, [x0]
        orr               x10, x8, x9
        orr               x11, x1, x9
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_or::u128::release_all:
        mov               x9, #-0x1               // =-1
0:
        ldxp              x8, x1, [x0]
        orr               x10, x8, x9
        orr               x11, x1, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_or::u128::seqcst_zero:
        mov               x9, xzr
0:
        ldaxp             x8, x1, [x0]
        orr               x10, x8, x9
        orr               x11, x1, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_or::u128::acquire_zero:
        mov               x9, xzr
0:
        ldaxp             x8, x1, [x0]
        orr               x10, x8, x9
        orr               x11, x1, x9
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_or::u128::relaxed_zero:
        mov               x9, xzr
0:
        ldxp              x8, x1, [x0]
        orr               x10, x8, x9
        orr               x11, x1, x9
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_or::u128::release_zero:
        mov               x9, xzr
0:
        ldxp              x8, x1, [x0]
        orr               x10, x8, x9
        orr               x11, x1, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_or::u128::acqrel:
0:
        ldaxp             x8, x1, [x0]
        orr               x9, x8, x2
        orr               x10, x1, x3
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_or::u128::seqcst:
0:
        ldaxp             x8, x1, [x0]
        orr               x9, x8, x2
        orr               x10, x1, x3
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_or::u128::acquire:
0:
        ldaxp             x8, x1, [x0]
        orr               x9, x8, x2
        orr               x10, x1, x3
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_or::u128::relaxed:
0:
        ldxp              x8, x1, [x0]
        orr               x9, x8, x2
        orr               x10, x1, x3
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_or::u128::release:
0:
        ldxp              x8, x1, [x0]
        orr               x9, x8, x2
        orr               x10, x1, x3
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::bit_clear::u8::acqrel:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        and               x9, x1, #0x7
        lsl               w19, w8, w9
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_clear::u8::seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        and               x9, x1, #0x7
        lsl               w19, w8, w9
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_clear::u8::acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        and               x9, x1, #0x7
        lsl               w19, w8, w9
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_clear::u8::relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        and               x9, x1, #0x7
        lsl               w19, w8, w9
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_clear::u8::release:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        and               x9, x1, #0x7
        lsl               w19, w8, w9
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_clear::u16::acqrel:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        and               x9, x1, #0xf
        lsl               w19, w8, w9
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_clear::u16::seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        and               x9, x1, #0xf
        lsl               w19, w8, w9
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_clear::u16::acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        and               x9, x1, #0xf
        lsl               w19, w8, w9
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_clear::u16::relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        and               x9, x1, #0xf
        lsl               w19, w8, w9
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_clear::u16::release:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        and               x9, x1, #0xf
        lsl               w19, w8, w9
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_clear::u32::acqrel:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        lsl               w19, w8, w1
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_clear::u32::seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        lsl               w19, w8, w1
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_clear::u32::acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        lsl               w19, w8, w1
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_clear::u32::relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        lsl               w19, w8, w1
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_clear::u32::release:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        lsl               w19, w8, w1
        mov               x1, x0
        mov               w0, w19
0:
        bl                0f
        tst               w0, w19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_clear::u64::acqrel:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        lsl               x19, x8, x1
        mov               x1, x0
        mov               x0, x19
0:
        bl                0f
        tst               x0, x19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_clear::u64::seqcst:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        lsl               x19, x8, x1
        mov               x1, x0
        mov               x0, x19
0:
        bl                0f
        tst               x0, x19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_clear::u64::acquire:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        lsl               x19, x8, x1
        mov               x1, x0
        mov               x0, x19
0:
        bl                0f
        tst               x0, x19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_clear::u64::relaxed:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        lsl               x19, x8, x1
        mov               x1, x0
        mov               x0, x19
0:
        bl                0f
        tst               x0, x19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_clear::u64::release:
        stp               x29, x30, [sp, #-0x20]!
        str               x19, [sp, #0x10]
        mov               x29, sp
        mov               w8, #0x1                // =1
        lsl               x19, x8, x1
        mov               x1, x0
        mov               x0, x19
0:
        bl                0f
        tst               x0, x19
        cset              w0, ne
        ldr               x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::bit_clear::u128::acqrel:
        mov               w8, #0x1                // =1
        and               w9, w1, #0x7f
        lsl               x8, x8, x9
        tst               x9, #0x40
        csel              x9, x8, xzr, ne
        csel              x8, xzr, x8, ne
        mvn               x10, x8
        mvn               x11, x9
0:
        ldaxp             x12, x13, [x0]
        and               x14, x12, x10
        and               x15, x13, x11
        stlxp             w16, x14, x15, [x0]
        cbnz              w16, 0b
        and               x9, x13, x9
        and               x8, x12, x8
        orr               x8, x8, x9
        cmp               x8, #0x0
        cset              w0, ne
        ret

asm_test::bit_clear::u128::seqcst:
        mov               w8, #0x1                // =1
        and               w9, w1, #0x7f
        lsl               x8, x8, x9
        tst               x9, #0x40
        csel              x9, x8, xzr, ne
        csel              x8, xzr, x8, ne
        mvn               x10, x8
        mvn               x11, x9
0:
        ldaxp             x12, x13, [x0]
        and               x14, x12, x10
        and               x15, x13, x11
        stlxp             w16, x14, x15, [x0]
        cbnz              w16, 0b
        and               x9, x13, x9
        and               x8, x12, x8
        orr               x8, x8, x9
        cmp               x8, #0x0
        cset              w0, ne
        ret

asm_test::bit_clear::u128::acquire:
        mov               w8, #0x1                // =1
        and               w9, w1, #0x7f
        lsl               x8, x8, x9
        tst               x9, #0x40
        csel              x9, x8, xzr, ne
        csel              x8, xzr, x8, ne
        mvn               x10, x8
        mvn               x11, x9
0:
        ldaxp             x12, x13, [x0]
        and               x14, x12, x10
        and               x15, x13, x11
        stxp              w16, x14, x15, [x0]
        cbnz              w16, 0b
        and               x9, x13, x9
        and               x8, x12, x8
        orr               x8, x8, x9
        cmp               x8, #0x0
        cset              w0, ne
        ret

asm_test::bit_clear::u128::relaxed:
        mov               w8, #0x1                // =1
        and               w9, w1, #0x7f
        lsl               x8, x8, x9
        tst               x9, #0x40
        csel              x9, x8, xzr, ne
        csel              x8, xzr, x8, ne
        mvn               x10, x8
        mvn               x11, x9
0:
        ldxp              x12, x13, [x0]
        and               x14, x12, x10
        and               x15, x13, x11
        stxp              w16, x14, x15, [x0]
        cbnz              w16, 0b
        and               x9, x13, x9
        and               x8, x12, x8
        orr               x8, x8, x9
        cmp               x8, #0x0
        cset              w0, ne
        ret

asm_test::bit_clear::u128::release:
        mov               w8, #0x1                // =1
        and               w9, w1, #0x7f
        lsl               x8, x8, x9
        tst               x9, #0x40
        csel              x9, x8, xzr, ne
        csel              x8, xzr, x8, ne
        mvn               x10, x8
        mvn               x11, x9
0:
        ldxp              x12, x13, [x0]
        and               x14, x12, x10
        and               x15, x13, x11
        stlxp             w16, x14, x15, [x0]
        cbnz              w16, 0b
        and               x9, x13, x9
        and               x8, x12, x8
        orr               x8, x8, x9
        cmp               x8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_abs::f32::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x80000000        // =-2147483648
0:
        bl                0f
        fmov              s0, w0
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_abs::f32::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x80000000        // =-2147483648
0:
        bl                0f
        fmov              s0, w0
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_abs::f32::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x80000000        // =-2147483648
0:
        bl                0f
        fmov              s0, w0
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_abs::f32::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x80000000        // =-2147483648
0:
        bl                0f
        fmov              s0, w0
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_abs::f32::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x80000000        // =-2147483648
0:
        bl                0f
        fmov              s0, w0
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_abs::f64::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, #-0x8000000000000000 // =-9223372036854775808
0:
        bl                0f
        fmov              d0, x0
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_abs::f64::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, #-0x8000000000000000 // =-9223372036854775808
0:
        bl                0f
        fmov              d0, x0
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_abs::f64::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, #-0x8000000000000000 // =-9223372036854775808
0:
        bl                0f
        fmov              d0, x0
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_abs::f64::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, #-0x8000000000000000 // =-9223372036854775808
0:
        bl                0f
        fmov              d0, x0
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_abs::f64::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, #-0x8000000000000000 // =-9223372036854775808
0:
        bl                0f
        fmov              d0, x0
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u8::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u8::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u8::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u8::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u8::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u8::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u8::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u8::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u8::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u8::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::f32::acqrel_zero:
        movi              d0, #0000000000000000
        ldfaddal          s0, s0, [x0]
        ret

asm_test::fetch_add::f32::seqcst_zero:
        movi              d0, #0000000000000000
        ldfaddal          s0, s0, [x0]
        ret

asm_test::fetch_add::f32::acquire_zero:
        movi              d0, #0000000000000000
        ldfadda           s0, s0, [x0]
        ret

asm_test::fetch_add::f32::relaxed_zero:
        movi              d0, #0000000000000000
        ldfadd            s0, s0, [x0]
        ret

asm_test::fetch_add::f32::release_zero:
        movi              d0, #0000000000000000
        ldfaddl           s0, s0, [x0]
        ret

asm_test::fetch_add::f32::acqrel:
        ldfaddal          s0, s0, [x0]
        ret

asm_test::fetch_add::f32::seqcst:
        ldfaddal          s0, s0, [x0]
        ret

asm_test::fetch_add::f32::acquire:
        ldfadda           s0, s0, [x0]
        ret

asm_test::fetch_add::f32::relaxed:
        ldfadd            s0, s0, [x0]
        ret

asm_test::fetch_add::f32::release:
        ldfaddl           s0, s0, [x0]
        ret

asm_test::fetch_add::f64::acqrel_zero:
        movi              d0, #0000000000000000
        ldfaddal          d0, d0, [x0]
        ret

asm_test::fetch_add::f64::seqcst_zero:
        movi              d0, #0000000000000000
        ldfaddal          d0, d0, [x0]
        ret

asm_test::fetch_add::f64::acquire_zero:
        movi              d0, #0000000000000000
        ldfadda           d0, d0, [x0]
        ret

asm_test::fetch_add::f64::relaxed_zero:
        movi              d0, #0000000000000000
        ldfadd            d0, d0, [x0]
        ret

asm_test::fetch_add::f64::release_zero:
        movi              d0, #0000000000000000
        ldfaddl           d0, d0, [x0]
        ret

asm_test::fetch_add::f64::acqrel:
        ldfaddal          d0, d0, [x0]
        ret

asm_test::fetch_add::f64::seqcst:
        ldfaddal          d0, d0, [x0]
        ret

asm_test::fetch_add::f64::acquire:
        ldfadda           d0, d0, [x0]
        ret

asm_test::fetch_add::f64::relaxed:
        ldfadd            d0, d0, [x0]
        ret

asm_test::fetch_add::f64::release:
        ldfaddl           d0, d0, [x0]
        ret

asm_test::fetch_add::u16::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u16::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u16::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u16::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u16::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u16::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u16::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u16::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u16::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u16::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u32::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u32::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u32::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u32::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u32::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u32::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u32::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u32::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u32::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u32::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u64::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u64::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u64::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u64::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u64::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u64::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u64::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u64::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u64::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u64::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_add::u128::acqrel_zero:
        mov               x9, xzr
0:
        ldaxp             x8, x1, [x0]
        adds              x10, x8, x9
        adc               x11, x1, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_add::u128::seqcst_zero:
        mov               x9, xzr
0:
        ldaxp             x8, x1, [x0]
        adds              x10, x8, x9
        adc               x11, x1, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_add::u128::acquire_zero:
        mov               x9, xzr
0:
        ldaxp             x8, x1, [x0]
        adds              x10, x8, x9
        adc               x11, x1, x9
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_add::u128::relaxed_zero:
        mov               x9, xzr
0:
        ldxp              x8, x1, [x0]
        adds              x10, x8, x9
        adc               x11, x1, x9
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_add::u128::release_zero:
        mov               x9, xzr
0:
        ldxp              x8, x1, [x0]
        adds              x10, x8, x9
        adc               x11, x1, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_add::u128::acqrel:
0:
        ldaxp             x8, x1, [x0]
        adds              x9, x8, x2
        adc               x10, x1, x3
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_add::u128::seqcst:
0:
        ldaxp             x8, x1, [x0]
        adds              x9, x8, x2
        adc               x10, x1, x3
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_add::u128::acquire:
0:
        ldaxp             x8, x1, [x0]
        adds              x9, x8, x2
        adc               x10, x1, x3
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_add::u128::relaxed:
0:
        ldxp              x8, x1, [x0]
        adds              x9, x8, x2
        adc               x10, x1, x3
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_add::u128::release:
0:
        ldxp              x8, x1, [x0]
        adds              x9, x8, x2
        adc               x10, x1, x3
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_and::u8::acqrel_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u8::seqcst_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u8::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u8::acquire_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u8::relaxed_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u8::release_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u8::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u8::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u8::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u8::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u8::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u8::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u8::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u8::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u8::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u16::acqrel_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u16::seqcst_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u16::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u16::acquire_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u16::relaxed_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u16::release_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u16::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u16::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u16::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u16::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u16::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u16::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u16::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u16::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u16::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u32::acqrel_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u32::seqcst_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u32::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u32::acquire_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u32::relaxed_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u32::release_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u32::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u32::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u32::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u32::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u32::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u32::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u32::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u32::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u32::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u64::acqrel_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u64::seqcst_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u64::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u64::acquire_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u64::relaxed_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u64::release_all:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u64::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u64::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u64::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u64::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u64::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u64::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u64::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u64::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u64::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::bool::acqrel_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x2               // =-2
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::bool::seqcst_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x2               // =-2
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::bool::acqrel_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::bool::acquire_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x2               // =-2
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::bool::relaxed_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x2               // =-2
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::bool::release_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x2               // =-2
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::bool::seqcst_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::bool::acquire_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::bool::relaxed_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::bool::release_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::bool::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::bool::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::bool::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::bool::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::bool::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mvn               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_and::u128::acqrel_all:
        mov               x9, #-0x1               // =-1
0:
        ldaxp             x8, x1, [x0]
        and               x10, x8, x9
        and               x11, x1, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_and::u128::seqcst_all:
        mov               x9, #-0x1               // =-1
0:
        ldaxp             x8, x1, [x0]
        and               x10, x8, x9
        and               x11, x1, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_and::u128::acqrel_zero:
        mov               x9, xzr
0:
        ldaxp             x8, x1, [x0]
        and               x10, x8, x9
        and               x11, x1, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_and::u128::acquire_all:
        mov               x9, #-0x1               // =-1
0:
        ldaxp             x8, x1, [x0]
        and               x10, x8, x9
        and               x11, x1, x9
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_and::u128::relaxed_all:
        mov               x9, #-0x1               // =-1
0:
        ldxp              x8, x1, [x0]
        and               x10, x8, x9
        and               x11, x1, x9
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_and::u128::release_all:
        mov               x9, #-0x1               // =-1
0:
        ldxp              x8, x1, [x0]
        and               x10, x8, x9
        and               x11, x1, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_and::u128::seqcst_zero:
        mov               x9, xzr
0:
        ldaxp             x8, x1, [x0]
        and               x10, x8, x9
        and               x11, x1, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_and::u128::acquire_zero:
        mov               x9, xzr
0:
        ldaxp             x8, x1, [x0]
        and               x10, x8, x9
        and               x11, x1, x9
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_and::u128::relaxed_zero:
        mov               x9, xzr
0:
        ldxp              x8, x1, [x0]
        and               x10, x8, x9
        and               x11, x1, x9
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_and::u128::release_zero:
        mov               x9, xzr
0:
        ldxp              x8, x1, [x0]
        and               x10, x8, x9
        and               x11, x1, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_and::u128::acqrel:
0:
        ldaxp             x8, x1, [x0]
        and               x9, x8, x2
        and               x10, x1, x3
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_and::u128::seqcst:
0:
        ldaxp             x8, x1, [x0]
        and               x9, x8, x2
        and               x10, x1, x3
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_and::u128::acquire:
0:
        ldaxp             x8, x1, [x0]
        and               x9, x8, x2
        and               x10, x1, x3
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_and::u128::relaxed:
0:
        ldxp              x8, x1, [x0]
        and               x9, x8, x2
        and               x10, x1, x3
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_and::u128::release:
0:
        ldxp              x8, x1, [x0]
        and               x9, x8, x2
        and               x10, x1, x3
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_max::i8::acqrel:
0:
        ldaxrb            w9, [x0]
        sxtb              w8, w9
        cmp               w8, w1, sxtb
        csel              w9, w9, w1, gt
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_max::i8::seqcst:
0:
        ldaxrb            w9, [x0]
        sxtb              w8, w9
        cmp               w8, w1, sxtb
        csel              w9, w9, w1, gt
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_max::i8::acquire:
0:
        ldaxrb            w9, [x0]
        sxtb              w8, w9
        cmp               w8, w1, sxtb
        csel              w9, w9, w1, gt
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_max::i8::relaxed:
0:
        ldxrb             w9, [x0]
        sxtb              w8, w9
        cmp               w8, w1, sxtb
        csel              w9, w9, w1, gt
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_max::i8::release:
0:
        ldxrb             w9, [x0]
        sxtb              w8, w9
        cmp               w8, w1, sxtb
        csel              w9, w9, w1, gt
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_max::f32::acqrel:
        ldfmaxnmal        s0, s0, [x0]
        ret

asm_test::fetch_max::f32::seqcst:
        ldfmaxnmal        s0, s0, [x0]
        ret

asm_test::fetch_max::f32::acquire:
        ldfmaxnma         s0, s0, [x0]
        ret

asm_test::fetch_max::f32::relaxed:
        ldfmaxnm          s0, s0, [x0]
        ret

asm_test::fetch_max::f32::release:
        ldfmaxnml         s0, s0, [x0]
        ret

asm_test::fetch_max::f64::acqrel:
        ldfmaxnmal        d0, d0, [x0]
        ret

asm_test::fetch_max::f64::seqcst:
        ldfmaxnmal        d0, d0, [x0]
        ret

asm_test::fetch_max::f64::acquire:
        ldfmaxnma         d0, d0, [x0]
        ret

asm_test::fetch_max::f64::relaxed:
        ldfmaxnm          d0, d0, [x0]
        ret

asm_test::fetch_max::f64::release:
        ldfmaxnml         d0, d0, [x0]
        ret

asm_test::fetch_max::i16::acqrel:
0:
        ldaxrh            w9, [x0]
        sxth              w8, w9
        cmp               w8, w1, sxth
        csel              w9, w9, w1, gt
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_max::i16::seqcst:
0:
        ldaxrh            w9, [x0]
        sxth              w8, w9
        cmp               w8, w1, sxth
        csel              w9, w9, w1, gt
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_max::i16::acquire:
0:
        ldaxrh            w9, [x0]
        sxth              w8, w9
        cmp               w8, w1, sxth
        csel              w9, w9, w1, gt
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_max::i16::relaxed:
0:
        ldxrh             w9, [x0]
        sxth              w8, w9
        cmp               w8, w1, sxth
        csel              w9, w9, w1, gt
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_max::i16::release:
0:
        ldxrh             w9, [x0]
        sxth              w8, w9
        cmp               w8, w1, sxth
        csel              w9, w9, w1, gt
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_max::i32::acqrel:
0:
        ldaxr             w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, gt
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_max::i32::seqcst:
0:
        ldaxr             w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, gt
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_max::i32::acquire:
0:
        ldaxr             w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, gt
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_max::i32::relaxed:
0:
        ldxr              w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, gt
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_max::i32::release:
0:
        ldxr              w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, gt
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_max::i64::acqrel:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, gt
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_max::i64::seqcst:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, gt
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_max::i64::acquire:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, gt
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_max::i64::relaxed:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, gt
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_max::i64::release:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, gt
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_max::i128::acqrel:
0:
        ldaxp             x8, x1, [x0]
        cmp               x2, x8
        sbcs              xzr, x3, x1
        csel              x10, x1, x3, lt
        csel              x9, x8, x2, lt
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_max::i128::seqcst:
0:
        ldaxp             x8, x1, [x0]
        cmp               x2, x8
        sbcs              xzr, x3, x1
        csel              x10, x1, x3, lt
        csel              x9, x8, x2, lt
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_max::i128::acquire:
0:
        ldaxp             x8, x1, [x0]
        cmp               x2, x8
        sbcs              xzr, x3, x1
        csel              x10, x1, x3, lt
        csel              x9, x8, x2, lt
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_max::i128::relaxed:
0:
        ldxp              x8, x1, [x0]
        cmp               x2, x8
        sbcs              xzr, x3, x1
        csel              x10, x1, x3, lt
        csel              x9, x8, x2, lt
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_max::i128::release:
0:
        ldxp              x8, x1, [x0]
        cmp               x2, x8
        sbcs              xzr, x3, x1
        csel              x10, x1, x3, lt
        csel              x9, x8, x2, lt
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_min::i8::acqrel:
0:
        ldaxrb            w9, [x0]
        sxtb              w8, w9
        cmp               w8, w1, sxtb
        csel              w9, w9, w1, le
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_min::i8::seqcst:
0:
        ldaxrb            w9, [x0]
        sxtb              w8, w9
        cmp               w8, w1, sxtb
        csel              w9, w9, w1, le
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_min::i8::acquire:
0:
        ldaxrb            w9, [x0]
        sxtb              w8, w9
        cmp               w8, w1, sxtb
        csel              w9, w9, w1, le
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_min::i8::relaxed:
0:
        ldxrb             w9, [x0]
        sxtb              w8, w9
        cmp               w8, w1, sxtb
        csel              w9, w9, w1, le
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_min::i8::release:
0:
        ldxrb             w9, [x0]
        sxtb              w8, w9
        cmp               w8, w1, sxtb
        csel              w9, w9, w1, le
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_min::f32::acqrel:
        ldfminnmal        s0, s0, [x0]
        ret

asm_test::fetch_min::f32::seqcst:
        ldfminnmal        s0, s0, [x0]
        ret

asm_test::fetch_min::f32::acquire:
        ldfminnma         s0, s0, [x0]
        ret

asm_test::fetch_min::f32::relaxed:
        ldfminnm          s0, s0, [x0]
        ret

asm_test::fetch_min::f32::release:
        ldfminnml         s0, s0, [x0]
        ret

asm_test::fetch_min::f64::acqrel:
        ldfminnmal        d0, d0, [x0]
        ret

asm_test::fetch_min::f64::seqcst:
        ldfminnmal        d0, d0, [x0]
        ret

asm_test::fetch_min::f64::acquire:
        ldfminnma         d0, d0, [x0]
        ret

asm_test::fetch_min::f64::relaxed:
        ldfminnm          d0, d0, [x0]
        ret

asm_test::fetch_min::f64::release:
        ldfminnml         d0, d0, [x0]
        ret

asm_test::fetch_min::i16::acqrel:
0:
        ldaxrh            w9, [x0]
        sxth              w8, w9
        cmp               w8, w1, sxth
        csel              w9, w9, w1, le
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_min::i16::seqcst:
0:
        ldaxrh            w9, [x0]
        sxth              w8, w9
        cmp               w8, w1, sxth
        csel              w9, w9, w1, le
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_min::i16::acquire:
0:
        ldaxrh            w9, [x0]
        sxth              w8, w9
        cmp               w8, w1, sxth
        csel              w9, w9, w1, le
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_min::i16::relaxed:
0:
        ldxrh             w9, [x0]
        sxth              w8, w9
        cmp               w8, w1, sxth
        csel              w9, w9, w1, le
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_min::i16::release:
0:
        ldxrh             w9, [x0]
        sxth              w8, w9
        cmp               w8, w1, sxth
        csel              w9, w9, w1, le
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_min::i32::acqrel:
0:
        ldaxr             w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, le
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_min::i32::seqcst:
0:
        ldaxr             w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, le
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_min::i32::acquire:
0:
        ldaxr             w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, le
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_min::i32::relaxed:
0:
        ldxr              w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, le
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_min::i32::release:
0:
        ldxr              w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, le
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_min::i64::acqrel:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, le
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_min::i64::seqcst:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, le
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_min::i64::acquire:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, le
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_min::i64::relaxed:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, le
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_min::i64::release:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, le
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_min::i128::acqrel:
0:
        ldaxp             x8, x1, [x0]
        cmp               x2, x8
        sbcs              xzr, x3, x1
        csel              x10, x1, x3, ge
        csel              x9, x8, x2, ge
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_min::i128::seqcst:
0:
        ldaxp             x8, x1, [x0]
        cmp               x2, x8
        sbcs              xzr, x3, x1
        csel              x10, x1, x3, ge
        csel              x9, x8, x2, ge
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_min::i128::acquire:
0:
        ldaxp             x8, x1, [x0]
        cmp               x2, x8
        sbcs              xzr, x3, x1
        csel              x10, x1, x3, ge
        csel              x9, x8, x2, ge
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_min::i128::relaxed:
0:
        ldxp              x8, x1, [x0]
        cmp               x2, x8
        sbcs              xzr, x3, x1
        csel              x10, x1, x3, ge
        csel              x9, x8, x2, ge
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_min::i128::release:
0:
        ldxp              x8, x1, [x0]
        cmp               x2, x8
        sbcs              xzr, x3, x1
        csel              x10, x1, x3, ge
        csel              x9, x8, x2, ge
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_neg::u8::acqrel:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldrb              w20, [x0]
        mov               x19, x0
0:
        neg               w1, w20
        mov               w0, w20
        mov               x2, x19
1:
        bl                1f
        cmp               w0, w20, uxtb
        mov               w20, w0
        b.ne              0b
        mov               w0, w20
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::fetch_neg::u8::seqcst:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldrb              w20, [x0]
        mov               x19, x0
0:
        neg               w1, w20
        mov               w0, w20
        mov               x2, x19
1:
        bl                1f
        cmp               w0, w20, uxtb
        mov               w20, w0
        b.ne              0b
        mov               w0, w20
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::fetch_neg::u8::acquire:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldrb              w20, [x0]
        mov               x19, x0
0:
        neg               w1, w20
        mov               w0, w20
        mov               x2, x19
1:
        bl                1f
        cmp               w0, w20, uxtb
        mov               w20, w0
        b.ne              0b
        mov               w0, w20
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::fetch_neg::u8::relaxed:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldrb              w20, [x0]
        mov               x19, x0
0:
        neg               w1, w20
        mov               w0, w20
        mov               x2, x19
1:
        bl                1f
        cmp               w0, w20, uxtb
        mov               w20, w0
        b.ne              0b
        mov               w0, w20
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::fetch_neg::u8::release:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldrb              w20, [x0]
        mov               x19, x0
0:
        neg               w1, w20
        mov               w0, w20
        mov               x2, x19
1:
        bl                1f
        cmp               w0, w20, uxtb
        mov               w20, w0
        b.ne              0b
        mov               w0, w20
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::fetch_neg::f32::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x80000000        // =-2147483648
0:
        bl                0f
        fmov              s0, w0
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_neg::f32::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x80000000        // =-2147483648
0:
        bl                0f
        fmov              s0, w0
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_neg::f32::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x80000000        // =-2147483648
0:
        bl                0f
        fmov              s0, w0
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_neg::f32::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x80000000        // =-2147483648
0:
        bl                0f
        fmov              s0, w0
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_neg::f32::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x80000000        // =-2147483648
0:
        bl                0f
        fmov              s0, w0
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_neg::f64::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, #-0x8000000000000000 // =-9223372036854775808
0:
        bl                0f
        fmov              d0, x0
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_neg::f64::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, #-0x8000000000000000 // =-9223372036854775808
0:
        bl                0f
        fmov              d0, x0
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_neg::f64::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, #-0x8000000000000000 // =-9223372036854775808
0:
        bl                0f
        fmov              d0, x0
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_neg::f64::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, #-0x8000000000000000 // =-9223372036854775808
0:
        bl                0f
        fmov              d0, x0
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_neg::f64::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, #-0x8000000000000000 // =-9223372036854775808
0:
        bl                0f
        fmov              d0, x0
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_neg::u16::acqrel:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldrh              w20, [x0]
        mov               x19, x0
0:
        neg               w1, w20
        mov               w0, w20
        mov               x2, x19
1:
        bl                1f
        cmp               w0, w20, uxth
        mov               w20, w0
        b.ne              0b
        mov               w0, w20
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::fetch_neg::u16::seqcst:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldrh              w20, [x0]
        mov               x19, x0
0:
        neg               w1, w20
        mov               w0, w20
        mov               x2, x19
1:
        bl                1f
        cmp               w0, w20, uxth
        mov               w20, w0
        b.ne              0b
        mov               w0, w20
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::fetch_neg::u16::acquire:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldrh              w20, [x0]
        mov               x19, x0
0:
        neg               w1, w20
        mov               w0, w20
        mov               x2, x19
1:
        bl                1f
        cmp               w0, w20, uxth
        mov               w20, w0
        b.ne              0b
        mov               w0, w20
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::fetch_neg::u16::relaxed:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldrh              w20, [x0]
        mov               x19, x0
0:
        neg               w1, w20
        mov               w0, w20
        mov               x2, x19
1:
        bl                1f
        cmp               w0, w20, uxth
        mov               w20, w0
        b.ne              0b
        mov               w0, w20
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::fetch_neg::u16::release:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldrh              w20, [x0]
        mov               x19, x0
0:
        neg               w1, w20
        mov               w0, w20
        mov               x2, x19
1:
        bl                1f
        cmp               w0, w20, uxth
        mov               w20, w0
        b.ne              0b
        mov               w0, w20
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::fetch_neg::u32::acqrel:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldr               w20, [x0]
        mov               x19, x0
0:
        neg               w1, w20
        mov               w0, w20
        mov               x2, x19
1:
        bl                1f
        cmp               w0, w20
        mov               w20, w0
        b.ne              0b
        mov               w0, w20
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::fetch_neg::u32::seqcst:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldr               w20, [x0]
        mov               x19, x0
0:
        neg               w1, w20
        mov               w0, w20
        mov               x2, x19
1:
        bl                1f
        cmp               w0, w20
        mov               w20, w0
        b.ne              0b
        mov               w0, w20
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::fetch_neg::u32::acquire:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldr               w20, [x0]
        mov               x19, x0
0:
        neg               w1, w20
        mov               w0, w20
        mov               x2, x19
1:
        bl                1f
        cmp               w0, w20
        mov               w20, w0
        b.ne              0b
        mov               w0, w20
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::fetch_neg::u32::relaxed:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldr               w20, [x0]
        mov               x19, x0
0:
        neg               w1, w20
        mov               w0, w20
        mov               x2, x19
1:
        bl                1f
        cmp               w0, w20
        mov               w20, w0
        b.ne              0b
        mov               w0, w20
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::fetch_neg::u32::release:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldr               w20, [x0]
        mov               x19, x0
0:
        neg               w1, w20
        mov               w0, w20
        mov               x2, x19
1:
        bl                1f
        cmp               w0, w20
        mov               w20, w0
        b.ne              0b
        mov               w0, w20
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::fetch_neg::u64::acqrel:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldr               x20, [x0]
        mov               x19, x0
0:
        neg               x1, x20
        mov               x0, x20
        mov               x2, x19
1:
        bl                1f
        cmp               x0, x20
        mov               x20, x0
        b.ne              0b
        mov               x0, x20
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::fetch_neg::u64::seqcst:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldr               x20, [x0]
        mov               x19, x0
0:
        neg               x1, x20
        mov               x0, x20
        mov               x2, x19
1:
        bl                1f
        cmp               x0, x20
        mov               x20, x0
        b.ne              0b
        mov               x0, x20
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::fetch_neg::u64::acquire:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldr               x20, [x0]
        mov               x19, x0
0:
        neg               x1, x20
        mov               x0, x20
        mov               x2, x19
1:
        bl                1f
        cmp               x0, x20
        mov               x20, x0
        b.ne              0b
        mov               x0, x20
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::fetch_neg::u64::relaxed:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldr               x20, [x0]
        mov               x19, x0
0:
        neg               x1, x20
        mov               x0, x20
        mov               x2, x19
1:
        bl                1f
        cmp               x0, x20
        mov               x20, x0
        b.ne              0b
        mov               x0, x20
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::fetch_neg::u64::release:
        stp               x29, x30, [sp, #-0x20]!
        stp               x20, x19, [sp, #0x10]
        mov               x29, sp
        ldr               x20, [x0]
        mov               x19, x0
0:
        neg               x1, x20
        mov               x0, x20
        mov               x2, x19
1:
        bl                1f
        cmp               x0, x20
        mov               x20, x0
        b.ne              0b
        mov               x0, x20
        ldp               x20, x19, [sp, #0x10]
        ldp               x29, x30, [sp], #0x20
        ret

asm_test::fetch_neg::u128::acqrel:
0:
        ldaxp             x8, x1, [x0]
        negs              x9, x8
        ngc               x10, x1
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_neg::u128::seqcst:
0:
        ldaxp             x8, x1, [x0]
        negs              x9, x8
        ngc               x10, x1
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_neg::u128::acquire:
0:
        ldaxp             x8, x1, [x0]
        negs              x9, x8
        ngc               x10, x1
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_neg::u128::relaxed:
0:
        ldxp              x8, x1, [x0]
        negs              x9, x8
        ngc               x10, x1
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_neg::u128::release:
0:
        ldxp              x8, x1, [x0]
        negs              x9, x8
        ngc               x10, x1
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_not::u8::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_not::u8::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_not::u8::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_not::u8::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_not::u8::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_not::u16::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_not::u16::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_not::u16::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_not::u16::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_not::u16::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_not::u32::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_not::u32::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_not::u32::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_not::u32::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_not::u32::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_not::u64::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_not::u64::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_not::u64::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_not::u64::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_not::u64::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, #-0x1               // =-1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_not::bool::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_not::bool::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_not::bool::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_not::bool::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_not::bool::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_not::u128::acqrel:
0:
        ldaxp             x8, x1, [x0]
        mvn               x9, x8
        mvn               x10, x1
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_not::u128::seqcst:
0:
        ldaxp             x8, x1, [x0]
        mvn               x9, x8
        mvn               x10, x1
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_not::u128::acquire:
0:
        ldaxp             x8, x1, [x0]
        mvn               x9, x8
        mvn               x10, x1
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_not::u128::relaxed:
0:
        ldxp              x8, x1, [x0]
        mvn               x9, x8
        mvn               x10, x1
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_not::u128::release:
0:
        ldxp              x8, x1, [x0]
        mvn               x9, x8
        mvn               x10, x1
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_sub::u8::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u8::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u8::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u8::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u8::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u8::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u8::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u8::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u8::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u8::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::f32::acqrel_zero:
        movi              v0.2s, #0x80, lsl #24
        ldfaddal          s0, s0, [x0]
        ret

asm_test::fetch_sub::f32::seqcst_zero:
        movi              v0.2s, #0x80, lsl #24
        ldfaddal          s0, s0, [x0]
        ret

asm_test::fetch_sub::f32::acquire_zero:
        movi              v0.2s, #0x80, lsl #24
        ldfadda           s0, s0, [x0]
        ret

asm_test::fetch_sub::f32::relaxed_zero:
        movi              v0.2s, #0x80, lsl #24
        ldfadd            s0, s0, [x0]
        ret

asm_test::fetch_sub::f32::release_zero:
        movi              v0.2s, #0x80, lsl #24
        ldfaddl           s0, s0, [x0]
        ret

asm_test::fetch_sub::f32::acqrel:
        fneg              s0, s0
        ldfaddal          s0, s0, [x0]
        ret

asm_test::fetch_sub::f32::seqcst:
        fneg              s0, s0
        ldfaddal          s0, s0, [x0]
        ret

asm_test::fetch_sub::f32::acquire:
        fneg              s0, s0
        ldfadda           s0, s0, [x0]
        ret

asm_test::fetch_sub::f32::relaxed:
        fneg              s0, s0
        ldfadd            s0, s0, [x0]
        ret

asm_test::fetch_sub::f32::release:
        fneg              s0, s0
        ldfaddl           s0, s0, [x0]
        ret

asm_test::fetch_sub::f64::acqrel_zero:
        mov               x8, #-0x8000000000000000 // =-9223372036854775808
        fmov              d0, x8
        ldfaddal          d0, d0, [x0]
        ret

asm_test::fetch_sub::f64::seqcst_zero:
        mov               x8, #-0x8000000000000000 // =-9223372036854775808
        fmov              d0, x8
        ldfaddal          d0, d0, [x0]
        ret

asm_test::fetch_sub::f64::acquire_zero:
        mov               x8, #-0x8000000000000000 // =-9223372036854775808
        fmov              d0, x8
        ldfadda           d0, d0, [x0]
        ret

asm_test::fetch_sub::f64::relaxed_zero:
        mov               x8, #-0x8000000000000000 // =-9223372036854775808
        fmov              d0, x8
        ldfadd            d0, d0, [x0]
        ret

asm_test::fetch_sub::f64::release_zero:
        mov               x8, #-0x8000000000000000 // =-9223372036854775808
        fmov              d0, x8
        ldfaddl           d0, d0, [x0]
        ret

asm_test::fetch_sub::f64::acqrel:
        fneg              d0, d0
        ldfaddal          d0, d0, [x0]
        ret

asm_test::fetch_sub::f64::seqcst:
        fneg              d0, d0
        ldfaddal          d0, d0, [x0]
        ret

asm_test::fetch_sub::f64::acquire:
        fneg              d0, d0
        ldfadda           d0, d0, [x0]
        ret

asm_test::fetch_sub::f64::relaxed:
        fneg              d0, d0
        ldfadd            d0, d0, [x0]
        ret

asm_test::fetch_sub::f64::release:
        fneg              d0, d0
        ldfaddl           d0, d0, [x0]
        ret

asm_test::fetch_sub::u16::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u16::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u16::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u16::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u16::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u16::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u16::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u16::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u16::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u16::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u32::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u32::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u32::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u32::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u32::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u32::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u32::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u32::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u32::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u32::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u64::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u64::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u64::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u64::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u64::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u64::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u64::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u64::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u64::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u64::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        neg               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_sub::u128::acqrel_zero:
        mov               x9, xzr
0:
        ldaxp             x8, x1, [x0]
        subs              x10, x8, x9
        sbc               x11, x1, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_sub::u128::seqcst_zero:
        mov               x9, xzr
0:
        ldaxp             x8, x1, [x0]
        subs              x10, x8, x9
        sbc               x11, x1, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_sub::u128::acquire_zero:
        mov               x9, xzr
0:
        ldaxp             x8, x1, [x0]
        subs              x10, x8, x9
        sbc               x11, x1, x9
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_sub::u128::relaxed_zero:
        mov               x9, xzr
0:
        ldxp              x8, x1, [x0]
        subs              x10, x8, x9
        sbc               x11, x1, x9
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_sub::u128::release_zero:
        mov               x9, xzr
0:
        ldxp              x8, x1, [x0]
        subs              x10, x8, x9
        sbc               x11, x1, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_sub::u128::acqrel:
0:
        ldaxp             x8, x1, [x0]
        subs              x9, x8, x2
        sbc               x10, x1, x3
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_sub::u128::seqcst:
0:
        ldaxp             x8, x1, [x0]
        subs              x9, x8, x2
        sbc               x10, x1, x3
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_sub::u128::acquire:
0:
        ldaxp             x8, x1, [x0]
        subs              x9, x8, x2
        sbc               x10, x1, x3
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_sub::u128::relaxed:
0:
        ldxp              x8, x1, [x0]
        subs              x9, x8, x2
        sbc               x10, x1, x3
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_sub::u128::release:
0:
        ldxp              x8, x1, [x0]
        subs              x9, x8, x2
        sbc               x10, x1, x3
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_xor::u8::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u8::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u8::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u8::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u8::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u8::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u8::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u8::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u8::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u8::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u16::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u16::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u16::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u16::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u16::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u16::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u16::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u16::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u16::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u16::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u32::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u32::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u32::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u32::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u32::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u32::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u32::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u32::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u32::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u32::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u64::acqrel_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u64::seqcst_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u64::acquire_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u64::relaxed_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u64::release_zero:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               x0, xzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u64::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u64::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u64::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u64::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u64::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               x0, x1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::bool::acqrel_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::bool::seqcst_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::bool::acqrel_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::bool::acquire_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::bool::relaxed_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::bool::release_true:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, #0x1                // =1
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::bool::seqcst_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::bool::acquire_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::bool::relaxed_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::bool::release_false:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x1, x0
        mov               w0, wzr
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::bool::acqrel:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::bool::seqcst:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::bool::acquire:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::bool::relaxed:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::bool::release:
        stp               x29, x30, [sp, #-0x10]!
        mov               x29, sp
        mov               x8, x0
        mov               w0, w1
        mov               x1, x8
0:
        bl                0f
        ldp               x29, x30, [sp], #0x10
        ret

asm_test::fetch_xor::u128::acqrel_zero:
        mov               x9, xzr
0:
        ldaxp             x8, x1, [x0]
        eor               x10, x8, x9
        eor               x11, x1, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_xor::u128::seqcst_zero:
        mov               x9, xzr
0:
        ldaxp             x8, x1, [x0]
        eor               x10, x8, x9
        eor               x11, x1, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_xor::u128::acquire_zero:
        mov               x9, xzr
0:
        ldaxp             x8, x1, [x0]
        eor               x10, x8, x9
        eor               x11, x1, x9
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_xor::u128::relaxed_zero:
        mov               x9, xzr
0:
        ldxp              x8, x1, [x0]
        eor               x10, x8, x9
        eor               x11, x1, x9
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_xor::u128::release_zero:
        mov               x9, xzr
0:
        ldxp              x8, x1, [x0]
        eor               x10, x8, x9
        eor               x11, x1, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        mov               x0, x8
        ret

asm_test::fetch_xor::u128::acqrel:
0:
        ldaxp             x8, x1, [x0]
        eor               x9, x8, x2
        eor               x10, x1, x3
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_xor::u128::seqcst:
0:
        ldaxp             x8, x1, [x0]
        eor               x9, x8, x2
        eor               x10, x1, x3
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_xor::u128::acquire:
0:
        ldaxp             x8, x1, [x0]
        eor               x9, x8, x2
        eor               x10, x1, x3
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_xor::u128::relaxed:
0:
        ldxp              x8, x1, [x0]
        eor               x9, x8, x2
        eor               x10, x1, x3
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_xor::u128::release:
0:
        ldxp              x8, x1, [x0]
        eor               x9, x8, x2
        eor               x10, x1, x3
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

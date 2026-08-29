ltmp0:
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
        and               x8, x1, #0x7
        mov               w9, #0x1                ; =1
        lsl               w8, w9, w8
        ldeoralb          w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret
        and               x8, x1, #0x7
        mov               w9, #0x1                ; =1
        lsl               w8, w9, w8
        ldeoralb          w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret

asm_test::bit_toggle::u8::acquire:
        and               x8, x1, #0x7
        mov               w9, #0x1                ; =1
        lsl               w8, w9, w8
        ldeorab           w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret

asm_test::bit_toggle::u8::relaxed:
        and               x8, x1, #0x7
        mov               w9, #0x1                ; =1
        lsl               w8, w9, w8
        ldeorb            w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret

asm_test::bit_toggle::u8::release:
        and               x8, x1, #0x7
        mov               w9, #0x1                ; =1
        lsl               w8, w9, w8
        ldeorlb           w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret
        and               x8, x1, #0xf
        mov               w9, #0x1                ; =1
        lsl               w8, w9, w8
        ldeoralh          w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret
        and               x8, x1, #0xf
        mov               w9, #0x1                ; =1
        lsl               w8, w9, w8
        ldeoralh          w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret
        and               x8, x1, #0xf
        mov               w9, #0x1                ; =1
        lsl               w8, w9, w8
        ldeorah           w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret

asm_test::bit_toggle::u16::relaxed:
        and               x8, x1, #0xf
        mov               w9, #0x1                ; =1
        lsl               w8, w9, w8
        ldeorh            w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret
        and               x8, x1, #0xf
        mov               w9, #0x1                ; =1
        lsl               w8, w9, w8
        ldeorlh           w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret

asm_test::bit_toggle::u32::acqrel:
        mov               w8, #0x1                ; =1
        lsl               w8, w8, w1
        ldeoral           w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret

asm_test::bit_toggle::u32::seqcst:
        mov               w8, #0x1                ; =1
        lsl               w8, w8, w1
        ldeoral           w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret

asm_test::bit_toggle::u32::acquire:
        mov               w8, #0x1                ; =1
        lsl               w8, w8, w1
        ldeora            w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret

asm_test::bit_toggle::u32::relaxed:
        mov               w8, #0x1                ; =1
        lsl               w8, w8, w1
        ldeor             w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret

asm_test::bit_toggle::u32::release:
        mov               w8, #0x1                ; =1
        lsl               w8, w8, w1
        ldeorl            w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret
        mov               w8, #0x1                ; =1
        lsl               x8, x8, x1
        ldeoral           x8, x9, [x0]
        tst               x9, x8
        cset              w0, ne
        ret
        mov               w8, #0x1                ; =1
        lsl               x8, x8, x1
        ldeoral           x8, x9, [x0]
        tst               x9, x8
        cset              w0, ne
        ret
        mov               w8, #0x1                ; =1
        lsl               x8, x8, x1
        ldeora            x8, x9, [x0]
        tst               x9, x8
        cset              w0, ne
        ret
        mov               w8, #0x1                ; =1
        lsl               x8, x8, x1
        ldeor             x8, x9, [x0]
        tst               x9, x8
        cset              w0, ne
        ret

asm_test::bit_toggle::u64::release:
        mov               w8, #0x1                ; =1
        lsl               x8, x8, x1
        ldeorl            x8, x9, [x0]
        tst               x9, x8
        cset              w0, ne
        ret

asm_test::bit_toggle::u128::acqrel:
        and               w8, w1, #0x7f
        mov               w9, #0x1                ; =1
        lsl               x9, x9, x8
        tst               x8, #0x40
        csel              x8, xzr, x9, ne
        csel              x9, x9, xzr, ne
        ldaxp             x10, x11, [x0]
        eor               x12, x10, x8
        eor               x13, x11, x9
        stlxp             w14, x12, x13, [x0]
        cbnz              w14, 0x240 <asm_test::bit_toggle::u128::acqrel+0x18>
        and               x9, x11, x9
        and               x8, x10, x8
        orr               x8, x8, x9
        cmp               x8, #0x0
        cset              w0, ne
        ret
        and               w8, w1, #0x7f
        mov               w9, #0x1                ; =1
        lsl               x9, x9, x8
        tst               x8, #0x40
        csel              x8, xzr, x9, ne
        csel              x9, x9, xzr, ne
        ldaxp             x10, x11, [x0]
        eor               x12, x10, x8
        eor               x13, x11, x9
        stlxp             w14, x12, x13, [x0]
        cbnz              w14, 0x284 <asm_test::bit_toggle::u128::seqcst+0x18>
        and               x9, x11, x9
        and               x8, x10, x8
        orr               x8, x8, x9
        cmp               x8, #0x0
        cset              w0, ne
        ret
        and               w8, w1, #0x7f
        mov               w9, #0x1                ; =1
        lsl               x9, x9, x8
        tst               x8, #0x40
        csel              x8, xzr, x9, ne
        csel              x9, x9, xzr, ne
        ldaxp             x10, x11, [x0]
        eor               x12, x10, x8
        eor               x13, x11, x9
        stxp              w14, x12, x13, [x0]
        cbnz              w14, 0x2c8 <asm_test::bit_toggle::u128::acquire+0x18>
        and               x9, x11, x9
        and               x8, x10, x8
        orr               x8, x8, x9
        cmp               x8, #0x0
        cset              w0, ne
        ret
        and               w8, w1, #0x7f
        mov               w9, #0x1                ; =1
        lsl               x9, x9, x8
        tst               x8, #0x40
        csel              x8, xzr, x9, ne
        csel              x9, x9, xzr, ne
        ldxp              x10, x11, [x0]
        eor               x12, x10, x8
        eor               x13, x11, x9
        stxp              w14, x12, x13, [x0]
        cbnz              w14, 0x30c <asm_test::bit_toggle::u128::relaxed+0x18>
        and               x9, x11, x9
        and               x8, x10, x8
        orr               x8, x8, x9
        cmp               x8, #0x0
        cset              w0, ne
        ret

asm_test::bit_toggle::u128::release:
        and               w8, w1, #0x7f
        mov               w9, #0x1                ; =1
        lsl               x9, x9, x8
        tst               x8, #0x40
        csel              x8, xzr, x9, ne
        csel              x9, x9, xzr, ne
        ldxp              x10, x11, [x0]
        eor               x12, x10, x8
        eor               x13, x11, x9
        stlxp             w14, x12, x13, [x0]
        cbnz              w14, 0x350 <asm_test::bit_toggle::u128::release+0x18>
        and               x9, x11, x9
        and               x8, x10, x8
        orr               x8, x8, x9
        cmp               x8, #0x0
        cset              w0, ne
        ret
        ldrb              w8, [x0]
        mov               x9, x8
        and               w10, w8, w1
        mvn               w10, w10
        casalb            w9, w10, [x0]
        cmp               w9, w8, uxtb
        mov               x8, x9
        b.ne              0x384 <asm_test::fetch_nand::u8::acqrel+0x8>
        mov               x0, x8
        ret
        ldrb              w8, [x0]
        mov               x9, x8
        and               w10, w8, w1
        mvn               w10, w10
        casalb            w9, w10, [x0]
        cmp               w9, w8, uxtb
        mov               x8, x9
        b.ne              0x3ac <asm_test::fetch_nand::u8::seqcst+0x8>
        mov               x0, x8
        ret
        ldrb              w8, [x0]
        mov               x9, x8
        and               w10, w8, w1
        mvn               w10, w10
        casab             w9, w10, [x0]
        cmp               w9, w8, uxtb
        mov               x8, x9
        b.ne              0x3d4 <asm_test::fetch_nand::u8::acquire+0x8>
        mov               x0, x8
        ret
        ldrb              w8, [x0]
        mov               x9, x8
        and               w10, w8, w1
        mvn               w10, w10
        casb              w9, w10, [x0]
        cmp               w9, w8, uxtb
        mov               x8, x9
        b.ne              0x3fc <asm_test::fetch_nand::u8::relaxed+0x8>
        mov               x0, x8
        ret
        ldrb              w8, [x0]
        mov               x9, x8
        and               w10, w8, w1
        mvn               w10, w10
        caslb             w9, w10, [x0]
        cmp               w9, w8, uxtb
        mov               x8, x9
        b.ne              0x424 <asm_test::fetch_nand::u8::release+0x8>
        mov               x0, x8
        ret

asm_test::fetch_nand::u16::acqrel:
        ldrh              w8, [x0]
        mov               x9, x8
        and               w10, w8, w1
        mvn               w10, w10
        casalh            w9, w10, [x0]
        cmp               w9, w8, uxth
        mov               x8, x9
        b.ne              0x44c <asm_test::fetch_nand::u16::acqrel+0x8>
        mov               x0, x8
        ret
        ldrh              w8, [x0]
        mov               x9, x8
        and               w10, w8, w1
        mvn               w10, w10
        casalh            w9, w10, [x0]
        cmp               w9, w8, uxth
        mov               x8, x9
        b.ne              0x474 <asm_test::fetch_nand::u16::seqcst+0x8>
        mov               x0, x8
        ret

asm_test::fetch_nand::u16::acquire:
        ldrh              w8, [x0]
        mov               x9, x8
        and               w10, w8, w1
        mvn               w10, w10
        casah             w9, w10, [x0]
        cmp               w9, w8, uxth
        mov               x8, x9
        b.ne              0x49c <asm_test::fetch_nand::u16::acquire+0x8>
        mov               x0, x8
        ret
        ldrh              w8, [x0]
        mov               x9, x8
        and               w10, w8, w1
        mvn               w10, w10
        cash              w9, w10, [x0]
        cmp               w9, w8, uxth
        mov               x8, x9
        b.ne              0x4c4 <asm_test::fetch_nand::u16::relaxed+0x8>
        mov               x0, x8
        ret
        ldrh              w8, [x0]
        mov               x9, x8
        and               w10, w8, w1
        mvn               w10, w10
        caslh             w9, w10, [x0]
        cmp               w9, w8, uxth
        mov               x8, x9
        b.ne              0x4ec <asm_test::fetch_nand::u16::release+0x8>
        mov               x0, x8
        ret
        ldr               w8, [x0]
        mov               x9, x8
        and               w10, w8, w1
        mvn               w10, w10
        casal             w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x514 <asm_test::fetch_nand::u32::acqrel+0x8>
        mov               x0, x8
        ret

asm_test::fetch_nand::u32::seqcst:
        ldr               w8, [x0]
        mov               x9, x8
        and               w10, w8, w1
        mvn               w10, w10
        casal             w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x53c <asm_test::fetch_nand::u32::seqcst+0x8>
        mov               x0, x8
        ret
        ldr               w8, [x0]
        mov               x9, x8
        and               w10, w8, w1
        mvn               w10, w10
        casa              w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x564 <asm_test::fetch_nand::u32::acquire+0x8>
        mov               x0, x8
        ret

asm_test::fetch_nand::u32::relaxed:
        ldr               w8, [x0]
        mov               x9, x8
        and               w10, w8, w1
        mvn               w10, w10
        cas               w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x58c <asm_test::fetch_nand::u32::relaxed+0x8>
        mov               x0, x8
        ret
        ldr               w8, [x0]
        mov               x9, x8
        and               w10, w8, w1
        mvn               w10, w10
        casl              w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x5b4 <asm_test::fetch_nand::u32::release+0x8>
        mov               x0, x8
        ret
        ldr               x8, [x0]
        mov               x9, x8
        and               x10, x8, x1
        mvn               x10, x10
        casal             x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x5dc <asm_test::fetch_nand::u64::acqrel+0x8>
        mov               x0, x8
        ret
        ldr               x8, [x0]
        mov               x9, x8
        and               x10, x8, x1
        mvn               x10, x10
        casal             x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x604 <asm_test::fetch_nand::u64::seqcst+0x8>
        mov               x0, x8
        ret

asm_test::fetch_nand::u64::acquire:
        ldr               x8, [x0]
        mov               x9, x8
        and               x10, x8, x1
        mvn               x10, x10
        casa              x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x62c <asm_test::fetch_nand::u64::acquire+0x8>
        mov               x0, x8
        ret
        ldr               x8, [x0]
        mov               x9, x8
        and               x10, x8, x1
        mvn               x10, x10
        cas               x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x654 <asm_test::fetch_nand::u64::relaxed+0x8>
        mov               x0, x8
        ret

asm_test::fetch_nand::u64::release:
        ldr               x8, [x0]
        mov               x9, x8
        and               x10, x8, x1
        mvn               x10, x10
        casl              x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x67c <asm_test::fetch_nand::u64::release+0x8>
        mov               x0, x8
        ret
        mov               w8, #0x1                ; =1
        tbz               w1, #0x0, 0x6b4 <asm_test::fetch_nand::bool::acqrel+0x18>
        ldeoralb          w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        swpalb            w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        mov               w8, #0x1                ; =1
        tbz               w1, #0x0, 0x6dc <asm_test::fetch_nand::bool::seqcst+0x18>
        ldeoralb          w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        swpalb            w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        mov               w8, #0x1                ; =1
        tbz               w1, #0x0, 0x704 <asm_test::fetch_nand::bool::acquire+0x18>
        ldeorab           w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        swpab             w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_nand::bool::relaxed:
        mov               w8, #0x1                ; =1
        tbz               w1, #0x0, 0x72c <asm_test::fetch_nand::bool::relaxed+0x18>
        ldeorb            w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        swpb              w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        mov               w8, #0x1                ; =1
        tbz               w1, #0x0, 0x754 <asm_test::fetch_nand::bool::release+0x18>
        ldeorlb           w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        swplb             w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_nand::u128::acqrel:
        ldaxp             x8, x9, [x0]
        and               x10, x8, x1
        and               x11, x9, x2
        mvn               x10, x10
        mvn               x11, x11
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x764 <asm_test::fetch_nand::u128::acqrel>
        mov               x0, x8
        mov               x1, x9
        ret
        ldaxp             x8, x9, [x0]
        and               x10, x8, x1
        and               x11, x9, x2
        mvn               x10, x10
        mvn               x11, x11
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x78c <asm_test::fetch_nand::u128::seqcst>
        mov               x0, x8
        mov               x1, x9
        ret
        ldaxp             x8, x9, [x0]
        and               x10, x8, x1
        and               x11, x9, x2
        mvn               x10, x10
        mvn               x11, x11
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0x7b4 <asm_test::fetch_nand::u128::acquire>
        mov               x0, x8
        mov               x1, x9
        ret
        ldxp              x8, x9, [x0]
        and               x10, x8, x1
        and               x11, x9, x2
        mvn               x10, x10
        mvn               x11, x11
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0x7dc <asm_test::fetch_nand::u128::relaxed>
        mov               x0, x8
        mov               x1, x9
        ret

asm_test::fetch_nand::u128::release:
        ldxp              x8, x9, [x0]
        and               x10, x8, x1
        and               x11, x9, x2
        mvn               x10, x10
        mvn               x11, x11
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x804 <asm_test::fetch_nand::u128::release>
        mov               x0, x8
        mov               x1, x9
        ret
        nop
        nop
        nop
        nop
        nop

asm_test::fetch_umax::u8::acqrel:
        mov               x8, x0
        ldrb              w0, [x0]
        and               w9, w1, #0xff
        and               w10, w0, #0xff
        cmp               w9, w10
        csel              w11, w9, w10, hi
        casalb            w0, w11, [x8]
        cmp               w0, w10
        b.ne              0x84c <asm_test::fetch_umax::u8::acqrel+0xc>
        ret
        nop
        nop
        nop
        nop
        nop
        nop

asm_test::fetch_umax::u8::seqcst:
        mov               x8, x0
        ldrb              w0, [x0]
        and               w9, w1, #0xff
        and               w10, w0, #0xff
        cmp               w9, w10
        csel              w11, w9, w10, hi
        casalb            w0, w11, [x8]
        cmp               w0, w10
        b.ne              0x88c <asm_test::fetch_umax::u8::seqcst+0xc>
        ret
        nop
        nop
        nop
        nop
        nop
        nop
        mov               x8, x0
        ldrb              w0, [x0]
        and               w9, w1, #0xff
        and               w10, w0, #0xff
        cmp               w9, w10
        csel              w11, w9, w10, hi
        casab             w0, w11, [x8]
        cmp               w0, w10
        b.ne              0x8cc <asm_test::fetch_umax::u8::acquire+0xc>
        ret
        nop
        nop
        nop
        nop
        nop
        nop

asm_test::fetch_umax::u8::relaxed:
        mov               x8, x0
        ldrb              w0, [x0]
        and               w9, w1, #0xff
        and               w10, w0, #0xff
        cmp               w9, w10
        csel              w11, w9, w10, hi
        casb              w0, w11, [x8]
        cmp               w0, w10
        b.ne              0x90c <asm_test::fetch_umax::u8::relaxed+0xc>
        ret
        nop
        nop
        nop
        nop
        nop
        nop

asm_test::fetch_umax::u8::release:
        mov               x8, x0
        ldrb              w0, [x0]
        and               w9, w1, #0xff
        and               w10, w0, #0xff
        cmp               w9, w10
        csel              w11, w9, w10, hi
        caslb             w0, w11, [x8]
        cmp               w0, w10
        b.ne              0x94c <asm_test::fetch_umax::u8::release+0xc>
        ret
        nop
        nop
        nop
        nop
        nop
        nop

asm_test::fetch_umax::u16::acqrel:
        mov               x8, x0
        ldrh              w0, [x0]
        and               w9, w1, #0xffff
        and               w10, w0, #0xffff
        cmp               w9, w10
        csel              w11, w9, w10, hi
        casalh            w0, w11, [x8]
        cmp               w0, w10
        b.ne              0x98c <asm_test::fetch_umax::u16::acqrel+0xc>
        ret
        nop
        nop
        nop
        nop
        nop
        nop
        mov               x8, x0
        ldrh              w0, [x0]
        and               w9, w1, #0xffff
        and               w10, w0, #0xffff
        cmp               w9, w10
        csel              w11, w9, w10, hi
        casalh            w0, w11, [x8]
        cmp               w0, w10
        b.ne              0x9cc <asm_test::fetch_umax::u16::seqcst+0xc>
        ret
        nop
        nop
        nop
        nop
        nop
        nop
        mov               x8, x0
        ldrh              w0, [x0]
        and               w9, w1, #0xffff
        and               w10, w0, #0xffff
        cmp               w9, w10
        csel              w11, w9, w10, hi
        casah             w0, w11, [x8]
        cmp               w0, w10
        b.ne              0xa0c <asm_test::fetch_umax::u16::acquire+0xc>
        ret
        nop
        nop
        nop
        nop
        nop
        nop
        mov               x8, x0
        ldrh              w0, [x0]
        and               w9, w1, #0xffff
        and               w10, w0, #0xffff
        cmp               w9, w10
        csel              w11, w9, w10, hi
        cash              w0, w11, [x8]
        cmp               w0, w10
        b.ne              0xa4c <asm_test::fetch_umax::u16::relaxed+0xc>
        ret
        nop
        nop
        nop
        nop
        nop
        nop
        mov               x8, x0
        ldrh              w0, [x0]
        and               w9, w1, #0xffff
        and               w10, w0, #0xffff
        cmp               w9, w10
        csel              w11, w9, w10, hi
        caslh             w0, w11, [x8]
        cmp               w0, w10
        b.ne              0xa8c <asm_test::fetch_umax::u16::release+0xc>
        ret
        ldumaxal          w1, w0, [x0]
        ret
        ldumaxal          w1, w0, [x0]
        ret
        ldumaxa           w1, w0, [x0]
        ret
        ldumax            w1, w0, [x0]
        ret
        ldumaxl           w1, w0, [x0]
        ret
        ldumaxal          x1, x0, [x0]
        ret
        ldumaxal          x1, x0, [x0]
        ret
        ldumaxa           x1, x0, [x0]
        ret
        ldumax            x1, x0, [x0]
        ret
        ldumaxl           x1, x0, [x0]
        ret
        ldaxp             x8, x9, [x0]
        cmp               x1, x8
        sbcs              xzr, x2, x9
        csel              x11, x9, x2, lo
        csel              x10, x8, x1, lo
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0xaf8 <asm_test::fetch_umax::u128::acqrel>
        mov               x0, x8
        mov               x1, x9
        ret
        ldaxp             x8, x9, [x0]
        cmp               x1, x8
        sbcs              xzr, x2, x9
        csel              x11, x9, x2, lo
        csel              x10, x8, x1, lo
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0xb20 <asm_test::fetch_umax::u128::seqcst>
        mov               x0, x8
        mov               x1, x9
        ret
        ldaxp             x8, x9, [x0]
        cmp               x1, x8
        sbcs              xzr, x2, x9
        csel              x11, x9, x2, lo
        csel              x10, x8, x1, lo
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0xb48 <asm_test::fetch_umax::u128::acquire>
        mov               x0, x8
        mov               x1, x9
        ret
        ldxp              x8, x9, [x0]
        cmp               x1, x8
        sbcs              xzr, x2, x9
        csel              x11, x9, x2, lo
        csel              x10, x8, x1, lo
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0xb70 <asm_test::fetch_umax::u128::relaxed>
        mov               x0, x8
        mov               x1, x9
        ret
        ldxp              x8, x9, [x0]
        cmp               x1, x8
        sbcs              xzr, x2, x9
        csel              x11, x9, x2, lo
        csel              x10, x8, x1, lo
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0xb98 <asm_test::fetch_umax::u128::release>
        mov               x0, x8
        mov               x1, x9
        ret
        mov               x8, x0
        ldrb              w0, [x0]
        and               w9, w1, #0xff
        and               w10, w0, #0xff
        cmp               w9, w10
        csel              w11, w9, w10, lo
        casalb            w0, w11, [x8]
        cmp               w0, w10
        b.ne              0xbcc <asm_test::fetch_umin::u8::acqrel+0xc>
        ret
        nop
        nop
        nop
        nop
        nop
        nop
        mov               x8, x0
        ldrb              w0, [x0]
        and               w9, w1, #0xff
        and               w10, w0, #0xff
        cmp               w9, w10
        csel              w11, w9, w10, lo
        casalb            w0, w11, [x8]
        cmp               w0, w10
        b.ne              0xc0c <asm_test::fetch_umin::u8::seqcst+0xc>
        ret
        nop
        nop
        nop
        nop
        nop
        nop
        mov               x8, x0
        ldrb              w0, [x0]
        and               w9, w1, #0xff
        and               w10, w0, #0xff
        cmp               w9, w10
        csel              w11, w9, w10, lo
        casab             w0, w11, [x8]
        cmp               w0, w10
        b.ne              0xc4c <asm_test::fetch_umin::u8::acquire+0xc>
        ret
        nop
        nop
        nop
        nop
        nop
        nop
        mov               x8, x0
        ldrb              w0, [x0]
        and               w9, w1, #0xff
        and               w10, w0, #0xff
        cmp               w9, w10
        csel              w11, w9, w10, lo
        casb              w0, w11, [x8]
        cmp               w0, w10
        b.ne              0xc8c <asm_test::fetch_umin::u8::relaxed+0xc>
        ret
        nop
        nop
        nop
        nop
        nop
        nop
        mov               x8, x0
        ldrb              w0, [x0]
        and               w9, w1, #0xff
        and               w10, w0, #0xff
        cmp               w9, w10
        csel              w11, w9, w10, lo
        caslb             w0, w11, [x8]
        cmp               w0, w10
        b.ne              0xccc <asm_test::fetch_umin::u8::release+0xc>
        ret
        nop
        nop
        nop
        nop
        nop
        nop
        mov               x8, x0
        ldrh              w0, [x0]
        and               w9, w1, #0xffff
        and               w10, w0, #0xffff
        cmp               w9, w10
        csel              w11, w9, w10, lo
        casalh            w0, w11, [x8]
        cmp               w0, w10
        b.ne              0xd0c <asm_test::fetch_umin::u16::acqrel+0xc>
        ret
        nop
        nop
        nop
        nop
        nop
        nop
        mov               x8, x0
        ldrh              w0, [x0]
        and               w9, w1, #0xffff
        and               w10, w0, #0xffff
        cmp               w9, w10
        csel              w11, w9, w10, lo
        casalh            w0, w11, [x8]
        cmp               w0, w10
        b.ne              0xd4c <asm_test::fetch_umin::u16::seqcst+0xc>
        ret
        nop
        nop
        nop
        nop
        nop
        nop
        mov               x8, x0
        ldrh              w0, [x0]
        and               w9, w1, #0xffff
        and               w10, w0, #0xffff
        cmp               w9, w10
        csel              w11, w9, w10, lo
        casah             w0, w11, [x8]
        cmp               w0, w10
        b.ne              0xd8c <asm_test::fetch_umin::u16::acquire+0xc>
        ret
        nop
        nop
        nop
        nop
        nop
        nop
        mov               x8, x0
        ldrh              w0, [x0]
        and               w9, w1, #0xffff
        and               w10, w0, #0xffff
        cmp               w9, w10
        csel              w11, w9, w10, lo
        cash              w0, w11, [x8]
        cmp               w0, w10
        b.ne              0xdcc <asm_test::fetch_umin::u16::relaxed+0xc>
        ret
        nop
        nop
        nop
        nop
        nop
        nop
        mov               x8, x0
        ldrh              w0, [x0]
        and               w9, w1, #0xffff
        and               w10, w0, #0xffff
        cmp               w9, w10
        csel              w11, w9, w10, lo
        caslh             w0, w11, [x8]
        cmp               w0, w10
        b.ne              0xe0c <asm_test::fetch_umin::u16::release+0xc>
        ret
        lduminal          w1, w0, [x0]
        ret
        lduminal          w1, w0, [x0]
        ret
        ldumina           w1, w0, [x0]
        ret
        ldumin            w1, w0, [x0]
        ret
        lduminl           w1, w0, [x0]
        ret
        lduminal          x1, x0, [x0]
        ret
        lduminal          x1, x0, [x0]
        ret
        ldumina           x1, x0, [x0]
        ret
        ldumin            x1, x0, [x0]
        ret
        lduminl           x1, x0, [x0]
        ret
        ldaxp             x8, x9, [x0]
        cmp               x1, x8
        sbcs              xzr, x2, x9
        csel              x11, x9, x2, hs
        csel              x10, x8, x1, hs
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0xe78 <asm_test::fetch_umin::u128::acqrel>
        mov               x0, x8
        mov               x1, x9
        ret
        ldaxp             x8, x9, [x0]
        cmp               x1, x8
        sbcs              xzr, x2, x9
        csel              x11, x9, x2, hs
        csel              x10, x8, x1, hs
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0xea0 <asm_test::fetch_umin::u128::seqcst>
        mov               x0, x8
        mov               x1, x9
        ret
        ldaxp             x8, x9, [x0]
        cmp               x1, x8
        sbcs              xzr, x2, x9
        csel              x11, x9, x2, hs
        csel              x10, x8, x1, hs
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0xec8 <asm_test::fetch_umin::u128::acquire>
        mov               x0, x8
        mov               x1, x9
        ret
        ldxp              x8, x9, [x0]
        cmp               x1, x8
        sbcs              xzr, x2, x9
        csel              x11, x9, x2, hs
        csel              x10, x8, x1, hs
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0xef0 <asm_test::fetch_umin::u128::relaxed>
        mov               x0, x8
        mov               x1, x9
        ret
        ldxp              x8, x9, [x0]
        cmp               x1, x8
        sbcs              xzr, x2, x9
        csel              x11, x9, x2, hs
        csel              x10, x8, x1, hs
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0xf18 <asm_test::fetch_umin::u128::release>
        mov               x0, x8
        mov               x1, x9
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange::u8::seqcst_acquire:
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange::u8::seqcst_relaxed:
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casab             w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange::u8::acquire_relaxed:
        mov               x8, x1
        casab             w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange::u8::relaxed_acquire:
        mov               x8, x1
        casab             w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange::u8::relaxed_relaxed:
        mov               x8, x1
        casb              w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        caslb             w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        fmov              w8, s0
        fmov              w9, s1
        mov               x10, x8
        casal             w10, w9, [x0]
        cmp               w10, w8
        cset              w8, eq
        fmov              s0, w10
        eor               w0, w8, #0x1
        ret

asm_test::compare_exchange::f32::seqcst_seqcst:
        fmov              w8, s0
        fmov              w9, s1
        mov               x10, x8
        casal             w10, w9, [x0]
        cmp               w10, w8
        cset              w8, eq
        fmov              s0, w10
        eor               w0, w8, #0x1
        ret
        fmov              w8, s0
        fmov              w9, s1
        mov               x10, x8
        casal             w10, w9, [x0]
        cmp               w10, w8
        cset              w8, eq
        fmov              s0, w10
        eor               w0, w8, #0x1
        ret

asm_test::compare_exchange::f32::acqrel_relaxed:
        fmov              w8, s0
        fmov              w9, s1
        mov               x10, x8
        casal             w10, w9, [x0]
        cmp               w10, w8
        cset              w8, eq
        fmov              s0, w10
        eor               w0, w8, #0x1
        ret

asm_test::compare_exchange::f32::acquire_seqcst:
        fmov              w8, s0
        fmov              w9, s1
        mov               x10, x8
        casal             w10, w9, [x0]
        cmp               w10, w8
        cset              w8, eq
        fmov              s0, w10
        eor               w0, w8, #0x1
        ret

asm_test::compare_exchange::f32::relaxed_seqcst:
        fmov              w8, s0
        fmov              w9, s1
        mov               x10, x8
        casal             w10, w9, [x0]
        cmp               w10, w8
        cset              w8, eq
        fmov              s0, w10
        eor               w0, w8, #0x1
        ret
        fmov              w8, s0
        fmov              w9, s1
        mov               x10, x8
        casal             w10, w9, [x0]
        cmp               w10, w8
        cset              w8, eq
        fmov              s0, w10
        eor               w0, w8, #0x1
        ret
        fmov              w8, s0
        fmov              w9, s1
        mov               x10, x8
        casal             w10, w9, [x0]
        cmp               w10, w8
        cset              w8, eq
        fmov              s0, w10
        eor               w0, w8, #0x1
        ret

asm_test::compare_exchange::f32::seqcst_relaxed:
        fmov              w8, s0
        fmov              w9, s1
        mov               x10, x8
        casal             w10, w9, [x0]
        cmp               w10, w8
        cset              w8, eq
        fmov              s0, w10
        eor               w0, w8, #0x1
        ret

asm_test::compare_exchange::f32::acquire_acquire:
        fmov              w8, s0
        fmov              w9, s1
        mov               x10, x8
        casa              w10, w9, [x0]
        cmp               w10, w8
        cset              w8, eq
        fmov              s0, w10
        eor               w0, w8, #0x1
        ret
        fmov              w8, s0
        fmov              w9, s1
        mov               x10, x8
        casa              w10, w9, [x0]
        cmp               w10, w8
        cset              w8, eq
        fmov              s0, w10
        eor               w0, w8, #0x1
        ret

asm_test::compare_exchange::f32::relaxed_acquire:
        fmov              w8, s0
        fmov              w9, s1
        mov               x10, x8
        casa              w10, w9, [x0]
        cmp               w10, w8
        cset              w8, eq
        fmov              s0, w10
        eor               w0, w8, #0x1
        ret

asm_test::compare_exchange::f32::relaxed_relaxed:
        fmov              w8, s0
        fmov              w9, s1
        mov               x10, x8
        cas               w10, w9, [x0]
        cmp               w10, w8
        cset              w8, eq
        fmov              s0, w10
        eor               w0, w8, #0x1
        ret
        fmov              w8, s0
        fmov              w9, s1
        mov               x10, x8
        casal             w10, w9, [x0]
        cmp               w10, w8
        cset              w8, eq
        fmov              s0, w10
        eor               w0, w8, #0x1
        ret
        fmov              w8, s0
        fmov              w9, s1
        mov               x10, x8
        casl              w10, w9, [x0]
        cmp               w10, w8
        cset              w8, eq
        fmov              s0, w10
        eor               w0, w8, #0x1
        ret

asm_test::compare_exchange::f64::acqrel_seqcst:
        fmov              x8, d0
        fmov              x9, d1
        mov               x10, x8
        casal             x10, x9, [x0]
        cmp               x10, x8
        cset              w8, eq
        eor               w0, w8, #0x1
        fmov              d0, x10
        ret

asm_test::compare_exchange::f64::seqcst_seqcst:
        fmov              x8, d0
        fmov              x9, d1
        mov               x10, x8
        casal             x10, x9, [x0]
        cmp               x10, x8
        cset              w8, eq
        eor               w0, w8, #0x1
        fmov              d0, x10
        ret

asm_test::compare_exchange::f64::acqrel_acquire:
        fmov              x8, d0
        fmov              x9, d1
        mov               x10, x8
        casal             x10, x9, [x0]
        cmp               x10, x8
        cset              w8, eq
        eor               w0, w8, #0x1
        fmov              d0, x10
        ret
        fmov              x8, d0
        fmov              x9, d1
        mov               x10, x8
        casal             x10, x9, [x0]
        cmp               x10, x8
        cset              w8, eq
        eor               w0, w8, #0x1
        fmov              d0, x10
        ret

asm_test::compare_exchange::f64::acquire_seqcst:
        fmov              x8, d0
        fmov              x9, d1
        mov               x10, x8
        casal             x10, x9, [x0]
        cmp               x10, x8
        cset              w8, eq
        eor               w0, w8, #0x1
        fmov              d0, x10
        ret
        fmov              x8, d0
        fmov              x9, d1
        mov               x10, x8
        casal             x10, x9, [x0]
        cmp               x10, x8
        cset              w8, eq
        eor               w0, w8, #0x1
        fmov              d0, x10
        ret
        fmov              x8, d0
        fmov              x9, d1
        mov               x10, x8
        casal             x10, x9, [x0]
        cmp               x10, x8
        cset              w8, eq
        eor               w0, w8, #0x1
        fmov              d0, x10
        ret
        fmov              x8, d0
        fmov              x9, d1
        mov               x10, x8
        casal             x10, x9, [x0]
        cmp               x10, x8
        cset              w8, eq
        eor               w0, w8, #0x1
        fmov              d0, x10
        ret

asm_test::compare_exchange::f64::seqcst_relaxed:
        fmov              x8, d0
        fmov              x9, d1
        mov               x10, x8
        casal             x10, x9, [x0]
        cmp               x10, x8
        cset              w8, eq
        eor               w0, w8, #0x1
        fmov              d0, x10
        ret

asm_test::compare_exchange::f64::acquire_acquire:
        fmov              x8, d0
        fmov              x9, d1
        mov               x10, x8
        casa              x10, x9, [x0]
        cmp               x10, x8
        cset              w8, eq
        eor               w0, w8, #0x1
        fmov              d0, x10
        ret

asm_test::compare_exchange::f64::acquire_relaxed:
        fmov              x8, d0
        fmov              x9, d1
        mov               x10, x8
        casa              x10, x9, [x0]
        cmp               x10, x8
        cset              w8, eq
        eor               w0, w8, #0x1
        fmov              d0, x10
        ret
        fmov              x8, d0
        fmov              x9, d1
        mov               x10, x8
        casa              x10, x9, [x0]
        cmp               x10, x8
        cset              w8, eq
        eor               w0, w8, #0x1
        fmov              d0, x10
        ret
        fmov              x8, d0
        fmov              x9, d1
        mov               x10, x8
        cas               x10, x9, [x0]
        cmp               x10, x8
        cset              w8, eq
        eor               w0, w8, #0x1
        fmov              d0, x10
        ret
        fmov              x8, d0
        fmov              x9, d1
        mov               x10, x8
        casal             x10, x9, [x0]
        cmp               x10, x8
        cset              w8, eq
        eor               w0, w8, #0x1
        fmov              d0, x10
        ret
        fmov              x8, d0
        fmov              x9, d1
        mov               x10, x8
        casl              x10, x9, [x0]
        cmp               x10, x8
        cset              w8, eq
        eor               w0, w8, #0x1
        fmov              d0, x10
        ret
        mov               x8, x1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange::u16::seqcst_seqcst:
        mov               x8, x1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange::u16::acqrel_acquire:
        mov               x8, x1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange::u16::acqrel_relaxed:
        mov               x8, x1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange::u16::acquire_acquire:
        mov               x8, x1
        casah             w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange::u16::acquire_relaxed:
        mov               x8, x1
        casah             w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange::u16::relaxed_acquire:
        mov               x8, x1
        casah             w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        cash              w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange::u16::release_acquire:
        mov               x8, x1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        caslh             w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casal             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casal             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casal             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange::u32::acqrel_relaxed:
        mov               x8, x1
        casal             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange::u32::acquire_seqcst:
        mov               x8, x1
        casal             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casal             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange::u32::release_seqcst:
        mov               x8, x1
        casal             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange::u32::seqcst_acquire:
        mov               x8, x1
        casal             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casal             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casa              w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casa              w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casa              w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange::u32::relaxed_relaxed:
        mov               x8, x1
        cas               w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casal             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange::u32::release_relaxed:
        mov               x8, x1
        casl              w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange::u64::acqrel_seqcst:
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange::u64::seqcst_seqcst:
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange::u64::seqcst_acquire:
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange::u64::seqcst_relaxed:
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange::u64::acquire_acquire:
        mov               x8, x1
        casa              x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casa              x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange::u64::relaxed_acquire:
        mov               x8, x1
        casa              x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        cas               x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casl              x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret
        mov               x8, x1
        casab             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret
        mov               x8, x1
        casab             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret
        mov               x8, x1
        casab             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret
        mov               x8, x1
        casb              w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret
        mov               x8, x1
        caslb             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret
        mov               x7, x2
        mov               x6, x1
        mov               x5, x4
        mov               x4, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x2, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x7, x2
        mov               x6, x1
        mov               x5, x4
        mov               x4, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x2, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x7, x2
        mov               x6, x1
        mov               x5, x4
        mov               x4, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x2, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x7, x2
        mov               x6, x1
        mov               x5, x4
        mov               x4, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x2, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x7, x2
        mov               x6, x1
        mov               x5, x4
        mov               x4, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x2, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x7, x2
        mov               x6, x1
        mov               x5, x4
        mov               x4, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x2, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x7, x2
        mov               x6, x1
        mov               x5, x4
        mov               x4, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x2, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x7, x2
        mov               x6, x1
        mov               x5, x4
        mov               x4, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x2, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x7, x2
        mov               x6, x1
        mov               x5, x4
        mov               x4, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x2, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x7, x2
        mov               x6, x1
        mov               x5, x4
        mov               x4, x3
        caspa             x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x2, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x7, x2
        mov               x6, x1
        mov               x5, x4
        mov               x4, x3
        caspa             x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x2, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x7, x2
        mov               x6, x1
        mov               x5, x4
        mov               x4, x3
        caspa             x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x2, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x7, x2
        mov               x6, x1
        mov               x5, x4
        mov               x4, x3
        casp              x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x2, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x7, x2
        mov               x6, x1
        mov               x5, x4
        mov               x4, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x2, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x7, x2
        mov               x6, x1
        mov               x5, x4
        mov               x4, x3
        caspl             x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x2, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casab             w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casab             w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casab             w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casb              w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange_weak::u8::release_relaxed:
        mov               x8, x1
        caslb             w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange_weak::f32::acqrel_seqcst:
        fmov              w8, s0
        fmov              w9, s1
        mov               x10, x8
        casal             w10, w9, [x0]
        cmp               w10, w8
        cset              w8, eq
        fmov              s0, w10
        eor               w0, w8, #0x1
        ret

asm_test::compare_exchange_weak::f32::seqcst_seqcst:
        fmov              w8, s0
        fmov              w9, s1
        mov               x10, x8
        casal             w10, w9, [x0]
        cmp               w10, w8
        cset              w8, eq
        fmov              s0, w10
        eor               w0, w8, #0x1
        ret

asm_test::compare_exchange_weak::f32::acqrel_acquire:
        fmov              w8, s0
        fmov              w9, s1
        mov               x10, x8
        casal             w10, w9, [x0]
        cmp               w10, w8
        cset              w8, eq
        fmov              s0, w10
        eor               w0, w8, #0x1
        ret
        fmov              w8, s0
        fmov              w9, s1
        mov               x10, x8
        casal             w10, w9, [x0]
        cmp               w10, w8
        cset              w8, eq
        fmov              s0, w10
        eor               w0, w8, #0x1
        ret
        fmov              w8, s0
        fmov              w9, s1
        mov               x10, x8
        casal             w10, w9, [x0]
        cmp               w10, w8
        cset              w8, eq
        fmov              s0, w10
        eor               w0, w8, #0x1
        ret
        fmov              w8, s0
        fmov              w9, s1
        mov               x10, x8
        casal             w10, w9, [x0]
        cmp               w10, w8
        cset              w8, eq
        fmov              s0, w10
        eor               w0, w8, #0x1
        ret
        fmov              w8, s0
        fmov              w9, s1
        mov               x10, x8
        casal             w10, w9, [x0]
        cmp               w10, w8
        cset              w8, eq
        fmov              s0, w10
        eor               w0, w8, #0x1
        ret
        fmov              w8, s0
        fmov              w9, s1
        mov               x10, x8
        casal             w10, w9, [x0]
        cmp               w10, w8
        cset              w8, eq
        fmov              s0, w10
        eor               w0, w8, #0x1
        ret

asm_test::compare_exchange_weak::f32::seqcst_relaxed:
        fmov              w8, s0
        fmov              w9, s1
        mov               x10, x8
        casal             w10, w9, [x0]
        cmp               w10, w8
        cset              w8, eq
        fmov              s0, w10
        eor               w0, w8, #0x1
        ret

asm_test::compare_exchange_weak::f32::acquire_acquire:
        fmov              w8, s0
        fmov              w9, s1
        mov               x10, x8
        casa              w10, w9, [x0]
        cmp               w10, w8
        cset              w8, eq
        fmov              s0, w10
        eor               w0, w8, #0x1
        ret

asm_test::compare_exchange_weak::f32::acquire_relaxed:
        fmov              w8, s0
        fmov              w9, s1
        mov               x10, x8
        casa              w10, w9, [x0]
        cmp               w10, w8
        cset              w8, eq
        fmov              s0, w10
        eor               w0, w8, #0x1
        ret
        fmov              w8, s0
        fmov              w9, s1
        mov               x10, x8
        casa              w10, w9, [x0]
        cmp               w10, w8
        cset              w8, eq
        fmov              s0, w10
        eor               w0, w8, #0x1
        ret
        fmov              w8, s0
        fmov              w9, s1
        mov               x10, x8
        cas               w10, w9, [x0]
        cmp               w10, w8
        cset              w8, eq
        fmov              s0, w10
        eor               w0, w8, #0x1
        ret
        fmov              w8, s0
        fmov              w9, s1
        mov               x10, x8
        casal             w10, w9, [x0]
        cmp               w10, w8
        cset              w8, eq
        fmov              s0, w10
        eor               w0, w8, #0x1
        ret

asm_test::compare_exchange_weak::f32::release_relaxed:
        fmov              w8, s0
        fmov              w9, s1
        mov               x10, x8
        casl              w10, w9, [x0]
        cmp               w10, w8
        cset              w8, eq
        fmov              s0, w10
        eor               w0, w8, #0x1
        ret
        fmov              x8, d0
        fmov              x9, d1
        mov               x10, x8
        casal             x10, x9, [x0]
        cmp               x10, x8
        cset              w8, eq
        eor               w0, w8, #0x1
        fmov              d0, x10
        ret

asm_test::compare_exchange_weak::f64::seqcst_seqcst:
        fmov              x8, d0
        fmov              x9, d1
        mov               x10, x8
        casal             x10, x9, [x0]
        cmp               x10, x8
        cset              w8, eq
        eor               w0, w8, #0x1
        fmov              d0, x10
        ret

asm_test::compare_exchange_weak::f64::acqrel_acquire:
        fmov              x8, d0
        fmov              x9, d1
        mov               x10, x8
        casal             x10, x9, [x0]
        cmp               x10, x8
        cset              w8, eq
        eor               w0, w8, #0x1
        fmov              d0, x10
        ret
        fmov              x8, d0
        fmov              x9, d1
        mov               x10, x8
        casal             x10, x9, [x0]
        cmp               x10, x8
        cset              w8, eq
        eor               w0, w8, #0x1
        fmov              d0, x10
        ret
        fmov              x8, d0
        fmov              x9, d1
        mov               x10, x8
        casal             x10, x9, [x0]
        cmp               x10, x8
        cset              w8, eq
        eor               w0, w8, #0x1
        fmov              d0, x10
        ret
        fmov              x8, d0
        fmov              x9, d1
        mov               x10, x8
        casal             x10, x9, [x0]
        cmp               x10, x8
        cset              w8, eq
        eor               w0, w8, #0x1
        fmov              d0, x10
        ret

asm_test::compare_exchange_weak::f64::release_seqcst:
        fmov              x8, d0
        fmov              x9, d1
        mov               x10, x8
        casal             x10, x9, [x0]
        cmp               x10, x8
        cset              w8, eq
        eor               w0, w8, #0x1
        fmov              d0, x10
        ret

asm_test::compare_exchange_weak::f64::seqcst_acquire:
        fmov              x8, d0
        fmov              x9, d1
        mov               x10, x8
        casal             x10, x9, [x0]
        cmp               x10, x8
        cset              w8, eq
        eor               w0, w8, #0x1
        fmov              d0, x10
        ret
        fmov              x8, d0
        fmov              x9, d1
        mov               x10, x8
        casal             x10, x9, [x0]
        cmp               x10, x8
        cset              w8, eq
        eor               w0, w8, #0x1
        fmov              d0, x10
        ret

asm_test::compare_exchange_weak::f64::acquire_acquire:
        fmov              x8, d0
        fmov              x9, d1
        mov               x10, x8
        casa              x10, x9, [x0]
        cmp               x10, x8
        cset              w8, eq
        eor               w0, w8, #0x1
        fmov              d0, x10
        ret
        fmov              x8, d0
        fmov              x9, d1
        mov               x10, x8
        casa              x10, x9, [x0]
        cmp               x10, x8
        cset              w8, eq
        eor               w0, w8, #0x1
        fmov              d0, x10
        ret
        fmov              x8, d0
        fmov              x9, d1
        mov               x10, x8
        casa              x10, x9, [x0]
        cmp               x10, x8
        cset              w8, eq
        eor               w0, w8, #0x1
        fmov              d0, x10
        ret
        fmov              x8, d0
        fmov              x9, d1
        mov               x10, x8
        cas               x10, x9, [x0]
        cmp               x10, x8
        cset              w8, eq
        eor               w0, w8, #0x1
        fmov              d0, x10
        ret

asm_test::compare_exchange_weak::f64::release_acquire:
        fmov              x8, d0
        fmov              x9, d1
        mov               x10, x8
        casal             x10, x9, [x0]
        cmp               x10, x8
        cset              w8, eq
        eor               w0, w8, #0x1
        fmov              d0, x10
        ret

asm_test::compare_exchange_weak::f64::release_relaxed:
        fmov              x8, d0
        fmov              x9, d1
        mov               x10, x8
        casl              x10, x9, [x0]
        cmp               x10, x8
        cset              w8, eq
        eor               w0, w8, #0x1
        fmov              d0, x10
        ret

asm_test::compare_exchange_weak::u16::acqrel_seqcst:
        mov               x8, x1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange_weak::u16::seqcst_seqcst:
        mov               x8, x1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange_weak::u16::acqrel_acquire:
        mov               x8, x1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange_weak::u16::release_seqcst:
        mov               x8, x1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange_weak::u16::seqcst_relaxed:
        mov               x8, x1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange_weak::u16::acquire_acquire:
        mov               x8, x1
        casah             w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange_weak::u16::acquire_relaxed:
        mov               x8, x1
        casah             w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casah             w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        cash              w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        caslh             w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casal             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange_weak::u32::seqcst_seqcst:
        mov               x8, x1
        casal             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange_weak::u32::acqrel_acquire:
        mov               x8, x1
        casal             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange_weak::u32::acqrel_relaxed:
        mov               x8, x1
        casal             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casal             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange_weak::u32::relaxed_seqcst:
        mov               x8, x1
        casal             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casal             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casal             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casal             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casa              w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange_weak::u32::acquire_relaxed:
        mov               x8, x1
        casa              w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange_weak::u32::relaxed_acquire:
        mov               x8, x1
        casa              w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        cas               w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange_weak::u32::release_acquire:
        mov               x8, x1
        casal             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange_weak::u32::release_relaxed:
        mov               x8, x1
        casl              w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange_weak::u64::acquire_seqcst:
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange_weak::u64::release_seqcst:
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange_weak::u64::seqcst_acquire:
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange_weak::u64::seqcst_relaxed:
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casa              x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casa              x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casa              x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        cas               x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange_weak::u64::release_relaxed:
        mov               x8, x1
        casl              x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange_weak::bool::acqrel_seqcst:
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::bool::seqcst_seqcst:
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::bool::acqrel_acquire:
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret
        mov               x8, x1
        casab             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret
        mov               x8, x1
        casab             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret
        mov               x8, x1
        casab             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret
        mov               x8, x1
        casb              w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret
        mov               x8, x1
        caslb             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret
        mov               x7, x2
        mov               x6, x1
        mov               x5, x4
        mov               x4, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x2, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x7, x2
        mov               x6, x1
        mov               x5, x4
        mov               x4, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x2, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x7, x2
        mov               x6, x1
        mov               x5, x4
        mov               x4, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x2, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x7, x2
        mov               x6, x1
        mov               x5, x4
        mov               x4, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x2, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x7, x2
        mov               x6, x1
        mov               x5, x4
        mov               x4, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x2, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x7, x2
        mov               x6, x1
        mov               x5, x4
        mov               x4, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x2, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x7, x2
        mov               x6, x1
        mov               x5, x4
        mov               x4, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x2, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x7, x2
        mov               x6, x1
        mov               x5, x4
        mov               x4, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x2, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x7, x2
        mov               x6, x1
        mov               x5, x4
        mov               x4, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x2, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x7, x2
        mov               x6, x1
        mov               x5, x4
        mov               x4, x3
        caspa             x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x2, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x7, x2
        mov               x6, x1
        mov               x5, x4
        mov               x4, x3
        caspa             x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x2, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x7, x2
        mov               x6, x1
        mov               x5, x4
        mov               x4, x3
        caspa             x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x2, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x7, x2
        mov               x6, x1
        mov               x5, x4
        mov               x4, x3
        casp              x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x2, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x7, x2
        mov               x6, x1
        mov               x5, x4
        mov               x4, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x2, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x7, x2
        mov               x6, x1
        mov               x5, x4
        mov               x4, x3
        caspl             x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x2, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        ldsetalb          w1, w8, [x0]
        ret
        ldsetalb          w1, w8, [x0]
        ret
        ldsetab           w1, w8, [x0]
        ret
        ldsetb            w1, w8, [x0]
        ret
        ldsetlb           w1, w8, [x0]
        ret
        ldsetalh          w1, w8, [x0]
        ret
        ldsetalh          w1, w8, [x0]
        ret
        ldsetah           w1, w8, [x0]
        ret
        ldseth            w1, w8, [x0]
        ret
        ldsetlh           w1, w8, [x0]
        ret
        ldsetal           w1, w8, [x0]
        ret
        ldsetal           w1, w8, [x0]
        ret
        ldseta            w1, w8, [x0]
        ret
        ldset             w1, w8, [x0]
        ret
        ldsetl            w1, w8, [x0]
        ret
        ldsetal           x1, x8, [x0]
        ret
        ldsetal           x1, x8, [x0]
        ret
        ldseta            x1, x8, [x0]
        ret
        ldset             x1, x8, [x0]
        ret
        ldsetl            x1, x8, [x0]
        ret
        ldsetalb          w1, w8, [x0]
        ret
        ldsetalb          w1, w8, [x0]
        ret
        ldsetab           w1, w8, [x0]
        ret
        ldsetb            w1, w8, [x0]
        ret
        ldsetlb           w1, w8, [x0]
        ret
        ldaxp             x8, x9, [x0]
        orr               x10, x8, x1
        orr               x11, x9, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x2e80 <asm_test::or::u128::acqrel>
        ret
        ldaxp             x8, x9, [x0]
        orr               x10, x8, x1
        orr               x11, x9, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x2e98 <asm_test::or::u128::seqcst>
        ret
        ldaxp             x8, x9, [x0]
        orr               x10, x8, x1
        orr               x11, x9, x2
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0x2eb0 <asm_test::or::u128::acquire>
        ret
        ldxp              x8, x9, [x0]
        orr               x10, x8, x1
        orr               x11, x9, x2
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0x2ec8 <asm_test::or::u128::relaxed>
        ret
        ldxp              x8, x9, [x0]
        orr               x10, x8, x1
        orr               x11, x9, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x2ee0 <asm_test::or::u128::release>
        ret
        ldaddalb          w1, w8, [x0]
        ret
        ldaddalb          w1, w8, [x0]
        ret
        ldaddab           w1, w8, [x0]
        ret
        ldaddb            w1, w8, [x0]
        ret
        ldaddlb           w1, w8, [x0]
        ret
        ldaddalh          w1, w8, [x0]
        ret
        ldaddalh          w1, w8, [x0]
        ret
        ldaddah           w1, w8, [x0]
        ret
        ldaddh            w1, w8, [x0]
        ret
        ldaddlh           w1, w8, [x0]
        ret
        ldaddal           w1, w8, [x0]
        ret
        ldaddal           w1, w8, [x0]
        ret
        ldadda            w1, w8, [x0]
        ret
        ldadd             w1, w8, [x0]
        ret
        ldaddl            w1, w8, [x0]
        ret
        ldaddal           x1, x8, [x0]
        ret
        ldaddal           x1, x8, [x0]
        ret
        ldadda            x1, x8, [x0]
        ret
        ldadd             x1, x8, [x0]
        ret
        ldaddl            x1, x8, [x0]
        ret
        ldaxp             x8, x9, [x0]
        adds              x10, x8, x1
        adc               x11, x9, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x2f98 <asm_test::add::u128::acqrel>
        ret
        ldaxp             x8, x9, [x0]
        adds              x10, x8, x1
        adc               x11, x9, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x2fb0 <asm_test::add::u128::seqcst>
        ret
        ldaxp             x8, x9, [x0]
        adds              x10, x8, x1
        adc               x11, x9, x2
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0x2fc8 <asm_test::add::u128::acquire>
        ret
        ldxp              x8, x9, [x0]
        adds              x10, x8, x1
        adc               x11, x9, x2
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0x2fe0 <asm_test::add::u128::relaxed>
        ret
        ldxp              x8, x9, [x0]
        adds              x10, x8, x1
        adc               x11, x9, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x2ff8 <asm_test::add::u128::release>
        ret

asm_test::and::u8::acqrel:
        mvn               w8, w1
        ldclralb          w8, w8, [x0]
        ret
        mvn               w8, w1
        ldclralb          w8, w8, [x0]
        ret

asm_test::and::u8::acquire:
        mvn               w8, w1
        ldclrab           w8, w8, [x0]
        ret

asm_test::and::u8::relaxed:
        mvn               w8, w1
        ldclrb            w8, w8, [x0]
        ret

asm_test::and::u8::release:
        mvn               w8, w1
        ldclrlb           w8, w8, [x0]
        ret
        mvn               w8, w1
        ldclralh          w8, w8, [x0]
        ret

asm_test::and::u16::seqcst:
        mvn               w8, w1
        ldclralh          w8, w8, [x0]
        ret

asm_test::and::u16::acquire:
        mvn               w8, w1
        ldclrah           w8, w8, [x0]
        ret

asm_test::and::u16::relaxed:
        mvn               w8, w1
        ldclrh            w8, w8, [x0]
        ret
        mvn               w8, w1
        ldclrlh           w8, w8, [x0]
        ret

asm_test::and::u32::acqrel:
        mvn               w8, w1
        ldclral           w8, w8, [x0]
        ret

asm_test::and::u32::seqcst:
        mvn               w8, w1
        ldclral           w8, w8, [x0]
        ret
        mvn               w8, w1
        ldclra            w8, w8, [x0]
        ret
        mvn               w8, w1
        ldclr             w8, w8, [x0]
        ret
        mvn               w8, w1
        ldclrl            w8, w8, [x0]
        ret
        mvn               x8, x1
        ldclral           x8, x8, [x0]
        ret
        mvn               x8, x1
        ldclral           x8, x8, [x0]
        ret
        mvn               x8, x1
        ldclra            x8, x8, [x0]
        ret
        mvn               x8, x1
        ldclr             x8, x8, [x0]
        ret
        mvn               x8, x1
        ldclrl            x8, x8, [x0]
        ret

asm_test::and::bool::acqrel:
        mvn               w8, w1
        ldclralb          w8, w8, [x0]
        ret
        mvn               w8, w1
        ldclralb          w8, w8, [x0]
        ret

asm_test::and::bool::acquire:
        mvn               w8, w1
        ldclrab           w8, w8, [x0]
        ret

asm_test::and::bool::relaxed:
        mvn               w8, w1
        ldclrb            w8, w8, [x0]
        ret

asm_test::and::bool::release:
        mvn               w8, w1
        ldclrlb           w8, w8, [x0]
        ret
        ldaxp             x8, x9, [x0]
        and               x10, x8, x1
        and               x11, x9, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x313c <asm_test::and::u128::acqrel>
        ret

asm_test::and::u128::seqcst:
        ldaxp             x8, x9, [x0]
        and               x10, x8, x1
        and               x11, x9, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x3154 <asm_test::and::u128::seqcst>
        ret
        ldaxp             x8, x9, [x0]
        and               x10, x8, x1
        and               x11, x9, x2
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0x316c <asm_test::and::u128::acquire>
        ret

asm_test::and::u128::relaxed:
        ldxp              x8, x9, [x0]
        and               x10, x8, x1
        and               x11, x9, x2
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0x3184 <asm_test::and::u128::relaxed>
        ret
        ldxp              x8, x9, [x0]
        and               x10, x8, x1
        and               x11, x9, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x319c <asm_test::and::u128::release>
        ret
        ldrb              w9, [x0]
        mov               x8, x9
        neg               w10, w9
        casalb            w8, w10, [x0]
        cmp               w8, w9, uxtb
        mov               x9, x8
        b.ne              0x31bc <asm_test::neg::u8::acqrel+0x8>
        ret
        ldrb              w9, [x0]
        mov               x8, x9
        neg               w10, w9
        casalb            w8, w10, [x0]
        cmp               w8, w9, uxtb
        mov               x9, x8
        b.ne              0x31dc <asm_test::neg::u8::seqcst+0x8>
        ret
        ldrb              w9, [x0]
        mov               x8, x9
        neg               w10, w9
        casab             w8, w10, [x0]
        cmp               w8, w9, uxtb
        mov               x9, x8
        b.ne              0x31fc <asm_test::neg::u8::acquire+0x8>
        ret

asm_test::neg::u8::relaxed:
        ldrb              w9, [x0]
        mov               x8, x9
        neg               w10, w9
        casb              w8, w10, [x0]
        cmp               w8, w9, uxtb
        mov               x9, x8
        b.ne              0x321c <asm_test::neg::u8::relaxed+0x8>
        ret

asm_test::neg::u8::release:
        ldrb              w9, [x0]
        mov               x8, x9
        neg               w10, w9
        caslb             w8, w10, [x0]
        cmp               w8, w9, uxtb
        mov               x9, x8
        b.ne              0x323c <asm_test::neg::u8::release+0x8>
        ret

asm_test::neg::u16::acqrel:
        ldrh              w9, [x0]
        mov               x8, x9
        neg               w10, w9
        casalh            w8, w10, [x0]
        cmp               w8, w9, uxth
        mov               x9, x8
        b.ne              0x325c <asm_test::neg::u16::acqrel+0x8>
        ret

asm_test::neg::u16::seqcst:
        ldrh              w9, [x0]
        mov               x8, x9
        neg               w10, w9
        casalh            w8, w10, [x0]
        cmp               w8, w9, uxth
        mov               x9, x8
        b.ne              0x327c <asm_test::neg::u16::seqcst+0x8>
        ret

asm_test::neg::u16::acquire:
        ldrh              w9, [x0]
        mov               x8, x9
        neg               w10, w9
        casah             w8, w10, [x0]
        cmp               w8, w9, uxth
        mov               x9, x8
        b.ne              0x329c <asm_test::neg::u16::acquire+0x8>
        ret
        ldrh              w9, [x0]
        mov               x8, x9
        neg               w10, w9
        cash              w8, w10, [x0]
        cmp               w8, w9, uxth
        mov               x9, x8
        b.ne              0x32bc <asm_test::neg::u16::relaxed+0x8>
        ret
        ldrh              w9, [x0]
        mov               x8, x9
        neg               w10, w9
        caslh             w8, w10, [x0]
        cmp               w8, w9, uxth
        mov               x9, x8
        b.ne              0x32dc <asm_test::neg::u16::release+0x8>
        ret
        ldr               w9, [x0]
        mov               x8, x9
        neg               w10, w9
        casal             w8, w10, [x0]
        cmp               w8, w9
        mov               x9, x8
        b.ne              0x32fc <asm_test::neg::u32::acqrel+0x8>
        ret

asm_test::neg::u32::seqcst:
        ldr               w9, [x0]
        mov               x8, x9
        neg               w10, w9
        casal             w8, w10, [x0]
        cmp               w8, w9
        mov               x9, x8
        b.ne              0x331c <asm_test::neg::u32::seqcst+0x8>
        ret

asm_test::neg::u32::acquire:
        ldr               w9, [x0]
        mov               x8, x9
        neg               w10, w9
        casa              w8, w10, [x0]
        cmp               w8, w9
        mov               x9, x8
        b.ne              0x333c <asm_test::neg::u32::acquire+0x8>
        ret

asm_test::neg::u32::relaxed:
        ldr               w9, [x0]
        mov               x8, x9
        neg               w10, w9
        cas               w8, w10, [x0]
        cmp               w8, w9
        mov               x9, x8
        b.ne              0x335c <asm_test::neg::u32::relaxed+0x8>
        ret

asm_test::neg::u32::release:
        ldr               w9, [x0]
        mov               x8, x9
        neg               w10, w9
        casl              w8, w10, [x0]
        cmp               w8, w9
        mov               x9, x8
        b.ne              0x337c <asm_test::neg::u32::release+0x8>
        ret

asm_test::neg::u64::acqrel:
        ldr               x9, [x0]
        mov               x8, x9
        neg               x10, x9
        casal             x8, x10, [x0]
        cmp               x8, x9
        mov               x9, x8
        b.ne              0x339c <asm_test::neg::u64::acqrel+0x8>
        ret
        ldr               x9, [x0]
        mov               x8, x9
        neg               x10, x9
        casal             x8, x10, [x0]
        cmp               x8, x9
        mov               x9, x8
        b.ne              0x33bc <asm_test::neg::u64::seqcst+0x8>
        ret
        ldr               x9, [x0]
        mov               x8, x9
        neg               x10, x9
        casa              x8, x10, [x0]
        cmp               x8, x9
        mov               x9, x8
        b.ne              0x33dc <asm_test::neg::u64::acquire+0x8>
        ret
        ldr               x9, [x0]
        mov               x8, x9
        neg               x10, x9
        cas               x8, x10, [x0]
        cmp               x8, x9
        mov               x9, x8
        b.ne              0x33fc <asm_test::neg::u64::relaxed+0x8>
        ret

asm_test::neg::u64::release:
        ldr               x9, [x0]
        mov               x8, x9
        neg               x10, x9
        casl              x8, x10, [x0]
        cmp               x8, x9
        mov               x9, x8
        b.ne              0x341c <asm_test::neg::u64::release+0x8>
        ret

asm_test::neg::u128::acqrel:
        ldaxp             x8, x9, [x0]
        negs              x10, x8
        ngc               x11, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x3434 <asm_test::neg::u128::acqrel>
        ret
        ldaxp             x8, x9, [x0]
        negs              x10, x8
        ngc               x11, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x344c <asm_test::neg::u128::seqcst>
        ret

asm_test::neg::u128::acquire:
        ldaxp             x8, x9, [x0]
        negs              x10, x8
        ngc               x11, x9
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0x3464 <asm_test::neg::u128::acquire>
        ret
        ldxp              x8, x9, [x0]
        negs              x10, x8
        ngc               x11, x9
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0x347c <asm_test::neg::u128::relaxed>
        ret

asm_test::neg::u128::release:
        ldxp              x8, x9, [x0]
        negs              x10, x8
        ngc               x11, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x3494 <asm_test::neg::u128::release>
        ret
        mov               w8, #-0x1               ; =-1
        ldeoralb          w8, w8, [x0]
        ret
        mov               w8, #-0x1               ; =-1
        ldeoralb          w8, w8, [x0]
        ret
        mov               w8, #-0x1               ; =-1
        ldeorab           w8, w8, [x0]
        ret
        mov               w8, #-0x1               ; =-1
        ldeorb            w8, w8, [x0]
        ret
        mov               w8, #-0x1               ; =-1
        ldeorlb           w8, w8, [x0]
        ret
        mov               w8, #-0x1               ; =-1
        ldeoralh          w8, w8, [x0]
        ret
        mov               w8, #-0x1               ; =-1
        ldeoralh          w8, w8, [x0]
        ret

asm_test::not::u16::acquire:
        mov               w8, #-0x1               ; =-1
        ldeorah           w8, w8, [x0]
        ret
        mov               w8, #-0x1               ; =-1
        ldeorh            w8, w8, [x0]
        ret

asm_test::not::u16::release:
        mov               w8, #-0x1               ; =-1
        ldeorlh           w8, w8, [x0]
        ret

asm_test::not::u32::acqrel:
        mov               w8, #-0x1               ; =-1
        ldeoral           w8, w8, [x0]
        ret

asm_test::not::u32::seqcst:
        mov               w8, #-0x1               ; =-1
        ldeoral           w8, w8, [x0]
        ret
        mov               w8, #-0x1               ; =-1
        ldeora            w8, w8, [x0]
        ret

asm_test::not::u32::relaxed:
        mov               w8, #-0x1               ; =-1
        ldeor             w8, w8, [x0]
        ret

asm_test::not::u32::release:
        mov               w8, #-0x1               ; =-1
        ldeorl            w8, w8, [x0]
        ret

asm_test::not::u64::acqrel:
        mov               x8, #-0x1               ; =-1
        ldeoral           x8, x8, [x0]
        ret
        mov               x8, #-0x1               ; =-1
        ldeoral           x8, x8, [x0]
        ret

asm_test::not::u64::acquire:
        mov               x8, #-0x1               ; =-1
        ldeora            x8, x8, [x0]
        ret

asm_test::not::u64::relaxed:
        mov               x8, #-0x1               ; =-1
        ldeor             x8, x8, [x0]
        ret

asm_test::not::u64::release:
        mov               x8, #-0x1               ; =-1
        ldeorl            x8, x8, [x0]
        ret
        mov               w8, #0x1                ; =1
        ldeoralb          w8, w8, [x0]
        ret
        mov               w8, #0x1                ; =1
        ldeoralb          w8, w8, [x0]
        ret
        mov               w8, #0x1                ; =1
        ldeorab           w8, w8, [x0]
        ret
        mov               w8, #0x1                ; =1
        ldeorb            w8, w8, [x0]
        ret
        mov               w8, #0x1                ; =1
        ldeorlb           w8, w8, [x0]
        ret
        ldaxp             x8, x9, [x0]
        mvn               x10, x8
        mvn               x11, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x35d8 <asm_test::not::u128::acqrel>
        ret
        ldaxp             x8, x9, [x0]
        mvn               x10, x8
        mvn               x11, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x35f0 <asm_test::not::u128::seqcst>
        ret

asm_test::not::u128::acquire:
        ldaxp             x8, x9, [x0]
        mvn               x10, x8
        mvn               x11, x9
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0x3608 <asm_test::not::u128::acquire>
        ret

asm_test::not::u128::relaxed:
        ldxp              x8, x9, [x0]
        mvn               x10, x8
        mvn               x11, x9
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0x3620 <asm_test::not::u128::relaxed>
        ret

asm_test::not::u128::release:
        ldxp              x8, x9, [x0]
        mvn               x10, x8
        mvn               x11, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x3638 <asm_test::not::u128::release>
        ret

asm_test::sub::u8::acqrel:
        neg               w8, w1
        ldaddalb          w8, w8, [x0]
        ret
        neg               w8, w1
        ldaddalb          w8, w8, [x0]
        ret

asm_test::sub::u8::acquire:
        neg               w8, w1
        ldaddab           w8, w8, [x0]
        ret

asm_test::sub::u8::relaxed:
        neg               w8, w1
        ldaddb            w8, w8, [x0]
        ret

asm_test::sub::u8::release:
        neg               w8, w1
        ldaddlb           w8, w8, [x0]
        ret
        neg               w8, w1
        ldaddalh          w8, w8, [x0]
        ret

asm_test::sub::u16::seqcst:
        neg               w8, w1
        ldaddalh          w8, w8, [x0]
        ret
        neg               w8, w1
        ldaddah           w8, w8, [x0]
        ret
        neg               w8, w1
        ldaddh            w8, w8, [x0]
        ret
        neg               w8, w1
        ldaddlh           w8, w8, [x0]
        ret
        neg               w8, w1
        ldaddal           w8, w8, [x0]
        ret
        neg               w8, w1
        ldaddal           w8, w8, [x0]
        ret
        neg               w8, w1
        ldadda            w8, w8, [x0]
        ret
        neg               w8, w1
        ldadd             w8, w8, [x0]
        ret
        neg               w8, w1
        ldaddl            w8, w8, [x0]
        ret

asm_test::sub::u64::acqrel:
        neg               x8, x1
        ldaddal           x8, x8, [x0]
        ret

asm_test::sub::u64::seqcst:
        neg               x8, x1
        ldaddal           x8, x8, [x0]
        ret
        neg               x8, x1
        ldadda            x8, x8, [x0]
        ret

asm_test::sub::u64::relaxed:
        neg               x8, x1
        ldadd             x8, x8, [x0]
        ret

asm_test::sub::u64::release:
        neg               x8, x1
        ldaddl            x8, x8, [x0]
        ret

asm_test::sub::u128::acqrel:
        ldaxp             x8, x9, [x0]
        subs              x10, x8, x1
        sbc               x11, x9, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x3740 <asm_test::sub::u128::acqrel>
        ret

asm_test::sub::u128::seqcst:
        ldaxp             x8, x9, [x0]
        subs              x10, x8, x1
        sbc               x11, x9, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x3758 <asm_test::sub::u128::seqcst>
        ret

asm_test::sub::u128::acquire:
        ldaxp             x8, x9, [x0]
        subs              x10, x8, x1
        sbc               x11, x9, x2
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0x3770 <asm_test::sub::u128::acquire>
        ret

asm_test::sub::u128::relaxed:
        ldxp              x8, x9, [x0]
        subs              x10, x8, x1
        sbc               x11, x9, x2
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0x3788 <asm_test::sub::u128::relaxed>
        ret
        ldxp              x8, x9, [x0]
        subs              x10, x8, x1
        sbc               x11, x9, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x37a0 <asm_test::sub::u128::release>
        ret
        ldeoralb          w1, w8, [x0]
        ret
        ldeoralb          w1, w8, [x0]
        ret
        ldeorab           w1, w8, [x0]
        ret
        ldeorb            w1, w8, [x0]
        ret
        ldeorlb           w1, w8, [x0]
        ret
        ldeoralh          w1, w8, [x0]
        ret
        ldeoralh          w1, w8, [x0]
        ret
        ldeorah           w1, w8, [x0]
        ret
        ldeorh            w1, w8, [x0]
        ret

asm_test::xor::u16::release:
        ldeorlh           w1, w8, [x0]
        ret

asm_test::xor::u32::acqrel:
        ldeoral           w1, w8, [x0]
        ret

asm_test::xor::u32::seqcst:
        ldeoral           w1, w8, [x0]
        ret

asm_test::xor::u32::acquire:
        ldeora            w1, w8, [x0]
        ret

asm_test::xor::u32::relaxed:
        ldeor             w1, w8, [x0]
        ret

asm_test::xor::u32::release:
        ldeorl            w1, w8, [x0]
        ret

asm_test::xor::u64::acqrel:
        ldeoral           x1, x8, [x0]
        ret

asm_test::xor::u64::seqcst:
        ldeoral           x1, x8, [x0]
        ret

asm_test::xor::u64::acquire:
        ldeora            x1, x8, [x0]
        ret

asm_test::xor::u64::relaxed:
        ldeor             x1, x8, [x0]
        ret

asm_test::xor::u64::release:
        ldeorl            x1, x8, [x0]
        ret

asm_test::xor::bool::acqrel:
        ldeoralb          w1, w8, [x0]
        ret

asm_test::xor::bool::seqcst:
        ldeoralb          w1, w8, [x0]
        ret

asm_test::xor::bool::acquire:
        ldeorab           w1, w8, [x0]
        ret

asm_test::xor::bool::relaxed:
        ldeorb            w1, w8, [x0]
        ret

asm_test::xor::bool::release:
        ldeorlb           w1, w8, [x0]
        ret

asm_test::xor::u128::acqrel:
        ldaxp             x8, x9, [x0]
        eor               x10, x8, x1
        eor               x11, x9, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x3880 <asm_test::xor::u128::acqrel>
        ret

asm_test::xor::u128::seqcst:
        ldaxp             x8, x9, [x0]
        eor               x10, x8, x1
        eor               x11, x9, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x3898 <asm_test::xor::u128::seqcst>
        ret
        ldaxp             x8, x9, [x0]
        eor               x10, x8, x1
        eor               x11, x9, x2
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0x38b0 <asm_test::xor::u128::acquire>
        ret
        ldxp              x8, x9, [x0]
        eor               x10, x8, x1
        eor               x11, x9, x2
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0x38c8 <asm_test::xor::u128::relaxed>
        ret
        ldxp              x8, x9, [x0]
        eor               x10, x8, x1
        eor               x11, x9, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x38e0 <asm_test::xor::u128::release>
        ret
        ldarb             w0, [x0]
        ret

asm_test::load::u8::acquire:
        ldaprb            w0, [x0]
        ret

asm_test::load::u8::relaxed:
        ldrb              w0, [x0]
        ret

asm_test::load::f32::seqcst:
        ldar              w8, [x0]
        fmov              s0, w8
        ret
        ldapr             w8, [x0]
        fmov              s0, w8
        ret

asm_test::load::f32::relaxed:
        ldr               s0, [x0]
        ret

asm_test::load::f64::seqcst:
        ldar              x8, [x0]
        fmov              d0, x8
        ret
        ldapr             x8, [x0]
        fmov              d0, x8
        ret

asm_test::load::f64::relaxed:
        ldr               d0, [x0]
        ret

asm_test::load::u16::seqcst:
        ldarh             w0, [x0]
        ret

asm_test::load::u16::acquire:
        ldaprh            w0, [x0]
        ret

asm_test::load::u16::relaxed:
        ldrh              w0, [x0]
        ret

asm_test::load::u32::seqcst:
        ldar              w0, [x0]
        ret

asm_test::load::u32::acquire:
        ldapr             w0, [x0]
        ret

asm_test::load::u32::relaxed:
        ldr               w0, [x0]
        ret

asm_test::load::u64::seqcst:
        ldar              x0, [x0]
        ret

asm_test::load::u64::acquire:
        ldapr             x0, [x0]
        ret

asm_test::load::u64::relaxed:
        ldr               x0, [x0]
        ret

asm_test::load::bool::seqcst:
        ldarb             w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        ldaprb            w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        ldrb              w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        ldar              x8, [x0]
        ldp               x0, x1, [x0]
        dmb               ishld
        ret
        ldp               x0, x1, [x0]
        dmb               ishld
        ret
        ldp               x0, x1, [x0]
        ret
        swpalb            w1, w0, [x0]
        ret
        swpalb            w1, w0, [x0]
        ret
        swpab             w1, w0, [x0]
        ret
        swpb              w1, w0, [x0]
        ret
        swplb             w1, w0, [x0]
        ret
        fmov              w8, s0
        swpal             w8, w8, [x0]
        fmov              s0, w8
        ret
        fmov              w8, s0
        swpal             w8, w8, [x0]
        fmov              s0, w8
        ret
        fmov              w8, s0
        swpa              w8, w8, [x0]
        fmov              s0, w8
        ret
        fmov              w8, s0
        swp               w8, w8, [x0]
        fmov              s0, w8
        ret
        fmov              w8, s0
        swpl              w8, w8, [x0]
        fmov              s0, w8
        ret
        fmov              x8, d0
        swpal             x8, x8, [x0]
        fmov              d0, x8
        ret
        fmov              x8, d0
        swpal             x8, x8, [x0]
        fmov              d0, x8
        ret
        fmov              x8, d0
        swpa              x8, x8, [x0]
        fmov              d0, x8
        ret
        fmov              x8, d0
        swp               x8, x8, [x0]
        fmov              d0, x8
        ret
        fmov              x8, d0
        swpl              x8, x8, [x0]
        fmov              d0, x8
        ret
        swpalh            w1, w0, [x0]
        ret
        swpalh            w1, w0, [x0]
        ret
        swpah             w1, w0, [x0]
        ret
        swph              w1, w0, [x0]
        ret
        swplh             w1, w0, [x0]
        ret
        swpal             w1, w0, [x0]
        ret
        swpal             w1, w0, [x0]
        ret
        swpa              w1, w0, [x0]
        ret
        swp               w1, w0, [x0]
        ret
        swpl              w1, w0, [x0]
        ret
        swpal             x1, x0, [x0]
        ret
        swpal             x1, x0, [x0]
        ret
        swpa              x1, x0, [x0]
        ret
        swp               x1, x0, [x0]
        ret
        swpl              x1, x0, [x0]
        ret
        swpalb            w1, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        swpalb            w1, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        swpab             w1, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        swpb              w1, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        swplb             w1, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        ldaxp             x8, x9, [x0]
        stlxp             w10, x1, x2, [x0]
        cbnz              w10, 0x3b7c <asm_test::swap::u128::acqrel>
        mov               x0, x8
        mov               x1, x9
        ret
        ldaxp             x8, x9, [x0]
        stlxp             w10, x1, x2, [x0]
        cbnz              w10, 0x3b94 <asm_test::swap::u128::seqcst>
        mov               x0, x8
        mov               x1, x9
        ret
        ldaxp             x8, x9, [x0]
        stxp              w10, x1, x2, [x0]
        cbnz              w10, 0x3bac <asm_test::swap::u128::acquire>
        mov               x0, x8
        mov               x1, x9
        ret
        ldxp              x8, x9, [x0]
        stxp              w10, x1, x2, [x0]
        cbnz              w10, 0x3bc4 <asm_test::swap::u128::relaxed>
        mov               x0, x8
        mov               x1, x9
        ret
        ldxp              x8, x9, [x0]
        stlxp             w10, x1, x2, [x0]
        cbnz              w10, 0x3bdc <asm_test::swap::u128::release>
        mov               x0, x8
        mov               x1, x9
        ret
        stlrb             w1, [x0]
        ret
        strb              w1, [x0]
        ret
        stlrb             w1, [x0]
        ret
        fmov              w8, s0
        stlr              w8, [x0]
        ret
        str               s0, [x0]
        ret
        fmov              w8, s0
        stlr              w8, [x0]
        ret
        fmov              x8, d0
        stlr              x8, [x0]
        ret
        str               d0, [x0]
        ret
        fmov              x8, d0
        stlr              x8, [x0]
        ret
        stlrh             w1, [x0]
        ret
        strh              w1, [x0]
        ret
        stlrh             w1, [x0]
        ret
        stlr              w1, [x0]
        ret
        str               w1, [x0]
        ret
        stlr              w1, [x0]
        ret
        stlr              x1, [x0]
        ret
        str               x1, [x0]
        ret
        stlr              x1, [x0]
        ret
        stlrb             w1, [x0]
        ret
        strb              w1, [x0]
        ret
        stlrb             w1, [x0]
        ret
        dmb               ish
        stp               x1, x2, [x0]
        dmb               ish
        ret
        stp               x1, x2, [x0]
        ret
        dmb               ish
        stp               x1, x2, [x0]
        ret
        and               x8, x1, #0x7
        mov               w9, #0x1                ; =1
        lsl               w8, w9, w8
        ldsetalb          w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret
        and               x8, x1, #0x7
        mov               w9, #0x1                ; =1
        lsl               w8, w9, w8
        ldsetalb          w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret
        and               x8, x1, #0x7
        mov               w9, #0x1                ; =1
        lsl               w8, w9, w8
        ldsetab           w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret
        and               x8, x1, #0x7
        mov               w9, #0x1                ; =1
        lsl               w8, w9, w8
        ldsetb            w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret
        and               x8, x1, #0x7
        mov               w9, #0x1                ; =1
        lsl               w8, w9, w8
        ldsetlb           w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret
        and               x8, x1, #0xf
        mov               w9, #0x1                ; =1
        lsl               w8, w9, w8
        ldsetalh          w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret
        and               x8, x1, #0xf
        mov               w9, #0x1                ; =1
        lsl               w8, w9, w8
        ldsetalh          w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret
        and               x8, x1, #0xf
        mov               w9, #0x1                ; =1
        lsl               w8, w9, w8
        ldsetah           w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret
        and               x8, x1, #0xf
        mov               w9, #0x1                ; =1
        lsl               w8, w9, w8
        ldseth            w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret
        and               x8, x1, #0xf
        mov               w9, #0x1                ; =1
        lsl               w8, w9, w8
        ldsetlh           w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret
        mov               w8, #0x1                ; =1
        lsl               w8, w8, w1
        ldsetal           w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret
        mov               w8, #0x1                ; =1
        lsl               w8, w8, w1
        ldsetal           w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret
        mov               w8, #0x1                ; =1
        lsl               w8, w8, w1
        ldseta            w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret
        mov               w8, #0x1                ; =1
        lsl               w8, w8, w1
        ldset             w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret
        mov               w8, #0x1                ; =1
        lsl               w8, w8, w1
        ldsetl            w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret
        mov               w8, #0x1                ; =1
        lsl               x8, x8, x1
        ldsetal           x8, x9, [x0]
        tst               x9, x8
        cset              w0, ne
        ret
        mov               w8, #0x1                ; =1
        lsl               x8, x8, x1
        ldsetal           x8, x9, [x0]
        tst               x9, x8
        cset              w0, ne
        ret
        mov               w8, #0x1                ; =1
        lsl               x8, x8, x1
        ldseta            x8, x9, [x0]
        tst               x9, x8
        cset              w0, ne
        ret
        mov               w8, #0x1                ; =1
        lsl               x8, x8, x1
        ldset             x8, x9, [x0]
        tst               x9, x8
        cset              w0, ne
        ret
        mov               w8, #0x1                ; =1
        lsl               x8, x8, x1
        ldsetl            x8, x9, [x0]
        tst               x9, x8
        cset              w0, ne
        ret
        and               w8, w1, #0x7f
        mov               w9, #0x1                ; =1
        lsl               x9, x9, x8
        tst               x8, #0x40
        csel              x8, xzr, x9, ne
        csel              x9, x9, xzr, ne
        ldaxp             x10, x11, [x0]
        orr               x12, x10, x8
        orr               x13, x11, x9
        stlxp             w14, x12, x13, [x0]
        cbnz              w14, 0x3ef0 <asm_test::bit_set::u128::acqrel+0x18>
        and               x9, x11, x9
        and               x8, x10, x8
        orr               x8, x8, x9
        cmp               x8, #0x0
        cset              w0, ne
        ret
        and               w8, w1, #0x7f
        mov               w9, #0x1                ; =1
        lsl               x9, x9, x8
        tst               x8, #0x40
        csel              x8, xzr, x9, ne
        csel              x9, x9, xzr, ne
        ldaxp             x10, x11, [x0]
        orr               x12, x10, x8
        orr               x13, x11, x9
        stlxp             w14, x12, x13, [x0]
        cbnz              w14, 0x3f34 <asm_test::bit_set::u128::seqcst+0x18>
        and               x9, x11, x9
        and               x8, x10, x8
        orr               x8, x8, x9
        cmp               x8, #0x0
        cset              w0, ne
        ret
        and               w8, w1, #0x7f
        mov               w9, #0x1                ; =1
        lsl               x9, x9, x8
        tst               x8, #0x40
        csel              x8, xzr, x9, ne
        csel              x9, x9, xzr, ne
        ldaxp             x10, x11, [x0]
        orr               x12, x10, x8
        orr               x13, x11, x9
        stxp              w14, x12, x13, [x0]
        cbnz              w14, 0x3f78 <asm_test::bit_set::u128::acquire+0x18>
        and               x9, x11, x9
        and               x8, x10, x8
        orr               x8, x8, x9
        cmp               x8, #0x0
        cset              w0, ne
        ret
        and               w8, w1, #0x7f
        mov               w9, #0x1                ; =1
        lsl               x9, x9, x8
        tst               x8, #0x40
        csel              x8, xzr, x9, ne
        csel              x9, x9, xzr, ne
        ldxp              x10, x11, [x0]
        orr               x12, x10, x8
        orr               x13, x11, x9
        stxp              w14, x12, x13, [x0]
        cbnz              w14, 0x3fbc <asm_test::bit_set::u128::relaxed+0x18>
        and               x9, x11, x9
        and               x8, x10, x8
        orr               x8, x8, x9
        cmp               x8, #0x0
        cset              w0, ne
        ret
        and               w8, w1, #0x7f
        mov               w9, #0x1                ; =1
        lsl               x9, x9, x8
        tst               x8, #0x40
        csel              x8, xzr, x9, ne
        csel              x9, x9, xzr, ne
        ldxp              x10, x11, [x0]
        orr               x12, x10, x8
        orr               x13, x11, x9
        stlxp             w14, x12, x13, [x0]
        cbnz              w14, 0x4000 <asm_test::bit_set::u128::release+0x18>
        and               x9, x11, x9
        and               x8, x10, x8
        orr               x8, x8, x9
        cmp               x8, #0x0
        cset              w0, ne
        ret
        ldsetalb          w1, w0, [x0]
        ret

asm_test::fetch_or::u8::seqcst:
        ldsetalb          w1, w0, [x0]
        ret
        ldsetab           w1, w0, [x0]
        ret

asm_test::fetch_or::u8::relaxed:
        ldsetb            w1, w0, [x0]
        ret
        ldsetlb           w1, w0, [x0]
        ret

asm_test::fetch_or::u16::acqrel:
        ldsetalh          w1, w0, [x0]
        ret
        ldsetalh          w1, w0, [x0]
        ret

asm_test::fetch_or::u16::acquire:
        ldsetah           w1, w0, [x0]
        ret
        ldseth            w1, w0, [x0]
        ret

asm_test::fetch_or::u16::release:
        ldsetlh           w1, w0, [x0]
        ret
        ldsetal           w1, w0, [x0]
        ret

asm_test::fetch_or::u32::seqcst:
        ldsetal           w1, w0, [x0]
        ret
        ldseta            w1, w0, [x0]
        ret

asm_test::fetch_or::u32::relaxed:
        ldset             w1, w0, [x0]
        ret
        ldsetl            w1, w0, [x0]
        ret
        ldsetal           x1, x0, [x0]
        ret
        ldsetal           x1, x0, [x0]
        ret
        ldseta            x1, x0, [x0]
        ret
        ldset             x1, x0, [x0]
        ret
        ldsetl            x1, x0, [x0]
        ret
        ldsetalb          w1, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        ldsetalb          w1, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        ldsetab           w1, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        ldsetb            w1, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        ldsetlb           w1, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        ldaxp             x8, x9, [x0]
        orr               x10, x8, x1
        orr               x11, x9, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x411c <asm_test::fetch_or::u128::acqrel>
        mov               x0, x8
        mov               x1, x9
        ret
        ldaxp             x8, x9, [x0]
        orr               x10, x8, x1
        orr               x11, x9, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x413c <asm_test::fetch_or::u128::seqcst>
        mov               x0, x8
        mov               x1, x9
        ret
        ldaxp             x8, x9, [x0]
        orr               x10, x8, x1
        orr               x11, x9, x2
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0x415c <asm_test::fetch_or::u128::acquire>
        mov               x0, x8
        mov               x1, x9
        ret
        ldxp              x8, x9, [x0]
        orr               x10, x8, x1
        orr               x11, x9, x2
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0x417c <asm_test::fetch_or::u128::relaxed>
        mov               x0, x8
        mov               x1, x9
        ret
        ldxp              x8, x9, [x0]
        orr               x10, x8, x1
        orr               x11, x9, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x419c <asm_test::fetch_or::u128::release>
        mov               x0, x8
        mov               x1, x9
        ret
        and               x8, x1, #0x7
        mov               w9, #0x1                ; =1
        lsl               w8, w9, w8
        ldclralb          w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret
        and               x8, x1, #0x7
        mov               w9, #0x1                ; =1
        lsl               w8, w9, w8
        ldclralb          w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret
        and               x8, x1, #0x7
        mov               w9, #0x1                ; =1
        lsl               w8, w9, w8
        ldclrab           w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret

asm_test::bit_clear::u8::relaxed:
        and               x8, x1, #0x7
        mov               w9, #0x1                ; =1
        lsl               w8, w9, w8
        ldclrb            w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret
        and               x8, x1, #0x7
        mov               w9, #0x1                ; =1
        lsl               w8, w9, w8
        ldclrlb           w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret

asm_test::bit_clear::u16::acqrel:
        and               x8, x1, #0xf
        mov               w9, #0x1                ; =1
        lsl               w8, w9, w8
        ldclralh          w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret

asm_test::bit_clear::u16::seqcst:
        and               x8, x1, #0xf
        mov               w9, #0x1                ; =1
        lsl               w8, w9, w8
        ldclralh          w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret

asm_test::bit_clear::u16::acquire:
        and               x8, x1, #0xf
        mov               w9, #0x1                ; =1
        lsl               w8, w9, w8
        ldclrah           w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret
        and               x8, x1, #0xf
        mov               w9, #0x1                ; =1
        lsl               w8, w9, w8
        ldclrh            w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret
        and               x8, x1, #0xf
        mov               w9, #0x1                ; =1
        lsl               w8, w9, w8
        ldclrlh           w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret
        mov               w8, #0x1                ; =1
        lsl               w8, w8, w1
        ldclral           w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret
        mov               w8, #0x1                ; =1
        lsl               w8, w8, w1
        ldclral           w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret

asm_test::bit_clear::u32::acquire:
        mov               w8, #0x1                ; =1
        lsl               w8, w8, w1
        ldclra            w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret
        mov               w8, #0x1                ; =1
        lsl               w8, w8, w1
        ldclr             w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret

asm_test::bit_clear::u32::release:
        mov               w8, #0x1                ; =1
        lsl               w8, w8, w1
        ldclrl            w8, w9, [x0]
        tst               w9, w8
        cset              w0, ne
        ret
        mov               w8, #0x1                ; =1
        lsl               x8, x8, x1
        ldclral           x8, x9, [x0]
        tst               x9, x8
        cset              w0, ne
        ret

asm_test::bit_clear::u64::seqcst:
        mov               w8, #0x1                ; =1
        lsl               x8, x8, x1
        ldclral           x8, x9, [x0]
        tst               x9, x8
        cset              w0, ne
        ret
        mov               w8, #0x1                ; =1
        lsl               x8, x8, x1
        ldclra            x8, x9, [x0]
        tst               x9, x8
        cset              w0, ne
        ret

asm_test::bit_clear::u64::relaxed:
        mov               w8, #0x1                ; =1
        lsl               x8, x8, x1
        ldclr             x8, x9, [x0]
        tst               x9, x8
        cset              w0, ne
        ret
        mov               w8, #0x1                ; =1
        lsl               x8, x8, x1
        ldclrl            x8, x9, [x0]
        tst               x9, x8
        cset              w0, ne
        ret
        and               w8, w1, #0x7f
        mov               w9, #0x1                ; =1
        lsl               x9, x9, x8
        tst               x8, #0x40
        csel              x8, x9, xzr, ne
        csel              x9, xzr, x9, ne
        mvn               x10, x9
        mvn               x11, x8
        ldaxp             x12, x13, [x0]
        and               x14, x12, x10
        and               x15, x13, x11
        stlxp             w16, x14, x15, [x0]
        cbnz              w16, 0x43e4 <asm_test::bit_clear::u128::acqrel+0x20>
        and               x8, x13, x8
        and               x9, x12, x9
        orr               x8, x9, x8
        cmp               x8, #0x0
        cset              w0, ne
        ret

asm_test::bit_clear::u128::seqcst:
        and               w8, w1, #0x7f
        mov               w9, #0x1                ; =1
        lsl               x9, x9, x8
        tst               x8, #0x40
        csel              x8, x9, xzr, ne
        csel              x9, xzr, x9, ne
        mvn               x10, x9
        mvn               x11, x8
        ldaxp             x12, x13, [x0]
        and               x14, x12, x10
        and               x15, x13, x11
        stlxp             w16, x14, x15, [x0]
        cbnz              w16, 0x4430 <asm_test::bit_clear::u128::seqcst+0x20>
        and               x8, x13, x8
        and               x9, x12, x9
        orr               x8, x9, x8
        cmp               x8, #0x0
        cset              w0, ne
        ret
        and               w8, w1, #0x7f
        mov               w9, #0x1                ; =1
        lsl               x9, x9, x8
        tst               x8, #0x40
        csel              x8, x9, xzr, ne
        csel              x9, xzr, x9, ne
        mvn               x10, x9
        mvn               x11, x8
        ldaxp             x12, x13, [x0]
        and               x14, x12, x10
        and               x15, x13, x11
        stxp              w16, x14, x15, [x0]
        cbnz              w16, 0x447c <asm_test::bit_clear::u128::acquire+0x20>
        and               x8, x13, x8
        and               x9, x12, x9
        orr               x8, x9, x8
        cmp               x8, #0x0
        cset              w0, ne
        ret
        and               w8, w1, #0x7f
        mov               w9, #0x1                ; =1
        lsl               x9, x9, x8
        tst               x8, #0x40
        csel              x8, x9, xzr, ne
        csel              x9, xzr, x9, ne
        mvn               x10, x9
        mvn               x11, x8
        ldxp              x12, x13, [x0]
        and               x14, x12, x10
        and               x15, x13, x11
        stxp              w16, x14, x15, [x0]
        cbnz              w16, 0x44c8 <asm_test::bit_clear::u128::relaxed+0x20>
        and               x8, x13, x8
        and               x9, x12, x9
        orr               x8, x9, x8
        cmp               x8, #0x0
        cset              w0, ne
        ret
        and               w8, w1, #0x7f
        mov               w9, #0x1                ; =1
        lsl               x9, x9, x8
        tst               x8, #0x40
        csel              x8, x9, xzr, ne
        csel              x9, xzr, x9, ne
        mvn               x10, x9
        mvn               x11, x8
        ldxp              x12, x13, [x0]
        and               x14, x12, x10
        and               x15, x13, x11
        stlxp             w16, x14, x15, [x0]
        cbnz              w16, 0x4514 <asm_test::bit_clear::u128::release+0x20>
        and               x8, x13, x8
        and               x9, x12, x9
        orr               x8, x9, x8
        cmp               x8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_abs::f32::acqrel:
        mov               w8, #-0x80000000        ; =-2147483648
        ldclral           w8, w8, [x0]
        fmov              s0, w8
        ret

asm_test::fetch_abs::f32::seqcst:
        mov               w8, #-0x80000000        ; =-2147483648
        ldclral           w8, w8, [x0]
        fmov              s0, w8
        ret

asm_test::fetch_abs::f32::acquire:
        mov               w8, #-0x80000000        ; =-2147483648
        ldclra            w8, w8, [x0]
        fmov              s0, w8
        ret

asm_test::fetch_abs::f32::relaxed:
        mov               w8, #-0x80000000        ; =-2147483648
        ldclr             w8, w8, [x0]
        fmov              s0, w8
        ret

asm_test::fetch_abs::f32::release:
        mov               w8, #-0x80000000        ; =-2147483648
        ldclrl            w8, w8, [x0]
        fmov              s0, w8
        ret

asm_test::fetch_abs::f64::acqrel:
        mov               x8, #-0x8000000000000000 ; =-9223372036854775808
        ldclral           x8, x8, [x0]
        fmov              d0, x8
        ret
        mov               x8, #-0x8000000000000000 ; =-9223372036854775808
        ldclral           x8, x8, [x0]
        fmov              d0, x8
        ret
        mov               x8, #-0x8000000000000000 ; =-9223372036854775808
        ldclra            x8, x8, [x0]
        fmov              d0, x8
        ret
        mov               x8, #-0x8000000000000000 ; =-9223372036854775808
        ldclr             x8, x8, [x0]
        fmov              d0, x8
        ret
        mov               x8, #-0x8000000000000000 ; =-9223372036854775808
        ldclrl            x8, x8, [x0]
        fmov              d0, x8
        ret
        ldaddalb          w1, w0, [x0]
        ret
        ldaddalb          w1, w0, [x0]
        ret
        ldaddab           w1, w0, [x0]
        ret
        ldaddb            w1, w0, [x0]
        ret

asm_test::fetch_add::u8::release:
        ldaddlb           w1, w0, [x0]
        ret

asm_test::fetch_add::f32::acqrel:
        ldr               w8, [x0]
        mov               x9, x8
        fmov              s1, w8
        fadd              s1, s0, s1
        fmov              w10, s1
        casal             w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x4610 <asm_test::fetch_add::f32::acqrel+0x8>
        fmov              s0, w8
        ret

asm_test::fetch_add::f32::seqcst:
        ldr               w8, [x0]
        mov               x9, x8
        fmov              s1, w8
        fadd              s1, s0, s1
        fmov              w10, s1
        casal             w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x463c <asm_test::fetch_add::f32::seqcst+0x8>
        fmov              s0, w8
        ret

asm_test::fetch_add::f32::acquire:
        ldr               w8, [x0]
        mov               x9, x8
        fmov              s1, w8
        fadd              s1, s0, s1
        fmov              w10, s1
        casa              w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x4668 <asm_test::fetch_add::f32::acquire+0x8>
        fmov              s0, w8
        ret
        ldr               w8, [x0]
        mov               x9, x8
        fmov              s1, w8
        fadd              s1, s0, s1
        fmov              w10, s1
        cas               w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x4694 <asm_test::fetch_add::f32::relaxed+0x8>
        fmov              s0, w8
        ret
        ldr               w8, [x0]
        mov               x9, x8
        fmov              s1, w8
        fadd              s1, s0, s1
        fmov              w10, s1
        casl              w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x46c0 <asm_test::fetch_add::f32::release+0x8>
        fmov              s0, w8
        ret
        ldr               x8, [x0]
        mov               x9, x8
        fmov              d1, x8
        fadd              d1, d0, d1
        fmov              x10, d1
        casal             x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x46ec <asm_test::fetch_add::f64::acqrel+0x8>
        fmov              d0, x8
        ret

asm_test::fetch_add::f64::seqcst:
        ldr               x8, [x0]
        mov               x9, x8
        fmov              d1, x8
        fadd              d1, d0, d1
        fmov              x10, d1
        casal             x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x4718 <asm_test::fetch_add::f64::seqcst+0x8>
        fmov              d0, x8
        ret
        ldr               x8, [x0]
        mov               x9, x8
        fmov              d1, x8
        fadd              d1, d0, d1
        fmov              x10, d1
        casa              x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x4744 <asm_test::fetch_add::f64::acquire+0x8>
        fmov              d0, x8
        ret

asm_test::fetch_add::f64::relaxed:
        ldr               x8, [x0]
        mov               x9, x8
        fmov              d1, x8
        fadd              d1, d0, d1
        fmov              x10, d1
        cas               x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x4770 <asm_test::fetch_add::f64::relaxed+0x8>
        fmov              d0, x8
        ret

asm_test::fetch_add::f64::release:
        ldr               x8, [x0]
        mov               x9, x8
        fmov              d1, x8
        fadd              d1, d0, d1
        fmov              x10, d1
        casl              x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x479c <asm_test::fetch_add::f64::release+0x8>
        fmov              d0, x8
        ret
        ldaddalh          w1, w0, [x0]
        ret
        ldaddalh          w1, w0, [x0]
        ret
        ldaddah           w1, w0, [x0]
        ret
        ldaddh            w1, w0, [x0]
        ret
        ldaddlh           w1, w0, [x0]
        ret
        ldaddal           w1, w0, [x0]
        ret
        ldaddal           w1, w0, [x0]
        ret
        ldadda            w1, w0, [x0]
        ret

asm_test::fetch_add::u32::relaxed:
        ldadd             w1, w0, [x0]
        ret

asm_test::fetch_add::u32::release:
        ldaddl            w1, w0, [x0]
        ret

asm_test::fetch_add::u64::acqrel:
        ldaddal           x1, x0, [x0]
        ret

asm_test::fetch_add::u64::seqcst:
        ldaddal           x1, x0, [x0]
        ret

asm_test::fetch_add::u64::acquire:
        ldadda            x1, x0, [x0]
        ret

asm_test::fetch_add::u64::relaxed:
        ldadd             x1, x0, [x0]
        ret

asm_test::fetch_add::u64::release:
        ldaddl            x1, x0, [x0]
        ret

asm_test::fetch_add::u128::acqrel:
        ldaxp             x8, x9, [x0]
        adds              x10, x8, x1
        adc               x11, x9, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x4838 <asm_test::fetch_add::u128::acqrel>
        mov               x0, x8
        mov               x1, x9
        ret

asm_test::fetch_add::u128::seqcst:
        ldaxp             x8, x9, [x0]
        adds              x10, x8, x1
        adc               x11, x9, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x4858 <asm_test::fetch_add::u128::seqcst>
        mov               x0, x8
        mov               x1, x9
        ret

asm_test::fetch_add::u128::acquire:
        ldaxp             x8, x9, [x0]
        adds              x10, x8, x1
        adc               x11, x9, x2
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0x4878 <asm_test::fetch_add::u128::acquire>
        mov               x0, x8
        mov               x1, x9
        ret

asm_test::fetch_add::u128::relaxed:
        ldxp              x8, x9, [x0]
        adds              x10, x8, x1
        adc               x11, x9, x2
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0x4898 <asm_test::fetch_add::u128::relaxed>
        mov               x0, x8
        mov               x1, x9
        ret
        ldxp              x8, x9, [x0]
        adds              x10, x8, x1
        adc               x11, x9, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x48b8 <asm_test::fetch_add::u128::release>
        mov               x0, x8
        mov               x1, x9
        ret
        mvn               w8, w1
        ldclralb          w8, w0, [x0]
        ret
        mvn               w8, w1
        ldclralb          w8, w0, [x0]
        ret
        mvn               w8, w1
        ldclrab           w8, w0, [x0]
        ret
        mvn               w8, w1
        ldclrb            w8, w0, [x0]
        ret

asm_test::fetch_and::u8::release:
        mvn               w8, w1
        ldclrlb           w8, w0, [x0]
        ret

asm_test::fetch_and::u16::acqrel:
        mvn               w8, w1
        ldclralh          w8, w0, [x0]
        ret

asm_test::fetch_and::u16::seqcst:
        mvn               w8, w1
        ldclralh          w8, w0, [x0]
        ret
        mvn               w8, w1
        ldclrah           w8, w0, [x0]
        ret

asm_test::fetch_and::u16::relaxed:
        mvn               w8, w1
        ldclrh            w8, w0, [x0]
        ret

asm_test::fetch_and::u16::release:
        mvn               w8, w1
        ldclrlh           w8, w0, [x0]
        ret

asm_test::fetch_and::u32::acqrel:
        mvn               w8, w1
        ldclral           w8, w0, [x0]
        ret
        mvn               w8, w1
        ldclral           w8, w0, [x0]
        ret

asm_test::fetch_and::u32::acquire:
        mvn               w8, w1
        ldclra            w8, w0, [x0]
        ret

asm_test::fetch_and::u32::relaxed:
        mvn               w8, w1
        ldclr             w8, w0, [x0]
        ret

asm_test::fetch_and::u32::release:
        mvn               w8, w1
        ldclrl            w8, w0, [x0]
        ret
        mvn               x8, x1
        ldclral           x8, x0, [x0]
        ret

asm_test::fetch_and::u64::seqcst:
        mvn               x8, x1
        ldclral           x8, x0, [x0]
        ret
        mvn               x8, x1
        ldclra            x8, x0, [x0]
        ret
        mvn               x8, x1
        ldclr             x8, x0, [x0]
        ret
        mvn               x8, x1
        ldclrl            x8, x0, [x0]
        ret
        mvn               w8, w1
        ldclralb          w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        mvn               w8, w1
        ldclralb          w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        mvn               w8, w1
        ldclrab           w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        mvn               w8, w1
        ldclrb            w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        mvn               w8, w1
        ldclrlb           w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        ldaxp             x8, x9, [x0]
        and               x10, x8, x1
        and               x11, x9, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x4a2c <asm_test::fetch_and::u128::acqrel>
        mov               x0, x8
        mov               x1, x9
        ret
        ldaxp             x8, x9, [x0]
        and               x10, x8, x1
        and               x11, x9, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x4a4c <asm_test::fetch_and::u128::seqcst>
        mov               x0, x8
        mov               x1, x9
        ret
        ldaxp             x8, x9, [x0]
        and               x10, x8, x1
        and               x11, x9, x2
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0x4a6c <asm_test::fetch_and::u128::acquire>
        mov               x0, x8
        mov               x1, x9
        ret
        ldxp              x8, x9, [x0]
        and               x10, x8, x1
        and               x11, x9, x2
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0x4a8c <asm_test::fetch_and::u128::relaxed>
        mov               x0, x8
        mov               x1, x9
        ret
        ldxp              x8, x9, [x0]
        and               x10, x8, x1
        and               x11, x9, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x4aac <asm_test::fetch_and::u128::release>
        mov               x0, x8
        mov               x1, x9
        ret
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        ldrb              w8, [x0]
        sxtb              w9, w1
        mov               x10, x8
        sxtb              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, gt
        casalb            w10, w11, [x0]
        cmp               w10, w8, uxtb
        mov               x8, x10
        b.ne              0x4b0c <asm_test::fetch_max::i8::acqrel+0xc>
        mov               x0, x8
        ret
        nop
        nop
        nop
        nop
        ldrb              w8, [x0]
        sxtb              w9, w1
        mov               x10, x8
        sxtb              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, gt
        casalb            w10, w11, [x0]
        cmp               w10, w8, uxtb
        mov               x8, x10
        b.ne              0x4b4c <asm_test::fetch_max::i8::seqcst+0xc>
        mov               x0, x8
        ret
        nop
        nop
        nop
        nop
        ldrb              w8, [x0]
        sxtb              w9, w1
        mov               x10, x8
        sxtb              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, gt
        casab             w10, w11, [x0]
        cmp               w10, w8, uxtb
        mov               x8, x10
        b.ne              0x4b8c <asm_test::fetch_max::i8::acquire+0xc>
        mov               x0, x8
        ret
        nop
        nop
        nop
        nop
        ldrb              w8, [x0]
        sxtb              w9, w1
        mov               x10, x8
        sxtb              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, gt
        casb              w10, w11, [x0]
        cmp               w10, w8, uxtb
        mov               x8, x10
        b.ne              0x4bcc <asm_test::fetch_max::i8::relaxed+0xc>
        mov               x0, x8
        ret
        nop
        nop
        nop
        nop
        ldrb              w8, [x0]
        sxtb              w9, w1
        mov               x10, x8
        sxtb              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, gt
        caslb             w10, w11, [x0]
        cmp               w10, w8, uxtb
        mov               x8, x10
        b.ne              0x4c0c <asm_test::fetch_max::i8::release+0xc>
        mov               x0, x8
        ret
        ldr               w8, [x0]
        fminnm            s0, s0, s0
        mov               x9, x8
        fmov              s1, w8
        fminnm            s1, s1, s1
        fmaxnm            s1, s1, s0
        fmov              w10, s1
        casal             w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x4c3c <asm_test::fetch_max::f32::acqrel+0xc>
        fmov              s0, w8
        ret
        ldr               w8, [x0]
        fminnm            s0, s0, s0
        mov               x9, x8
        fmov              s1, w8
        fminnm            s1, s1, s1
        fmaxnm            s1, s1, s0
        fmov              w10, s1
        casal             w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x4c70 <asm_test::fetch_max::f32::seqcst+0xc>
        fmov              s0, w8
        ret
        ldr               w8, [x0]
        fminnm            s0, s0, s0
        mov               x9, x8
        fmov              s1, w8
        fminnm            s1, s1, s1
        fmaxnm            s1, s1, s0
        fmov              w10, s1
        casa              w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x4ca4 <asm_test::fetch_max::f32::acquire+0xc>
        fmov              s0, w8
        ret
        ldr               w8, [x0]
        fminnm            s0, s0, s0
        mov               x9, x8
        fmov              s1, w8
        fminnm            s1, s1, s1
        fmaxnm            s1, s1, s0
        fmov              w10, s1
        cas               w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x4cd8 <asm_test::fetch_max::f32::relaxed+0xc>
        fmov              s0, w8
        ret
        ldr               w8, [x0]
        fminnm            s0, s0, s0
        mov               x9, x8
        fmov              s1, w8
        fminnm            s1, s1, s1
        fmaxnm            s1, s1, s0
        fmov              w10, s1
        casl              w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x4d0c <asm_test::fetch_max::f32::release+0xc>
        fmov              s0, w8
        ret
        ldr               x8, [x0]
        fminnm            d0, d0, d0
        mov               x9, x8
        fmov              d1, x8
        fminnm            d1, d1, d1
        fmaxnm            d1, d1, d0
        fmov              x10, d1
        casal             x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x4d40 <asm_test::fetch_max::f64::acqrel+0xc>
        fmov              d0, x8
        ret
        ldr               x8, [x0]
        fminnm            d0, d0, d0
        mov               x9, x8
        fmov              d1, x8
        fminnm            d1, d1, d1
        fmaxnm            d1, d1, d0
        fmov              x10, d1
        casal             x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x4d74 <asm_test::fetch_max::f64::seqcst+0xc>
        fmov              d0, x8
        ret
        ldr               x8, [x0]
        fminnm            d0, d0, d0
        mov               x9, x8
        fmov              d1, x8
        fminnm            d1, d1, d1
        fmaxnm            d1, d1, d0
        fmov              x10, d1
        casa              x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x4da8 <asm_test::fetch_max::f64::acquire+0xc>
        fmov              d0, x8
        ret
        ldr               x8, [x0]
        fminnm            d0, d0, d0
        mov               x9, x8
        fmov              d1, x8
        fminnm            d1, d1, d1
        fmaxnm            d1, d1, d0
        fmov              x10, d1
        cas               x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x4ddc <asm_test::fetch_max::f64::relaxed+0xc>
        fmov              d0, x8
        ret
        ldr               x8, [x0]
        fminnm            d0, d0, d0
        mov               x9, x8
        fmov              d1, x8
        fminnm            d1, d1, d1
        fmaxnm            d1, d1, d0
        fmov              x10, d1
        casl              x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x4e10 <asm_test::fetch_max::f64::release+0xc>
        fmov              d0, x8
        ret
        nop
        nop
        ldrh              w8, [x0]
        sxth              w9, w1
        mov               x10, x8
        sxth              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, gt
        casalh            w10, w11, [x0]
        cmp               w10, w8, uxth
        mov               x8, x10
        b.ne              0x4e4c <asm_test::fetch_max::i16::acqrel+0xc>
        mov               x0, x8
        ret
        nop
        nop
        nop
        nop
        ldrh              w8, [x0]
        sxth              w9, w1
        mov               x10, x8
        sxth              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, gt
        casalh            w10, w11, [x0]
        cmp               w10, w8, uxth
        mov               x8, x10
        b.ne              0x4e8c <asm_test::fetch_max::i16::seqcst+0xc>
        mov               x0, x8
        ret
        nop
        nop
        nop
        nop
        ldrh              w8, [x0]
        sxth              w9, w1
        mov               x10, x8
        sxth              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, gt
        casah             w10, w11, [x0]
        cmp               w10, w8, uxth
        mov               x8, x10
        b.ne              0x4ecc <asm_test::fetch_max::i16::acquire+0xc>
        mov               x0, x8
        ret
        nop
        nop
        nop
        nop
        ldrh              w8, [x0]
        sxth              w9, w1
        mov               x10, x8
        sxth              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, gt
        cash              w10, w11, [x0]
        cmp               w10, w8, uxth
        mov               x8, x10
        b.ne              0x4f0c <asm_test::fetch_max::i16::relaxed+0xc>
        mov               x0, x8
        ret
        nop
        nop
        nop
        nop
        ldrh              w8, [x0]
        sxth              w9, w1
        mov               x10, x8
        sxth              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, gt
        caslh             w10, w11, [x0]
        cmp               w10, w8, uxth
        mov               x8, x10
        b.ne              0x4f4c <asm_test::fetch_max::i16::release+0xc>
        mov               x0, x8
        ret
        ldsmaxal          w1, w0, [x0]
        ret
        ldsmaxal          w1, w0, [x0]
        ret
        ldsmaxa           w1, w0, [x0]
        ret
        ldsmax            w1, w0, [x0]
        ret
        ldsmaxl           w1, w0, [x0]
        ret
        ldsmaxal          x1, x0, [x0]
        ret
        ldsmaxal          x1, x0, [x0]
        ret
        ldsmaxa           x1, x0, [x0]
        ret
        ldsmax            x1, x0, [x0]
        ret
        ldsmaxl           x1, x0, [x0]
        ret
        ldaxp             x8, x9, [x0]
        cmp               x1, x8
        sbcs              xzr, x2, x9
        csel              x11, x9, x2, lt
        csel              x10, x8, x1, lt
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x4fc0 <asm_test::fetch_max::i128::acqrel>
        mov               x0, x8
        mov               x1, x9
        ret
        ldaxp             x8, x9, [x0]
        cmp               x1, x8
        sbcs              xzr, x2, x9
        csel              x11, x9, x2, lt
        csel              x10, x8, x1, lt
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x4fe8 <asm_test::fetch_max::i128::seqcst>
        mov               x0, x8
        mov               x1, x9
        ret

asm_test::fetch_max::i128::acquire:
        ldaxp             x8, x9, [x0]
        cmp               x1, x8
        sbcs              xzr, x2, x9
        csel              x11, x9, x2, lt
        csel              x10, x8, x1, lt
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0x5010 <asm_test::fetch_max::i128::acquire>
        mov               x0, x8
        mov               x1, x9
        ret

asm_test::fetch_max::i128::relaxed:
        ldxp              x8, x9, [x0]
        cmp               x1, x8
        sbcs              xzr, x2, x9
        csel              x11, x9, x2, lt
        csel              x10, x8, x1, lt
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0x5038 <asm_test::fetch_max::i128::relaxed>
        mov               x0, x8
        mov               x1, x9
        ret

asm_test::fetch_max::i128::release:
        ldxp              x8, x9, [x0]
        cmp               x1, x8
        sbcs              xzr, x2, x9
        csel              x11, x9, x2, lt
        csel              x10, x8, x1, lt
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x5060 <asm_test::fetch_max::i128::release>
        mov               x0, x8
        mov               x1, x9
        ret
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        ldrb              w8, [x0]
        sxtb              w9, w1
        mov               x10, x8
        sxtb              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, lt
        casalb            w10, w11, [x0]
        cmp               w10, w8, uxtb
        mov               x8, x10
        b.ne              0x50cc <asm_test::fetch_min::i8::acqrel+0xc>
        mov               x0, x8
        ret
        nop
        nop
        nop
        nop

asm_test::fetch_min::i8::seqcst:
        ldrb              w8, [x0]
        sxtb              w9, w1
        mov               x10, x8
        sxtb              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, lt
        casalb            w10, w11, [x0]
        cmp               w10, w8, uxtb
        mov               x8, x10
        b.ne              0x510c <asm_test::fetch_min::i8::seqcst+0xc>
        mov               x0, x8
        ret
        nop
        nop
        nop
        nop

asm_test::fetch_min::i8::acquire:
        ldrb              w8, [x0]
        sxtb              w9, w1
        mov               x10, x8
        sxtb              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, lt
        casab             w10, w11, [x0]
        cmp               w10, w8, uxtb
        mov               x8, x10
        b.ne              0x514c <asm_test::fetch_min::i8::acquire+0xc>
        mov               x0, x8
        ret
        nop
        nop
        nop
        nop

asm_test::fetch_min::i8::relaxed:
        ldrb              w8, [x0]
        sxtb              w9, w1
        mov               x10, x8
        sxtb              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, lt
        casb              w10, w11, [x0]
        cmp               w10, w8, uxtb
        mov               x8, x10
        b.ne              0x518c <asm_test::fetch_min::i8::relaxed+0xc>
        mov               x0, x8
        ret
        nop
        nop
        nop
        nop
        ldrb              w8, [x0]
        sxtb              w9, w1
        mov               x10, x8
        sxtb              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, lt
        caslb             w10, w11, [x0]
        cmp               w10, w8, uxtb
        mov               x8, x10
        b.ne              0x51cc <asm_test::fetch_min::i8::release+0xc>
        mov               x0, x8
        ret
        ldr               w8, [x0]
        fminnm            s0, s0, s0
        mov               x9, x8
        fmov              s1, w8
        fminnm            s1, s1, s1
        fminnm            s1, s1, s0
        fmov              w10, s1
        casal             w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x51fc <asm_test::fetch_min::f32::acqrel+0xc>
        fmov              s0, w8
        ret

asm_test::fetch_min::f32::seqcst:
        ldr               w8, [x0]
        fminnm            s0, s0, s0
        mov               x9, x8
        fmov              s1, w8
        fminnm            s1, s1, s1
        fminnm            s1, s1, s0
        fmov              w10, s1
        casal             w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x5230 <asm_test::fetch_min::f32::seqcst+0xc>
        fmov              s0, w8
        ret

asm_test::fetch_min::f32::acquire:
        ldr               w8, [x0]
        fminnm            s0, s0, s0
        mov               x9, x8
        fmov              s1, w8
        fminnm            s1, s1, s1
        fminnm            s1, s1, s0
        fmov              w10, s1
        casa              w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x5264 <asm_test::fetch_min::f32::acquire+0xc>
        fmov              s0, w8
        ret
        ldr               w8, [x0]
        fminnm            s0, s0, s0
        mov               x9, x8
        fmov              s1, w8
        fminnm            s1, s1, s1
        fminnm            s1, s1, s0
        fmov              w10, s1
        cas               w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x5298 <asm_test::fetch_min::f32::relaxed+0xc>
        fmov              s0, w8
        ret
        ldr               w8, [x0]
        fminnm            s0, s0, s0
        mov               x9, x8
        fmov              s1, w8
        fminnm            s1, s1, s1
        fminnm            s1, s1, s0
        fmov              w10, s1
        casl              w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x52cc <asm_test::fetch_min::f32::release+0xc>
        fmov              s0, w8
        ret
        ldr               x8, [x0]
        fminnm            d0, d0, d0
        mov               x9, x8
        fmov              d1, x8
        fminnm            d1, d1, d1
        fminnm            d1, d1, d0
        fmov              x10, d1
        casal             x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x5300 <asm_test::fetch_min::f64::acqrel+0xc>
        fmov              d0, x8
        ret

asm_test::fetch_min::f64::seqcst:
        ldr               x8, [x0]
        fminnm            d0, d0, d0
        mov               x9, x8
        fmov              d1, x8
        fminnm            d1, d1, d1
        fminnm            d1, d1, d0
        fmov              x10, d1
        casal             x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x5334 <asm_test::fetch_min::f64::seqcst+0xc>
        fmov              d0, x8
        ret
        ldr               x8, [x0]
        fminnm            d0, d0, d0
        mov               x9, x8
        fmov              d1, x8
        fminnm            d1, d1, d1
        fminnm            d1, d1, d0
        fmov              x10, d1
        casa              x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x5368 <asm_test::fetch_min::f64::acquire+0xc>
        fmov              d0, x8
        ret

asm_test::fetch_min::f64::relaxed:
        ldr               x8, [x0]
        fminnm            d0, d0, d0
        mov               x9, x8
        fmov              d1, x8
        fminnm            d1, d1, d1
        fminnm            d1, d1, d0
        fmov              x10, d1
        cas               x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x539c <asm_test::fetch_min::f64::relaxed+0xc>
        fmov              d0, x8
        ret
        ldr               x8, [x0]
        fminnm            d0, d0, d0
        mov               x9, x8
        fmov              d1, x8
        fminnm            d1, d1, d1
        fminnm            d1, d1, d0
        fmov              x10, d1
        casl              x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x53d0 <asm_test::fetch_min::f64::release+0xc>
        fmov              d0, x8
        ret
        nop
        nop

asm_test::fetch_min::i16::acqrel:
        ldrh              w8, [x0]
        sxth              w9, w1
        mov               x10, x8
        sxth              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, lt
        casalh            w10, w11, [x0]
        cmp               w10, w8, uxth
        mov               x8, x10
        b.ne              0x540c <asm_test::fetch_min::i16::acqrel+0xc>
        mov               x0, x8
        ret
        nop
        nop
        nop
        nop

asm_test::fetch_min::i16::seqcst:
        ldrh              w8, [x0]
        sxth              w9, w1
        mov               x10, x8
        sxth              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, lt
        casalh            w10, w11, [x0]
        cmp               w10, w8, uxth
        mov               x8, x10
        b.ne              0x544c <asm_test::fetch_min::i16::seqcst+0xc>
        mov               x0, x8
        ret
        nop
        nop
        nop
        nop

asm_test::fetch_min::i16::acquire:
        ldrh              w8, [x0]
        sxth              w9, w1
        mov               x10, x8
        sxth              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, lt
        casah             w10, w11, [x0]
        cmp               w10, w8, uxth
        mov               x8, x10
        b.ne              0x548c <asm_test::fetch_min::i16::acquire+0xc>
        mov               x0, x8
        ret
        nop
        nop
        nop
        nop
        ldrh              w8, [x0]
        sxth              w9, w1
        mov               x10, x8
        sxth              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, lt
        cash              w10, w11, [x0]
        cmp               w10, w8, uxth
        mov               x8, x10
        b.ne              0x54cc <asm_test::fetch_min::i16::relaxed+0xc>
        mov               x0, x8
        ret
        nop
        nop
        nop
        nop

asm_test::fetch_min::i16::release:
        ldrh              w8, [x0]
        sxth              w9, w1
        mov               x10, x8
        sxth              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, lt
        caslh             w10, w11, [x0]
        cmp               w10, w8, uxth
        mov               x8, x10
        b.ne              0x550c <asm_test::fetch_min::i16::release+0xc>
        mov               x0, x8
        ret

asm_test::fetch_min::i32::acqrel:
        ldsminal          w1, w0, [x0]
        ret

asm_test::fetch_min::i32::seqcst:
        ldsminal          w1, w0, [x0]
        ret

asm_test::fetch_min::i32::acquire:
        ldsmina           w1, w0, [x0]
        ret

asm_test::fetch_min::i32::relaxed:
        ldsmin            w1, w0, [x0]
        ret

asm_test::fetch_min::i32::release:
        ldsminl           w1, w0, [x0]
        ret

asm_test::fetch_min::i64::acqrel:
        ldsminal          x1, x0, [x0]
        ret

asm_test::fetch_min::i64::seqcst:
        ldsminal          x1, x0, [x0]
        ret

asm_test::fetch_min::i64::acquire:
        ldsmina           x1, x0, [x0]
        ret

asm_test::fetch_min::i64::relaxed:
        ldsmin            x1, x0, [x0]
        ret

asm_test::fetch_min::i64::release:
        ldsminl           x1, x0, [x0]
        ret

asm_test::fetch_min::i128::acqrel:
        ldaxp             x8, x9, [x0]
        cmp               x1, x8
        sbcs              xzr, x2, x9
        csel              x11, x9, x2, ge
        csel              x10, x8, x1, ge
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x5580 <asm_test::fetch_min::i128::acqrel>
        mov               x0, x8
        mov               x1, x9
        ret
        ldaxp             x8, x9, [x0]
        cmp               x1, x8
        sbcs              xzr, x2, x9
        csel              x11, x9, x2, ge
        csel              x10, x8, x1, ge
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x55a8 <asm_test::fetch_min::i128::seqcst>
        mov               x0, x8
        mov               x1, x9
        ret
        ldaxp             x8, x9, [x0]
        cmp               x1, x8
        sbcs              xzr, x2, x9
        csel              x11, x9, x2, ge
        csel              x10, x8, x1, ge
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0x55d0 <asm_test::fetch_min::i128::acquire>
        mov               x0, x8
        mov               x1, x9
        ret
        ldxp              x8, x9, [x0]
        cmp               x1, x8
        sbcs              xzr, x2, x9
        csel              x11, x9, x2, ge
        csel              x10, x8, x1, ge
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0x55f8 <asm_test::fetch_min::i128::relaxed>
        mov               x0, x8
        mov               x1, x9
        ret

asm_test::fetch_min::i128::release:
        ldxp              x8, x9, [x0]
        cmp               x1, x8
        sbcs              xzr, x2, x9
        csel              x11, x9, x2, ge
        csel              x10, x8, x1, ge
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x5620 <asm_test::fetch_min::i128::release>
        mov               x0, x8
        mov               x1, x9
        ret

asm_test::fetch_neg::u8::acqrel:
        ldrb              w8, [x0]
        mov               x9, x8
        neg               w10, w8
        casalb            w9, w10, [x0]
        cmp               w9, w8, uxtb
        mov               x8, x9
        b.ne              0x5650 <asm_test::fetch_neg::u8::acqrel+0x8>
        mov               x0, x8
        ret
        ldrb              w8, [x0]
        mov               x9, x8
        neg               w10, w8
        casalb            w9, w10, [x0]
        cmp               w9, w8, uxtb
        mov               x8, x9
        b.ne              0x5674 <asm_test::fetch_neg::u8::seqcst+0x8>
        mov               x0, x8
        ret

asm_test::fetch_neg::u8::acquire:
        ldrb              w8, [x0]
        mov               x9, x8
        neg               w10, w8
        casab             w9, w10, [x0]
        cmp               w9, w8, uxtb
        mov               x8, x9
        b.ne              0x5698 <asm_test::fetch_neg::u8::acquire+0x8>
        mov               x0, x8
        ret
        ldrb              w8, [x0]
        mov               x9, x8
        neg               w10, w8
        casb              w9, w10, [x0]
        cmp               w9, w8, uxtb
        mov               x8, x9
        b.ne              0x56bc <asm_test::fetch_neg::u8::relaxed+0x8>
        mov               x0, x8
        ret
        ldrb              w8, [x0]
        mov               x9, x8
        neg               w10, w8
        caslb             w9, w10, [x0]
        cmp               w9, w8, uxtb
        mov               x8, x9
        b.ne              0x56e0 <asm_test::fetch_neg::u8::release+0x8>
        mov               x0, x8
        ret
        mov               w8, #-0x80000000        ; =-2147483648
        ldeoral           w8, w8, [x0]
        fmov              s0, w8
        ret
        mov               w8, #-0x80000000        ; =-2147483648
        ldeoral           w8, w8, [x0]
        fmov              s0, w8
        ret
        mov               w8, #-0x80000000        ; =-2147483648
        ldeora            w8, w8, [x0]
        fmov              s0, w8
        ret
        mov               w8, #-0x80000000        ; =-2147483648
        ldeor             w8, w8, [x0]
        fmov              s0, w8
        ret
        mov               w8, #-0x80000000        ; =-2147483648
        ldeorl            w8, w8, [x0]
        fmov              s0, w8
        ret
        mov               x8, #-0x8000000000000000 ; =-9223372036854775808
        ldeoral           x8, x8, [x0]
        fmov              d0, x8
        ret
        mov               x8, #-0x8000000000000000 ; =-9223372036854775808
        ldeoral           x8, x8, [x0]
        fmov              d0, x8
        ret
        mov               x8, #-0x8000000000000000 ; =-9223372036854775808
        ldeora            x8, x8, [x0]
        fmov              d0, x8
        ret
        mov               x8, #-0x8000000000000000 ; =-9223372036854775808
        ldeor             x8, x8, [x0]
        fmov              d0, x8
        ret
        mov               x8, #-0x8000000000000000 ; =-9223372036854775808
        ldeorl            x8, x8, [x0]
        fmov              d0, x8
        ret
        ldrh              w8, [x0]
        mov               x9, x8
        neg               w10, w8
        casalh            w9, w10, [x0]
        cmp               w9, w8, uxth
        mov               x8, x9
        b.ne              0x57a4 <asm_test::fetch_neg::u16::acqrel+0x8>
        mov               x0, x8
        ret
        ldrh              w8, [x0]
        mov               x9, x8
        neg               w10, w8
        casalh            w9, w10, [x0]
        cmp               w9, w8, uxth
        mov               x8, x9
        b.ne              0x57c8 <asm_test::fetch_neg::u16::seqcst+0x8>
        mov               x0, x8
        ret
        ldrh              w8, [x0]
        mov               x9, x8
        neg               w10, w8
        casah             w9, w10, [x0]
        cmp               w9, w8, uxth
        mov               x8, x9
        b.ne              0x57ec <asm_test::fetch_neg::u16::acquire+0x8>
        mov               x0, x8
        ret

asm_test::fetch_neg::u16::relaxed:
        ldrh              w8, [x0]
        mov               x9, x8
        neg               w10, w8
        cash              w9, w10, [x0]
        cmp               w9, w8, uxth
        mov               x8, x9
        b.ne              0x5810 <asm_test::fetch_neg::u16::relaxed+0x8>
        mov               x0, x8
        ret
        ldrh              w8, [x0]
        mov               x9, x8
        neg               w10, w8
        caslh             w9, w10, [x0]
        cmp               w9, w8, uxth
        mov               x8, x9
        b.ne              0x5834 <asm_test::fetch_neg::u16::release+0x8>
        mov               x0, x8
        ret

asm_test::fetch_neg::u32::acqrel:
        ldr               w8, [x0]
        mov               x9, x8
        neg               w10, w8
        casal             w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x5858 <asm_test::fetch_neg::u32::acqrel+0x8>
        mov               x0, x8
        ret

asm_test::fetch_neg::u32::seqcst:
        ldr               w8, [x0]
        mov               x9, x8
        neg               w10, w8
        casal             w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x587c <asm_test::fetch_neg::u32::seqcst+0x8>
        mov               x0, x8
        ret

asm_test::fetch_neg::u32::acquire:
        ldr               w8, [x0]
        mov               x9, x8
        neg               w10, w8
        casa              w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x58a0 <asm_test::fetch_neg::u32::acquire+0x8>
        mov               x0, x8
        ret
        ldr               w8, [x0]
        mov               x9, x8
        neg               w10, w8
        cas               w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x58c4 <asm_test::fetch_neg::u32::relaxed+0x8>
        mov               x0, x8
        ret
        ldr               w8, [x0]
        mov               x9, x8
        neg               w10, w8
        casl              w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x58e8 <asm_test::fetch_neg::u32::release+0x8>
        mov               x0, x8
        ret

asm_test::fetch_neg::u64::acqrel:
        ldr               x8, [x0]
        mov               x9, x8
        neg               x10, x8
        casal             x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x590c <asm_test::fetch_neg::u64::acqrel+0x8>
        mov               x0, x8
        ret

asm_test::fetch_neg::u64::seqcst:
        ldr               x8, [x0]
        mov               x9, x8
        neg               x10, x8
        casal             x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x5930 <asm_test::fetch_neg::u64::seqcst+0x8>
        mov               x0, x8
        ret
        ldr               x8, [x0]
        mov               x9, x8
        neg               x10, x8
        casa              x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x5954 <asm_test::fetch_neg::u64::acquire+0x8>
        mov               x0, x8
        ret

asm_test::fetch_neg::u64::relaxed:
        ldr               x8, [x0]
        mov               x9, x8
        neg               x10, x8
        cas               x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x5978 <asm_test::fetch_neg::u64::relaxed+0x8>
        mov               x0, x8
        ret

asm_test::fetch_neg::u64::release:
        ldr               x8, [x0]
        mov               x9, x8
        neg               x10, x8
        casl              x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x599c <asm_test::fetch_neg::u64::release+0x8>
        mov               x0, x8
        ret
        ldaxp             x8, x1, [x0]
        negs              x9, x8
        ngc               x10, x1
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0x59b8 <asm_test::fetch_neg::u128::acqrel>
        mov               x0, x8
        ret
        ldaxp             x8, x1, [x0]
        negs              x9, x8
        ngc               x10, x1
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0x59d4 <asm_test::fetch_neg::u128::seqcst>
        mov               x0, x8
        ret
        ldaxp             x8, x1, [x0]
        negs              x9, x8
        ngc               x10, x1
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0x59f0 <asm_test::fetch_neg::u128::acquire>
        mov               x0, x8
        ret
        ldxp              x8, x1, [x0]
        negs              x9, x8
        ngc               x10, x1
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0x5a0c <asm_test::fetch_neg::u128::relaxed>
        mov               x0, x8
        ret
        ldxp              x8, x1, [x0]
        negs              x9, x8
        ngc               x10, x1
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0x5a28 <asm_test::fetch_neg::u128::release>
        mov               x0, x8
        ret
        mov               w8, #-0x1               ; =-1
        ldeoralb          w8, w0, [x0]
        ret
        mov               w8, #-0x1               ; =-1
        ldeoralb          w8, w0, [x0]
        ret
        mov               w8, #-0x1               ; =-1
        ldeorab           w8, w0, [x0]
        ret
        mov               w8, #-0x1               ; =-1
        ldeorb            w8, w0, [x0]
        ret
        mov               w8, #-0x1               ; =-1
        ldeorlb           w8, w0, [x0]
        ret
        mov               w8, #-0x1               ; =-1
        ldeoralh          w8, w0, [x0]
        ret
        mov               w8, #-0x1               ; =-1
        ldeoralh          w8, w0, [x0]
        ret
        mov               w8, #-0x1               ; =-1
        ldeorah           w8, w0, [x0]
        ret
        mov               w8, #-0x1               ; =-1
        ldeorh            w8, w0, [x0]
        ret
        mov               w8, #-0x1               ; =-1
        ldeorlh           w8, w0, [x0]
        ret
        mov               w8, #-0x1               ; =-1
        ldeoral           w8, w0, [x0]
        ret
        mov               w8, #-0x1               ; =-1
        ldeoral           w8, w0, [x0]
        ret
        mov               w8, #-0x1               ; =-1
        ldeora            w8, w0, [x0]
        ret
        mov               w8, #-0x1               ; =-1
        ldeor             w8, w0, [x0]
        ret
        mov               w8, #-0x1               ; =-1
        ldeorl            w8, w0, [x0]
        ret
        mov               x8, #-0x1               ; =-1
        ldeoral           x8, x0, [x0]
        ret
        mov               x8, #-0x1               ; =-1
        ldeoral           x8, x0, [x0]
        ret
        mov               x8, #-0x1               ; =-1
        ldeora            x8, x0, [x0]
        ret
        mov               x8, #-0x1               ; =-1
        ldeor             x8, x0, [x0]
        ret
        mov               x8, #-0x1               ; =-1
        ldeorl            x8, x0, [x0]
        ret
        mov               w8, #0x1                ; =1
        ldeoralb          w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        mov               w8, #0x1                ; =1
        ldeoralb          w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        mov               w8, #0x1                ; =1
        ldeorab           w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        mov               w8, #0x1                ; =1
        ldeorb            w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        mov               w8, #0x1                ; =1
        ldeorlb           w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        ldaxp             x8, x1, [x0]
        mvn               x9, x8
        mvn               x10, x1
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0x5b98 <asm_test::fetch_not::u128::acqrel>
        mov               x0, x8
        ret
        ldaxp             x8, x1, [x0]
        mvn               x9, x8
        mvn               x10, x1
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0x5bb4 <asm_test::fetch_not::u128::seqcst>
        mov               x0, x8
        ret
        ldaxp             x8, x1, [x0]
        mvn               x9, x8
        mvn               x10, x1
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0x5bd0 <asm_test::fetch_not::u128::acquire>
        mov               x0, x8
        ret
        ldxp              x8, x1, [x0]
        mvn               x9, x8
        mvn               x10, x1
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0x5bec <asm_test::fetch_not::u128::relaxed>
        mov               x0, x8
        ret
        ldxp              x8, x1, [x0]
        mvn               x9, x8
        mvn               x10, x1
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0x5c08 <asm_test::fetch_not::u128::release>
        mov               x0, x8
        ret
        neg               w8, w1
        ldaddalb          w8, w0, [x0]
        ret
        neg               w8, w1
        ldaddalb          w8, w0, [x0]
        ret
        neg               w8, w1
        ldaddab           w8, w0, [x0]
        ret
        neg               w8, w1
        ldaddb            w8, w0, [x0]
        ret
        neg               w8, w1
        ldaddlb           w8, w0, [x0]
        ret
        ldr               w8, [x0]
        mov               x9, x8
        fmov              s1, w8
        fsub              s1, s1, s0
        fmov              w10, s1
        casal             w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x5c68 <asm_test::fetch_sub::f32::acqrel+0x8>
        fmov              s0, w8
        ret
        ldr               w8, [x0]
        mov               x9, x8
        fmov              s1, w8
        fsub              s1, s1, s0
        fmov              w10, s1
        casal             w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x5c94 <asm_test::fetch_sub::f32::seqcst+0x8>
        fmov              s0, w8
        ret
        ldr               w8, [x0]
        mov               x9, x8
        fmov              s1, w8
        fsub              s1, s1, s0
        fmov              w10, s1
        casa              w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x5cc0 <asm_test::fetch_sub::f32::acquire+0x8>
        fmov              s0, w8
        ret
        ldr               w8, [x0]
        mov               x9, x8
        fmov              s1, w8
        fsub              s1, s1, s0
        fmov              w10, s1
        cas               w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x5cec <asm_test::fetch_sub::f32::relaxed+0x8>
        fmov              s0, w8
        ret
        ldr               w8, [x0]
        mov               x9, x8
        fmov              s1, w8
        fsub              s1, s1, s0
        fmov              w10, s1
        casl              w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x5d18 <asm_test::fetch_sub::f32::release+0x8>
        fmov              s0, w8
        ret
        ldr               x8, [x0]
        mov               x9, x8
        fmov              d1, x8
        fsub              d1, d1, d0
        fmov              x10, d1
        casal             x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x5d44 <asm_test::fetch_sub::f64::acqrel+0x8>
        fmov              d0, x8
        ret
        ldr               x8, [x0]
        mov               x9, x8
        fmov              d1, x8
        fsub              d1, d1, d0
        fmov              x10, d1
        casal             x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x5d70 <asm_test::fetch_sub::f64::seqcst+0x8>
        fmov              d0, x8
        ret
        ldr               x8, [x0]
        mov               x9, x8
        fmov              d1, x8
        fsub              d1, d1, d0
        fmov              x10, d1
        casa              x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x5d9c <asm_test::fetch_sub::f64::acquire+0x8>
        fmov              d0, x8
        ret
        ldr               x8, [x0]
        mov               x9, x8
        fmov              d1, x8
        fsub              d1, d1, d0
        fmov              x10, d1
        cas               x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x5dc8 <asm_test::fetch_sub::f64::relaxed+0x8>
        fmov              d0, x8
        ret
        ldr               x8, [x0]
        mov               x9, x8
        fmov              d1, x8
        fsub              d1, d1, d0
        fmov              x10, d1
        casl              x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x5df4 <asm_test::fetch_sub::f64::release+0x8>
        fmov              d0, x8
        ret
        neg               w8, w1
        ldaddalh          w8, w0, [x0]
        ret
        neg               w8, w1
        ldaddalh          w8, w0, [x0]
        ret
        neg               w8, w1
        ldaddah           w8, w0, [x0]
        ret
        neg               w8, w1
        ldaddh            w8, w0, [x0]
        ret
        neg               w8, w1
        ldaddlh           w8, w0, [x0]
        ret
        neg               w8, w1
        ldaddal           w8, w0, [x0]
        ret
        neg               w8, w1
        ldaddal           w8, w0, [x0]
        ret
        neg               w8, w1
        ldadda            w8, w0, [x0]
        ret
        neg               w8, w1
        ldadd             w8, w0, [x0]
        ret
        neg               w8, w1
        ldaddl            w8, w0, [x0]
        ret
        neg               x8, x1
        ldaddal           x8, x0, [x0]
        ret
        neg               x8, x1
        ldaddal           x8, x0, [x0]
        ret
        neg               x8, x1
        ldadda            x8, x0, [x0]
        ret
        neg               x8, x1
        ldadd             x8, x0, [x0]
        ret
        neg               x8, x1
        ldaddl            x8, x0, [x0]
        ret
        ldaxp             x8, x9, [x0]
        subs              x10, x8, x1
        sbc               x11, x9, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x5ecc <asm_test::fetch_sub::u128::acqrel>
        mov               x0, x8
        mov               x1, x9
        ret
        ldaxp             x8, x9, [x0]
        subs              x10, x8, x1
        sbc               x11, x9, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x5eec <asm_test::fetch_sub::u128::seqcst>
        mov               x0, x8
        mov               x1, x9
        ret
        ldaxp             x8, x9, [x0]
        subs              x10, x8, x1
        sbc               x11, x9, x2
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0x5f0c <asm_test::fetch_sub::u128::acquire>
        mov               x0, x8
        mov               x1, x9
        ret
        ldxp              x8, x9, [x0]
        subs              x10, x8, x1
        sbc               x11, x9, x2
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0x5f2c <asm_test::fetch_sub::u128::relaxed>
        mov               x0, x8
        mov               x1, x9
        ret
        ldxp              x8, x9, [x0]
        subs              x10, x8, x1
        sbc               x11, x9, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x5f4c <asm_test::fetch_sub::u128::release>
        mov               x0, x8
        mov               x1, x9
        ret
        ldeoralb          w1, w0, [x0]
        ret
        ldeoralb          w1, w0, [x0]
        ret
        ldeorab           w1, w0, [x0]
        ret
        ldeorb            w1, w0, [x0]
        ret
        ldeorlb           w1, w0, [x0]
        ret
        ldeoralh          w1, w0, [x0]
        ret
        ldeoralh          w1, w0, [x0]
        ret
        ldeorah           w1, w0, [x0]
        ret
        ldeorh            w1, w0, [x0]
        ret
        ldeorlh           w1, w0, [x0]
        ret
        ldeoral           w1, w0, [x0]
        ret
        ldeoral           w1, w0, [x0]
        ret
        ldeora            w1, w0, [x0]
        ret
        ldeor             w1, w0, [x0]
        ret
        ldeorl            w1, w0, [x0]
        ret
        ldeoral           x1, x0, [x0]
        ret
        ldeoral           x1, x0, [x0]
        ret
        ldeora            x1, x0, [x0]
        ret
        ldeor             x1, x0, [x0]
        ret

asm_test::fetch_xor::u64::release:
        ldeorl            x1, x0, [x0]
        ret
        ldeoralb          w1, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        ldeoralb          w1, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        ldeorab           w1, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        ldeorb            w1, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        ldeorlb           w1, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
        ldaxp             x8, x9, [x0]
        eor               x10, x8, x1
        eor               x11, x9, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x605c <asm_test::fetch_xor::u128::acqrel>
        mov               x0, x8
        mov               x1, x9
        ret
        ldaxp             x8, x9, [x0]
        eor               x10, x8, x1
        eor               x11, x9, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x607c <asm_test::fetch_xor::u128::seqcst>
        mov               x0, x8
        mov               x1, x9
        ret
        ldaxp             x8, x9, [x0]
        eor               x10, x8, x1
        eor               x11, x9, x2
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0x609c <asm_test::fetch_xor::u128::acquire>
        mov               x0, x8
        mov               x1, x9
        ret
        ldxp              x8, x9, [x0]
        eor               x10, x8, x1
        eor               x11, x9, x2
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0x60bc <asm_test::fetch_xor::u128::relaxed>
        mov               x0, x8
        mov               x1, x9
        ret
        ldxp              x8, x9, [x0]
        eor               x10, x8, x1
        eor               x11, x9, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0x60dc <asm_test::fetch_xor::u128::release>
        mov               x0, x8
        mov               x1, x9
        ret

asm_test::fetch_nand::u8::acqrel:
        ldrb              w8, [x0]
        mov               w9, w8
0:
        and               w10, w8, w1
        mvn               w10, w10
        casalb            w9, w10, [x0]
        cmp               w9, w8, uxtb
        mov               w8, w9
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u8::seqcst:
        ldrb              w8, [x0]
        mov               w9, w8
0:
        and               w10, w8, w1
        mvn               w10, w10
        casalb            w9, w10, [x0]
        cmp               w9, w8, uxtb
        mov               w8, w9
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u8::acquire:
        ldrb              w8, [x0]
        mov               w9, w8
0:
        and               w10, w8, w1
        mvn               w10, w10
        casab             w9, w10, [x0]
        cmp               w9, w8, uxtb
        mov               w8, w9
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u8::relaxed:
        ldrb              w8, [x0]
        mov               w9, w8
0:
        and               w10, w8, w1
        mvn               w10, w10
        casb              w9, w10, [x0]
        cmp               w9, w8, uxtb
        mov               w8, w9
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u8::release:
        ldrb              w8, [x0]
        mov               w9, w8
0:
        and               w10, w8, w1
        mvn               w10, w10
        caslb             w9, w10, [x0]
        cmp               w9, w8, uxtb
        mov               w8, w9
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u16::acqrel:
        ldrh              w8, [x0]
        mov               w9, w8
0:
        and               w10, w8, w1
        mvn               w10, w10
        casalh            w9, w10, [x0]
        cmp               w9, w8, uxth
        mov               w8, w9
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u16::seqcst:
        ldrh              w8, [x0]
        mov               w9, w8
0:
        and               w10, w8, w1
        mvn               w10, w10
        casalh            w9, w10, [x0]
        cmp               w9, w8, uxth
        mov               w8, w9
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u16::acquire:
        ldrh              w8, [x0]
        mov               w9, w8
0:
        and               w10, w8, w1
        mvn               w10, w10
        casah             w9, w10, [x0]
        cmp               w9, w8, uxth
        mov               w8, w9
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u16::relaxed:
        ldrh              w8, [x0]
        mov               w9, w8
0:
        and               w10, w8, w1
        mvn               w10, w10
        cash              w9, w10, [x0]
        cmp               w9, w8, uxth
        mov               w8, w9
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u16::release:
        ldrh              w8, [x0]
        mov               w9, w8
0:
        and               w10, w8, w1
        mvn               w10, w10
        caslh             w9, w10, [x0]
        cmp               w9, w8, uxth
        mov               w8, w9
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u32::acqrel:
        ldr               w8, [x0]
        mov               w9, w8
0:
        and               w10, w8, w1
        mvn               w10, w10
        casal             w9, w10, [x0]
        cmp               w9, w8
        mov               w8, w9
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u32::seqcst:
        ldr               w8, [x0]
        mov               w9, w8
0:
        and               w10, w8, w1
        mvn               w10, w10
        casal             w9, w10, [x0]
        cmp               w9, w8
        mov               w8, w9
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u32::acquire:
        ldr               w8, [x0]
        mov               w9, w8
0:
        and               w10, w8, w1
        mvn               w10, w10
        casa              w9, w10, [x0]
        cmp               w9, w8
        mov               w8, w9
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u32::relaxed:
        ldr               w8, [x0]
        mov               w9, w8
0:
        and               w10, w8, w1
        mvn               w10, w10
        cas               w9, w10, [x0]
        cmp               w9, w8
        mov               w8, w9
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u32::release:
        ldr               w8, [x0]
        mov               w9, w8
0:
        and               w10, w8, w1
        mvn               w10, w10
        casl              w9, w10, [x0]
        cmp               w9, w8
        mov               w8, w9
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_nand::u64::acqrel:
        ldr               x8, [x0]
        mov               x9, x8
0:
        and               x10, x8, x1
        mvn               x10, x10
        casal             x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0b
        mov               x0, x8
        ret

asm_test::fetch_nand::u64::seqcst:
        ldr               x8, [x0]
        mov               x9, x8
0:
        and               x10, x8, x1
        mvn               x10, x10
        casal             x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0b
        mov               x0, x8
        ret

asm_test::fetch_nand::u64::acquire:
        ldr               x8, [x0]
        mov               x9, x8
0:
        and               x10, x8, x1
        mvn               x10, x10
        casa              x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0b
        mov               x0, x8
        ret

asm_test::fetch_nand::u64::relaxed:
        ldr               x8, [x0]
        mov               x9, x8
0:
        and               x10, x8, x1
        mvn               x10, x10
        cas               x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0b
        mov               x0, x8
        ret

asm_test::fetch_nand::u64::release:
        ldr               x8, [x0]
        mov               x9, x8
0:
        and               x10, x8, x1
        mvn               x10, x10
        casl              x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0b
        mov               x0, x8
        ret

asm_test::fetch_nand::bool::acqrel:
        mov               w8, #0x1                // =1
        tbz               w1, #0x0, 0f
        ldeoralb          w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
0:
        swpalb            w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_nand::bool::seqcst:
        mov               w8, #0x1                // =1
        tbz               w1, #0x0, 0f
        ldeoralb          w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
0:
        swpalb            w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_nand::bool::acquire:
        mov               w8, #0x1                // =1
        tbz               w1, #0x0, 0f
        ldeorab           w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
0:
        swpab             w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_nand::bool::relaxed:
        mov               w8, #0x1                // =1
        tbz               w1, #0x0, 0f
        ldeorb            w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
0:
        swpb              w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_nand::bool::release:
        mov               w8, #0x1                // =1
        tbz               w1, #0x0, 0f
        ldeorlb           w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret
0:
        swplb             w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_nand::u128::acqrel:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        and               x4, x6, x2
        and               x5, x7, x3
        mvn               x4, x4
        mvn               x5, x5
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_nand::u128::seqcst:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        and               x4, x6, x2
        and               x5, x7, x3
        mvn               x4, x4
        mvn               x5, x5
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_nand::u128::acquire:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        and               x4, x6, x2
        and               x5, x7, x3
        mvn               x4, x4
        mvn               x5, x5
        caspa             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_nand::u128::relaxed:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        and               x4, x6, x2
        and               x5, x7, x3
        mvn               x4, x4
        mvn               x5, x5
        casp              x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_nand::u128::release:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        and               x4, x6, x2
        and               x5, x7, x3
        mvn               x4, x4
        mvn               x5, x5
        caspl             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_umax::u8::acqrel:
        mov               x8, x0
        ldrb              w0, [x0]
        and               w9, w1, #0xff
0:
        and               w10, w0, #0xff
        cmp               w9, w10
        csel              w11, w9, w10, hi
        casalb            w0, w11, [x8]
        cmp               w0, w10
        b.ne              0b
        ret

asm_test::fetch_umax::u8::seqcst:
        mov               x8, x0
        ldrb              w0, [x0]
        and               w9, w1, #0xff
0:
        and               w10, w0, #0xff
        cmp               w9, w10
        csel              w11, w9, w10, hi
        casalb            w0, w11, [x8]
        cmp               w0, w10
        b.ne              0b
        ret

asm_test::fetch_umax::u8::acquire:
        mov               x8, x0
        ldrb              w0, [x0]
        and               w9, w1, #0xff
0:
        and               w10, w0, #0xff
        cmp               w9, w10
        csel              w11, w9, w10, hi
        casab             w0, w11, [x8]
        cmp               w0, w10
        b.ne              0b
        ret

asm_test::fetch_umax::u8::relaxed:
        mov               x8, x0
        ldrb              w0, [x0]
        and               w9, w1, #0xff
0:
        and               w10, w0, #0xff
        cmp               w9, w10
        csel              w11, w9, w10, hi
        casb              w0, w11, [x8]
        cmp               w0, w10
        b.ne              0b
        ret

asm_test::fetch_umax::u8::release:
        mov               x8, x0
        ldrb              w0, [x0]
        and               w9, w1, #0xff
0:
        and               w10, w0, #0xff
        cmp               w9, w10
        csel              w11, w9, w10, hi
        caslb             w0, w11, [x8]
        cmp               w0, w10
        b.ne              0b
        ret

asm_test::fetch_umax::u16::acqrel:
        mov               x8, x0
        ldrh              w0, [x0]
        and               w9, w1, #0xffff
0:
        and               w10, w0, #0xffff
        cmp               w9, w10
        csel              w11, w9, w10, hi
        casalh            w0, w11, [x8]
        cmp               w0, w10
        b.ne              0b
        ret

asm_test::fetch_umax::u16::seqcst:
        mov               x8, x0
        ldrh              w0, [x0]
        and               w9, w1, #0xffff
0:
        and               w10, w0, #0xffff
        cmp               w9, w10
        csel              w11, w9, w10, hi
        casalh            w0, w11, [x8]
        cmp               w0, w10
        b.ne              0b
        ret

asm_test::fetch_umax::u16::acquire:
        mov               x8, x0
        ldrh              w0, [x0]
        and               w9, w1, #0xffff
0:
        and               w10, w0, #0xffff
        cmp               w9, w10
        csel              w11, w9, w10, hi
        casah             w0, w11, [x8]
        cmp               w0, w10
        b.ne              0b
        ret

asm_test::fetch_umax::u16::relaxed:
        mov               x8, x0
        ldrh              w0, [x0]
        and               w9, w1, #0xffff
0:
        and               w10, w0, #0xffff
        cmp               w9, w10
        csel              w11, w9, w10, hi
        cash              w0, w11, [x8]
        cmp               w0, w10
        b.ne              0b
        ret

asm_test::fetch_umax::u16::release:
        mov               x8, x0
        ldrh              w0, [x0]
        and               w9, w1, #0xffff
0:
        and               w10, w0, #0xffff
        cmp               w9, w10
        csel              w11, w9, w10, hi
        caslh             w0, w11, [x8]
        cmp               w0, w10
        b.ne              0b
        ret

asm_test::fetch_umax::u32::acqrel:
        ldumaxal          w1, w0, [x0]
        ret

asm_test::fetch_umax::u32::seqcst:
        ldumaxal          w1, w0, [x0]
        ret

asm_test::fetch_umax::u32::acquire:
        ldumaxa           w1, w0, [x0]
        ret

asm_test::fetch_umax::u32::relaxed:
        ldumax            w1, w0, [x0]
        ret

asm_test::fetch_umax::u32::release:
        ldumaxl           w1, w0, [x0]
        ret

asm_test::fetch_umax::u64::acqrel:
        ldumaxal          x1, x0, [x0]
        ret

asm_test::fetch_umax::u64::seqcst:
        ldumaxal          x1, x0, [x0]
        ret

asm_test::fetch_umax::u64::acquire:
        ldumaxa           x1, x0, [x0]
        ret

asm_test::fetch_umax::u64::relaxed:
        ldumax            x1, x0, [x0]
        ret

asm_test::fetch_umax::u64::release:
        ldumaxl           x1, x0, [x0]
        ret

asm_test::fetch_umax::u128::acqrel:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        cmp               x2, x6
        sbcs              xzr, x3, x7
        csel              x5, x7, x3, lo
        csel              x4, x6, x2, lo
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_umax::u128::seqcst:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        cmp               x2, x6
        sbcs              xzr, x3, x7
        csel              x5, x7, x3, lo
        csel              x4, x6, x2, lo
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_umax::u128::acquire:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        cmp               x2, x6
        sbcs              xzr, x3, x7
        csel              x5, x7, x3, lo
        csel              x4, x6, x2, lo
        caspa             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_umax::u128::relaxed:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        cmp               x2, x6
        sbcs              xzr, x3, x7
        csel              x5, x7, x3, lo
        csel              x4, x6, x2, lo
        casp              x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_umax::u128::release:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        cmp               x2, x6
        sbcs              xzr, x3, x7
        csel              x5, x7, x3, lo
        csel              x4, x6, x2, lo
        caspl             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_umin::u8::acqrel:
        mov               x8, x0
        ldrb              w0, [x0]
        and               w9, w1, #0xff
0:
        and               w10, w0, #0xff
        cmp               w9, w10
        csel              w11, w9, w10, lo
        casalb            w0, w11, [x8]
        cmp               w0, w10
        b.ne              0b
        ret

asm_test::fetch_umin::u8::seqcst:
        mov               x8, x0
        ldrb              w0, [x0]
        and               w9, w1, #0xff
0:
        and               w10, w0, #0xff
        cmp               w9, w10
        csel              w11, w9, w10, lo
        casalb            w0, w11, [x8]
        cmp               w0, w10
        b.ne              0b
        ret

asm_test::fetch_umin::u8::acquire:
        mov               x8, x0
        ldrb              w0, [x0]
        and               w9, w1, #0xff
0:
        and               w10, w0, #0xff
        cmp               w9, w10
        csel              w11, w9, w10, lo
        casab             w0, w11, [x8]
        cmp               w0, w10
        b.ne              0b
        ret

asm_test::fetch_umin::u8::relaxed:
        mov               x8, x0
        ldrb              w0, [x0]
        and               w9, w1, #0xff
0:
        and               w10, w0, #0xff
        cmp               w9, w10
        csel              w11, w9, w10, lo
        casb              w0, w11, [x8]
        cmp               w0, w10
        b.ne              0b
        ret

asm_test::fetch_umin::u8::release:
        mov               x8, x0
        ldrb              w0, [x0]
        and               w9, w1, #0xff
0:
        and               w10, w0, #0xff
        cmp               w9, w10
        csel              w11, w9, w10, lo
        caslb             w0, w11, [x8]
        cmp               w0, w10
        b.ne              0b
        ret

asm_test::fetch_umin::u16::acqrel:
        mov               x8, x0
        ldrh              w0, [x0]
        and               w9, w1, #0xffff
0:
        and               w10, w0, #0xffff
        cmp               w9, w10
        csel              w11, w9, w10, lo
        casalh            w0, w11, [x8]
        cmp               w0, w10
        b.ne              0b
        ret

asm_test::fetch_umin::u16::seqcst:
        mov               x8, x0
        ldrh              w0, [x0]
        and               w9, w1, #0xffff
0:
        and               w10, w0, #0xffff
        cmp               w9, w10
        csel              w11, w9, w10, lo
        casalh            w0, w11, [x8]
        cmp               w0, w10
        b.ne              0b
        ret

asm_test::fetch_umin::u16::acquire:
        mov               x8, x0
        ldrh              w0, [x0]
        and               w9, w1, #0xffff
0:
        and               w10, w0, #0xffff
        cmp               w9, w10
        csel              w11, w9, w10, lo
        casah             w0, w11, [x8]
        cmp               w0, w10
        b.ne              0b
        ret

asm_test::fetch_umin::u16::relaxed:
        mov               x8, x0
        ldrh              w0, [x0]
        and               w9, w1, #0xffff
0:
        and               w10, w0, #0xffff
        cmp               w9, w10
        csel              w11, w9, w10, lo
        cash              w0, w11, [x8]
        cmp               w0, w10
        b.ne              0b
        ret

asm_test::fetch_umin::u16::release:
        mov               x8, x0
        ldrh              w0, [x0]
        and               w9, w1, #0xffff
0:
        and               w10, w0, #0xffff
        cmp               w9, w10
        csel              w11, w9, w10, lo
        caslh             w0, w11, [x8]
        cmp               w0, w10
        b.ne              0b
        ret

asm_test::fetch_umin::u32::acqrel:
        lduminal          w1, w0, [x0]
        ret

asm_test::fetch_umin::u32::seqcst:
        lduminal          w1, w0, [x0]
        ret

asm_test::fetch_umin::u32::acquire:
        ldumina           w1, w0, [x0]
        ret

asm_test::fetch_umin::u32::relaxed:
        ldumin            w1, w0, [x0]
        ret

asm_test::fetch_umin::u32::release:
        lduminl           w1, w0, [x0]
        ret

asm_test::fetch_umin::u64::acqrel:
        lduminal          x1, x0, [x0]
        ret

asm_test::fetch_umin::u64::seqcst:
        lduminal          x1, x0, [x0]
        ret

asm_test::fetch_umin::u64::acquire:
        ldumina           x1, x0, [x0]
        ret

asm_test::fetch_umin::u64::relaxed:
        ldumin            x1, x0, [x0]
        ret

asm_test::fetch_umin::u64::release:
        lduminl           x1, x0, [x0]
        ret

asm_test::fetch_umin::u128::acqrel:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        cmp               x2, x6
        sbcs              xzr, x3, x7
        csel              x5, x7, x3, hs
        csel              x4, x6, x2, hs
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_umin::u128::seqcst:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        cmp               x2, x6
        sbcs              xzr, x3, x7
        csel              x5, x7, x3, hs
        csel              x4, x6, x2, hs
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_umin::u128::acquire:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        cmp               x2, x6
        sbcs              xzr, x3, x7
        csel              x5, x7, x3, hs
        csel              x4, x6, x2, hs
        caspa             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_umin::u128::relaxed:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        cmp               x2, x6
        sbcs              xzr, x3, x7
        csel              x5, x7, x3, hs
        csel              x4, x6, x2, hs
        casp              x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_umin::u128::release:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        cmp               x2, x6
        sbcs              xzr, x3, x7
        csel              x5, x7, x3, hs
        csel              x4, x6, x2, hs
        caspl             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::compare_exchange::u8::acqrel_seqcst:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u8::seqcst_seqcst:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u8::acqrel_acquire:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u8::acqrel_relaxed:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u8::acquire_seqcst:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u8::relaxed_seqcst:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u8::release_seqcst:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u8::seqcst_acquire:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u8::seqcst_relaxed:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u8::acquire_acquire:
        mov               w8, w1
        casab             w8, w2, [x0]
        cmp               w8, w1, uxtb
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u8::acquire_relaxed:
        mov               w8, w1
        casab             w8, w2, [x0]
        cmp               w8, w1, uxtb
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u8::relaxed_acquire:
        mov               w8, w1
        casab             w8, w2, [x0]
        cmp               w8, w1, uxtb
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u8::relaxed_relaxed:
        mov               w8, w1
        casb              w8, w2, [x0]
        cmp               w8, w1, uxtb
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u8::release_acquire:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u8::release_relaxed:
        mov               w8, w1
        caslb             w8, w2, [x0]
        cmp               w8, w1, uxtb
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u16::acqrel_seqcst:
        mov               w8, w1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u16::seqcst_seqcst:
        mov               w8, w1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u16::acqrel_acquire:
        mov               w8, w1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u16::acqrel_relaxed:
        mov               w8, w1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u16::acquire_seqcst:
        mov               w8, w1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u16::relaxed_seqcst:
        mov               w8, w1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u16::release_seqcst:
        mov               w8, w1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u16::seqcst_acquire:
        mov               w8, w1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u16::seqcst_relaxed:
        mov               w8, w1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u16::acquire_acquire:
        mov               w8, w1
        casah             w8, w2, [x0]
        cmp               w8, w1, uxth
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u16::acquire_relaxed:
        mov               w8, w1
        casah             w8, w2, [x0]
        cmp               w8, w1, uxth
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u16::relaxed_acquire:
        mov               w8, w1
        casah             w8, w2, [x0]
        cmp               w8, w1, uxth
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u16::relaxed_relaxed:
        mov               w8, w1
        cash              w8, w2, [x0]
        cmp               w8, w1, uxth
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u16::release_acquire:
        mov               w8, w1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u16::release_relaxed:
        mov               w8, w1
        caslh             w8, w2, [x0]
        cmp               w8, w1, uxth
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u32::acqrel_seqcst:
        mov               w8, w1
        casal             w8, w2, [x0]
        cmp               w8, w1
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u32::seqcst_seqcst:
        mov               w8, w1
        casal             w8, w2, [x0]
        cmp               w8, w1
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u32::acqrel_acquire:
        mov               w8, w1
        casal             w8, w2, [x0]
        cmp               w8, w1
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u32::acqrel_relaxed:
        mov               w8, w1
        casal             w8, w2, [x0]
        cmp               w8, w1
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u32::acquire_seqcst:
        mov               w8, w1
        casal             w8, w2, [x0]
        cmp               w8, w1
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u32::relaxed_seqcst:
        mov               w8, w1
        casal             w8, w2, [x0]
        cmp               w8, w1
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u32::release_seqcst:
        mov               w8, w1
        casal             w8, w2, [x0]
        cmp               w8, w1
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u32::seqcst_acquire:
        mov               w8, w1
        casal             w8, w2, [x0]
        cmp               w8, w1
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u32::seqcst_relaxed:
        mov               w8, w1
        casal             w8, w2, [x0]
        cmp               w8, w1
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u32::acquire_acquire:
        mov               w8, w1
        casa              w8, w2, [x0]
        cmp               w8, w1
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u32::acquire_relaxed:
        mov               w8, w1
        casa              w8, w2, [x0]
        cmp               w8, w1
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u32::relaxed_acquire:
        mov               w8, w1
        casa              w8, w2, [x0]
        cmp               w8, w1
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u32::relaxed_relaxed:
        mov               w8, w1
        cas               w8, w2, [x0]
        cmp               w8, w1
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u32::release_acquire:
        mov               w8, w1
        casal             w8, w2, [x0]
        cmp               w8, w1
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u32::release_relaxed:
        mov               w8, w1
        casl              w8, w2, [x0]
        cmp               w8, w1
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u64::acqrel_seqcst:
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        mov               x1, x8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u64::seqcst_seqcst:
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        mov               x1, x8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u64::acqrel_acquire:
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        mov               x1, x8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u64::acqrel_relaxed:
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        mov               x1, x8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u64::acquire_seqcst:
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        mov               x1, x8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u64::relaxed_seqcst:
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        mov               x1, x8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u64::release_seqcst:
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        mov               x1, x8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u64::seqcst_acquire:
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        mov               x1, x8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u64::seqcst_relaxed:
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        mov               x1, x8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u64::acquire_acquire:
        mov               x8, x1
        casa              x8, x2, [x0]
        cmp               x8, x1
        mov               x1, x8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u64::acquire_relaxed:
        mov               x8, x1
        casa              x8, x2, [x0]
        cmp               x8, x1
        mov               x1, x8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u64::relaxed_acquire:
        mov               x8, x1
        casa              x8, x2, [x0]
        cmp               x8, x1
        mov               x1, x8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u64::relaxed_relaxed:
        mov               x8, x1
        cas               x8, x2, [x0]
        cmp               x8, x1
        mov               x1, x8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u64::release_acquire:
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        mov               x1, x8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u64::release_relaxed:
        mov               x8, x1
        casl              x8, x2, [x0]
        cmp               x8, x1
        mov               x1, x8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::bool::acqrel_seqcst:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::bool::seqcst_seqcst:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::bool::acqrel_acquire:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::bool::acqrel_relaxed:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::bool::acquire_seqcst:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::bool::relaxed_seqcst:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::bool::release_seqcst:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::bool::seqcst_acquire:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::bool::seqcst_relaxed:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::bool::acquire_acquire:
        mov               w8, w1
        casab             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::bool::acquire_relaxed:
        mov               w8, w1
        casab             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::bool::relaxed_acquire:
        mov               w8, w1
        casab             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::bool::relaxed_relaxed:
        mov               w8, w1
        casb              w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::bool::release_acquire:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::bool::release_relaxed:
        mov               w8, w1
        caslb             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange::u128::acqrel_seqcst:
        mov               x7, x3
        mov               x6, x2
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x2
        stp               x6, x7, [x8, #0x10]
        ccmp              x7, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::seqcst_seqcst:
        mov               x7, x3
        mov               x6, x2
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x2
        stp               x6, x7, [x8, #0x10]
        ccmp              x7, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::acqrel_acquire:
        mov               x7, x3
        mov               x6, x2
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x2
        stp               x6, x7, [x8, #0x10]
        ccmp              x7, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::acqrel_relaxed:
        mov               x7, x3
        mov               x6, x2
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x2
        stp               x6, x7, [x8, #0x10]
        ccmp              x7, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::acquire_seqcst:
        mov               x7, x3
        mov               x6, x2
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x2
        stp               x6, x7, [x8, #0x10]
        ccmp              x7, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::relaxed_seqcst:
        mov               x7, x3
        mov               x6, x2
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x2
        stp               x6, x7, [x8, #0x10]
        ccmp              x7, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::release_seqcst:
        mov               x7, x3
        mov               x6, x2
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x2
        stp               x6, x7, [x8, #0x10]
        ccmp              x7, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::seqcst_acquire:
        mov               x7, x3
        mov               x6, x2
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x2
        stp               x6, x7, [x8, #0x10]
        ccmp              x7, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::seqcst_relaxed:
        mov               x7, x3
        mov               x6, x2
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x2
        stp               x6, x7, [x8, #0x10]
        ccmp              x7, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::acquire_acquire:
        mov               x7, x3
        mov               x6, x2
        caspa             x6, x7, x4, x5, [x0]
        cmp               x6, x2
        stp               x6, x7, [x8, #0x10]
        ccmp              x7, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::acquire_relaxed:
        mov               x7, x3
        mov               x6, x2
        caspa             x6, x7, x4, x5, [x0]
        cmp               x6, x2
        stp               x6, x7, [x8, #0x10]
        ccmp              x7, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::relaxed_acquire:
        mov               x7, x3
        mov               x6, x2
        caspa             x6, x7, x4, x5, [x0]
        cmp               x6, x2
        stp               x6, x7, [x8, #0x10]
        ccmp              x7, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::relaxed_relaxed:
        mov               x7, x3
        mov               x6, x2
        casp              x6, x7, x4, x5, [x0]
        cmp               x6, x2
        stp               x6, x7, [x8, #0x10]
        ccmp              x7, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::release_acquire:
        mov               x7, x3
        mov               x6, x2
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x2
        stp               x6, x7, [x8, #0x10]
        ccmp              x7, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::release_relaxed:
        mov               x7, x3
        mov               x6, x2
        caspl             x6, x7, x4, x5, [x0]
        cmp               x6, x2
        stp               x6, x7, [x8, #0x10]
        ccmp              x7, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u8::acqrel_seqcst:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u8::seqcst_seqcst:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u8::acqrel_acquire:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u8::acqrel_relaxed:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u8::acquire_seqcst:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u8::relaxed_seqcst:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u8::release_seqcst:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u8::seqcst_acquire:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u8::seqcst_relaxed:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u8::acquire_acquire:
        mov               w8, w1
        casab             w8, w2, [x0]
        cmp               w8, w1, uxtb
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u8::acquire_relaxed:
        mov               w8, w1
        casab             w8, w2, [x0]
        cmp               w8, w1, uxtb
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u8::relaxed_acquire:
        mov               w8, w1
        casab             w8, w2, [x0]
        cmp               w8, w1, uxtb
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u8::relaxed_relaxed:
        mov               w8, w1
        casb              w8, w2, [x0]
        cmp               w8, w1, uxtb
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u8::release_acquire:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u8::release_relaxed:
        mov               w8, w1
        caslb             w8, w2, [x0]
        cmp               w8, w1, uxtb
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u16::acqrel_seqcst:
        mov               w8, w1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u16::seqcst_seqcst:
        mov               w8, w1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u16::acqrel_acquire:
        mov               w8, w1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u16::acqrel_relaxed:
        mov               w8, w1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u16::acquire_seqcst:
        mov               w8, w1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u16::relaxed_seqcst:
        mov               w8, w1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u16::release_seqcst:
        mov               w8, w1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u16::seqcst_acquire:
        mov               w8, w1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u16::seqcst_relaxed:
        mov               w8, w1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u16::acquire_acquire:
        mov               w8, w1
        casah             w8, w2, [x0]
        cmp               w8, w1, uxth
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u16::acquire_relaxed:
        mov               w8, w1
        casah             w8, w2, [x0]
        cmp               w8, w1, uxth
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u16::relaxed_acquire:
        mov               w8, w1
        casah             w8, w2, [x0]
        cmp               w8, w1, uxth
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u16::relaxed_relaxed:
        mov               w8, w1
        cash              w8, w2, [x0]
        cmp               w8, w1, uxth
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u16::release_acquire:
        mov               w8, w1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u16::release_relaxed:
        mov               w8, w1
        caslh             w8, w2, [x0]
        cmp               w8, w1, uxth
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u32::acqrel_seqcst:
        mov               w8, w1
        casal             w8, w2, [x0]
        cmp               w8, w1
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u32::seqcst_seqcst:
        mov               w8, w1
        casal             w8, w2, [x0]
        cmp               w8, w1
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u32::acqrel_acquire:
        mov               w8, w1
        casal             w8, w2, [x0]
        cmp               w8, w1
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u32::acqrel_relaxed:
        mov               w8, w1
        casal             w8, w2, [x0]
        cmp               w8, w1
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u32::acquire_seqcst:
        mov               w8, w1
        casal             w8, w2, [x0]
        cmp               w8, w1
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u32::relaxed_seqcst:
        mov               w8, w1
        casal             w8, w2, [x0]
        cmp               w8, w1
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u32::release_seqcst:
        mov               w8, w1
        casal             w8, w2, [x0]
        cmp               w8, w1
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u32::seqcst_acquire:
        mov               w8, w1
        casal             w8, w2, [x0]
        cmp               w8, w1
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u32::seqcst_relaxed:
        mov               w8, w1
        casal             w8, w2, [x0]
        cmp               w8, w1
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u32::acquire_acquire:
        mov               w8, w1
        casa              w8, w2, [x0]
        cmp               w8, w1
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u32::acquire_relaxed:
        mov               w8, w1
        casa              w8, w2, [x0]
        cmp               w8, w1
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u32::relaxed_acquire:
        mov               w8, w1
        casa              w8, w2, [x0]
        cmp               w8, w1
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u32::relaxed_relaxed:
        mov               w8, w1
        cas               w8, w2, [x0]
        cmp               w8, w1
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u32::release_acquire:
        mov               w8, w1
        casal             w8, w2, [x0]
        cmp               w8, w1
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u32::release_relaxed:
        mov               w8, w1
        casl              w8, w2, [x0]
        cmp               w8, w1
        mov               w1, w8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u64::acqrel_seqcst:
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        mov               x1, x8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u64::seqcst_seqcst:
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        mov               x1, x8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u64::acqrel_acquire:
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        mov               x1, x8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u64::acqrel_relaxed:
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        mov               x1, x8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u64::acquire_seqcst:
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        mov               x1, x8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u64::relaxed_seqcst:
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        mov               x1, x8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u64::release_seqcst:
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        mov               x1, x8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u64::seqcst_acquire:
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        mov               x1, x8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u64::seqcst_relaxed:
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        mov               x1, x8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u64::acquire_acquire:
        mov               x8, x1
        casa              x8, x2, [x0]
        cmp               x8, x1
        mov               x1, x8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u64::acquire_relaxed:
        mov               x8, x1
        casa              x8, x2, [x0]
        cmp               x8, x1
        mov               x1, x8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u64::relaxed_acquire:
        mov               x8, x1
        casa              x8, x2, [x0]
        cmp               x8, x1
        mov               x1, x8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u64::relaxed_relaxed:
        mov               x8, x1
        cas               x8, x2, [x0]
        cmp               x8, x1
        mov               x1, x8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u64::release_acquire:
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        mov               x1, x8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u64::release_relaxed:
        mov               x8, x1
        casl              x8, x2, [x0]
        cmp               x8, x1
        mov               x1, x8
        cset              w9, eq
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::bool::acqrel_seqcst:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::bool::seqcst_seqcst:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::bool::acqrel_acquire:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::bool::acqrel_relaxed:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::bool::acquire_seqcst:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::bool::relaxed_seqcst:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::bool::release_seqcst:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::bool::seqcst_acquire:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::bool::seqcst_relaxed:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::bool::acquire_acquire:
        mov               w8, w1
        casab             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::bool::acquire_relaxed:
        mov               w8, w1
        casab             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::bool::relaxed_acquire:
        mov               w8, w1
        casab             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::bool::relaxed_relaxed:
        mov               w8, w1
        casb              w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::bool::release_acquire:
        mov               w8, w1
        casalb            w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::bool::release_relaxed:
        mov               w8, w1
        caslb             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        cmp               w8, #0x0
        cset              w1, ne
        eor               w0, w9, #0x1
        ret

asm_test::compare_exchange_weak::u128::acqrel_seqcst:
        mov               x7, x3
        mov               x6, x2
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x2
        stp               x6, x7, [x8, #0x10]
        ccmp              x7, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::seqcst_seqcst:
        mov               x7, x3
        mov               x6, x2
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x2
        stp               x6, x7, [x8, #0x10]
        ccmp              x7, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::acqrel_acquire:
        mov               x7, x3
        mov               x6, x2
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x2
        stp               x6, x7, [x8, #0x10]
        ccmp              x7, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::acqrel_relaxed:
        mov               x7, x3
        mov               x6, x2
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x2
        stp               x6, x7, [x8, #0x10]
        ccmp              x7, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::acquire_seqcst:
        mov               x7, x3
        mov               x6, x2
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x2
        stp               x6, x7, [x8, #0x10]
        ccmp              x7, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::relaxed_seqcst:
        mov               x7, x3
        mov               x6, x2
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x2
        stp               x6, x7, [x8, #0x10]
        ccmp              x7, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::release_seqcst:
        mov               x7, x3
        mov               x6, x2
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x2
        stp               x6, x7, [x8, #0x10]
        ccmp              x7, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::seqcst_acquire:
        mov               x7, x3
        mov               x6, x2
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x2
        stp               x6, x7, [x8, #0x10]
        ccmp              x7, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::seqcst_relaxed:
        mov               x7, x3
        mov               x6, x2
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x2
        stp               x6, x7, [x8, #0x10]
        ccmp              x7, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::acquire_acquire:
        mov               x7, x3
        mov               x6, x2
        caspa             x6, x7, x4, x5, [x0]
        cmp               x6, x2
        stp               x6, x7, [x8, #0x10]
        ccmp              x7, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::acquire_relaxed:
        mov               x7, x3
        mov               x6, x2
        caspa             x6, x7, x4, x5, [x0]
        cmp               x6, x2
        stp               x6, x7, [x8, #0x10]
        ccmp              x7, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::relaxed_acquire:
        mov               x7, x3
        mov               x6, x2
        caspa             x6, x7, x4, x5, [x0]
        cmp               x6, x2
        stp               x6, x7, [x8, #0x10]
        ccmp              x7, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::relaxed_relaxed:
        mov               x7, x3
        mov               x6, x2
        casp              x6, x7, x4, x5, [x0]
        cmp               x6, x2
        stp               x6, x7, [x8, #0x10]
        ccmp              x7, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::release_acquire:
        mov               x7, x3
        mov               x6, x2
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x2
        stp               x6, x7, [x8, #0x10]
        ccmp              x7, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::release_relaxed:
        mov               x7, x3
        mov               x6, x2
        caspl             x6, x7, x4, x5, [x0]
        cmp               x6, x2
        stp               x6, x7, [x8, #0x10]
        ccmp              x7, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::or::u8::acqrel:
        ldsetalb          w1, w8, [x0]
        ret

asm_test::or::u8::seqcst:
        ldsetalb          w1, w8, [x0]
        ret

asm_test::or::u8::acquire:
        ldsetab           w1, w8, [x0]
        ret

asm_test::or::u8::relaxed:
        ldsetb            w1, w8, [x0]
        ret

asm_test::or::u8::release:
        ldsetlb           w1, w8, [x0]
        ret

asm_test::or::u16::acqrel:
        ldsetalh          w1, w8, [x0]
        ret

asm_test::or::u16::seqcst:
        ldsetalh          w1, w8, [x0]
        ret

asm_test::or::u16::acquire:
        ldsetah           w1, w8, [x0]
        ret

asm_test::or::u16::relaxed:
        ldseth            w1, w8, [x0]
        ret

asm_test::or::u16::release:
        ldsetlh           w1, w8, [x0]
        ret

asm_test::or::u32::acqrel:
        ldsetal           w1, w8, [x0]
        ret

asm_test::or::u32::seqcst:
        ldsetal           w1, w8, [x0]
        ret

asm_test::or::u32::acquire:
        ldseta            w1, w8, [x0]
        ret

asm_test::or::u32::relaxed:
        ldset             w1, w8, [x0]
        ret

asm_test::or::u32::release:
        ldsetl            w1, w8, [x0]
        ret

asm_test::or::u64::acqrel:
        ldsetal           x1, x8, [x0]
        ret

asm_test::or::u64::seqcst:
        ldsetal           x1, x8, [x0]
        ret

asm_test::or::u64::acquire:
        ldseta            x1, x8, [x0]
        ret

asm_test::or::u64::relaxed:
        ldset             x1, x8, [x0]
        ret

asm_test::or::u64::release:
        ldsetl            x1, x8, [x0]
        ret

asm_test::or::u128::acqrel:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        orr               x4, x6, x2
        orr               x5, x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::or::u128::seqcst:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        orr               x4, x6, x2
        orr               x5, x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::or::u128::acquire:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        orr               x4, x6, x2
        orr               x5, x7, x3
        caspa             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::or::u128::relaxed:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        orr               x4, x6, x2
        orr               x5, x7, x3
        casp              x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::or::u128::release:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        orr               x4, x6, x2
        orr               x5, x7, x3
        caspl             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::add::u8::acqrel:
        ldaddalb          w1, w8, [x0]
        ret

asm_test::add::u8::seqcst:
        ldaddalb          w1, w8, [x0]
        ret

asm_test::add::u8::acquire:
        ldaddab           w1, w8, [x0]
        ret

asm_test::add::u8::relaxed:
        ldaddb            w1, w8, [x0]
        ret

asm_test::add::u8::release:
        ldaddlb           w1, w8, [x0]
        ret

asm_test::add::u16::acqrel:
        ldaddalh          w1, w8, [x0]
        ret

asm_test::add::u16::seqcst:
        ldaddalh          w1, w8, [x0]
        ret

asm_test::add::u16::acquire:
        ldaddah           w1, w8, [x0]
        ret

asm_test::add::u16::relaxed:
        ldaddh            w1, w8, [x0]
        ret

asm_test::add::u16::release:
        ldaddlh           w1, w8, [x0]
        ret

asm_test::add::u32::acqrel:
        ldaddal           w1, w8, [x0]
        ret

asm_test::add::u32::seqcst:
        ldaddal           w1, w8, [x0]
        ret

asm_test::add::u32::acquire:
        ldadda            w1, w8, [x0]
        ret

asm_test::add::u32::relaxed:
        ldadd             w1, w8, [x0]
        ret

asm_test::add::u32::release:
        ldaddl            w1, w8, [x0]
        ret

asm_test::add::u64::acqrel:
        ldaddal           x1, x8, [x0]
        ret

asm_test::add::u64::seqcst:
        ldaddal           x1, x8, [x0]
        ret

asm_test::add::u64::acquire:
        ldadda            x1, x8, [x0]
        ret

asm_test::add::u64::relaxed:
        ldadd             x1, x8, [x0]
        ret

asm_test::add::u64::release:
        ldaddl            x1, x8, [x0]
        ret

asm_test::add::u128::acqrel:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        adds              x4, x6, x2
        adc               x5, x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::add::u128::seqcst:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        adds              x4, x6, x2
        adc               x5, x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::add::u128::acquire:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        adds              x4, x6, x2
        adc               x5, x7, x3
        caspa             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::add::u128::relaxed:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        adds              x4, x6, x2
        adc               x5, x7, x3
        casp              x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::add::u128::release:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        adds              x4, x6, x2
        adc               x5, x7, x3
        caspl             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::and::u8::acqrel:
        mvn               w8, w1
        ldclralb          w8, w8, [x0]
        ret

asm_test::and::u8::seqcst:
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

asm_test::and::u16::acqrel:
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

asm_test::and::u16::release:
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

asm_test::and::u32::acquire:
        mvn               w8, w1
        ldclra            w8, w8, [x0]
        ret

asm_test::and::u32::relaxed:
        mvn               w8, w1
        ldclr             w8, w8, [x0]
        ret

asm_test::and::u32::release:
        mvn               w8, w1
        ldclrl            w8, w8, [x0]
        ret

asm_test::and::u64::acqrel:
        mvn               x8, x1
        ldclral           x8, x8, [x0]
        ret

asm_test::and::u64::seqcst:
        mvn               x8, x1
        ldclral           x8, x8, [x0]
        ret

asm_test::and::u64::acquire:
        mvn               x8, x1
        ldclra            x8, x8, [x0]
        ret

asm_test::and::u64::relaxed:
        mvn               x8, x1
        ldclr             x8, x8, [x0]
        ret

asm_test::and::u64::release:
        mvn               x8, x1
        ldclrl            x8, x8, [x0]
        ret

asm_test::and::u128::acqrel:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        and               x4, x6, x2
        and               x5, x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::and::u128::seqcst:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        and               x4, x6, x2
        and               x5, x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::and::u128::acquire:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        and               x4, x6, x2
        and               x5, x7, x3
        caspa             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::and::u128::relaxed:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        and               x4, x6, x2
        and               x5, x7, x3
        casp              x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::and::u128::release:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        and               x4, x6, x2
        and               x5, x7, x3
        caspl             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::neg::u8::acqrel:
        ldrb              w9, [x0]
        mov               w8, w9
0:
        neg               w10, w9
        casalb            w8, w10, [x0]
        cmp               w8, w9, uxtb
        mov               w9, w8
        b.ne              0b
        ret

asm_test::neg::u8::seqcst:
        ldrb              w9, [x0]
        mov               w8, w9
0:
        neg               w10, w9
        casalb            w8, w10, [x0]
        cmp               w8, w9, uxtb
        mov               w9, w8
        b.ne              0b
        ret

asm_test::neg::u8::acquire:
        ldrb              w9, [x0]
        mov               w8, w9
0:
        neg               w10, w9
        casab             w8, w10, [x0]
        cmp               w8, w9, uxtb
        mov               w9, w8
        b.ne              0b
        ret

asm_test::neg::u8::relaxed:
        ldrb              w9, [x0]
        mov               w8, w9
0:
        neg               w10, w9
        casb              w8, w10, [x0]
        cmp               w8, w9, uxtb
        mov               w9, w8
        b.ne              0b
        ret

asm_test::neg::u8::release:
        ldrb              w9, [x0]
        mov               w8, w9
0:
        neg               w10, w9
        caslb             w8, w10, [x0]
        cmp               w8, w9, uxtb
        mov               w9, w8
        b.ne              0b
        ret

asm_test::neg::u16::acqrel:
        ldrh              w9, [x0]
        mov               w8, w9
0:
        neg               w10, w9
        casalh            w8, w10, [x0]
        cmp               w8, w9, uxth
        mov               w9, w8
        b.ne              0b
        ret

asm_test::neg::u16::seqcst:
        ldrh              w9, [x0]
        mov               w8, w9
0:
        neg               w10, w9
        casalh            w8, w10, [x0]
        cmp               w8, w9, uxth
        mov               w9, w8
        b.ne              0b
        ret

asm_test::neg::u16::acquire:
        ldrh              w9, [x0]
        mov               w8, w9
0:
        neg               w10, w9
        casah             w8, w10, [x0]
        cmp               w8, w9, uxth
        mov               w9, w8
        b.ne              0b
        ret

asm_test::neg::u16::relaxed:
        ldrh              w9, [x0]
        mov               w8, w9
0:
        neg               w10, w9
        cash              w8, w10, [x0]
        cmp               w8, w9, uxth
        mov               w9, w8
        b.ne              0b
        ret

asm_test::neg::u16::release:
        ldrh              w9, [x0]
        mov               w8, w9
0:
        neg               w10, w9
        caslh             w8, w10, [x0]
        cmp               w8, w9, uxth
        mov               w9, w8
        b.ne              0b
        ret

asm_test::neg::u32::acqrel:
        ldr               w9, [x0]
        mov               w8, w9
0:
        neg               w10, w9
        casal             w8, w10, [x0]
        cmp               w8, w9
        mov               w9, w8
        b.ne              0b
        ret

asm_test::neg::u32::seqcst:
        ldr               w9, [x0]
        mov               w8, w9
0:
        neg               w10, w9
        casal             w8, w10, [x0]
        cmp               w8, w9
        mov               w9, w8
        b.ne              0b
        ret

asm_test::neg::u32::acquire:
        ldr               w9, [x0]
        mov               w8, w9
0:
        neg               w10, w9
        casa              w8, w10, [x0]
        cmp               w8, w9
        mov               w9, w8
        b.ne              0b
        ret

asm_test::neg::u32::relaxed:
        ldr               w9, [x0]
        mov               w8, w9
0:
        neg               w10, w9
        cas               w8, w10, [x0]
        cmp               w8, w9
        mov               w9, w8
        b.ne              0b
        ret

asm_test::neg::u32::release:
        ldr               w9, [x0]
        mov               w8, w9
0:
        neg               w10, w9
        casl              w8, w10, [x0]
        cmp               w8, w9
        mov               w9, w8
        b.ne              0b
        ret

asm_test::neg::u64::acqrel:
        ldr               x9, [x0]
        mov               x8, x9
0:
        neg               x10, x9
        casal             x8, x10, [x0]
        cmp               x8, x9
        mov               x9, x8
        b.ne              0b
        ret

asm_test::neg::u64::seqcst:
        ldr               x9, [x0]
        mov               x8, x9
0:
        neg               x10, x9
        casal             x8, x10, [x0]
        cmp               x8, x9
        mov               x9, x8
        b.ne              0b
        ret

asm_test::neg::u64::acquire:
        ldr               x9, [x0]
        mov               x8, x9
0:
        neg               x10, x9
        casa              x8, x10, [x0]
        cmp               x8, x9
        mov               x9, x8
        b.ne              0b
        ret

asm_test::neg::u64::relaxed:
        ldr               x9, [x0]
        mov               x8, x9
0:
        neg               x10, x9
        cas               x8, x10, [x0]
        cmp               x8, x9
        mov               x9, x8
        b.ne              0b
        ret

asm_test::neg::u64::release:
        ldr               x9, [x0]
        mov               x8, x9
0:
        neg               x10, x9
        casl              x8, x10, [x0]
        cmp               x8, x9
        mov               x9, x8
        b.ne              0b
        ret

asm_test::neg::u128::acqrel:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        negs              x4, x6
        ngc               x5, x7
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::neg::u128::seqcst:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        negs              x4, x6
        ngc               x5, x7
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::neg::u128::acquire:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        negs              x4, x6
        ngc               x5, x7
        caspa             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::neg::u128::relaxed:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        negs              x4, x6
        ngc               x5, x7
        casp              x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::neg::u128::release:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        negs              x4, x6
        ngc               x5, x7
        caspl             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::not::u8::acqrel:
        mov               w8, #-0x1               // =-1
        ldeoralb          w8, w8, [x0]
        ret

asm_test::not::u8::seqcst:
        mov               w8, #-0x1               // =-1
        ldeoralb          w8, w8, [x0]
        ret

asm_test::not::u8::acquire:
        mov               w8, #-0x1               // =-1
        ldeorab           w8, w8, [x0]
        ret

asm_test::not::u8::relaxed:
        mov               w8, #-0x1               // =-1
        ldeorb            w8, w8, [x0]
        ret

asm_test::not::u8::release:
        mov               w8, #-0x1               // =-1
        ldeorlb           w8, w8, [x0]
        ret

asm_test::not::u16::acqrel:
        mov               w8, #-0x1               // =-1
        ldeoralh          w8, w8, [x0]
        ret

asm_test::not::u16::seqcst:
        mov               w8, #-0x1               // =-1
        ldeoralh          w8, w8, [x0]
        ret

asm_test::not::u16::acquire:
        mov               w8, #-0x1               // =-1
        ldeorah           w8, w8, [x0]
        ret

asm_test::not::u16::relaxed:
        mov               w8, #-0x1               // =-1
        ldeorh            w8, w8, [x0]
        ret

asm_test::not::u16::release:
        mov               w8, #-0x1               // =-1
        ldeorlh           w8, w8, [x0]
        ret

asm_test::not::u32::acqrel:
        mov               w8, #-0x1               // =-1
        ldeoral           w8, w8, [x0]
        ret

asm_test::not::u32::seqcst:
        mov               w8, #-0x1               // =-1
        ldeoral           w8, w8, [x0]
        ret

asm_test::not::u32::acquire:
        mov               w8, #-0x1               // =-1
        ldeora            w8, w8, [x0]
        ret

asm_test::not::u32::relaxed:
        mov               w8, #-0x1               // =-1
        ldeor             w8, w8, [x0]
        ret

asm_test::not::u32::release:
        mov               w8, #-0x1               // =-1
        ldeorl            w8, w8, [x0]
        ret

asm_test::not::u64::acqrel:
        mov               x8, #-0x1               // =-1
        ldeoral           x8, x8, [x0]
        ret

asm_test::not::u64::seqcst:
        mov               x8, #-0x1               // =-1
        ldeoral           x8, x8, [x0]
        ret

asm_test::not::u64::acquire:
        mov               x8, #-0x1               // =-1
        ldeora            x8, x8, [x0]
        ret

asm_test::not::u64::relaxed:
        mov               x8, #-0x1               // =-1
        ldeor             x8, x8, [x0]
        ret

asm_test::not::u64::release:
        mov               x8, #-0x1               // =-1
        ldeorl            x8, x8, [x0]
        ret

asm_test::not::u128::acqrel:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        mvn               x4, x6
        mvn               x5, x7
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::not::u128::seqcst:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        mvn               x4, x6
        mvn               x5, x7
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::not::u128::acquire:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        mvn               x4, x6
        mvn               x5, x7
        caspa             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::not::u128::relaxed:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        mvn               x4, x6
        mvn               x5, x7
        casp              x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::not::u128::release:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        mvn               x4, x6
        mvn               x5, x7
        caspl             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::sub::u8::acqrel:
        neg               w8, w1
        ldaddalb          w8, w8, [x0]
        ret

asm_test::sub::u8::seqcst:
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

asm_test::sub::u16::acqrel:
        neg               w8, w1
        ldaddalh          w8, w8, [x0]
        ret

asm_test::sub::u16::seqcst:
        neg               w8, w1
        ldaddalh          w8, w8, [x0]
        ret

asm_test::sub::u16::acquire:
        neg               w8, w1
        ldaddah           w8, w8, [x0]
        ret

asm_test::sub::u16::relaxed:
        neg               w8, w1
        ldaddh            w8, w8, [x0]
        ret

asm_test::sub::u16::release:
        neg               w8, w1
        ldaddlh           w8, w8, [x0]
        ret

asm_test::sub::u32::acqrel:
        neg               w8, w1
        ldaddal           w8, w8, [x0]
        ret

asm_test::sub::u32::seqcst:
        neg               w8, w1
        ldaddal           w8, w8, [x0]
        ret

asm_test::sub::u32::acquire:
        neg               w8, w1
        ldadda            w8, w8, [x0]
        ret

asm_test::sub::u32::relaxed:
        neg               w8, w1
        ldadd             w8, w8, [x0]
        ret

asm_test::sub::u32::release:
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

asm_test::sub::u64::acquire:
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
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        subs              x4, x6, x2
        sbc               x5, x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::sub::u128::seqcst:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        subs              x4, x6, x2
        sbc               x5, x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::sub::u128::acquire:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        subs              x4, x6, x2
        sbc               x5, x7, x3
        caspa             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::sub::u128::relaxed:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        subs              x4, x6, x2
        sbc               x5, x7, x3
        casp              x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::sub::u128::release:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        subs              x4, x6, x2
        sbc               x5, x7, x3
        caspl             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::xor::u8::acqrel:
        ldeoralb          w1, w8, [x0]
        ret

asm_test::xor::u8::seqcst:
        ldeoralb          w1, w8, [x0]
        ret

asm_test::xor::u8::acquire:
        ldeorab           w1, w8, [x0]
        ret

asm_test::xor::u8::relaxed:
        ldeorb            w1, w8, [x0]
        ret

asm_test::xor::u8::release:
        ldeorlb           w1, w8, [x0]
        ret

asm_test::xor::u16::acqrel:
        ldeoralh          w1, w8, [x0]
        ret

asm_test::xor::u16::seqcst:
        ldeoralh          w1, w8, [x0]
        ret

asm_test::xor::u16::acquire:
        ldeorah           w1, w8, [x0]
        ret

asm_test::xor::u16::relaxed:
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

asm_test::xor::u128::acqrel:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        eor               x4, x6, x2
        eor               x5, x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::xor::u128::seqcst:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        eor               x4, x6, x2
        eor               x5, x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::xor::u128::acquire:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        eor               x4, x6, x2
        eor               x5, x7, x3
        caspa             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::xor::u128::relaxed:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        eor               x4, x6, x2
        eor               x5, x7, x3
        casp              x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        ret

asm_test::xor::u128::release:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        eor               x4, x6, x2
        eor               x5, x7, x3
        caspl             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
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
        ldarb             w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::load::bool::acquire:
        ldarb             w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::load::bool::relaxed:
        ldrb              w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::load::u128::seqcst:
        mov               x2, xzr
        mov               x3, xzr
        caspal            x2, x3, x2, x3, [x0]
        mov               x1, x3
        mov               x0, x2
        ret

asm_test::load::u128::acquire:
        mov               x2, xzr
        mov               x3, xzr
        caspa             x2, x3, x2, x3, [x0]
        mov               x1, x3
        mov               x0, x2
        ret

asm_test::load::u128::relaxed:
        mov               x2, xzr
        mov               x3, xzr
        casp              x2, x3, x2, x3, [x0]
        mov               x1, x3
        mov               x0, x2
        ret

asm_test::swap::u8::acqrel:
        swpalb            w1, w0, [x0]
        ret

asm_test::swap::u8::seqcst:
        swpalb            w1, w0, [x0]
        ret

asm_test::swap::u8::acquire:
        swpab             w1, w0, [x0]
        ret

asm_test::swap::u8::relaxed:
        swpb              w1, w0, [x0]
        ret

asm_test::swap::u8::release:
        swplb             w1, w0, [x0]
        ret

asm_test::swap::u16::acqrel:
        swpalh            w1, w0, [x0]
        ret

asm_test::swap::u16::seqcst:
        swpalh            w1, w0, [x0]
        ret

asm_test::swap::u16::acquire:
        swpah             w1, w0, [x0]
        ret

asm_test::swap::u16::relaxed:
        swph              w1, w0, [x0]
        ret

asm_test::swap::u16::release:
        swplh             w1, w0, [x0]
        ret

asm_test::swap::u32::acqrel:
        swpal             w1, w0, [x0]
        ret

asm_test::swap::u32::seqcst:
        swpal             w1, w0, [x0]
        ret

asm_test::swap::u32::acquire:
        swpa              w1, w0, [x0]
        ret

asm_test::swap::u32::relaxed:
        swp               w1, w0, [x0]
        ret

asm_test::swap::u32::release:
        swpl              w1, w0, [x0]
        ret

asm_test::swap::u64::acqrel:
        swpal             x1, x0, [x0]
        ret

asm_test::swap::u64::seqcst:
        swpal             x1, x0, [x0]
        ret

asm_test::swap::u64::acquire:
        swpa              x1, x0, [x0]
        ret

asm_test::swap::u64::relaxed:
        swp               x1, x0, [x0]
        ret

asm_test::swap::u64::release:
        swpl              x1, x0, [x0]
        ret

asm_test::swap::bool::acqrel:
        swpalb            w1, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::swap::bool::seqcst:
        swpalb            w1, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::swap::bool::acquire:
        swpab             w1, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::swap::bool::relaxed:
        swpb              w1, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::swap::bool::release:
        swplb             w1, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::swap::u128::acqrel:
        ldp               x4, x5, [x0]
0:
        mov               x8, x4
        mov               x9, x5
        caspal            x4, x5, x2, x3, [x0]
        cmp               x9, x5
        ccmp              x8, x4, #0x0, eq
        b.ne              0b
        mov               x1, x5
        mov               x0, x4
        ret

asm_test::swap::u128::seqcst:
        ldp               x4, x5, [x0]
0:
        mov               x8, x4
        mov               x9, x5
        caspal            x4, x5, x2, x3, [x0]
        cmp               x9, x5
        ccmp              x8, x4, #0x0, eq
        b.ne              0b
        mov               x1, x5
        mov               x0, x4
        ret

asm_test::swap::u128::acquire:
        ldp               x4, x5, [x0]
0:
        mov               x8, x4
        mov               x9, x5
        caspa             x4, x5, x2, x3, [x0]
        cmp               x9, x5
        ccmp              x8, x4, #0x0, eq
        b.ne              0b
        mov               x1, x5
        mov               x0, x4
        ret

asm_test::swap::u128::relaxed:
        ldp               x4, x5, [x0]
0:
        mov               x8, x4
        mov               x9, x5
        casp              x4, x5, x2, x3, [x0]
        cmp               x9, x5
        ccmp              x8, x4, #0x0, eq
        b.ne              0b
        mov               x1, x5
        mov               x0, x4
        ret

asm_test::swap::u128::release:
        ldp               x4, x5, [x0]
0:
        mov               x8, x4
        mov               x9, x5
        caspl             x4, x5, x2, x3, [x0]
        cmp               x9, x5
        ccmp              x8, x4, #0x0, eq
        b.ne              0b
        mov               x1, x5
        mov               x0, x4
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
        ldp               x4, x5, [x0]
0:
        mov               x8, x4
        mov               x9, x5
        caspal            x4, x5, x2, x3, [x0]
        cmp               x9, x5
        ccmp              x8, x4, #0x0, eq
        b.ne              0b
        ret

asm_test::store::u128::relaxed:
        ldp               x4, x5, [x0]
0:
        mov               x8, x4
        mov               x9, x5
        casp              x4, x5, x2, x3, [x0]
        cmp               x9, x5
        ccmp              x8, x4, #0x0, eq
        b.ne              0b
        ret

asm_test::store::u128::release:
        ldp               x4, x5, [x0]
0:
        mov               x8, x4
        mov               x9, x5
        caspl             x4, x5, x2, x3, [x0]
        cmp               x9, x5
        ccmp              x8, x4, #0x0, eq
        b.ne              0b
        ret

asm_test::fetch_or::u8::acqrel:
        ldsetalb          w1, w0, [x0]
        ret

asm_test::fetch_or::u8::seqcst:
        ldsetalb          w1, w0, [x0]
        ret

asm_test::fetch_or::u8::acquire:
        ldsetab           w1, w0, [x0]
        ret

asm_test::fetch_or::u8::relaxed:
        ldsetb            w1, w0, [x0]
        ret

asm_test::fetch_or::u8::release:
        ldsetlb           w1, w0, [x0]
        ret

asm_test::fetch_or::u16::acqrel:
        ldsetalh          w1, w0, [x0]
        ret

asm_test::fetch_or::u16::seqcst:
        ldsetalh          w1, w0, [x0]
        ret

asm_test::fetch_or::u16::acquire:
        ldsetah           w1, w0, [x0]
        ret

asm_test::fetch_or::u16::relaxed:
        ldseth            w1, w0, [x0]
        ret

asm_test::fetch_or::u16::release:
        ldsetlh           w1, w0, [x0]
        ret

asm_test::fetch_or::u32::acqrel:
        ldsetal           w1, w0, [x0]
        ret

asm_test::fetch_or::u32::seqcst:
        ldsetal           w1, w0, [x0]
        ret

asm_test::fetch_or::u32::acquire:
        ldseta            w1, w0, [x0]
        ret

asm_test::fetch_or::u32::relaxed:
        ldset             w1, w0, [x0]
        ret

asm_test::fetch_or::u32::release:
        ldsetl            w1, w0, [x0]
        ret

asm_test::fetch_or::u64::acqrel:
        ldsetal           x1, x0, [x0]
        ret

asm_test::fetch_or::u64::seqcst:
        ldsetal           x1, x0, [x0]
        ret

asm_test::fetch_or::u64::acquire:
        ldseta            x1, x0, [x0]
        ret

asm_test::fetch_or::u64::relaxed:
        ldset             x1, x0, [x0]
        ret

asm_test::fetch_or::u64::release:
        ldsetl            x1, x0, [x0]
        ret

asm_test::fetch_or::bool::acqrel:
        ldsetalb          w1, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_or::bool::seqcst:
        ldsetalb          w1, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_or::bool::acquire:
        ldsetab           w1, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_or::bool::relaxed:
        ldsetb            w1, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_or::bool::release:
        ldsetlb           w1, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_or::u128::acqrel:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        orr               x4, x6, x2
        orr               x5, x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_or::u128::seqcst:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        orr               x4, x6, x2
        orr               x5, x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_or::u128::acquire:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        orr               x4, x6, x2
        orr               x5, x7, x3
        caspa             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_or::u128::relaxed:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        orr               x4, x6, x2
        orr               x5, x7, x3
        casp              x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_or::u128::release:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        orr               x4, x6, x2
        orr               x5, x7, x3
        caspl             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_add::u8::acqrel:
        ldaddalb          w1, w0, [x0]
        ret

asm_test::fetch_add::u8::seqcst:
        ldaddalb          w1, w0, [x0]
        ret

asm_test::fetch_add::u8::acquire:
        ldaddab           w1, w0, [x0]
        ret

asm_test::fetch_add::u8::relaxed:
        ldaddb            w1, w0, [x0]
        ret

asm_test::fetch_add::u8::release:
        ldaddlb           w1, w0, [x0]
        ret

asm_test::fetch_add::u16::acqrel:
        ldaddalh          w1, w0, [x0]
        ret

asm_test::fetch_add::u16::seqcst:
        ldaddalh          w1, w0, [x0]
        ret

asm_test::fetch_add::u16::acquire:
        ldaddah           w1, w0, [x0]
        ret

asm_test::fetch_add::u16::relaxed:
        ldaddh            w1, w0, [x0]
        ret

asm_test::fetch_add::u16::release:
        ldaddlh           w1, w0, [x0]
        ret

asm_test::fetch_add::u32::acqrel:
        ldaddal           w1, w0, [x0]
        ret

asm_test::fetch_add::u32::seqcst:
        ldaddal           w1, w0, [x0]
        ret

asm_test::fetch_add::u32::acquire:
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
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        adds              x4, x6, x2
        adc               x5, x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_add::u128::seqcst:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        adds              x4, x6, x2
        adc               x5, x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_add::u128::acquire:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        adds              x4, x6, x2
        adc               x5, x7, x3
        caspa             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_add::u128::relaxed:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        adds              x4, x6, x2
        adc               x5, x7, x3
        casp              x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_add::u128::release:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        adds              x4, x6, x2
        adc               x5, x7, x3
        caspl             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_and::u8::acqrel:
        mvn               w8, w1
        ldclralb          w8, w0, [x0]
        ret

asm_test::fetch_and::u8::seqcst:
        mvn               w8, w1
        ldclralb          w8, w0, [x0]
        ret

asm_test::fetch_and::u8::acquire:
        mvn               w8, w1
        ldclrab           w8, w0, [x0]
        ret

asm_test::fetch_and::u8::relaxed:
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

asm_test::fetch_and::u16::acquire:
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

asm_test::fetch_and::u32::seqcst:
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

asm_test::fetch_and::u64::acqrel:
        mvn               x8, x1
        ldclral           x8, x0, [x0]
        ret

asm_test::fetch_and::u64::seqcst:
        mvn               x8, x1
        ldclral           x8, x0, [x0]
        ret

asm_test::fetch_and::u64::acquire:
        mvn               x8, x1
        ldclra            x8, x0, [x0]
        ret

asm_test::fetch_and::u64::relaxed:
        mvn               x8, x1
        ldclr             x8, x0, [x0]
        ret

asm_test::fetch_and::u64::release:
        mvn               x8, x1
        ldclrl            x8, x0, [x0]
        ret

asm_test::fetch_and::bool::acqrel:
        mvn               w8, w1
        ldclralb          w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_and::bool::seqcst:
        mvn               w8, w1
        ldclralb          w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_and::bool::acquire:
        mvn               w8, w1
        ldclrab           w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_and::bool::relaxed:
        mvn               w8, w1
        ldclrb            w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_and::bool::release:
        mvn               w8, w1
        ldclrlb           w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_and::u128::acqrel:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        and               x4, x6, x2
        and               x5, x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_and::u128::seqcst:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        and               x4, x6, x2
        and               x5, x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_and::u128::acquire:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        and               x4, x6, x2
        and               x5, x7, x3
        caspa             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_and::u128::relaxed:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        and               x4, x6, x2
        and               x5, x7, x3
        casp              x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_and::u128::release:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        and               x4, x6, x2
        and               x5, x7, x3
        caspl             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_max::i8::acqrel:
        ldrb              w8, [x0]
        sxtb              w9, w1
        mov               w10, w8
0:
        sxtb              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, gt
        casalb            w10, w11, [x0]
        cmp               w10, w8, uxtb
        mov               w8, w10
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_max::i8::seqcst:
        ldrb              w8, [x0]
        sxtb              w9, w1
        mov               w10, w8
0:
        sxtb              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, gt
        casalb            w10, w11, [x0]
        cmp               w10, w8, uxtb
        mov               w8, w10
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_max::i8::acquire:
        ldrb              w8, [x0]
        sxtb              w9, w1
        mov               w10, w8
0:
        sxtb              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, gt
        casab             w10, w11, [x0]
        cmp               w10, w8, uxtb
        mov               w8, w10
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_max::i8::relaxed:
        ldrb              w8, [x0]
        sxtb              w9, w1
        mov               w10, w8
0:
        sxtb              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, gt
        casb              w10, w11, [x0]
        cmp               w10, w8, uxtb
        mov               w8, w10
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_max::i8::release:
        ldrb              w8, [x0]
        sxtb              w9, w1
        mov               w10, w8
0:
        sxtb              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, gt
        caslb             w10, w11, [x0]
        cmp               w10, w8, uxtb
        mov               w8, w10
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_max::i16::acqrel:
        ldrh              w8, [x0]
        sxth              w9, w1
        mov               w10, w8
0:
        sxth              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, gt
        casalh            w10, w11, [x0]
        cmp               w10, w8, uxth
        mov               w8, w10
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_max::i16::seqcst:
        ldrh              w8, [x0]
        sxth              w9, w1
        mov               w10, w8
0:
        sxth              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, gt
        casalh            w10, w11, [x0]
        cmp               w10, w8, uxth
        mov               w8, w10
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_max::i16::acquire:
        ldrh              w8, [x0]
        sxth              w9, w1
        mov               w10, w8
0:
        sxth              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, gt
        casah             w10, w11, [x0]
        cmp               w10, w8, uxth
        mov               w8, w10
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_max::i16::relaxed:
        ldrh              w8, [x0]
        sxth              w9, w1
        mov               w10, w8
0:
        sxth              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, gt
        cash              w10, w11, [x0]
        cmp               w10, w8, uxth
        mov               w8, w10
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_max::i16::release:
        ldrh              w8, [x0]
        sxth              w9, w1
        mov               w10, w8
0:
        sxth              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, gt
        caslh             w10, w11, [x0]
        cmp               w10, w8, uxth
        mov               w8, w10
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_max::i32::acqrel:
        ldsmaxal          w1, w0, [x0]
        ret

asm_test::fetch_max::i32::seqcst:
        ldsmaxal          w1, w0, [x0]
        ret

asm_test::fetch_max::i32::acquire:
        ldsmaxa           w1, w0, [x0]
        ret

asm_test::fetch_max::i32::relaxed:
        ldsmax            w1, w0, [x0]
        ret

asm_test::fetch_max::i32::release:
        ldsmaxl           w1, w0, [x0]
        ret

asm_test::fetch_max::i64::acqrel:
        ldsmaxal          x1, x0, [x0]
        ret

asm_test::fetch_max::i64::seqcst:
        ldsmaxal          x1, x0, [x0]
        ret

asm_test::fetch_max::i64::acquire:
        ldsmaxa           x1, x0, [x0]
        ret

asm_test::fetch_max::i64::relaxed:
        ldsmax            x1, x0, [x0]
        ret

asm_test::fetch_max::i64::release:
        ldsmaxl           x1, x0, [x0]
        ret

asm_test::fetch_max::i128::acqrel:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        cmp               x2, x6
        sbcs              xzr, x3, x7
        csel              x5, x7, x3, lt
        csel              x4, x6, x2, lt
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_max::i128::seqcst:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        cmp               x2, x6
        sbcs              xzr, x3, x7
        csel              x5, x7, x3, lt
        csel              x4, x6, x2, lt
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_max::i128::acquire:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        cmp               x2, x6
        sbcs              xzr, x3, x7
        csel              x5, x7, x3, lt
        csel              x4, x6, x2, lt
        caspa             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_max::i128::relaxed:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        cmp               x2, x6
        sbcs              xzr, x3, x7
        csel              x5, x7, x3, lt
        csel              x4, x6, x2, lt
        casp              x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_max::i128::release:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        cmp               x2, x6
        sbcs              xzr, x3, x7
        csel              x5, x7, x3, lt
        csel              x4, x6, x2, lt
        caspl             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_min::i8::acqrel:
        ldrb              w8, [x0]
        sxtb              w9, w1
        mov               w10, w8
0:
        sxtb              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, lt
        casalb            w10, w11, [x0]
        cmp               w10, w8, uxtb
        mov               w8, w10
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_min::i8::seqcst:
        ldrb              w8, [x0]
        sxtb              w9, w1
        mov               w10, w8
0:
        sxtb              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, lt
        casalb            w10, w11, [x0]
        cmp               w10, w8, uxtb
        mov               w8, w10
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_min::i8::acquire:
        ldrb              w8, [x0]
        sxtb              w9, w1
        mov               w10, w8
0:
        sxtb              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, lt
        casab             w10, w11, [x0]
        cmp               w10, w8, uxtb
        mov               w8, w10
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_min::i8::relaxed:
        ldrb              w8, [x0]
        sxtb              w9, w1
        mov               w10, w8
0:
        sxtb              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, lt
        casb              w10, w11, [x0]
        cmp               w10, w8, uxtb
        mov               w8, w10
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_min::i8::release:
        ldrb              w8, [x0]
        sxtb              w9, w1
        mov               w10, w8
0:
        sxtb              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, lt
        caslb             w10, w11, [x0]
        cmp               w10, w8, uxtb
        mov               w8, w10
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_min::i16::acqrel:
        ldrh              w8, [x0]
        sxth              w9, w1
        mov               w10, w8
0:
        sxth              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, lt
        casalh            w10, w11, [x0]
        cmp               w10, w8, uxth
        mov               w8, w10
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_min::i16::seqcst:
        ldrh              w8, [x0]
        sxth              w9, w1
        mov               w10, w8
0:
        sxth              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, lt
        casalh            w10, w11, [x0]
        cmp               w10, w8, uxth
        mov               w8, w10
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_min::i16::acquire:
        ldrh              w8, [x0]
        sxth              w9, w1
        mov               w10, w8
0:
        sxth              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, lt
        casah             w10, w11, [x0]
        cmp               w10, w8, uxth
        mov               w8, w10
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_min::i16::relaxed:
        ldrh              w8, [x0]
        sxth              w9, w1
        mov               w10, w8
0:
        sxth              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, lt
        cash              w10, w11, [x0]
        cmp               w10, w8, uxth
        mov               w8, w10
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_min::i16::release:
        ldrh              w8, [x0]
        sxth              w9, w1
        mov               w10, w8
0:
        sxth              w11, w8
        cmp               w9, w11
        csel              w11, w9, w11, lt
        caslh             w10, w11, [x0]
        cmp               w10, w8, uxth
        mov               w8, w10
        b.ne              0b
        mov               w0, w8
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
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        cmp               x2, x6
        sbcs              xzr, x3, x7
        csel              x5, x7, x3, ge
        csel              x4, x6, x2, ge
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_min::i128::seqcst:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        cmp               x2, x6
        sbcs              xzr, x3, x7
        csel              x5, x7, x3, ge
        csel              x4, x6, x2, ge
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_min::i128::acquire:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        cmp               x2, x6
        sbcs              xzr, x3, x7
        csel              x5, x7, x3, ge
        csel              x4, x6, x2, ge
        caspa             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_min::i128::relaxed:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        cmp               x2, x6
        sbcs              xzr, x3, x7
        csel              x5, x7, x3, ge
        csel              x4, x6, x2, ge
        casp              x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_min::i128::release:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        cmp               x2, x6
        sbcs              xzr, x3, x7
        csel              x5, x7, x3, ge
        csel              x4, x6, x2, ge
        caspl             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_neg::u8::acqrel:
        ldrb              w8, [x0]
        mov               w9, w8
0:
        neg               w10, w8
        casalb            w9, w10, [x0]
        cmp               w9, w8, uxtb
        mov               w8, w9
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_neg::u8::seqcst:
        ldrb              w8, [x0]
        mov               w9, w8
0:
        neg               w10, w8
        casalb            w9, w10, [x0]
        cmp               w9, w8, uxtb
        mov               w8, w9
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_neg::u8::acquire:
        ldrb              w8, [x0]
        mov               w9, w8
0:
        neg               w10, w8
        casab             w9, w10, [x0]
        cmp               w9, w8, uxtb
        mov               w8, w9
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_neg::u8::relaxed:
        ldrb              w8, [x0]
        mov               w9, w8
0:
        neg               w10, w8
        casb              w9, w10, [x0]
        cmp               w9, w8, uxtb
        mov               w8, w9
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_neg::u8::release:
        ldrb              w8, [x0]
        mov               w9, w8
0:
        neg               w10, w8
        caslb             w9, w10, [x0]
        cmp               w9, w8, uxtb
        mov               w8, w9
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_neg::u16::acqrel:
        ldrh              w8, [x0]
        mov               w9, w8
0:
        neg               w10, w8
        casalh            w9, w10, [x0]
        cmp               w9, w8, uxth
        mov               w8, w9
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_neg::u16::seqcst:
        ldrh              w8, [x0]
        mov               w9, w8
0:
        neg               w10, w8
        casalh            w9, w10, [x0]
        cmp               w9, w8, uxth
        mov               w8, w9
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_neg::u16::acquire:
        ldrh              w8, [x0]
        mov               w9, w8
0:
        neg               w10, w8
        casah             w9, w10, [x0]
        cmp               w9, w8, uxth
        mov               w8, w9
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_neg::u16::relaxed:
        ldrh              w8, [x0]
        mov               w9, w8
0:
        neg               w10, w8
        cash              w9, w10, [x0]
        cmp               w9, w8, uxth
        mov               w8, w9
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_neg::u16::release:
        ldrh              w8, [x0]
        mov               w9, w8
0:
        neg               w10, w8
        caslh             w9, w10, [x0]
        cmp               w9, w8, uxth
        mov               w8, w9
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_neg::u32::acqrel:
        ldr               w8, [x0]
        mov               w9, w8
0:
        neg               w10, w8
        casal             w9, w10, [x0]
        cmp               w9, w8
        mov               w8, w9
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_neg::u32::seqcst:
        ldr               w8, [x0]
        mov               w9, w8
0:
        neg               w10, w8
        casal             w9, w10, [x0]
        cmp               w9, w8
        mov               w8, w9
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_neg::u32::acquire:
        ldr               w8, [x0]
        mov               w9, w8
0:
        neg               w10, w8
        casa              w9, w10, [x0]
        cmp               w9, w8
        mov               w8, w9
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_neg::u32::relaxed:
        ldr               w8, [x0]
        mov               w9, w8
0:
        neg               w10, w8
        cas               w9, w10, [x0]
        cmp               w9, w8
        mov               w8, w9
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_neg::u32::release:
        ldr               w8, [x0]
        mov               w9, w8
0:
        neg               w10, w8
        casl              w9, w10, [x0]
        cmp               w9, w8
        mov               w8, w9
        b.ne              0b
        mov               w0, w8
        ret

asm_test::fetch_neg::u64::acqrel:
        ldr               x8, [x0]
        mov               x9, x8
0:
        neg               x10, x8
        casal             x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0b
        mov               x0, x8
        ret

asm_test::fetch_neg::u64::seqcst:
        ldr               x8, [x0]
        mov               x9, x8
0:
        neg               x10, x8
        casal             x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0b
        mov               x0, x8
        ret

asm_test::fetch_neg::u64::acquire:
        ldr               x8, [x0]
        mov               x9, x8
0:
        neg               x10, x8
        casa              x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0b
        mov               x0, x8
        ret

asm_test::fetch_neg::u64::relaxed:
        ldr               x8, [x0]
        mov               x9, x8
0:
        neg               x10, x8
        cas               x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0b
        mov               x0, x8
        ret

asm_test::fetch_neg::u64::release:
        ldr               x8, [x0]
        mov               x9, x8
0:
        neg               x10, x8
        casl              x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0b
        mov               x0, x8
        ret

asm_test::fetch_neg::u128::acqrel:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        negs              x4, x6
        ngc               x5, x7
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x0, x6
        mov               x1, x7
        ret

asm_test::fetch_neg::u128::seqcst:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        negs              x4, x6
        ngc               x5, x7
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x0, x6
        mov               x1, x7
        ret

asm_test::fetch_neg::u128::acquire:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        negs              x4, x6
        ngc               x5, x7
        caspa             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x0, x6
        mov               x1, x7
        ret

asm_test::fetch_neg::u128::relaxed:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        negs              x4, x6
        ngc               x5, x7
        casp              x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x0, x6
        mov               x1, x7
        ret

asm_test::fetch_neg::u128::release:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        negs              x4, x6
        ngc               x5, x7
        caspl             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x0, x6
        mov               x1, x7
        ret

asm_test::fetch_not::u8::acqrel:
        mov               w8, #-0x1               // =-1
        ldeoralb          w8, w0, [x0]
        ret

asm_test::fetch_not::u8::seqcst:
        mov               w8, #-0x1               // =-1
        ldeoralb          w8, w0, [x0]
        ret

asm_test::fetch_not::u8::acquire:
        mov               w8, #-0x1               // =-1
        ldeorab           w8, w0, [x0]
        ret

asm_test::fetch_not::u8::relaxed:
        mov               w8, #-0x1               // =-1
        ldeorb            w8, w0, [x0]
        ret

asm_test::fetch_not::u8::release:
        mov               w8, #-0x1               // =-1
        ldeorlb           w8, w0, [x0]
        ret

asm_test::fetch_not::u16::acqrel:
        mov               w8, #-0x1               // =-1
        ldeoralh          w8, w0, [x0]
        ret

asm_test::fetch_not::u16::seqcst:
        mov               w8, #-0x1               // =-1
        ldeoralh          w8, w0, [x0]
        ret

asm_test::fetch_not::u16::acquire:
        mov               w8, #-0x1               // =-1
        ldeorah           w8, w0, [x0]
        ret

asm_test::fetch_not::u16::relaxed:
        mov               w8, #-0x1               // =-1
        ldeorh            w8, w0, [x0]
        ret

asm_test::fetch_not::u16::release:
        mov               w8, #-0x1               // =-1
        ldeorlh           w8, w0, [x0]
        ret

asm_test::fetch_not::u32::acqrel:
        mov               w8, #-0x1               // =-1
        ldeoral           w8, w0, [x0]
        ret

asm_test::fetch_not::u32::seqcst:
        mov               w8, #-0x1               // =-1
        ldeoral           w8, w0, [x0]
        ret

asm_test::fetch_not::u32::acquire:
        mov               w8, #-0x1               // =-1
        ldeora            w8, w0, [x0]
        ret

asm_test::fetch_not::u32::relaxed:
        mov               w8, #-0x1               // =-1
        ldeor             w8, w0, [x0]
        ret

asm_test::fetch_not::u32::release:
        mov               w8, #-0x1               // =-1
        ldeorl            w8, w0, [x0]
        ret

asm_test::fetch_not::u64::acqrel:
        mov               x8, #-0x1               // =-1
        ldeoral           x8, x0, [x0]
        ret

asm_test::fetch_not::u64::seqcst:
        mov               x8, #-0x1               // =-1
        ldeoral           x8, x0, [x0]
        ret

asm_test::fetch_not::u64::acquire:
        mov               x8, #-0x1               // =-1
        ldeora            x8, x0, [x0]
        ret

asm_test::fetch_not::u64::relaxed:
        mov               x8, #-0x1               // =-1
        ldeor             x8, x0, [x0]
        ret

asm_test::fetch_not::u64::release:
        mov               x8, #-0x1               // =-1
        ldeorl            x8, x0, [x0]
        ret

asm_test::fetch_not::bool::acqrel:
        mov               w8, #0x1                // =1
        ldeoralb          w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_not::bool::seqcst:
        mov               w8, #0x1                // =1
        ldeoralb          w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_not::bool::acquire:
        mov               w8, #0x1                // =1
        ldeorab           w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_not::bool::relaxed:
        mov               w8, #0x1                // =1
        ldeorb            w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_not::bool::release:
        mov               w8, #0x1                // =1
        ldeorlb           w8, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_not::u128::acqrel:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        mvn               x4, x6
        mvn               x5, x7
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x0, x6
        mov               x1, x7
        ret

asm_test::fetch_not::u128::seqcst:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        mvn               x4, x6
        mvn               x5, x7
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x0, x6
        mov               x1, x7
        ret

asm_test::fetch_not::u128::acquire:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        mvn               x4, x6
        mvn               x5, x7
        caspa             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x0, x6
        mov               x1, x7
        ret

asm_test::fetch_not::u128::relaxed:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        mvn               x4, x6
        mvn               x5, x7
        casp              x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x0, x6
        mov               x1, x7
        ret

asm_test::fetch_not::u128::release:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        mvn               x4, x6
        mvn               x5, x7
        caspl             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x0, x6
        mov               x1, x7
        ret

asm_test::fetch_sub::u8::acqrel:
        neg               w8, w1
        ldaddalb          w8, w0, [x0]
        ret

asm_test::fetch_sub::u8::seqcst:
        neg               w8, w1
        ldaddalb          w8, w0, [x0]
        ret

asm_test::fetch_sub::u8::acquire:
        neg               w8, w1
        ldaddab           w8, w0, [x0]
        ret

asm_test::fetch_sub::u8::relaxed:
        neg               w8, w1
        ldaddb            w8, w0, [x0]
        ret

asm_test::fetch_sub::u8::release:
        neg               w8, w1
        ldaddlb           w8, w0, [x0]
        ret

asm_test::fetch_sub::u16::acqrel:
        neg               w8, w1
        ldaddalh          w8, w0, [x0]
        ret

asm_test::fetch_sub::u16::seqcst:
        neg               w8, w1
        ldaddalh          w8, w0, [x0]
        ret

asm_test::fetch_sub::u16::acquire:
        neg               w8, w1
        ldaddah           w8, w0, [x0]
        ret

asm_test::fetch_sub::u16::relaxed:
        neg               w8, w1
        ldaddh            w8, w0, [x0]
        ret

asm_test::fetch_sub::u16::release:
        neg               w8, w1
        ldaddlh           w8, w0, [x0]
        ret

asm_test::fetch_sub::u32::acqrel:
        neg               w8, w1
        ldaddal           w8, w0, [x0]
        ret

asm_test::fetch_sub::u32::seqcst:
        neg               w8, w1
        ldaddal           w8, w0, [x0]
        ret

asm_test::fetch_sub::u32::acquire:
        neg               w8, w1
        ldadda            w8, w0, [x0]
        ret

asm_test::fetch_sub::u32::relaxed:
        neg               w8, w1
        ldadd             w8, w0, [x0]
        ret

asm_test::fetch_sub::u32::release:
        neg               w8, w1
        ldaddl            w8, w0, [x0]
        ret

asm_test::fetch_sub::u64::acqrel:
        neg               x8, x1
        ldaddal           x8, x0, [x0]
        ret

asm_test::fetch_sub::u64::seqcst:
        neg               x8, x1
        ldaddal           x8, x0, [x0]
        ret

asm_test::fetch_sub::u64::acquire:
        neg               x8, x1
        ldadda            x8, x0, [x0]
        ret

asm_test::fetch_sub::u64::relaxed:
        neg               x8, x1
        ldadd             x8, x0, [x0]
        ret

asm_test::fetch_sub::u64::release:
        neg               x8, x1
        ldaddl            x8, x0, [x0]
        ret

asm_test::fetch_sub::u128::acqrel:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        subs              x4, x6, x2
        sbc               x5, x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_sub::u128::seqcst:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        subs              x4, x6, x2
        sbc               x5, x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_sub::u128::acquire:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        subs              x4, x6, x2
        sbc               x5, x7, x3
        caspa             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_sub::u128::relaxed:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        subs              x4, x6, x2
        sbc               x5, x7, x3
        casp              x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_sub::u128::release:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        subs              x4, x6, x2
        sbc               x5, x7, x3
        caspl             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_xor::u8::acqrel:
        ldeoralb          w1, w0, [x0]
        ret

asm_test::fetch_xor::u8::seqcst:
        ldeoralb          w1, w0, [x0]
        ret

asm_test::fetch_xor::u8::acquire:
        ldeorab           w1, w0, [x0]
        ret

asm_test::fetch_xor::u8::relaxed:
        ldeorb            w1, w0, [x0]
        ret

asm_test::fetch_xor::u8::release:
        ldeorlb           w1, w0, [x0]
        ret

asm_test::fetch_xor::u16::acqrel:
        ldeoralh          w1, w0, [x0]
        ret

asm_test::fetch_xor::u16::seqcst:
        ldeoralh          w1, w0, [x0]
        ret

asm_test::fetch_xor::u16::acquire:
        ldeorah           w1, w0, [x0]
        ret

asm_test::fetch_xor::u16::relaxed:
        ldeorh            w1, w0, [x0]
        ret

asm_test::fetch_xor::u16::release:
        ldeorlh           w1, w0, [x0]
        ret

asm_test::fetch_xor::u32::acqrel:
        ldeoral           w1, w0, [x0]
        ret

asm_test::fetch_xor::u32::seqcst:
        ldeoral           w1, w0, [x0]
        ret

asm_test::fetch_xor::u32::acquire:
        ldeora            w1, w0, [x0]
        ret

asm_test::fetch_xor::u32::relaxed:
        ldeor             w1, w0, [x0]
        ret

asm_test::fetch_xor::u32::release:
        ldeorl            w1, w0, [x0]
        ret

asm_test::fetch_xor::u64::acqrel:
        ldeoral           x1, x0, [x0]
        ret

asm_test::fetch_xor::u64::seqcst:
        ldeoral           x1, x0, [x0]
        ret

asm_test::fetch_xor::u64::acquire:
        ldeora            x1, x0, [x0]
        ret

asm_test::fetch_xor::u64::relaxed:
        ldeor             x1, x0, [x0]
        ret

asm_test::fetch_xor::u64::release:
        ldeorl            x1, x0, [x0]
        ret

asm_test::fetch_xor::bool::acqrel:
        ldeoralb          w1, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_xor::bool::seqcst:
        ldeoralb          w1, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_xor::bool::acquire:
        ldeorab           w1, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_xor::bool::relaxed:
        ldeorb            w1, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_xor::bool::release:
        ldeorlb           w1, w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_xor::u128::acqrel:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        eor               x4, x6, x2
        eor               x5, x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_xor::u128::seqcst:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        eor               x4, x6, x2
        eor               x5, x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_xor::u128::acquire:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        eor               x4, x6, x2
        eor               x5, x7, x3
        caspa             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_xor::u128::relaxed:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        eor               x4, x6, x2
        eor               x5, x7, x3
        casp              x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret

asm_test::fetch_xor::u128::release:
        ldp               x6, x7, [x0]
0:
        mov               x8, x6
        mov               x9, x7
        eor               x4, x6, x2
        eor               x5, x7, x3
        caspl             x6, x7, x4, x5, [x0]
        cmp               x9, x7
        ccmp              x8, x6, #0x0, eq
        b.ne              0b
        mov               x1, x7
        mov               x0, x6
        ret


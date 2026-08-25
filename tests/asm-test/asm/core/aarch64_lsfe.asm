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

asm_test::fetch_nand::u128::acqrel:
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        and               x9, x0, x2
        and               x10, x1, x3
        mvn               x10, x10
        mvn               x9, x9
        stlxp             w11, x9, x10, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_nand::u128::seqcst:
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        and               x9, x0, x2
        and               x10, x1, x3
        mvn               x10, x10
        mvn               x9, x9
        stlxp             w11, x9, x10, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_nand::u128::acquire:
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        and               x9, x0, x2
        and               x10, x1, x3
        mvn               x10, x10
        mvn               x9, x9
        stxp              w11, x9, x10, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_nand::u128::relaxed:
        mov               x8, x0
0:
        ldxp              x0, x1, [x8]
        and               x9, x0, x2
        and               x10, x1, x3
        mvn               x10, x10
        mvn               x9, x9
        stxp              w11, x9, x10, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_nand::u128::release:
        mov               x8, x0
0:
        ldxp              x0, x1, [x8]
        and               x9, x0, x2
        and               x10, x1, x3
        mvn               x10, x10
        mvn               x9, x9
        stlxp             w11, x9, x10, [x8]
        cbnz              w11, 0b
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
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        cmp               x2, x0
        sbcs              xzr, x3, x1
        csel              x9, x1, x3, lo
        csel              x10, x0, x2, lo
        stlxp             w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_umax::u128::seqcst:
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        cmp               x2, x0
        sbcs              xzr, x3, x1
        csel              x9, x1, x3, lo
        csel              x10, x0, x2, lo
        stlxp             w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_umax::u128::acquire:
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        cmp               x2, x0
        sbcs              xzr, x3, x1
        csel              x9, x1, x3, lo
        csel              x10, x0, x2, lo
        stxp              w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_umax::u128::relaxed:
        mov               x8, x0
0:
        ldxp              x0, x1, [x8]
        cmp               x2, x0
        sbcs              xzr, x3, x1
        csel              x9, x1, x3, lo
        csel              x10, x0, x2, lo
        stxp              w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_umax::u128::release:
        mov               x8, x0
0:
        ldxp              x0, x1, [x8]
        cmp               x2, x0
        sbcs              xzr, x3, x1
        csel              x9, x1, x3, lo
        csel              x10, x0, x2, lo
        stlxp             w11, x10, x9, [x8]
        cbnz              w11, 0b
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
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        cmp               x2, x0
        sbcs              xzr, x3, x1
        csel              x9, x1, x3, hs
        csel              x10, x0, x2, hs
        stlxp             w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_umin::u128::seqcst:
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        cmp               x2, x0
        sbcs              xzr, x3, x1
        csel              x9, x1, x3, hs
        csel              x10, x0, x2, hs
        stlxp             w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_umin::u128::acquire:
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        cmp               x2, x0
        sbcs              xzr, x3, x1
        csel              x9, x1, x3, hs
        csel              x10, x0, x2, hs
        stxp              w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_umin::u128::relaxed:
        mov               x8, x0
0:
        ldxp              x0, x1, [x8]
        cmp               x2, x0
        sbcs              xzr, x3, x1
        csel              x9, x1, x3, hs
        csel              x10, x0, x2, hs
        stxp              w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_umin::u128::release:
        mov               x8, x0
0:
        ldxp              x0, x1, [x8]
        cmp               x2, x0
        sbcs              xzr, x3, x1
        csel              x9, x1, x3, hs
        csel              x10, x0, x2, hs
        stlxp             w11, x10, x9, [x8]
        cbnz              w11, 0b
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

asm_test::compare_exchange::u128::acqrel_seqcst:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x9, x0
        mov               x19, x3
        mov               x20, x2
        mov               x0, x2
        mov               x1, x3
        mov               x2, x4
        mov               x3, x5
        mov               x4, x9
        mov               x21, x8
0:
        bl                0f
        cmp               x0, x20
        stp               x0, x1, [x21, #0x10]
        ccmp              x1, x19, #0x0, eq
        cset              w8, ne
        stp               x8, xzr, [x21]
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
        ret

asm_test::compare_exchange::u128::seqcst_seqcst:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x9, x0
        mov               x19, x3
        mov               x20, x2
        mov               x0, x2
        mov               x1, x3
        mov               x2, x4
        mov               x3, x5
        mov               x4, x9
        mov               x21, x8
0:
        bl                0f
        cmp               x0, x20
        stp               x0, x1, [x21, #0x10]
        ccmp              x1, x19, #0x0, eq
        cset              w8, ne
        stp               x8, xzr, [x21]
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
        ret

asm_test::compare_exchange::u128::acqrel_acquire:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x9, x0
        mov               x19, x3
        mov               x20, x2
        mov               x0, x2
        mov               x1, x3
        mov               x2, x4
        mov               x3, x5
        mov               x4, x9
        mov               x21, x8
0:
        bl                0f
        cmp               x0, x20
        stp               x0, x1, [x21, #0x10]
        ccmp              x1, x19, #0x0, eq
        cset              w8, ne
        stp               x8, xzr, [x21]
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
        ret

asm_test::compare_exchange::u128::acqrel_relaxed:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x9, x0
        mov               x19, x3
        mov               x20, x2
        mov               x0, x2
        mov               x1, x3
        mov               x2, x4
        mov               x3, x5
        mov               x4, x9
        mov               x21, x8
0:
        bl                0f
        cmp               x0, x20
        stp               x0, x1, [x21, #0x10]
        ccmp              x1, x19, #0x0, eq
        cset              w8, ne
        stp               x8, xzr, [x21]
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
        ret

asm_test::compare_exchange::u128::acquire_seqcst:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x9, x0
        mov               x19, x3
        mov               x20, x2
        mov               x0, x2
        mov               x1, x3
        mov               x2, x4
        mov               x3, x5
        mov               x4, x9
        mov               x21, x8
0:
        bl                0f
        cmp               x0, x20
        stp               x0, x1, [x21, #0x10]
        ccmp              x1, x19, #0x0, eq
        cset              w8, ne
        stp               x8, xzr, [x21]
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
        ret

asm_test::compare_exchange::u128::relaxed_seqcst:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x9, x0
        mov               x19, x3
        mov               x20, x2
        mov               x0, x2
        mov               x1, x3
        mov               x2, x4
        mov               x3, x5
        mov               x4, x9
        mov               x21, x8
0:
        bl                0f
        cmp               x0, x20
        stp               x0, x1, [x21, #0x10]
        ccmp              x1, x19, #0x0, eq
        cset              w8, ne
        stp               x8, xzr, [x21]
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
        ret

asm_test::compare_exchange::u128::release_seqcst:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x9, x0
        mov               x19, x3
        mov               x20, x2
        mov               x0, x2
        mov               x1, x3
        mov               x2, x4
        mov               x3, x5
        mov               x4, x9
        mov               x21, x8
0:
        bl                0f
        cmp               x0, x20
        stp               x0, x1, [x21, #0x10]
        ccmp              x1, x19, #0x0, eq
        cset              w8, ne
        stp               x8, xzr, [x21]
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
        ret

asm_test::compare_exchange::u128::seqcst_acquire:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x9, x0
        mov               x19, x3
        mov               x20, x2
        mov               x0, x2
        mov               x1, x3
        mov               x2, x4
        mov               x3, x5
        mov               x4, x9
        mov               x21, x8
0:
        bl                0f
        cmp               x0, x20
        stp               x0, x1, [x21, #0x10]
        ccmp              x1, x19, #0x0, eq
        cset              w8, ne
        stp               x8, xzr, [x21]
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
        ret

asm_test::compare_exchange::u128::seqcst_relaxed:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x9, x0
        mov               x19, x3
        mov               x20, x2
        mov               x0, x2
        mov               x1, x3
        mov               x2, x4
        mov               x3, x5
        mov               x4, x9
        mov               x21, x8
0:
        bl                0f
        cmp               x0, x20
        stp               x0, x1, [x21, #0x10]
        ccmp              x1, x19, #0x0, eq
        cset              w8, ne
        stp               x8, xzr, [x21]
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
        ret

asm_test::compare_exchange::u128::acquire_acquire:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x9, x0
        mov               x19, x3
        mov               x20, x2
        mov               x0, x2
        mov               x1, x3
        mov               x2, x4
        mov               x3, x5
        mov               x4, x9
        mov               x21, x8
0:
        bl                0f
        cmp               x0, x20
        stp               x0, x1, [x21, #0x10]
        ccmp              x1, x19, #0x0, eq
        cset              w8, ne
        stp               x8, xzr, [x21]
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
        ret

asm_test::compare_exchange::u128::acquire_relaxed:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x9, x0
        mov               x19, x3
        mov               x20, x2
        mov               x0, x2
        mov               x1, x3
        mov               x2, x4
        mov               x3, x5
        mov               x4, x9
        mov               x21, x8
0:
        bl                0f
        cmp               x0, x20
        stp               x0, x1, [x21, #0x10]
        ccmp              x1, x19, #0x0, eq
        cset              w8, ne
        stp               x8, xzr, [x21]
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
        ret

asm_test::compare_exchange::u128::relaxed_acquire:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x9, x0
        mov               x19, x3
        mov               x20, x2
        mov               x0, x2
        mov               x1, x3
        mov               x2, x4
        mov               x3, x5
        mov               x4, x9
        mov               x21, x8
0:
        bl                0f
        cmp               x0, x20
        stp               x0, x1, [x21, #0x10]
        ccmp              x1, x19, #0x0, eq
        cset              w8, ne
        stp               x8, xzr, [x21]
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
        ret

asm_test::compare_exchange::u128::relaxed_relaxed:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x9, x0
        mov               x19, x3
        mov               x20, x2
        mov               x0, x2
        mov               x1, x3
        mov               x2, x4
        mov               x3, x5
        mov               x4, x9
        mov               x21, x8
0:
        bl                0f
        cmp               x0, x20
        stp               x0, x1, [x21, #0x10]
        ccmp              x1, x19, #0x0, eq
        cset              w8, ne
        stp               x8, xzr, [x21]
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
        ret

asm_test::compare_exchange::u128::release_acquire:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x9, x0
        mov               x19, x3
        mov               x20, x2
        mov               x0, x2
        mov               x1, x3
        mov               x2, x4
        mov               x3, x5
        mov               x4, x9
        mov               x21, x8
0:
        bl                0f
        cmp               x0, x20
        stp               x0, x1, [x21, #0x10]
        ccmp              x1, x19, #0x0, eq
        cset              w8, ne
        stp               x8, xzr, [x21]
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
        ret

asm_test::compare_exchange::u128::release_relaxed:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x9, x0
        mov               x19, x3
        mov               x20, x2
        mov               x0, x2
        mov               x1, x3
        mov               x2, x4
        mov               x3, x5
        mov               x4, x9
        mov               x21, x8
0:
        bl                0f
        cmp               x0, x20
        stp               x0, x1, [x21, #0x10]
        ccmp              x1, x19, #0x0, eq
        cset              w8, ne
        stp               x8, xzr, [x21]
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
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

asm_test::compare_exchange_weak::u128::acqrel_seqcst:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x9, x0
        mov               x19, x3
        mov               x20, x2
        mov               x0, x2
        mov               x1, x3
        mov               x2, x4
        mov               x3, x5
        mov               x4, x9
        mov               x21, x8
0:
        bl                0f
        cmp               x0, x20
        stp               x0, x1, [x21, #0x10]
        ccmp              x1, x19, #0x0, eq
        cset              w8, ne
        stp               x8, xzr, [x21]
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
        ret

asm_test::compare_exchange_weak::u128::seqcst_seqcst:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x9, x0
        mov               x19, x3
        mov               x20, x2
        mov               x0, x2
        mov               x1, x3
        mov               x2, x4
        mov               x3, x5
        mov               x4, x9
        mov               x21, x8
0:
        bl                0f
        cmp               x0, x20
        stp               x0, x1, [x21, #0x10]
        ccmp              x1, x19, #0x0, eq
        cset              w8, ne
        stp               x8, xzr, [x21]
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
        ret

asm_test::compare_exchange_weak::u128::acqrel_acquire:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x9, x0
        mov               x19, x3
        mov               x20, x2
        mov               x0, x2
        mov               x1, x3
        mov               x2, x4
        mov               x3, x5
        mov               x4, x9
        mov               x21, x8
0:
        bl                0f
        cmp               x0, x20
        stp               x0, x1, [x21, #0x10]
        ccmp              x1, x19, #0x0, eq
        cset              w8, ne
        stp               x8, xzr, [x21]
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
        ret

asm_test::compare_exchange_weak::u128::acqrel_relaxed:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x9, x0
        mov               x19, x3
        mov               x20, x2
        mov               x0, x2
        mov               x1, x3
        mov               x2, x4
        mov               x3, x5
        mov               x4, x9
        mov               x21, x8
0:
        bl                0f
        cmp               x0, x20
        stp               x0, x1, [x21, #0x10]
        ccmp              x1, x19, #0x0, eq
        cset              w8, ne
        stp               x8, xzr, [x21]
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
        ret

asm_test::compare_exchange_weak::u128::acquire_seqcst:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x9, x0
        mov               x19, x3
        mov               x20, x2
        mov               x0, x2
        mov               x1, x3
        mov               x2, x4
        mov               x3, x5
        mov               x4, x9
        mov               x21, x8
0:
        bl                0f
        cmp               x0, x20
        stp               x0, x1, [x21, #0x10]
        ccmp              x1, x19, #0x0, eq
        cset              w8, ne
        stp               x8, xzr, [x21]
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
        ret

asm_test::compare_exchange_weak::u128::relaxed_seqcst:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x9, x0
        mov               x19, x3
        mov               x20, x2
        mov               x0, x2
        mov               x1, x3
        mov               x2, x4
        mov               x3, x5
        mov               x4, x9
        mov               x21, x8
0:
        bl                0f
        cmp               x0, x20
        stp               x0, x1, [x21, #0x10]
        ccmp              x1, x19, #0x0, eq
        cset              w8, ne
        stp               x8, xzr, [x21]
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
        ret

asm_test::compare_exchange_weak::u128::release_seqcst:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x9, x0
        mov               x19, x3
        mov               x20, x2
        mov               x0, x2
        mov               x1, x3
        mov               x2, x4
        mov               x3, x5
        mov               x4, x9
        mov               x21, x8
0:
        bl                0f
        cmp               x0, x20
        stp               x0, x1, [x21, #0x10]
        ccmp              x1, x19, #0x0, eq
        cset              w8, ne
        stp               x8, xzr, [x21]
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
        ret

asm_test::compare_exchange_weak::u128::seqcst_acquire:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x9, x0
        mov               x19, x3
        mov               x20, x2
        mov               x0, x2
        mov               x1, x3
        mov               x2, x4
        mov               x3, x5
        mov               x4, x9
        mov               x21, x8
0:
        bl                0f
        cmp               x0, x20
        stp               x0, x1, [x21, #0x10]
        ccmp              x1, x19, #0x0, eq
        cset              w8, ne
        stp               x8, xzr, [x21]
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
        ret

asm_test::compare_exchange_weak::u128::seqcst_relaxed:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x9, x0
        mov               x19, x3
        mov               x20, x2
        mov               x0, x2
        mov               x1, x3
        mov               x2, x4
        mov               x3, x5
        mov               x4, x9
        mov               x21, x8
0:
        bl                0f
        cmp               x0, x20
        stp               x0, x1, [x21, #0x10]
        ccmp              x1, x19, #0x0, eq
        cset              w8, ne
        stp               x8, xzr, [x21]
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
        ret

asm_test::compare_exchange_weak::u128::acquire_acquire:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x9, x0
        mov               x19, x3
        mov               x20, x2
        mov               x0, x2
        mov               x1, x3
        mov               x2, x4
        mov               x3, x5
        mov               x4, x9
        mov               x21, x8
0:
        bl                0f
        cmp               x0, x20
        stp               x0, x1, [x21, #0x10]
        ccmp              x1, x19, #0x0, eq
        cset              w8, ne
        stp               x8, xzr, [x21]
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
        ret

asm_test::compare_exchange_weak::u128::acquire_relaxed:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x9, x0
        mov               x19, x3
        mov               x20, x2
        mov               x0, x2
        mov               x1, x3
        mov               x2, x4
        mov               x3, x5
        mov               x4, x9
        mov               x21, x8
0:
        bl                0f
        cmp               x0, x20
        stp               x0, x1, [x21, #0x10]
        ccmp              x1, x19, #0x0, eq
        cset              w8, ne
        stp               x8, xzr, [x21]
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
        ret

asm_test::compare_exchange_weak::u128::relaxed_acquire:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x9, x0
        mov               x19, x3
        mov               x20, x2
        mov               x0, x2
        mov               x1, x3
        mov               x2, x4
        mov               x3, x5
        mov               x4, x9
        mov               x21, x8
0:
        bl                0f
        cmp               x0, x20
        stp               x0, x1, [x21, #0x10]
        ccmp              x1, x19, #0x0, eq
        cset              w8, ne
        stp               x8, xzr, [x21]
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
        ret

asm_test::compare_exchange_weak::u128::relaxed_relaxed:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x9, x0
        mov               x19, x3
        mov               x20, x2
        mov               x0, x2
        mov               x1, x3
        mov               x2, x4
        mov               x3, x5
        mov               x4, x9
        mov               x21, x8
0:
        bl                0f
        cmp               x0, x20
        stp               x0, x1, [x21, #0x10]
        ccmp              x1, x19, #0x0, eq
        cset              w8, ne
        stp               x8, xzr, [x21]
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
        ret

asm_test::compare_exchange_weak::u128::release_acquire:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x9, x0
        mov               x19, x3
        mov               x20, x2
        mov               x0, x2
        mov               x1, x3
        mov               x2, x4
        mov               x3, x5
        mov               x4, x9
        mov               x21, x8
0:
        bl                0f
        cmp               x0, x20
        stp               x0, x1, [x21, #0x10]
        ccmp              x1, x19, #0x0, eq
        cset              w8, ne
        stp               x8, xzr, [x21]
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
        ret

asm_test::compare_exchange_weak::u128::release_relaxed:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x9, x0
        mov               x19, x3
        mov               x20, x2
        mov               x0, x2
        mov               x1, x3
        mov               x2, x4
        mov               x3, x5
        mov               x4, x9
        mov               x21, x8
0:
        bl                0f
        cmp               x0, x20
        stp               x0, x1, [x21, #0x10]
        ccmp              x1, x19, #0x0, eq
        cset              w8, ne
        stp               x8, xzr, [x21]
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
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

asm_test::load::u128::seqcst:
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        stlxp             w9, x0, x1, [x8]
        cbnz              w9, 0b
        ret

asm_test::load::u128::acquire:
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        stxp              w9, x0, x1, [x8]
        cbnz              w9, 0b
        ret

asm_test::load::u128::relaxed:
        mov               x8, x0
0:
        ldxp              x0, x1, [x8]
        stxp              w9, x0, x1, [x8]
        cbnz              w9, 0b
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

asm_test::fetch_or::u128::acqrel:
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        orr               x9, x1, x3
        orr               x10, x0, x2
        stlxp             w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_or::u128::seqcst:
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        orr               x9, x1, x3
        orr               x10, x0, x2
        stlxp             w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_or::u128::acquire:
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        orr               x9, x1, x3
        orr               x10, x0, x2
        stxp              w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_or::u128::relaxed:
        mov               x8, x0
0:
        ldxp              x0, x1, [x8]
        orr               x9, x1, x3
        orr               x10, x0, x2
        stxp              w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_or::u128::release:
        mov               x8, x0
0:
        ldxp              x0, x1, [x8]
        orr               x9, x1, x3
        orr               x10, x0, x2
        stlxp             w11, x10, x9, [x8]
        cbnz              w11, 0b
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

asm_test::fetch_add::u128::acqrel:
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        adds              x9, x0, x2
        adc               x10, x1, x3
        stlxp             w11, x9, x10, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_add::u128::seqcst:
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        adds              x9, x0, x2
        adc               x10, x1, x3
        stlxp             w11, x9, x10, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_add::u128::acquire:
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        adds              x9, x0, x2
        adc               x10, x1, x3
        stxp              w11, x9, x10, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_add::u128::relaxed:
        mov               x8, x0
0:
        ldxp              x0, x1, [x8]
        adds              x9, x0, x2
        adc               x10, x1, x3
        stxp              w11, x9, x10, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_add::u128::release:
        mov               x8, x0
0:
        ldxp              x0, x1, [x8]
        adds              x9, x0, x2
        adc               x10, x1, x3
        stlxp             w11, x9, x10, [x8]
        cbnz              w11, 0b
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

asm_test::fetch_and::u128::acqrel:
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        and               x9, x1, x3
        and               x10, x0, x2
        stlxp             w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_and::u128::seqcst:
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        and               x9, x1, x3
        and               x10, x0, x2
        stlxp             w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_and::u128::acquire:
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        and               x9, x1, x3
        and               x10, x0, x2
        stxp              w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_and::u128::relaxed:
        mov               x8, x0
0:
        ldxp              x0, x1, [x8]
        and               x9, x1, x3
        and               x10, x0, x2
        stxp              w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_and::u128::release:
        mov               x8, x0
0:
        ldxp              x0, x1, [x8]
        and               x9, x1, x3
        and               x10, x0, x2
        stlxp             w11, x10, x9, [x8]
        cbnz              w11, 0b
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
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        cmp               x2, x0
        sbcs              xzr, x3, x1
        csel              x9, x1, x3, lt
        csel              x10, x0, x2, lt
        stlxp             w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_max::i128::seqcst:
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        cmp               x2, x0
        sbcs              xzr, x3, x1
        csel              x9, x1, x3, lt
        csel              x10, x0, x2, lt
        stlxp             w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_max::i128::acquire:
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        cmp               x2, x0
        sbcs              xzr, x3, x1
        csel              x9, x1, x3, lt
        csel              x10, x0, x2, lt
        stxp              w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_max::i128::relaxed:
        mov               x8, x0
0:
        ldxp              x0, x1, [x8]
        cmp               x2, x0
        sbcs              xzr, x3, x1
        csel              x9, x1, x3, lt
        csel              x10, x0, x2, lt
        stxp              w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_max::i128::release:
        mov               x8, x0
0:
        ldxp              x0, x1, [x8]
        cmp               x2, x0
        sbcs              xzr, x3, x1
        csel              x9, x1, x3, lt
        csel              x10, x0, x2, lt
        stlxp             w11, x10, x9, [x8]
        cbnz              w11, 0b
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
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        cmp               x2, x0
        sbcs              xzr, x3, x1
        csel              x9, x1, x3, ge
        csel              x10, x0, x2, ge
        stlxp             w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_min::i128::seqcst:
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        cmp               x2, x0
        sbcs              xzr, x3, x1
        csel              x9, x1, x3, ge
        csel              x10, x0, x2, ge
        stlxp             w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_min::i128::acquire:
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        cmp               x2, x0
        sbcs              xzr, x3, x1
        csel              x9, x1, x3, ge
        csel              x10, x0, x2, ge
        stxp              w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_min::i128::relaxed:
        mov               x8, x0
0:
        ldxp              x0, x1, [x8]
        cmp               x2, x0
        sbcs              xzr, x3, x1
        csel              x9, x1, x3, ge
        csel              x10, x0, x2, ge
        stxp              w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_min::i128::release:
        mov               x8, x0
0:
        ldxp              x0, x1, [x8]
        cmp               x2, x0
        sbcs              xzr, x3, x1
        csel              x9, x1, x3, ge
        csel              x10, x0, x2, ge
        stlxp             w11, x10, x9, [x8]
        cbnz              w11, 0b
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
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x19, x0
0:
        ldxp              x0, x1, [x19]
        stxp              w8, x0, x1, [x19]
        cbnz              w8, 0b
1:
        negs              x2, x0
        mov               x4, x19
        mov               x20, x0
        ngc               x3, x1
        mov               x21, x1
2:
        bl                2f
        cmp               x1, x21
        ccmp              x0, x20, #0x0, eq
        b.ne              1b
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
        ret

asm_test::fetch_neg::u128::seqcst:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x19, x0
0:
        ldxp              x0, x1, [x19]
        stxp              w8, x0, x1, [x19]
        cbnz              w8, 0b
1:
        negs              x2, x0
        mov               x4, x19
        mov               x20, x0
        ngc               x3, x1
        mov               x21, x1
2:
        bl                2f
        cmp               x1, x21
        ccmp              x0, x20, #0x0, eq
        b.ne              1b
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
        ret

asm_test::fetch_neg::u128::acquire:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x19, x0
0:
        ldxp              x0, x1, [x19]
        stxp              w8, x0, x1, [x19]
        cbnz              w8, 0b
1:
        negs              x2, x0
        mov               x4, x19
        mov               x20, x0
        ngc               x3, x1
        mov               x21, x1
2:
        bl                2f
        cmp               x1, x21
        ccmp              x0, x20, #0x0, eq
        b.ne              1b
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
        ret

asm_test::fetch_neg::u128::relaxed:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x19, x0
0:
        ldxp              x0, x1, [x19]
        stxp              w8, x0, x1, [x19]
        cbnz              w8, 0b
1:
        negs              x2, x0
        mov               x4, x19
        mov               x20, x0
        ngc               x3, x1
        mov               x21, x1
2:
        bl                2f
        cmp               x1, x21
        ccmp              x0, x20, #0x0, eq
        b.ne              1b
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
        ret

asm_test::fetch_neg::u128::release:
        stp               x29, x30, [sp, #-0x30]!
        str               x21, [sp, #0x10]
        stp               x20, x19, [sp, #0x20]
        mov               x29, sp
        mov               x19, x0
0:
        ldxp              x0, x1, [x19]
        stxp              w8, x0, x1, [x19]
        cbnz              w8, 0b
1:
        negs              x2, x0
        mov               x4, x19
        mov               x20, x0
        ngc               x3, x1
        mov               x21, x1
2:
        bl                2f
        cmp               x1, x21
        ccmp              x0, x20, #0x0, eq
        b.ne              1b
        ldp               x20, x19, [sp, #0x20]
        ldr               x21, [sp, #0x10]
        ldp               x29, x30, [sp], #0x30
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

asm_test::fetch_not::u128::acqrel:
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        mvn               x9, x1
        mvn               x10, x0
        stlxp             w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_not::u128::seqcst:
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        mvn               x9, x1
        mvn               x10, x0
        stlxp             w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_not::u128::acquire:
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        mvn               x9, x1
        mvn               x10, x0
        stxp              w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_not::u128::relaxed:
        mov               x8, x0
0:
        ldxp              x0, x1, [x8]
        mvn               x9, x1
        mvn               x10, x0
        stxp              w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_not::u128::release:
        mov               x8, x0
0:
        ldxp              x0, x1, [x8]
        mvn               x9, x1
        mvn               x10, x0
        stlxp             w11, x10, x9, [x8]
        cbnz              w11, 0b
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

asm_test::fetch_sub::u128::acqrel:
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        subs              x9, x0, x2
        sbc               x10, x1, x3
        stlxp             w11, x9, x10, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_sub::u128::seqcst:
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        subs              x9, x0, x2
        sbc               x10, x1, x3
        stlxp             w11, x9, x10, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_sub::u128::acquire:
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        subs              x9, x0, x2
        sbc               x10, x1, x3
        stxp              w11, x9, x10, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_sub::u128::relaxed:
        mov               x8, x0
0:
        ldxp              x0, x1, [x8]
        subs              x9, x0, x2
        sbc               x10, x1, x3
        stxp              w11, x9, x10, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_sub::u128::release:
        mov               x8, x0
0:
        ldxp              x0, x1, [x8]
        subs              x9, x0, x2
        sbc               x10, x1, x3
        stlxp             w11, x9, x10, [x8]
        cbnz              w11, 0b
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

asm_test::fetch_xor::u128::acqrel:
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        eor               x9, x1, x3
        eor               x10, x0, x2
        stlxp             w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_xor::u128::seqcst:
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        eor               x9, x1, x3
        eor               x10, x0, x2
        stlxp             w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_xor::u128::acquire:
        mov               x8, x0
0:
        ldaxp             x0, x1, [x8]
        eor               x9, x1, x3
        eor               x10, x0, x2
        stxp              w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_xor::u128::relaxed:
        mov               x8, x0
0:
        ldxp              x0, x1, [x8]
        eor               x9, x1, x3
        eor               x10, x0, x2
        stxp              w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

asm_test::fetch_xor::u128::release:
        mov               x8, x0
0:
        ldxp              x0, x1, [x8]
        eor               x9, x1, x3
        eor               x10, x0, x2
        stlxp             w11, x10, x9, [x8]
        cbnz              w11, 0b
        ret

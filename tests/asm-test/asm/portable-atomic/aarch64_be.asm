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

asm_test::fetch_nand::bool::acqrel:
        tbz               w1, #0x0, 1f
0:
        ldaxrb            w8, [x0]
        eor               w9, w8, #0x1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret
1:
        mov               w8, #0x1                // =1
2:
        ldaxrb            w9, [x0]
        stlxrb            w10, w8, [x0]
        cbnz              w10, 2b
        mov               w8, w9
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_nand::bool::seqcst:
        tbz               w1, #0x0, 1f
0:
        ldaxrb            w8, [x0]
        eor               w9, w8, #0x1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret
1:
        mov               w8, #0x1                // =1
2:
        ldaxrb            w9, [x0]
        stlxrb            w10, w8, [x0]
        cbnz              w10, 2b
        mov               w8, w9
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_nand::bool::acquire:
        tbz               w1, #0x0, 1f
0:
        ldaxrb            w8, [x0]
        eor               w9, w8, #0x1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret
1:
        mov               w8, #0x1                // =1
2:
        ldaxrb            w9, [x0]
        stxrb             w10, w8, [x0]
        cbnz              w10, 2b
        mov               w8, w9
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_nand::bool::relaxed:
        tbz               w1, #0x0, 1f
0:
        ldxrb             w8, [x0]
        eor               w9, w8, #0x1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret
1:
        mov               w8, #0x1                // =1
2:
        ldxrb             w9, [x0]
        stxrb             w10, w8, [x0]
        cbnz              w10, 2b
        mov               w8, w9
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_nand::bool::release:
        tbz               w1, #0x0, 1f
0:
        ldxrb             w8, [x0]
        eor               w9, w8, #0x1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret
1:
        mov               w8, #0x1                // =1
2:
        ldxrb             w9, [x0]
        stlxrb            w10, w8, [x0]
        cbnz              w10, 2b
        mov               w8, w9
        cmp               w8, #0x0
        cset              w0, ne
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
        cmp               x3, x1
        sbcs              xzr, x2, x8
        csel              x10, x1, x3, lo
        csel              x9, x8, x2, lo
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_umax::u128::seqcst:
0:
        ldaxp             x8, x1, [x0]
        cmp               x3, x1
        sbcs              xzr, x2, x8
        csel              x10, x1, x3, lo
        csel              x9, x8, x2, lo
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_umax::u128::acquire:
0:
        ldaxp             x8, x1, [x0]
        cmp               x3, x1
        sbcs              xzr, x2, x8
        csel              x10, x1, x3, lo
        csel              x9, x8, x2, lo
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_umax::u128::relaxed:
0:
        ldxp              x8, x1, [x0]
        cmp               x3, x1
        sbcs              xzr, x2, x8
        csel              x10, x1, x3, lo
        csel              x9, x8, x2, lo
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_umax::u128::release:
0:
        ldxp              x8, x1, [x0]
        cmp               x3, x1
        sbcs              xzr, x2, x8
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
        cmp               x3, x1
        sbcs              xzr, x2, x8
        csel              x10, x1, x3, hs
        csel              x9, x8, x2, hs
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_umin::u128::seqcst:
0:
        ldaxp             x8, x1, [x0]
        cmp               x3, x1
        sbcs              xzr, x2, x8
        csel              x10, x1, x3, hs
        csel              x9, x8, x2, hs
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_umin::u128::acquire:
0:
        ldaxp             x8, x1, [x0]
        cmp               x3, x1
        sbcs              xzr, x2, x8
        csel              x10, x1, x3, hs
        csel              x9, x8, x2, hs
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_umin::u128::relaxed:
0:
        ldxp              x8, x1, [x0]
        cmp               x3, x1
        sbcs              xzr, x2, x8
        csel              x10, x1, x3, hs
        csel              x9, x8, x2, hs
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_umin::u128::release:
0:
        ldxp              x8, x1, [x0]
        cmp               x3, x1
        sbcs              xzr, x2, x8
        csel              x10, x1, x3, hs
        csel              x9, x8, x2, hs
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::compare_exchange::u8::acqrel_seqcst:
        mov               w8, w1
0:
        ldaxrb            w1, [x0]
        cmp               w1, w8, uxtb
        b.ne              1f
        stlxrb            w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u8::seqcst_seqcst:
        mov               w8, w1
0:
        ldaxrb            w1, [x0]
        cmp               w1, w8, uxtb
        b.ne              1f
        stlxrb            w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u8::acqrel_acquire:
        mov               w8, w1
0:
        ldaxrb            w1, [x0]
        cmp               w1, w8, uxtb
        b.ne              1f
        stlxrb            w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u8::acqrel_relaxed:
        mov               w8, w1
0:
        ldaxrb            w1, [x0]
        cmp               w1, w8, uxtb
        b.ne              1f
        stlxrb            w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u8::acquire_seqcst:
        mov               w8, w1
0:
        ldaxrb            w1, [x0]
        cmp               w1, w8, uxtb
        b.ne              1f
        stlxrb            w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u8::relaxed_seqcst:
        mov               w8, w1
0:
        ldaxrb            w1, [x0]
        cmp               w1, w8, uxtb
        b.ne              1f
        stlxrb            w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u8::release_seqcst:
        mov               w8, w1
0:
        ldaxrb            w1, [x0]
        cmp               w1, w8, uxtb
        b.ne              1f
        stlxrb            w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u8::seqcst_acquire:
        mov               w8, w1
0:
        ldaxrb            w1, [x0]
        cmp               w1, w8, uxtb
        b.ne              1f
        stlxrb            w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u8::seqcst_relaxed:
        mov               w8, w1
0:
        ldaxrb            w1, [x0]
        cmp               w1, w8, uxtb
        b.ne              1f
        stlxrb            w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u8::acquire_acquire:
        mov               w8, w1
0:
        ldaxrb            w1, [x0]
        cmp               w1, w8, uxtb
        b.ne              1f
        stxrb             w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u8::acquire_relaxed:
        mov               w8, w1
0:
        ldaxrb            w1, [x0]
        cmp               w1, w8, uxtb
        b.ne              1f
        stxrb             w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u8::relaxed_acquire:
        mov               w8, w1
0:
        ldaxrb            w1, [x0]
        cmp               w1, w8, uxtb
        b.ne              1f
        stxrb             w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u8::relaxed_relaxed:
        mov               w8, w1
0:
        ldxrb             w1, [x0]
        cmp               w1, w8, uxtb
        b.ne              1f
        stxrb             w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u8::release_acquire:
        mov               w8, w1
0:
        ldaxrb            w1, [x0]
        cmp               w1, w8, uxtb
        b.ne              1f
        stlxrb            w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u8::release_relaxed:
        mov               w8, w1
0:
        ldxrb             w1, [x0]
        cmp               w1, w8, uxtb
        b.ne              1f
        stlxrb            w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u16::acqrel_seqcst:
        mov               w8, w1
0:
        ldaxrh            w1, [x0]
        cmp               w1, w8, uxth
        b.ne              1f
        stlxrh            w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u16::seqcst_seqcst:
        mov               w8, w1
0:
        ldaxrh            w1, [x0]
        cmp               w1, w8, uxth
        b.ne              1f
        stlxrh            w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u16::acqrel_acquire:
        mov               w8, w1
0:
        ldaxrh            w1, [x0]
        cmp               w1, w8, uxth
        b.ne              1f
        stlxrh            w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u16::acqrel_relaxed:
        mov               w8, w1
0:
        ldaxrh            w1, [x0]
        cmp               w1, w8, uxth
        b.ne              1f
        stlxrh            w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u16::acquire_seqcst:
        mov               w8, w1
0:
        ldaxrh            w1, [x0]
        cmp               w1, w8, uxth
        b.ne              1f
        stlxrh            w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u16::relaxed_seqcst:
        mov               w8, w1
0:
        ldaxrh            w1, [x0]
        cmp               w1, w8, uxth
        b.ne              1f
        stlxrh            w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u16::release_seqcst:
        mov               w8, w1
0:
        ldaxrh            w1, [x0]
        cmp               w1, w8, uxth
        b.ne              1f
        stlxrh            w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u16::seqcst_acquire:
        mov               w8, w1
0:
        ldaxrh            w1, [x0]
        cmp               w1, w8, uxth
        b.ne              1f
        stlxrh            w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u16::seqcst_relaxed:
        mov               w8, w1
0:
        ldaxrh            w1, [x0]
        cmp               w1, w8, uxth
        b.ne              1f
        stlxrh            w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u16::acquire_acquire:
        mov               w8, w1
0:
        ldaxrh            w1, [x0]
        cmp               w1, w8, uxth
        b.ne              1f
        stxrh             w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u16::acquire_relaxed:
        mov               w8, w1
0:
        ldaxrh            w1, [x0]
        cmp               w1, w8, uxth
        b.ne              1f
        stxrh             w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u16::relaxed_acquire:
        mov               w8, w1
0:
        ldaxrh            w1, [x0]
        cmp               w1, w8, uxth
        b.ne              1f
        stxrh             w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u16::relaxed_relaxed:
        mov               w8, w1
0:
        ldxrh             w1, [x0]
        cmp               w1, w8, uxth
        b.ne              1f
        stxrh             w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u16::release_acquire:
        mov               w8, w1
0:
        ldaxrh            w1, [x0]
        cmp               w1, w8, uxth
        b.ne              1f
        stlxrh            w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u16::release_relaxed:
        mov               w8, w1
0:
        ldxrh             w1, [x0]
        cmp               w1, w8, uxth
        b.ne              1f
        stlxrh            w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u32::acqrel_seqcst:
        mov               w8, w1
0:
        ldaxr             w1, [x0]
        cmp               w1, w8
        b.ne              1f
        stlxr             w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u32::seqcst_seqcst:
        mov               w8, w1
0:
        ldaxr             w1, [x0]
        cmp               w1, w8
        b.ne              1f
        stlxr             w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u32::acqrel_acquire:
        mov               w8, w1
0:
        ldaxr             w1, [x0]
        cmp               w1, w8
        b.ne              1f
        stlxr             w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u32::acqrel_relaxed:
        mov               w8, w1
0:
        ldaxr             w1, [x0]
        cmp               w1, w8
        b.ne              1f
        stlxr             w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u32::acquire_seqcst:
        mov               w8, w1
0:
        ldaxr             w1, [x0]
        cmp               w1, w8
        b.ne              1f
        stlxr             w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u32::relaxed_seqcst:
        mov               w8, w1
0:
        ldaxr             w1, [x0]
        cmp               w1, w8
        b.ne              1f
        stlxr             w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u32::release_seqcst:
        mov               w8, w1
0:
        ldaxr             w1, [x0]
        cmp               w1, w8
        b.ne              1f
        stlxr             w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u32::seqcst_acquire:
        mov               w8, w1
0:
        ldaxr             w1, [x0]
        cmp               w1, w8
        b.ne              1f
        stlxr             w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u32::seqcst_relaxed:
        mov               w8, w1
0:
        ldaxr             w1, [x0]
        cmp               w1, w8
        b.ne              1f
        stlxr             w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u32::acquire_acquire:
        mov               w8, w1
0:
        ldaxr             w1, [x0]
        cmp               w1, w8
        b.ne              1f
        stxr              w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u32::acquire_relaxed:
        mov               w8, w1
0:
        ldaxr             w1, [x0]
        cmp               w1, w8
        b.ne              1f
        stxr              w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u32::relaxed_acquire:
        mov               w8, w1
0:
        ldaxr             w1, [x0]
        cmp               w1, w8
        b.ne              1f
        stxr              w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u32::relaxed_relaxed:
        mov               w8, w1
0:
        ldxr              w1, [x0]
        cmp               w1, w8
        b.ne              1f
        stxr              w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u32::release_acquire:
        mov               w8, w1
0:
        ldaxr             w1, [x0]
        cmp               w1, w8
        b.ne              1f
        stlxr             w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u32::release_relaxed:
        mov               w8, w1
0:
        ldxr              w1, [x0]
        cmp               w1, w8
        b.ne              1f
        stlxr             w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u64::acqrel_seqcst:
        mov               x8, x1
0:
        ldaxr             x1, [x0]
        cmp               x1, x8
        b.ne              1f
        stlxr             w9, x2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u64::seqcst_seqcst:
        mov               x8, x1
0:
        ldaxr             x1, [x0]
        cmp               x1, x8
        b.ne              1f
        stlxr             w9, x2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u64::acqrel_acquire:
        mov               x8, x1
0:
        ldaxr             x1, [x0]
        cmp               x1, x8
        b.ne              1f
        stlxr             w9, x2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u64::acqrel_relaxed:
        mov               x8, x1
0:
        ldaxr             x1, [x0]
        cmp               x1, x8
        b.ne              1f
        stlxr             w9, x2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u64::acquire_seqcst:
        mov               x8, x1
0:
        ldaxr             x1, [x0]
        cmp               x1, x8
        b.ne              1f
        stlxr             w9, x2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u64::relaxed_seqcst:
        mov               x8, x1
0:
        ldaxr             x1, [x0]
        cmp               x1, x8
        b.ne              1f
        stlxr             w9, x2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u64::release_seqcst:
        mov               x8, x1
0:
        ldaxr             x1, [x0]
        cmp               x1, x8
        b.ne              1f
        stlxr             w9, x2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u64::seqcst_acquire:
        mov               x8, x1
0:
        ldaxr             x1, [x0]
        cmp               x1, x8
        b.ne              1f
        stlxr             w9, x2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u64::seqcst_relaxed:
        mov               x8, x1
0:
        ldaxr             x1, [x0]
        cmp               x1, x8
        b.ne              1f
        stlxr             w9, x2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u64::acquire_acquire:
        mov               x8, x1
0:
        ldaxr             x1, [x0]
        cmp               x1, x8
        b.ne              1f
        stxr              w9, x2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u64::acquire_relaxed:
        mov               x8, x1
0:
        ldaxr             x1, [x0]
        cmp               x1, x8
        b.ne              1f
        stxr              w9, x2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u64::relaxed_acquire:
        mov               x8, x1
0:
        ldaxr             x1, [x0]
        cmp               x1, x8
        b.ne              1f
        stxr              w9, x2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u64::relaxed_relaxed:
        mov               x8, x1
0:
        ldxr              x1, [x0]
        cmp               x1, x8
        b.ne              1f
        stxr              w9, x2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u64::release_acquire:
        mov               x8, x1
0:
        ldaxr             x1, [x0]
        cmp               x1, x8
        b.ne              1f
        stlxr             w9, x2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::u64::release_relaxed:
        mov               x8, x1
0:
        ldxr              x1, [x0]
        cmp               x1, x8
        b.ne              1f
        stlxr             w9, x2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

asm_test::compare_exchange::bool::acqrel_seqcst:
        mov               w9, w2
0:
        ldaxrb            w8, [x0]
        cmp               w8, w1
        b.ne              1f
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w9, #0x1                // =1
        cmp               w8, #0x0
        eor               w0, w9, #0x1
        cset              w1, ne
        ret
1:
        clrex
        cmp               w8, #0x0
        eor               w0, wzr, #0x1
        cset              w1, ne
        ret

asm_test::compare_exchange::bool::seqcst_seqcst:
        mov               w9, w2
0:
        ldaxrb            w8, [x0]
        cmp               w8, w1
        b.ne              1f
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w9, #0x1                // =1
        cmp               w8, #0x0
        eor               w0, w9, #0x1
        cset              w1, ne
        ret
1:
        clrex
        cmp               w8, #0x0
        eor               w0, wzr, #0x1
        cset              w1, ne
        ret

asm_test::compare_exchange::bool::acqrel_acquire:
        mov               w9, w2
0:
        ldaxrb            w8, [x0]
        cmp               w8, w1
        b.ne              1f
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w9, #0x1                // =1
        cmp               w8, #0x0
        eor               w0, w9, #0x1
        cset              w1, ne
        ret
1:
        clrex
        cmp               w8, #0x0
        eor               w0, wzr, #0x1
        cset              w1, ne
        ret

asm_test::compare_exchange::bool::acqrel_relaxed:
        mov               w9, w2
0:
        ldaxrb            w8, [x0]
        cmp               w8, w1
        b.ne              1f
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w9, #0x1                // =1
        cmp               w8, #0x0
        eor               w0, w9, #0x1
        cset              w1, ne
        ret
1:
        clrex
        cmp               w8, #0x0
        eor               w0, wzr, #0x1
        cset              w1, ne
        ret

asm_test::compare_exchange::bool::acquire_seqcst:
        mov               w9, w2
0:
        ldaxrb            w8, [x0]
        cmp               w8, w1
        b.ne              1f
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w9, #0x1                // =1
        cmp               w8, #0x0
        eor               w0, w9, #0x1
        cset              w1, ne
        ret
1:
        clrex
        cmp               w8, #0x0
        eor               w0, wzr, #0x1
        cset              w1, ne
        ret

asm_test::compare_exchange::bool::relaxed_seqcst:
        mov               w9, w2
0:
        ldaxrb            w8, [x0]
        cmp               w8, w1
        b.ne              1f
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w9, #0x1                // =1
        cmp               w8, #0x0
        eor               w0, w9, #0x1
        cset              w1, ne
        ret
1:
        clrex
        cmp               w8, #0x0
        eor               w0, wzr, #0x1
        cset              w1, ne
        ret

asm_test::compare_exchange::bool::release_seqcst:
        mov               w9, w2
0:
        ldaxrb            w8, [x0]
        cmp               w8, w1
        b.ne              1f
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w9, #0x1                // =1
        cmp               w8, #0x0
        eor               w0, w9, #0x1
        cset              w1, ne
        ret
1:
        clrex
        cmp               w8, #0x0
        eor               w0, wzr, #0x1
        cset              w1, ne
        ret

asm_test::compare_exchange::bool::seqcst_acquire:
        mov               w9, w2
0:
        ldaxrb            w8, [x0]
        cmp               w8, w1
        b.ne              1f
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w9, #0x1                // =1
        cmp               w8, #0x0
        eor               w0, w9, #0x1
        cset              w1, ne
        ret
1:
        clrex
        cmp               w8, #0x0
        eor               w0, wzr, #0x1
        cset              w1, ne
        ret

asm_test::compare_exchange::bool::seqcst_relaxed:
        mov               w9, w2
0:
        ldaxrb            w8, [x0]
        cmp               w8, w1
        b.ne              1f
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w9, #0x1                // =1
        cmp               w8, #0x0
        eor               w0, w9, #0x1
        cset              w1, ne
        ret
1:
        clrex
        cmp               w8, #0x0
        eor               w0, wzr, #0x1
        cset              w1, ne
        ret

asm_test::compare_exchange::bool::acquire_acquire:
        mov               w9, w2
0:
        ldaxrb            w8, [x0]
        cmp               w8, w1
        b.ne              1f
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w9, #0x1                // =1
        cmp               w8, #0x0
        eor               w0, w9, #0x1
        cset              w1, ne
        ret
1:
        clrex
        cmp               w8, #0x0
        eor               w0, wzr, #0x1
        cset              w1, ne
        ret

asm_test::compare_exchange::bool::acquire_relaxed:
        mov               w9, w2
0:
        ldaxrb            w8, [x0]
        cmp               w8, w1
        b.ne              1f
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w9, #0x1                // =1
        cmp               w8, #0x0
        eor               w0, w9, #0x1
        cset              w1, ne
        ret
1:
        clrex
        cmp               w8, #0x0
        eor               w0, wzr, #0x1
        cset              w1, ne
        ret

asm_test::compare_exchange::bool::relaxed_acquire:
        mov               w9, w2
0:
        ldaxrb            w8, [x0]
        cmp               w8, w1
        b.ne              1f
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w9, #0x1                // =1
        cmp               w8, #0x0
        eor               w0, w9, #0x1
        cset              w1, ne
        ret
1:
        clrex
        cmp               w8, #0x0
        eor               w0, wzr, #0x1
        cset              w1, ne
        ret

asm_test::compare_exchange::bool::relaxed_relaxed:
        mov               w9, w2
0:
        ldxrb             w8, [x0]
        cmp               w8, w1
        b.ne              1f
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w9, #0x1                // =1
        cmp               w8, #0x0
        eor               w0, w9, #0x1
        cset              w1, ne
        ret
1:
        clrex
        cmp               w8, #0x0
        eor               w0, wzr, #0x1
        cset              w1, ne
        ret

asm_test::compare_exchange::bool::release_acquire:
        mov               w9, w2
0:
        ldaxrb            w8, [x0]
        cmp               w8, w1
        b.ne              1f
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w9, #0x1                // =1
        cmp               w8, #0x0
        eor               w0, w9, #0x1
        cset              w1, ne
        ret
1:
        clrex
        cmp               w8, #0x0
        eor               w0, wzr, #0x1
        cset              w1, ne
        ret

asm_test::compare_exchange::bool::release_relaxed:
        mov               w9, w2
0:
        ldxrb             w8, [x0]
        cmp               w8, w1
        b.ne              1f
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w9, #0x1                // =1
        cmp               w8, #0x0
        eor               w0, w9, #0x1
        cset              w1, ne
        ret
1:
        clrex
        cmp               w8, #0x0
        eor               w0, wzr, #0x1
        cset              w1, ne
        ret

asm_test::compare_exchange::u128::acqrel_seqcst:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        cset              w11, ne
        cmp               x10, x3
        cinc              w11, w11, ne
        cbz               w11, 1f
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        b                 2f
1:
        stlxp             w11, x4, x5, [x0]
        cbnz              w11, 0b
2:
        stp               x9, x10, [x8, #0x10]
        cmp               x10, x3
        ccmp              x9, x2, #0x0, eq
        cset              w9, ne
        stp               xzr, x9, [x8]
        ret

asm_test::compare_exchange::u128::seqcst_seqcst:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        cset              w11, ne
        cmp               x10, x3
        cinc              w11, w11, ne
        cbz               w11, 1f
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        b                 2f
1:
        stlxp             w11, x4, x5, [x0]
        cbnz              w11, 0b
2:
        stp               x9, x10, [x8, #0x10]
        cmp               x10, x3
        ccmp              x9, x2, #0x0, eq
        cset              w9, ne
        stp               xzr, x9, [x8]
        ret

asm_test::compare_exchange::u128::acqrel_acquire:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        cset              w11, ne
        cmp               x10, x3
        cinc              w11, w11, ne
        cbz               w11, 1f
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        b                 2f
1:
        stlxp             w11, x4, x5, [x0]
        cbnz              w11, 0b
2:
        stp               x9, x10, [x8, #0x10]
        cmp               x10, x3
        ccmp              x9, x2, #0x0, eq
        cset              w9, ne
        stp               xzr, x9, [x8]
        ret

asm_test::compare_exchange::u128::acqrel_relaxed:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        cset              w11, ne
        cmp               x10, x3
        cinc              w11, w11, ne
        cbz               w11, 1f
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        b                 2f
1:
        stlxp             w11, x4, x5, [x0]
        cbnz              w11, 0b
2:
        stp               x9, x10, [x8, #0x10]
        cmp               x10, x3
        ccmp              x9, x2, #0x0, eq
        cset              w9, ne
        stp               xzr, x9, [x8]
        ret

asm_test::compare_exchange::u128::acquire_seqcst:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        cset              w11, ne
        cmp               x10, x3
        cinc              w11, w11, ne
        cbz               w11, 1f
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        b                 2f
1:
        stlxp             w11, x4, x5, [x0]
        cbnz              w11, 0b
2:
        stp               x9, x10, [x8, #0x10]
        cmp               x10, x3
        ccmp              x9, x2, #0x0, eq
        cset              w9, ne
        stp               xzr, x9, [x8]
        ret

asm_test::compare_exchange::u128::relaxed_seqcst:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        cset              w11, ne
        cmp               x10, x3
        cinc              w11, w11, ne
        cbz               w11, 1f
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        b                 2f
1:
        stlxp             w11, x4, x5, [x0]
        cbnz              w11, 0b
2:
        stp               x9, x10, [x8, #0x10]
        cmp               x10, x3
        ccmp              x9, x2, #0x0, eq
        cset              w9, ne
        stp               xzr, x9, [x8]
        ret

asm_test::compare_exchange::u128::release_seqcst:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        cset              w11, ne
        cmp               x10, x3
        cinc              w11, w11, ne
        cbz               w11, 1f
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        b                 2f
1:
        stlxp             w11, x4, x5, [x0]
        cbnz              w11, 0b
2:
        stp               x9, x10, [x8, #0x10]
        cmp               x10, x3
        ccmp              x9, x2, #0x0, eq
        cset              w9, ne
        stp               xzr, x9, [x8]
        ret

asm_test::compare_exchange::u128::seqcst_acquire:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        cset              w11, ne
        cmp               x10, x3
        cinc              w11, w11, ne
        cbz               w11, 1f
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        b                 2f
1:
        stlxp             w11, x4, x5, [x0]
        cbnz              w11, 0b
2:
        stp               x9, x10, [x8, #0x10]
        cmp               x10, x3
        ccmp              x9, x2, #0x0, eq
        cset              w9, ne
        stp               xzr, x9, [x8]
        ret

asm_test::compare_exchange::u128::seqcst_relaxed:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        cset              w11, ne
        cmp               x10, x3
        cinc              w11, w11, ne
        cbz               w11, 1f
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        b                 2f
1:
        stlxp             w11, x4, x5, [x0]
        cbnz              w11, 0b
2:
        stp               x9, x10, [x8, #0x10]
        cmp               x10, x3
        ccmp              x9, x2, #0x0, eq
        cset              w9, ne
        stp               xzr, x9, [x8]
        ret

asm_test::compare_exchange::u128::acquire_acquire:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        cset              w11, ne
        cmp               x10, x3
        cinc              w11, w11, ne
        cbz               w11, 1f
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        b                 2f
1:
        stxp              w11, x4, x5, [x0]
        cbnz              w11, 0b
2:
        stp               x9, x10, [x8, #0x10]
        cmp               x10, x3
        ccmp              x9, x2, #0x0, eq
        cset              w9, ne
        stp               xzr, x9, [x8]
        ret

asm_test::compare_exchange::u128::acquire_relaxed:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        cset              w11, ne
        cmp               x10, x3
        cinc              w11, w11, ne
        cbz               w11, 1f
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        b                 2f
1:
        stxp              w11, x4, x5, [x0]
        cbnz              w11, 0b
2:
        stp               x9, x10, [x8, #0x10]
        cmp               x10, x3
        ccmp              x9, x2, #0x0, eq
        cset              w9, ne
        stp               xzr, x9, [x8]
        ret

asm_test::compare_exchange::u128::relaxed_acquire:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        cset              w11, ne
        cmp               x10, x3
        cinc              w11, w11, ne
        cbz               w11, 1f
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        b                 2f
1:
        stxp              w11, x4, x5, [x0]
        cbnz              w11, 0b
2:
        stp               x9, x10, [x8, #0x10]
        cmp               x10, x3
        ccmp              x9, x2, #0x0, eq
        cset              w9, ne
        stp               xzr, x9, [x8]
        ret

asm_test::compare_exchange::u128::relaxed_relaxed:
0:
        ldxp              x9, x10, [x0]
        cmp               x9, x2
        cset              w11, ne
        cmp               x10, x3
        cinc              w11, w11, ne
        cbz               w11, 1f
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        b                 2f
1:
        stxp              w11, x4, x5, [x0]
        cbnz              w11, 0b
2:
        stp               x9, x10, [x8, #0x10]
        cmp               x10, x3
        ccmp              x9, x2, #0x0, eq
        cset              w9, ne
        stp               xzr, x9, [x8]
        ret

asm_test::compare_exchange::u128::release_acquire:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        cset              w11, ne
        cmp               x10, x3
        cinc              w11, w11, ne
        cbz               w11, 1f
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        b                 2f
1:
        stlxp             w11, x4, x5, [x0]
        cbnz              w11, 0b
2:
        stp               x9, x10, [x8, #0x10]
        cmp               x10, x3
        ccmp              x9, x2, #0x0, eq
        cset              w9, ne
        stp               xzr, x9, [x8]
        ret

asm_test::compare_exchange::u128::release_relaxed:
0:
        ldxp              x9, x10, [x0]
        cmp               x9, x2
        cset              w11, ne
        cmp               x10, x3
        cinc              w11, w11, ne
        cbz               w11, 1f
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        b                 2f
1:
        stlxp             w11, x4, x5, [x0]
        cbnz              w11, 0b
2:
        stp               x9, x10, [x8, #0x10]
        cmp               x10, x3
        ccmp              x9, x2, #0x0, eq
        cset              w9, ne
        stp               xzr, x9, [x8]
        ret

asm_test::compare_exchange_weak::u8::acqrel_seqcst:
        ldaxrb            w8, [x0]
        cmp               w8, w1, uxtb
        b.ne              0f
        stlxrb            w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u8::seqcst_seqcst:
        ldaxrb            w8, [x0]
        cmp               w8, w1, uxtb
        b.ne              0f
        stlxrb            w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u8::acqrel_acquire:
        ldaxrb            w8, [x0]
        cmp               w8, w1, uxtb
        b.ne              0f
        stlxrb            w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u8::acqrel_relaxed:
        ldaxrb            w8, [x0]
        cmp               w8, w1, uxtb
        b.ne              0f
        stlxrb            w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u8::acquire_seqcst:
        ldaxrb            w8, [x0]
        cmp               w8, w1, uxtb
        b.ne              0f
        stlxrb            w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u8::relaxed_seqcst:
        ldaxrb            w8, [x0]
        cmp               w8, w1, uxtb
        b.ne              0f
        stlxrb            w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u8::release_seqcst:
        ldaxrb            w8, [x0]
        cmp               w8, w1, uxtb
        b.ne              0f
        stlxrb            w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u8::seqcst_acquire:
        ldaxrb            w8, [x0]
        cmp               w8, w1, uxtb
        b.ne              0f
        stlxrb            w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u8::seqcst_relaxed:
        ldaxrb            w8, [x0]
        cmp               w8, w1, uxtb
        b.ne              0f
        stlxrb            w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u8::acquire_acquire:
        ldaxrb            w8, [x0]
        cmp               w8, w1, uxtb
        b.ne              0f
        stxrb             w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u8::acquire_relaxed:
        ldaxrb            w8, [x0]
        cmp               w8, w1, uxtb
        b.ne              0f
        stxrb             w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u8::relaxed_acquire:
        ldaxrb            w8, [x0]
        cmp               w8, w1, uxtb
        b.ne              0f
        stxrb             w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u8::relaxed_relaxed:
        ldxrb             w8, [x0]
        cmp               w8, w1, uxtb
        b.ne              0f
        stxrb             w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u8::release_acquire:
        ldaxrb            w8, [x0]
        cmp               w8, w1, uxtb
        b.ne              0f
        stlxrb            w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u8::release_relaxed:
        ldxrb             w8, [x0]
        cmp               w8, w1, uxtb
        b.ne              0f
        stlxrb            w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u16::acqrel_seqcst:
        ldaxrh            w8, [x0]
        cmp               w8, w1, uxth
        b.ne              0f
        stlxrh            w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u16::seqcst_seqcst:
        ldaxrh            w8, [x0]
        cmp               w8, w1, uxth
        b.ne              0f
        stlxrh            w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u16::acqrel_acquire:
        ldaxrh            w8, [x0]
        cmp               w8, w1, uxth
        b.ne              0f
        stlxrh            w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u16::acqrel_relaxed:
        ldaxrh            w8, [x0]
        cmp               w8, w1, uxth
        b.ne              0f
        stlxrh            w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u16::acquire_seqcst:
        ldaxrh            w8, [x0]
        cmp               w8, w1, uxth
        b.ne              0f
        stlxrh            w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u16::relaxed_seqcst:
        ldaxrh            w8, [x0]
        cmp               w8, w1, uxth
        b.ne              0f
        stlxrh            w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u16::release_seqcst:
        ldaxrh            w8, [x0]
        cmp               w8, w1, uxth
        b.ne              0f
        stlxrh            w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u16::seqcst_acquire:
        ldaxrh            w8, [x0]
        cmp               w8, w1, uxth
        b.ne              0f
        stlxrh            w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u16::seqcst_relaxed:
        ldaxrh            w8, [x0]
        cmp               w8, w1, uxth
        b.ne              0f
        stlxrh            w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u16::acquire_acquire:
        ldaxrh            w8, [x0]
        cmp               w8, w1, uxth
        b.ne              0f
        stxrh             w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u16::acquire_relaxed:
        ldaxrh            w8, [x0]
        cmp               w8, w1, uxth
        b.ne              0f
        stxrh             w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u16::relaxed_acquire:
        ldaxrh            w8, [x0]
        cmp               w8, w1, uxth
        b.ne              0f
        stxrh             w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u16::relaxed_relaxed:
        ldxrh             w8, [x0]
        cmp               w8, w1, uxth
        b.ne              0f
        stxrh             w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u16::release_acquire:
        ldaxrh            w8, [x0]
        cmp               w8, w1, uxth
        b.ne              0f
        stlxrh            w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u16::release_relaxed:
        ldxrh             w8, [x0]
        cmp               w8, w1, uxth
        b.ne              0f
        stlxrh            w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u32::acqrel_seqcst:
        ldaxr             w8, [x0]
        cmp               w8, w1
        b.ne              0f
        stlxr             w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u32::seqcst_seqcst:
        ldaxr             w8, [x0]
        cmp               w8, w1
        b.ne              0f
        stlxr             w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u32::acqrel_acquire:
        ldaxr             w8, [x0]
        cmp               w8, w1
        b.ne              0f
        stlxr             w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u32::acqrel_relaxed:
        ldaxr             w8, [x0]
        cmp               w8, w1
        b.ne              0f
        stlxr             w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u32::acquire_seqcst:
        ldaxr             w8, [x0]
        cmp               w8, w1
        b.ne              0f
        stlxr             w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u32::relaxed_seqcst:
        ldaxr             w8, [x0]
        cmp               w8, w1
        b.ne              0f
        stlxr             w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u32::release_seqcst:
        ldaxr             w8, [x0]
        cmp               w8, w1
        b.ne              0f
        stlxr             w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u32::seqcst_acquire:
        ldaxr             w8, [x0]
        cmp               w8, w1
        b.ne              0f
        stlxr             w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u32::seqcst_relaxed:
        ldaxr             w8, [x0]
        cmp               w8, w1
        b.ne              0f
        stlxr             w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u32::acquire_acquire:
        ldaxr             w8, [x0]
        cmp               w8, w1
        b.ne              0f
        stxr              w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u32::acquire_relaxed:
        ldaxr             w8, [x0]
        cmp               w8, w1
        b.ne              0f
        stxr              w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u32::relaxed_acquire:
        ldaxr             w8, [x0]
        cmp               w8, w1
        b.ne              0f
        stxr              w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u32::relaxed_relaxed:
        ldxr              w8, [x0]
        cmp               w8, w1
        b.ne              0f
        stxr              w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u32::release_acquire:
        ldaxr             w8, [x0]
        cmp               w8, w1
        b.ne              0f
        stlxr             w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u32::release_relaxed:
        ldxr              w8, [x0]
        cmp               w8, w1
        b.ne              0f
        stlxr             w9, w2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, w9
        ret
0:
        clrex
        mov               w10, #0x1               // =1
        mov               w1, w8
        bic               w0, w10, wzr
        ret

asm_test::compare_exchange_weak::u64::acqrel_seqcst:
        ldaxr             x8, [x0]
        cmp               x8, x1
        b.ne              0f
        stlxr             w9, x2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mvn               w9, w9
        mov               x1, x8
        and               x0, x9, #0x1
        ret
0:
        clrex
        mvn               w9, wzr
        mov               x1, x8
        and               x0, x9, #0x1
        ret

asm_test::compare_exchange_weak::u64::seqcst_seqcst:
        ldaxr             x8, [x0]
        cmp               x8, x1
        b.ne              0f
        stlxr             w9, x2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mvn               w9, w9
        mov               x1, x8
        and               x0, x9, #0x1
        ret
0:
        clrex
        mvn               w9, wzr
        mov               x1, x8
        and               x0, x9, #0x1
        ret

asm_test::compare_exchange_weak::u64::acqrel_acquire:
        ldaxr             x8, [x0]
        cmp               x8, x1
        b.ne              0f
        stlxr             w9, x2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mvn               w9, w9
        mov               x1, x8
        and               x0, x9, #0x1
        ret
0:
        clrex
        mvn               w9, wzr
        mov               x1, x8
        and               x0, x9, #0x1
        ret

asm_test::compare_exchange_weak::u64::acqrel_relaxed:
        ldaxr             x8, [x0]
        cmp               x8, x1
        b.ne              0f
        stlxr             w9, x2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mvn               w9, w9
        mov               x1, x8
        and               x0, x9, #0x1
        ret
0:
        clrex
        mvn               w9, wzr
        mov               x1, x8
        and               x0, x9, #0x1
        ret

asm_test::compare_exchange_weak::u64::acquire_seqcst:
        ldaxr             x8, [x0]
        cmp               x8, x1
        b.ne              0f
        stlxr             w9, x2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mvn               w9, w9
        mov               x1, x8
        and               x0, x9, #0x1
        ret
0:
        clrex
        mvn               w9, wzr
        mov               x1, x8
        and               x0, x9, #0x1
        ret

asm_test::compare_exchange_weak::u64::relaxed_seqcst:
        ldaxr             x8, [x0]
        cmp               x8, x1
        b.ne              0f
        stlxr             w9, x2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mvn               w9, w9
        mov               x1, x8
        and               x0, x9, #0x1
        ret
0:
        clrex
        mvn               w9, wzr
        mov               x1, x8
        and               x0, x9, #0x1
        ret

asm_test::compare_exchange_weak::u64::release_seqcst:
        ldaxr             x8, [x0]
        cmp               x8, x1
        b.ne              0f
        stlxr             w9, x2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mvn               w9, w9
        mov               x1, x8
        and               x0, x9, #0x1
        ret
0:
        clrex
        mvn               w9, wzr
        mov               x1, x8
        and               x0, x9, #0x1
        ret

asm_test::compare_exchange_weak::u64::seqcst_acquire:
        ldaxr             x8, [x0]
        cmp               x8, x1
        b.ne              0f
        stlxr             w9, x2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mvn               w9, w9
        mov               x1, x8
        and               x0, x9, #0x1
        ret
0:
        clrex
        mvn               w9, wzr
        mov               x1, x8
        and               x0, x9, #0x1
        ret

asm_test::compare_exchange_weak::u64::seqcst_relaxed:
        ldaxr             x8, [x0]
        cmp               x8, x1
        b.ne              0f
        stlxr             w9, x2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mvn               w9, w9
        mov               x1, x8
        and               x0, x9, #0x1
        ret
0:
        clrex
        mvn               w9, wzr
        mov               x1, x8
        and               x0, x9, #0x1
        ret

asm_test::compare_exchange_weak::u64::acquire_acquire:
        ldaxr             x8, [x0]
        cmp               x8, x1
        b.ne              0f
        stxr              w9, x2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mvn               w9, w9
        mov               x1, x8
        and               x0, x9, #0x1
        ret
0:
        clrex
        mvn               w9, wzr
        mov               x1, x8
        and               x0, x9, #0x1
        ret

asm_test::compare_exchange_weak::u64::acquire_relaxed:
        ldaxr             x8, [x0]
        cmp               x8, x1
        b.ne              0f
        stxr              w9, x2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mvn               w9, w9
        mov               x1, x8
        and               x0, x9, #0x1
        ret
0:
        clrex
        mvn               w9, wzr
        mov               x1, x8
        and               x0, x9, #0x1
        ret

asm_test::compare_exchange_weak::u64::relaxed_acquire:
        ldaxr             x8, [x0]
        cmp               x8, x1
        b.ne              0f
        stxr              w9, x2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mvn               w9, w9
        mov               x1, x8
        and               x0, x9, #0x1
        ret
0:
        clrex
        mvn               w9, wzr
        mov               x1, x8
        and               x0, x9, #0x1
        ret

asm_test::compare_exchange_weak::u64::relaxed_relaxed:
        ldxr              x8, [x0]
        cmp               x8, x1
        b.ne              0f
        stxr              w9, x2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mvn               w9, w9
        mov               x1, x8
        and               x0, x9, #0x1
        ret
0:
        clrex
        mvn               w9, wzr
        mov               x1, x8
        and               x0, x9, #0x1
        ret

asm_test::compare_exchange_weak::u64::release_acquire:
        ldaxr             x8, [x0]
        cmp               x8, x1
        b.ne              0f
        stlxr             w9, x2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mvn               w9, w9
        mov               x1, x8
        and               x0, x9, #0x1
        ret
0:
        clrex
        mvn               w9, wzr
        mov               x1, x8
        and               x0, x9, #0x1
        ret

asm_test::compare_exchange_weak::u64::release_relaxed:
        ldxr              x8, [x0]
        cmp               x8, x1
        b.ne              0f
        stlxr             w9, x2, [x0]
        cmp               w9, #0x0
        csetm             w9, eq
        mvn               w9, w9
        mov               x1, x8
        and               x0, x9, #0x1
        ret
0:
        clrex
        mvn               w9, wzr
        mov               x1, x8
        and               x0, x9, #0x1
        ret

asm_test::compare_exchange_weak::bool::acqrel_seqcst:
        ldaxrb            w8, [x0]
        cmp               w8, w1
        b.ne              0f
        mov               w9, w2
        stlxrb            w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w9, eq
        cmp               w8, #0x0
        mov               w8, #0x1                // =1
        cset              w1, ne
        bic               w0, w8, w9
        ret
0:
        clrex
        cmp               w8, #0x0
        mov               w8, #0x1                // =1
        cset              w1, ne
        bic               w0, w8, wzr
        ret

asm_test::compare_exchange_weak::bool::seqcst_seqcst:
        ldaxrb            w8, [x0]
        cmp               w8, w1
        b.ne              0f
        mov               w9, w2
        stlxrb            w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w9, eq
        cmp               w8, #0x0
        mov               w8, #0x1                // =1
        cset              w1, ne
        bic               w0, w8, w9
        ret
0:
        clrex
        cmp               w8, #0x0
        mov               w8, #0x1                // =1
        cset              w1, ne
        bic               w0, w8, wzr
        ret

asm_test::compare_exchange_weak::bool::acqrel_acquire:
        ldaxrb            w8, [x0]
        cmp               w8, w1
        b.ne              0f
        mov               w9, w2
        stlxrb            w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w9, eq
        cmp               w8, #0x0
        mov               w8, #0x1                // =1
        cset              w1, ne
        bic               w0, w8, w9
        ret
0:
        clrex
        cmp               w8, #0x0
        mov               w8, #0x1                // =1
        cset              w1, ne
        bic               w0, w8, wzr
        ret

asm_test::compare_exchange_weak::bool::acqrel_relaxed:
        ldaxrb            w8, [x0]
        cmp               w8, w1
        b.ne              0f
        mov               w9, w2
        stlxrb            w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w9, eq
        cmp               w8, #0x0
        mov               w8, #0x1                // =1
        cset              w1, ne
        bic               w0, w8, w9
        ret
0:
        clrex
        cmp               w8, #0x0
        mov               w8, #0x1                // =1
        cset              w1, ne
        bic               w0, w8, wzr
        ret

asm_test::compare_exchange_weak::bool::acquire_seqcst:
        ldaxrb            w8, [x0]
        cmp               w8, w1
        b.ne              0f
        mov               w9, w2
        stlxrb            w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w9, eq
        cmp               w8, #0x0
        mov               w8, #0x1                // =1
        cset              w1, ne
        bic               w0, w8, w9
        ret
0:
        clrex
        cmp               w8, #0x0
        mov               w8, #0x1                // =1
        cset              w1, ne
        bic               w0, w8, wzr
        ret

asm_test::compare_exchange_weak::bool::relaxed_seqcst:
        ldaxrb            w8, [x0]
        cmp               w8, w1
        b.ne              0f
        mov               w9, w2
        stlxrb            w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w9, eq
        cmp               w8, #0x0
        mov               w8, #0x1                // =1
        cset              w1, ne
        bic               w0, w8, w9
        ret
0:
        clrex
        cmp               w8, #0x0
        mov               w8, #0x1                // =1
        cset              w1, ne
        bic               w0, w8, wzr
        ret

asm_test::compare_exchange_weak::bool::release_seqcst:
        ldaxrb            w8, [x0]
        cmp               w8, w1
        b.ne              0f
        mov               w9, w2
        stlxrb            w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w9, eq
        cmp               w8, #0x0
        mov               w8, #0x1                // =1
        cset              w1, ne
        bic               w0, w8, w9
        ret
0:
        clrex
        cmp               w8, #0x0
        mov               w8, #0x1                // =1
        cset              w1, ne
        bic               w0, w8, wzr
        ret

asm_test::compare_exchange_weak::bool::seqcst_acquire:
        ldaxrb            w8, [x0]
        cmp               w8, w1
        b.ne              0f
        mov               w9, w2
        stlxrb            w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w9, eq
        cmp               w8, #0x0
        mov               w8, #0x1                // =1
        cset              w1, ne
        bic               w0, w8, w9
        ret
0:
        clrex
        cmp               w8, #0x0
        mov               w8, #0x1                // =1
        cset              w1, ne
        bic               w0, w8, wzr
        ret

asm_test::compare_exchange_weak::bool::seqcst_relaxed:
        ldaxrb            w8, [x0]
        cmp               w8, w1
        b.ne              0f
        mov               w9, w2
        stlxrb            w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w9, eq
        cmp               w8, #0x0
        mov               w8, #0x1                // =1
        cset              w1, ne
        bic               w0, w8, w9
        ret
0:
        clrex
        cmp               w8, #0x0
        mov               w8, #0x1                // =1
        cset              w1, ne
        bic               w0, w8, wzr
        ret

asm_test::compare_exchange_weak::bool::acquire_acquire:
        ldaxrb            w8, [x0]
        cmp               w8, w1
        b.ne              0f
        mov               w9, w2
        stxrb             w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w9, eq
        cmp               w8, #0x0
        mov               w8, #0x1                // =1
        cset              w1, ne
        bic               w0, w8, w9
        ret
0:
        clrex
        cmp               w8, #0x0
        mov               w8, #0x1                // =1
        cset              w1, ne
        bic               w0, w8, wzr
        ret

asm_test::compare_exchange_weak::bool::acquire_relaxed:
        ldaxrb            w8, [x0]
        cmp               w8, w1
        b.ne              0f
        mov               w9, w2
        stxrb             w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w9, eq
        cmp               w8, #0x0
        mov               w8, #0x1                // =1
        cset              w1, ne
        bic               w0, w8, w9
        ret
0:
        clrex
        cmp               w8, #0x0
        mov               w8, #0x1                // =1
        cset              w1, ne
        bic               w0, w8, wzr
        ret

asm_test::compare_exchange_weak::bool::relaxed_acquire:
        ldaxrb            w8, [x0]
        cmp               w8, w1
        b.ne              0f
        mov               w9, w2
        stxrb             w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w9, eq
        cmp               w8, #0x0
        mov               w8, #0x1                // =1
        cset              w1, ne
        bic               w0, w8, w9
        ret
0:
        clrex
        cmp               w8, #0x0
        mov               w8, #0x1                // =1
        cset              w1, ne
        bic               w0, w8, wzr
        ret

asm_test::compare_exchange_weak::bool::relaxed_relaxed:
        ldxrb             w8, [x0]
        cmp               w8, w1
        b.ne              0f
        mov               w9, w2
        stxrb             w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w9, eq
        cmp               w8, #0x0
        mov               w8, #0x1                // =1
        cset              w1, ne
        bic               w0, w8, w9
        ret
0:
        clrex
        cmp               w8, #0x0
        mov               w8, #0x1                // =1
        cset              w1, ne
        bic               w0, w8, wzr
        ret

asm_test::compare_exchange_weak::bool::release_acquire:
        ldaxrb            w8, [x0]
        cmp               w8, w1
        b.ne              0f
        mov               w9, w2
        stlxrb            w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w9, eq
        cmp               w8, #0x0
        mov               w8, #0x1                // =1
        cset              w1, ne
        bic               w0, w8, w9
        ret
0:
        clrex
        cmp               w8, #0x0
        mov               w8, #0x1                // =1
        cset              w1, ne
        bic               w0, w8, wzr
        ret

asm_test::compare_exchange_weak::bool::release_relaxed:
        ldxrb             w8, [x0]
        cmp               w8, w1
        b.ne              0f
        mov               w9, w2
        stlxrb            w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w9, eq
        cmp               w8, #0x0
        mov               w8, #0x1                // =1
        cset              w1, ne
        bic               w0, w8, w9
        ret
0:
        clrex
        cmp               w8, #0x0
        mov               w8, #0x1                // =1
        cset              w1, ne
        bic               w0, w8, wzr
        ret

asm_test::compare_exchange_weak::u128::acqrel_seqcst:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        cset              w11, ne
        cmp               x10, x3
        cinc              w11, w11, ne
        cbz               w11, 1f
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        b                 2f
1:
        stlxp             w11, x4, x5, [x0]
        cbnz              w11, 0b
2:
        stp               x9, x10, [x8, #0x10]
        cmp               x10, x3
        ccmp              x9, x2, #0x0, eq
        cset              w9, ne
        stp               xzr, x9, [x8]
        ret

asm_test::compare_exchange_weak::u128::seqcst_seqcst:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        cset              w11, ne
        cmp               x10, x3
        cinc              w11, w11, ne
        cbz               w11, 1f
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        b                 2f
1:
        stlxp             w11, x4, x5, [x0]
        cbnz              w11, 0b
2:
        stp               x9, x10, [x8, #0x10]
        cmp               x10, x3
        ccmp              x9, x2, #0x0, eq
        cset              w9, ne
        stp               xzr, x9, [x8]
        ret

asm_test::compare_exchange_weak::u128::acqrel_acquire:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        cset              w11, ne
        cmp               x10, x3
        cinc              w11, w11, ne
        cbz               w11, 1f
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        b                 2f
1:
        stlxp             w11, x4, x5, [x0]
        cbnz              w11, 0b
2:
        stp               x9, x10, [x8, #0x10]
        cmp               x10, x3
        ccmp              x9, x2, #0x0, eq
        cset              w9, ne
        stp               xzr, x9, [x8]
        ret

asm_test::compare_exchange_weak::u128::acqrel_relaxed:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        cset              w11, ne
        cmp               x10, x3
        cinc              w11, w11, ne
        cbz               w11, 1f
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        b                 2f
1:
        stlxp             w11, x4, x5, [x0]
        cbnz              w11, 0b
2:
        stp               x9, x10, [x8, #0x10]
        cmp               x10, x3
        ccmp              x9, x2, #0x0, eq
        cset              w9, ne
        stp               xzr, x9, [x8]
        ret

asm_test::compare_exchange_weak::u128::acquire_seqcst:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        cset              w11, ne
        cmp               x10, x3
        cinc              w11, w11, ne
        cbz               w11, 1f
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        b                 2f
1:
        stlxp             w11, x4, x5, [x0]
        cbnz              w11, 0b
2:
        stp               x9, x10, [x8, #0x10]
        cmp               x10, x3
        ccmp              x9, x2, #0x0, eq
        cset              w9, ne
        stp               xzr, x9, [x8]
        ret

asm_test::compare_exchange_weak::u128::relaxed_seqcst:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        cset              w11, ne
        cmp               x10, x3
        cinc              w11, w11, ne
        cbz               w11, 1f
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        b                 2f
1:
        stlxp             w11, x4, x5, [x0]
        cbnz              w11, 0b
2:
        stp               x9, x10, [x8, #0x10]
        cmp               x10, x3
        ccmp              x9, x2, #0x0, eq
        cset              w9, ne
        stp               xzr, x9, [x8]
        ret

asm_test::compare_exchange_weak::u128::release_seqcst:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        cset              w11, ne
        cmp               x10, x3
        cinc              w11, w11, ne
        cbz               w11, 1f
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        b                 2f
1:
        stlxp             w11, x4, x5, [x0]
        cbnz              w11, 0b
2:
        stp               x9, x10, [x8, #0x10]
        cmp               x10, x3
        ccmp              x9, x2, #0x0, eq
        cset              w9, ne
        stp               xzr, x9, [x8]
        ret

asm_test::compare_exchange_weak::u128::seqcst_acquire:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        cset              w11, ne
        cmp               x10, x3
        cinc              w11, w11, ne
        cbz               w11, 1f
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        b                 2f
1:
        stlxp             w11, x4, x5, [x0]
        cbnz              w11, 0b
2:
        stp               x9, x10, [x8, #0x10]
        cmp               x10, x3
        ccmp              x9, x2, #0x0, eq
        cset              w9, ne
        stp               xzr, x9, [x8]
        ret

asm_test::compare_exchange_weak::u128::seqcst_relaxed:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        cset              w11, ne
        cmp               x10, x3
        cinc              w11, w11, ne
        cbz               w11, 1f
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        b                 2f
1:
        stlxp             w11, x4, x5, [x0]
        cbnz              w11, 0b
2:
        stp               x9, x10, [x8, #0x10]
        cmp               x10, x3
        ccmp              x9, x2, #0x0, eq
        cset              w9, ne
        stp               xzr, x9, [x8]
        ret

asm_test::compare_exchange_weak::u128::acquire_acquire:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        cset              w11, ne
        cmp               x10, x3
        cinc              w11, w11, ne
        cbz               w11, 1f
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        b                 2f
1:
        stxp              w11, x4, x5, [x0]
        cbnz              w11, 0b
2:
        stp               x9, x10, [x8, #0x10]
        cmp               x10, x3
        ccmp              x9, x2, #0x0, eq
        cset              w9, ne
        stp               xzr, x9, [x8]
        ret

asm_test::compare_exchange_weak::u128::acquire_relaxed:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        cset              w11, ne
        cmp               x10, x3
        cinc              w11, w11, ne
        cbz               w11, 1f
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        b                 2f
1:
        stxp              w11, x4, x5, [x0]
        cbnz              w11, 0b
2:
        stp               x9, x10, [x8, #0x10]
        cmp               x10, x3
        ccmp              x9, x2, #0x0, eq
        cset              w9, ne
        stp               xzr, x9, [x8]
        ret

asm_test::compare_exchange_weak::u128::relaxed_acquire:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        cset              w11, ne
        cmp               x10, x3
        cinc              w11, w11, ne
        cbz               w11, 1f
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        b                 2f
1:
        stxp              w11, x4, x5, [x0]
        cbnz              w11, 0b
2:
        stp               x9, x10, [x8, #0x10]
        cmp               x10, x3
        ccmp              x9, x2, #0x0, eq
        cset              w9, ne
        stp               xzr, x9, [x8]
        ret

asm_test::compare_exchange_weak::u128::relaxed_relaxed:
0:
        ldxp              x9, x10, [x0]
        cmp               x9, x2
        cset              w11, ne
        cmp               x10, x3
        cinc              w11, w11, ne
        cbz               w11, 1f
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        b                 2f
1:
        stxp              w11, x4, x5, [x0]
        cbnz              w11, 0b
2:
        stp               x9, x10, [x8, #0x10]
        cmp               x10, x3
        ccmp              x9, x2, #0x0, eq
        cset              w9, ne
        stp               xzr, x9, [x8]
        ret

asm_test::compare_exchange_weak::u128::release_acquire:
0:
        ldaxp             x9, x10, [x0]
        cmp               x9, x2
        cset              w11, ne
        cmp               x10, x3
        cinc              w11, w11, ne
        cbz               w11, 1f
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        b                 2f
1:
        stlxp             w11, x4, x5, [x0]
        cbnz              w11, 0b
2:
        stp               x9, x10, [x8, #0x10]
        cmp               x10, x3
        ccmp              x9, x2, #0x0, eq
        cset              w9, ne
        stp               xzr, x9, [x8]
        ret

asm_test::compare_exchange_weak::u128::release_relaxed:
0:
        ldxp              x9, x10, [x0]
        cmp               x9, x2
        cset              w11, ne
        cmp               x10, x3
        cinc              w11, w11, ne
        cbz               w11, 1f
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        b                 2f
1:
        stlxp             w11, x4, x5, [x0]
        cbnz              w11, 0b
2:
        stp               x9, x10, [x8, #0x10]
        cmp               x10, x3
        ccmp              x9, x2, #0x0, eq
        cset              w9, ne
        stp               xzr, x9, [x8]
        ret

asm_test::or::u8::acqrel:
0:
        ldaxrb            w8, [x0]
        orr               w8, w8, w1
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::or::u8::seqcst:
0:
        ldaxrb            w8, [x0]
        orr               w8, w8, w1
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::or::u8::acquire:
0:
        ldaxrb            w8, [x0]
        orr               w8, w8, w1
        stxrb             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::or::u8::relaxed:
0:
        ldxrb             w8, [x0]
        orr               w8, w8, w1
        stxrb             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::or::u8::release:
0:
        ldxrb             w8, [x0]
        orr               w8, w8, w1
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::or::u16::acqrel:
0:
        ldaxrh            w8, [x0]
        orr               w8, w8, w1
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::or::u16::seqcst:
0:
        ldaxrh            w8, [x0]
        orr               w8, w8, w1
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::or::u16::acquire:
0:
        ldaxrh            w8, [x0]
        orr               w8, w8, w1
        stxrh             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::or::u16::relaxed:
0:
        ldxrh             w8, [x0]
        orr               w8, w8, w1
        stxrh             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::or::u16::release:
0:
        ldxrh             w8, [x0]
        orr               w8, w8, w1
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::or::u32::acqrel:
0:
        ldaxr             w8, [x0]
        orr               w8, w8, w1
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::or::u32::seqcst:
0:
        ldaxr             w8, [x0]
        orr               w8, w8, w1
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::or::u32::acquire:
0:
        ldaxr             w8, [x0]
        orr               w8, w8, w1
        stxr              w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::or::u32::relaxed:
0:
        ldxr              w8, [x0]
        orr               w8, w8, w1
        stxr              w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::or::u32::release:
0:
        ldxr              w8, [x0]
        orr               w8, w8, w1
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::or::u64::acqrel:
0:
        ldaxr             x8, [x0]
        orr               x8, x8, x1
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
        ret

asm_test::or::u64::seqcst:
0:
        ldaxr             x8, [x0]
        orr               x8, x8, x1
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
        ret

asm_test::or::u64::acquire:
0:
        ldaxr             x8, [x0]
        orr               x8, x8, x1
        stxr              w9, x8, [x0]
        cbnz              w9, 0b
        ret

asm_test::or::u64::relaxed:
0:
        ldxr              x8, [x0]
        orr               x8, x8, x1
        stxr              w9, x8, [x0]
        cbnz              w9, 0b
        ret

asm_test::or::u64::release:
0:
        ldxr              x8, [x0]
        orr               x8, x8, x1
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
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

asm_test::add::u8::acqrel:
0:
        ldaxrb            w8, [x0]
        add               w8, w8, w1
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::add::u8::seqcst:
0:
        ldaxrb            w8, [x0]
        add               w8, w8, w1
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::add::u8::acquire:
0:
        ldaxrb            w8, [x0]
        add               w8, w8, w1
        stxrb             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::add::u8::relaxed:
0:
        ldxrb             w8, [x0]
        add               w8, w8, w1
        stxrb             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::add::u8::release:
0:
        ldxrb             w8, [x0]
        add               w8, w8, w1
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::add::u16::acqrel:
0:
        ldaxrh            w8, [x0]
        add               w8, w8, w1
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::add::u16::seqcst:
0:
        ldaxrh            w8, [x0]
        add               w8, w8, w1
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::add::u16::acquire:
0:
        ldaxrh            w8, [x0]
        add               w8, w8, w1
        stxrh             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::add::u16::relaxed:
0:
        ldxrh             w8, [x0]
        add               w8, w8, w1
        stxrh             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::add::u16::release:
0:
        ldxrh             w8, [x0]
        add               w8, w8, w1
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::add::u32::acqrel:
0:
        ldaxr             w8, [x0]
        add               w8, w8, w1
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::add::u32::seqcst:
0:
        ldaxr             w8, [x0]
        add               w8, w8, w1
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::add::u32::acquire:
0:
        ldaxr             w8, [x0]
        add               w8, w8, w1
        stxr              w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::add::u32::relaxed:
0:
        ldxr              w8, [x0]
        add               w8, w8, w1
        stxr              w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::add::u32::release:
0:
        ldxr              w8, [x0]
        add               w8, w8, w1
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::add::u64::acqrel:
0:
        ldaxr             x8, [x0]
        add               x8, x8, x1
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
        ret

asm_test::add::u64::seqcst:
0:
        ldaxr             x8, [x0]
        add               x8, x8, x1
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
        ret

asm_test::add::u64::acquire:
0:
        ldaxr             x8, [x0]
        add               x8, x8, x1
        stxr              w9, x8, [x0]
        cbnz              w9, 0b
        ret

asm_test::add::u64::relaxed:
0:
        ldxr              x8, [x0]
        add               x8, x8, x1
        stxr              w9, x8, [x0]
        cbnz              w9, 0b
        ret

asm_test::add::u64::release:
0:
        ldxr              x8, [x0]
        add               x8, x8, x1
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
        ret

asm_test::add::u128::acqrel:
0:
        ldaxp             x8, x9, [x0]
        adds              x11, x9, x3
        adc               x10, x8, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::add::u128::seqcst:
0:
        ldaxp             x8, x9, [x0]
        adds              x11, x9, x3
        adc               x10, x8, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::add::u128::acquire:
0:
        ldaxp             x8, x9, [x0]
        adds              x11, x9, x3
        adc               x10, x8, x2
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::add::u128::relaxed:
0:
        ldxp              x8, x9, [x0]
        adds              x11, x9, x3
        adc               x10, x8, x2
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::add::u128::release:
0:
        ldxp              x8, x9, [x0]
        adds              x11, x9, x3
        adc               x10, x8, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::and::u8::acqrel:
0:
        ldaxrb            w8, [x0]
        and               w8, w8, w1
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::and::u8::seqcst:
0:
        ldaxrb            w8, [x0]
        and               w8, w8, w1
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::and::u8::acquire:
0:
        ldaxrb            w8, [x0]
        and               w8, w8, w1
        stxrb             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::and::u8::relaxed:
0:
        ldxrb             w8, [x0]
        and               w8, w8, w1
        stxrb             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::and::u8::release:
0:
        ldxrb             w8, [x0]
        and               w8, w8, w1
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::and::u16::acqrel:
0:
        ldaxrh            w8, [x0]
        and               w8, w8, w1
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::and::u16::seqcst:
0:
        ldaxrh            w8, [x0]
        and               w8, w8, w1
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::and::u16::acquire:
0:
        ldaxrh            w8, [x0]
        and               w8, w8, w1
        stxrh             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::and::u16::relaxed:
0:
        ldxrh             w8, [x0]
        and               w8, w8, w1
        stxrh             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::and::u16::release:
0:
        ldxrh             w8, [x0]
        and               w8, w8, w1
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::and::u32::acqrel:
0:
        ldaxr             w8, [x0]
        and               w8, w8, w1
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::and::u32::seqcst:
0:
        ldaxr             w8, [x0]
        and               w8, w8, w1
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::and::u32::acquire:
0:
        ldaxr             w8, [x0]
        and               w8, w8, w1
        stxr              w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::and::u32::relaxed:
0:
        ldxr              w8, [x0]
        and               w8, w8, w1
        stxr              w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::and::u32::release:
0:
        ldxr              w8, [x0]
        and               w8, w8, w1
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::and::u64::acqrel:
0:
        ldaxr             x8, [x0]
        and               x8, x8, x1
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
        ret

asm_test::and::u64::seqcst:
0:
        ldaxr             x8, [x0]
        and               x8, x8, x1
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
        ret

asm_test::and::u64::acquire:
0:
        ldaxr             x8, [x0]
        and               x8, x8, x1
        stxr              w9, x8, [x0]
        cbnz              w9, 0b
        ret

asm_test::and::u64::relaxed:
0:
        ldxr              x8, [x0]
        and               x8, x8, x1
        stxr              w9, x8, [x0]
        cbnz              w9, 0b
        ret

asm_test::and::u64::release:
0:
        ldxr              x8, [x0]
        and               x8, x8, x1
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
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
        ldrb              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        tbnz              wzr, #0x0, 2f
1:
        ldaxrb            w8, [x0]
        cmp               w8, w9, uxtb
        b.ne              0b
        neg               w9, w9
        stlxrb            w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               w9, w8
        tbz               w10, #0x0, 1b
2:
        ret

asm_test::neg::u8::seqcst:
        ldrb              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        tbnz              wzr, #0x0, 2f
1:
        ldaxrb            w8, [x0]
        cmp               w8, w9, uxtb
        b.ne              0b
        neg               w9, w9
        stlxrb            w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               w9, w8
        tbz               w10, #0x0, 1b
2:
        ret

asm_test::neg::u8::acquire:
        ldrb              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        tbnz              wzr, #0x0, 2f
1:
        ldaxrb            w8, [x0]
        cmp               w8, w9, uxtb
        b.ne              0b
        neg               w9, w9
        stxrb             w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               w9, w8
        tbz               w10, #0x0, 1b
2:
        ret

asm_test::neg::u8::relaxed:
        ldrb              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        tbnz              wzr, #0x0, 2f
1:
        ldxrb             w8, [x0]
        cmp               w8, w9, uxtb
        b.ne              0b
        neg               w9, w9
        stxrb             w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               w9, w8
        tbz               w10, #0x0, 1b
2:
        ret

asm_test::neg::u8::release:
        ldrb              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        tbnz              wzr, #0x0, 2f
1:
        ldxrb             w8, [x0]
        cmp               w8, w9, uxtb
        b.ne              0b
        neg               w9, w9
        stlxrb            w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               w9, w8
        tbz               w10, #0x0, 1b
2:
        ret

asm_test::neg::u16::acqrel:
        ldrh              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        tbnz              wzr, #0x0, 2f
1:
        ldaxrh            w8, [x0]
        cmp               w8, w9, uxth
        b.ne              0b
        neg               w9, w9
        stlxrh            w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               w9, w8
        tbz               w10, #0x0, 1b
2:
        ret

asm_test::neg::u16::seqcst:
        ldrh              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        tbnz              wzr, #0x0, 2f
1:
        ldaxrh            w8, [x0]
        cmp               w8, w9, uxth
        b.ne              0b
        neg               w9, w9
        stlxrh            w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               w9, w8
        tbz               w10, #0x0, 1b
2:
        ret

asm_test::neg::u16::acquire:
        ldrh              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        tbnz              wzr, #0x0, 2f
1:
        ldaxrh            w8, [x0]
        cmp               w8, w9, uxth
        b.ne              0b
        neg               w9, w9
        stxrh             w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               w9, w8
        tbz               w10, #0x0, 1b
2:
        ret

asm_test::neg::u16::relaxed:
        ldrh              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        tbnz              wzr, #0x0, 2f
1:
        ldxrh             w8, [x0]
        cmp               w8, w9, uxth
        b.ne              0b
        neg               w9, w9
        stxrh             w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               w9, w8
        tbz               w10, #0x0, 1b
2:
        ret

asm_test::neg::u16::release:
        ldrh              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        tbnz              wzr, #0x0, 2f
1:
        ldxrh             w8, [x0]
        cmp               w8, w9, uxth
        b.ne              0b
        neg               w9, w9
        stlxrh            w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               w9, w8
        tbz               w10, #0x0, 1b
2:
        ret

asm_test::neg::u32::acqrel:
        ldr               w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        tbnz              wzr, #0x0, 2f
1:
        ldaxr             w8, [x0]
        cmp               w8, w9
        b.ne              0b
        neg               w9, w9
        stlxr             w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               w9, w8
        tbz               w10, #0x0, 1b
2:
        ret

asm_test::neg::u32::seqcst:
        ldr               w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        tbnz              wzr, #0x0, 2f
1:
        ldaxr             w8, [x0]
        cmp               w8, w9
        b.ne              0b
        neg               w9, w9
        stlxr             w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               w9, w8
        tbz               w10, #0x0, 1b
2:
        ret

asm_test::neg::u32::acquire:
        ldr               w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        tbnz              wzr, #0x0, 2f
1:
        ldaxr             w8, [x0]
        cmp               w8, w9
        b.ne              0b
        neg               w9, w9
        stxr              w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               w9, w8
        tbz               w10, #0x0, 1b
2:
        ret

asm_test::neg::u32::relaxed:
        ldr               w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        tbnz              wzr, #0x0, 2f
1:
        ldxr              w8, [x0]
        cmp               w8, w9
        b.ne              0b
        neg               w9, w9
        stxr              w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               w9, w8
        tbz               w10, #0x0, 1b
2:
        ret

asm_test::neg::u32::release:
        ldr               w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        tbnz              wzr, #0x0, 2f
1:
        ldxr              w8, [x0]
        cmp               w8, w9
        b.ne              0b
        neg               w9, w9
        stlxr             w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               w9, w8
        tbz               w10, #0x0, 1b
2:
        ret

asm_test::neg::u64::acqrel:
        ldr               x9, [x0]
        b                 1f
0:
        clrex
        mov               x9, x8
        tbnz              wzr, #0x0, 2f
1:
        ldaxr             x8, [x0]
        cmp               x8, x9
        b.ne              0b
        neg               x9, x9
        stlxr             w10, x9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               x9, x8
        tbz               w10, #0x0, 1b
2:
        ret

asm_test::neg::u64::seqcst:
        ldr               x9, [x0]
        b                 1f
0:
        clrex
        mov               x9, x8
        tbnz              wzr, #0x0, 2f
1:
        ldaxr             x8, [x0]
        cmp               x8, x9
        b.ne              0b
        neg               x9, x9
        stlxr             w10, x9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               x9, x8
        tbz               w10, #0x0, 1b
2:
        ret

asm_test::neg::u64::acquire:
        ldr               x9, [x0]
        b                 1f
0:
        clrex
        mov               x9, x8
        tbnz              wzr, #0x0, 2f
1:
        ldaxr             x8, [x0]
        cmp               x8, x9
        b.ne              0b
        neg               x9, x9
        stxr              w10, x9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               x9, x8
        tbz               w10, #0x0, 1b
2:
        ret

asm_test::neg::u64::relaxed:
        ldr               x9, [x0]
        b                 1f
0:
        clrex
        mov               x9, x8
        tbnz              wzr, #0x0, 2f
1:
        ldxr              x8, [x0]
        cmp               x8, x9
        b.ne              0b
        neg               x9, x9
        stxr              w10, x9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               x9, x8
        tbz               w10, #0x0, 1b
2:
        ret

asm_test::neg::u64::release:
        ldr               x9, [x0]
        b                 1f
0:
        clrex
        mov               x9, x8
        tbnz              wzr, #0x0, 2f
1:
        ldxr              x8, [x0]
        cmp               x8, x9
        b.ne              0b
        neg               x9, x9
        stlxr             w10, x9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               x9, x8
        tbz               w10, #0x0, 1b
2:
        ret

asm_test::neg::u128::acqrel:
0:
        ldaxp             x8, x9, [x0]
        negs              x11, x9
        ngc               x10, x8
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::neg::u128::seqcst:
0:
        ldaxp             x8, x9, [x0]
        negs              x11, x9
        ngc               x10, x8
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::neg::u128::acquire:
0:
        ldaxp             x8, x9, [x0]
        negs              x11, x9
        ngc               x10, x8
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::neg::u128::relaxed:
0:
        ldxp              x8, x9, [x0]
        negs              x11, x9
        ngc               x10, x8
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::neg::u128::release:
0:
        ldxp              x8, x9, [x0]
        negs              x11, x9
        ngc               x10, x8
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::not::u8::acqrel:
0:
        ldaxrb            w8, [x0]
        mvn               w8, w8
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::not::u8::seqcst:
0:
        ldaxrb            w8, [x0]
        mvn               w8, w8
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::not::u8::acquire:
0:
        ldaxrb            w8, [x0]
        mvn               w8, w8
        stxrb             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::not::u8::relaxed:
0:
        ldxrb             w8, [x0]
        mvn               w8, w8
        stxrb             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::not::u8::release:
0:
        ldxrb             w8, [x0]
        mvn               w8, w8
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::not::u16::acqrel:
0:
        ldaxrh            w8, [x0]
        mvn               w8, w8
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::not::u16::seqcst:
0:
        ldaxrh            w8, [x0]
        mvn               w8, w8
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::not::u16::acquire:
0:
        ldaxrh            w8, [x0]
        mvn               w8, w8
        stxrh             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::not::u16::relaxed:
0:
        ldxrh             w8, [x0]
        mvn               w8, w8
        stxrh             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::not::u16::release:
0:
        ldxrh             w8, [x0]
        mvn               w8, w8
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::not::u32::acqrel:
0:
        ldaxr             w8, [x0]
        mvn               w8, w8
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::not::u32::seqcst:
0:
        ldaxr             w8, [x0]
        mvn               w8, w8
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::not::u32::acquire:
0:
        ldaxr             w8, [x0]
        mvn               w8, w8
        stxr              w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::not::u32::relaxed:
0:
        ldxr              w8, [x0]
        mvn               w8, w8
        stxr              w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::not::u32::release:
0:
        ldxr              w8, [x0]
        mvn               w8, w8
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::not::u64::acqrel:
0:
        ldaxr             x8, [x0]
        mvn               x8, x8
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
        ret

asm_test::not::u64::seqcst:
0:
        ldaxr             x8, [x0]
        mvn               x8, x8
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
        ret

asm_test::not::u64::acquire:
0:
        ldaxr             x8, [x0]
        mvn               x8, x8
        stxr              w9, x8, [x0]
        cbnz              w9, 0b
        ret

asm_test::not::u64::relaxed:
0:
        ldxr              x8, [x0]
        mvn               x8, x8
        stxr              w9, x8, [x0]
        cbnz              w9, 0b
        ret

asm_test::not::u64::release:
0:
        ldxr              x8, [x0]
        mvn               x8, x8
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
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

asm_test::sub::u8::acqrel:
0:
        ldaxrb            w8, [x0]
        sub               w8, w8, w1
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::sub::u8::seqcst:
0:
        ldaxrb            w8, [x0]
        sub               w8, w8, w1
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::sub::u8::acquire:
0:
        ldaxrb            w8, [x0]
        sub               w8, w8, w1
        stxrb             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::sub::u8::relaxed:
0:
        ldxrb             w8, [x0]
        sub               w8, w8, w1
        stxrb             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::sub::u8::release:
0:
        ldxrb             w8, [x0]
        sub               w8, w8, w1
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::sub::u16::acqrel:
0:
        ldaxrh            w8, [x0]
        sub               w8, w8, w1
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::sub::u16::seqcst:
0:
        ldaxrh            w8, [x0]
        sub               w8, w8, w1
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::sub::u16::acquire:
0:
        ldaxrh            w8, [x0]
        sub               w8, w8, w1
        stxrh             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::sub::u16::relaxed:
0:
        ldxrh             w8, [x0]
        sub               w8, w8, w1
        stxrh             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::sub::u16::release:
0:
        ldxrh             w8, [x0]
        sub               w8, w8, w1
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::sub::u32::acqrel:
0:
        ldaxr             w8, [x0]
        sub               w8, w8, w1
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::sub::u32::seqcst:
0:
        ldaxr             w8, [x0]
        sub               w8, w8, w1
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::sub::u32::acquire:
0:
        ldaxr             w8, [x0]
        sub               w8, w8, w1
        stxr              w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::sub::u32::relaxed:
0:
        ldxr              w8, [x0]
        sub               w8, w8, w1
        stxr              w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::sub::u32::release:
0:
        ldxr              w8, [x0]
        sub               w8, w8, w1
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::sub::u64::acqrel:
0:
        ldaxr             x8, [x0]
        sub               x8, x8, x1
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
        ret

asm_test::sub::u64::seqcst:
0:
        ldaxr             x8, [x0]
        sub               x8, x8, x1
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
        ret

asm_test::sub::u64::acquire:
0:
        ldaxr             x8, [x0]
        sub               x8, x8, x1
        stxr              w9, x8, [x0]
        cbnz              w9, 0b
        ret

asm_test::sub::u64::relaxed:
0:
        ldxr              x8, [x0]
        sub               x8, x8, x1
        stxr              w9, x8, [x0]
        cbnz              w9, 0b
        ret

asm_test::sub::u64::release:
0:
        ldxr              x8, [x0]
        sub               x8, x8, x1
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
        ret

asm_test::sub::u128::acqrel:
0:
        ldaxp             x8, x9, [x0]
        subs              x11, x9, x3
        sbc               x10, x8, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::sub::u128::seqcst:
0:
        ldaxp             x8, x9, [x0]
        subs              x11, x9, x3
        sbc               x10, x8, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::sub::u128::acquire:
0:
        ldaxp             x8, x9, [x0]
        subs              x11, x9, x3
        sbc               x10, x8, x2
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::sub::u128::relaxed:
0:
        ldxp              x8, x9, [x0]
        subs              x11, x9, x3
        sbc               x10, x8, x2
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::sub::u128::release:
0:
        ldxp              x8, x9, [x0]
        subs              x11, x9, x3
        sbc               x10, x8, x2
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

asm_test::xor::u8::acqrel:
0:
        ldaxrb            w8, [x0]
        eor               w8, w8, w1
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::xor::u8::seqcst:
0:
        ldaxrb            w8, [x0]
        eor               w8, w8, w1
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::xor::u8::acquire:
0:
        ldaxrb            w8, [x0]
        eor               w8, w8, w1
        stxrb             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::xor::u8::relaxed:
0:
        ldxrb             w8, [x0]
        eor               w8, w8, w1
        stxrb             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::xor::u8::release:
0:
        ldxrb             w8, [x0]
        eor               w8, w8, w1
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::xor::u16::acqrel:
0:
        ldaxrh            w8, [x0]
        eor               w8, w8, w1
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::xor::u16::seqcst:
0:
        ldaxrh            w8, [x0]
        eor               w8, w8, w1
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::xor::u16::acquire:
0:
        ldaxrh            w8, [x0]
        eor               w8, w8, w1
        stxrh             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::xor::u16::relaxed:
0:
        ldxrh             w8, [x0]
        eor               w8, w8, w1
        stxrh             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::xor::u16::release:
0:
        ldxrh             w8, [x0]
        eor               w8, w8, w1
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::xor::u32::acqrel:
0:
        ldaxr             w8, [x0]
        eor               w8, w8, w1
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::xor::u32::seqcst:
0:
        ldaxr             w8, [x0]
        eor               w8, w8, w1
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::xor::u32::acquire:
0:
        ldaxr             w8, [x0]
        eor               w8, w8, w1
        stxr              w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::xor::u32::relaxed:
0:
        ldxr              w8, [x0]
        eor               w8, w8, w1
        stxr              w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::xor::u32::release:
0:
        ldxr              w8, [x0]
        eor               w8, w8, w1
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        ret

asm_test::xor::u64::acqrel:
0:
        ldaxr             x8, [x0]
        eor               x8, x8, x1
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
        ret

asm_test::xor::u64::seqcst:
0:
        ldaxr             x8, [x0]
        eor               x8, x8, x1
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
        ret

asm_test::xor::u64::acquire:
0:
        ldaxr             x8, [x0]
        eor               x8, x8, x1
        stxr              w9, x8, [x0]
        cbnz              w9, 0b
        ret

asm_test::xor::u64::relaxed:
0:
        ldxr              x8, [x0]
        eor               x8, x8, x1
        stxr              w9, x8, [x0]
        cbnz              w9, 0b
        ret

asm_test::xor::u64::release:
0:
        ldxr              x8, [x0]
        eor               x8, x8, x1
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
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
        mov               x8, x0
0:
        ldaxrb            w0, [x8]
        stlxrb            w9, w1, [x8]
        cbnz              w9, 0b
        ret

asm_test::swap::u8::seqcst:
        mov               x8, x0
0:
        ldaxrb            w0, [x8]
        stlxrb            w9, w1, [x8]
        cbnz              w9, 0b
        ret

asm_test::swap::u8::acquire:
        mov               x8, x0
0:
        ldaxrb            w0, [x8]
        stxrb             w9, w1, [x8]
        cbnz              w9, 0b
        ret

asm_test::swap::u8::relaxed:
        mov               x8, x0
0:
        ldxrb             w0, [x8]
        stxrb             w9, w1, [x8]
        cbnz              w9, 0b
        ret

asm_test::swap::u8::release:
        mov               x8, x0
0:
        ldxrb             w0, [x8]
        stlxrb            w9, w1, [x8]
        cbnz              w9, 0b
        ret

asm_test::swap::u16::acqrel:
        mov               x8, x0
0:
        ldaxrh            w0, [x8]
        stlxrh            w9, w1, [x8]
        cbnz              w9, 0b
        ret

asm_test::swap::u16::seqcst:
        mov               x8, x0
0:
        ldaxrh            w0, [x8]
        stlxrh            w9, w1, [x8]
        cbnz              w9, 0b
        ret

asm_test::swap::u16::acquire:
        mov               x8, x0
0:
        ldaxrh            w0, [x8]
        stxrh             w9, w1, [x8]
        cbnz              w9, 0b
        ret

asm_test::swap::u16::relaxed:
        mov               x8, x0
0:
        ldxrh             w0, [x8]
        stxrh             w9, w1, [x8]
        cbnz              w9, 0b
        ret

asm_test::swap::u16::release:
        mov               x8, x0
0:
        ldxrh             w0, [x8]
        stlxrh            w9, w1, [x8]
        cbnz              w9, 0b
        ret

asm_test::swap::u32::acqrel:
        mov               x8, x0
0:
        ldaxr             w0, [x8]
        stlxr             w9, w1, [x8]
        cbnz              w9, 0b
        ret

asm_test::swap::u32::seqcst:
        mov               x8, x0
0:
        ldaxr             w0, [x8]
        stlxr             w9, w1, [x8]
        cbnz              w9, 0b
        ret

asm_test::swap::u32::acquire:
        mov               x8, x0
0:
        ldaxr             w0, [x8]
        stxr              w9, w1, [x8]
        cbnz              w9, 0b
        ret

asm_test::swap::u32::relaxed:
        mov               x8, x0
0:
        ldxr              w0, [x8]
        stxr              w9, w1, [x8]
        cbnz              w9, 0b
        ret

asm_test::swap::u32::release:
        mov               x8, x0
0:
        ldxr              w0, [x8]
        stlxr             w9, w1, [x8]
        cbnz              w9, 0b
        ret

asm_test::swap::u64::acqrel:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        stlxr             w9, x1, [x8]
        cbnz              w9, 0b
        ret

asm_test::swap::u64::seqcst:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        stlxr             w9, x1, [x8]
        cbnz              w9, 0b
        ret

asm_test::swap::u64::acquire:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        stxr              w9, x1, [x8]
        cbnz              w9, 0b
        ret

asm_test::swap::u64::relaxed:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        stxr              w9, x1, [x8]
        cbnz              w9, 0b
        ret

asm_test::swap::u64::release:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        stlxr             w9, x1, [x8]
        cbnz              w9, 0b
        ret

asm_test::swap::bool::acqrel:
        mov               w8, w1
0:
        ldaxrb            w9, [x0]
        stlxrb            w10, w8, [x0]
        cbnz              w10, 0b
        cmp               w9, #0x0
        cset              w0, ne
        ret

asm_test::swap::bool::seqcst:
        mov               w8, w1
0:
        ldaxrb            w9, [x0]
        stlxrb            w10, w8, [x0]
        cbnz              w10, 0b
        cmp               w9, #0x0
        cset              w0, ne
        ret

asm_test::swap::bool::acquire:
        mov               w8, w1
0:
        ldaxrb            w9, [x0]
        stxrb             w10, w8, [x0]
        cbnz              w10, 0b
        cmp               w9, #0x0
        cset              w0, ne
        ret

asm_test::swap::bool::relaxed:
        mov               w8, w1
0:
        ldxrb             w9, [x0]
        stxrb             w10, w8, [x0]
        cbnz              w10, 0b
        cmp               w9, #0x0
        cset              w0, ne
        ret

asm_test::swap::bool::release:
        mov               w8, w1
0:
        ldxrb             w9, [x0]
        stlxrb            w10, w8, [x0]
        cbnz              w10, 0b
        cmp               w9, #0x0
        cset              w0, ne
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

asm_test::fetch_or::u8::acqrel:
0:
        ldaxrb            w8, [x0]
        orr               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_or::u8::seqcst:
0:
        ldaxrb            w8, [x0]
        orr               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_or::u8::acquire:
0:
        ldaxrb            w8, [x0]
        orr               w9, w8, w1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_or::u8::relaxed:
0:
        ldxrb             w8, [x0]
        orr               w9, w8, w1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_or::u8::release:
0:
        ldxrb             w8, [x0]
        orr               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_or::u16::acqrel:
0:
        ldaxrh            w8, [x0]
        orr               w9, w8, w1
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_or::u16::seqcst:
0:
        ldaxrh            w8, [x0]
        orr               w9, w8, w1
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_or::u16::acquire:
0:
        ldaxrh            w8, [x0]
        orr               w9, w8, w1
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_or::u16::relaxed:
0:
        ldxrh             w8, [x0]
        orr               w9, w8, w1
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_or::u16::release:
0:
        ldxrh             w8, [x0]
        orr               w9, w8, w1
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_or::u32::acqrel:
0:
        ldaxr             w8, [x0]
        orr               w9, w8, w1
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_or::u32::seqcst:
0:
        ldaxr             w8, [x0]
        orr               w9, w8, w1
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_or::u32::acquire:
0:
        ldaxr             w8, [x0]
        orr               w9, w8, w1
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_or::u32::relaxed:
0:
        ldxr              w8, [x0]
        orr               w9, w8, w1
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_or::u32::release:
0:
        ldxr              w8, [x0]
        orr               w9, w8, w1
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_or::u64::acqrel:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        orr               x9, x0, x1
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_or::u64::seqcst:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        orr               x9, x0, x1
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_or::u64::acquire:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        orr               x9, x0, x1
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_or::u64::relaxed:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        orr               x9, x0, x1
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_or::u64::release:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        orr               x9, x0, x1
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_or::bool::acqrel:
0:
        ldaxrb            w8, [x0]
        orr               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_or::bool::seqcst:
0:
        ldaxrb            w8, [x0]
        orr               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_or::bool::acquire:
0:
        ldaxrb            w8, [x0]
        orr               w9, w8, w1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_or::bool::relaxed:
0:
        ldxrb             w8, [x0]
        orr               w9, w8, w1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_or::bool::release:
0:
        ldxrb             w8, [x0]
        orr               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
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

asm_test::fetch_add::u8::acqrel:
0:
        ldaxrb            w8, [x0]
        add               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_add::u8::seqcst:
0:
        ldaxrb            w8, [x0]
        add               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_add::u8::acquire:
0:
        ldaxrb            w8, [x0]
        add               w9, w8, w1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_add::u8::relaxed:
0:
        ldxrb             w8, [x0]
        add               w9, w8, w1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_add::u8::release:
0:
        ldxrb             w8, [x0]
        add               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_add::u16::acqrel:
0:
        ldaxrh            w8, [x0]
        add               w9, w8, w1
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_add::u16::seqcst:
0:
        ldaxrh            w8, [x0]
        add               w9, w8, w1
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_add::u16::acquire:
0:
        ldaxrh            w8, [x0]
        add               w9, w8, w1
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_add::u16::relaxed:
0:
        ldxrh             w8, [x0]
        add               w9, w8, w1
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_add::u16::release:
0:
        ldxrh             w8, [x0]
        add               w9, w8, w1
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_add::u32::acqrel:
0:
        ldaxr             w8, [x0]
        add               w9, w8, w1
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_add::u32::seqcst:
0:
        ldaxr             w8, [x0]
        add               w9, w8, w1
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_add::u32::acquire:
0:
        ldaxr             w8, [x0]
        add               w9, w8, w1
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_add::u32::relaxed:
0:
        ldxr              w8, [x0]
        add               w9, w8, w1
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_add::u32::release:
0:
        ldxr              w8, [x0]
        add               w9, w8, w1
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_add::u64::acqrel:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        add               x9, x0, x1
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_add::u64::seqcst:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        add               x9, x0, x1
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_add::u64::acquire:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        add               x9, x0, x1
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_add::u64::relaxed:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        add               x9, x0, x1
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_add::u64::release:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        add               x9, x0, x1
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_add::u128::acqrel:
0:
        ldaxp             x8, x1, [x0]
        adds              x10, x1, x3
        adc               x9, x8, x2
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_add::u128::seqcst:
0:
        ldaxp             x8, x1, [x0]
        adds              x10, x1, x3
        adc               x9, x8, x2
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_add::u128::acquire:
0:
        ldaxp             x8, x1, [x0]
        adds              x10, x1, x3
        adc               x9, x8, x2
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_add::u128::relaxed:
0:
        ldxp              x8, x1, [x0]
        adds              x10, x1, x3
        adc               x9, x8, x2
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_add::u128::release:
0:
        ldxp              x8, x1, [x0]
        adds              x10, x1, x3
        adc               x9, x8, x2
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_and::u8::acqrel:
0:
        ldaxrb            w8, [x0]
        and               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_and::u8::seqcst:
0:
        ldaxrb            w8, [x0]
        and               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_and::u8::acquire:
0:
        ldaxrb            w8, [x0]
        and               w9, w8, w1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_and::u8::relaxed:
0:
        ldxrb             w8, [x0]
        and               w9, w8, w1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_and::u8::release:
0:
        ldxrb             w8, [x0]
        and               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_and::u16::acqrel:
0:
        ldaxrh            w8, [x0]
        and               w9, w8, w1
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_and::u16::seqcst:
0:
        ldaxrh            w8, [x0]
        and               w9, w8, w1
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_and::u16::acquire:
0:
        ldaxrh            w8, [x0]
        and               w9, w8, w1
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_and::u16::relaxed:
0:
        ldxrh             w8, [x0]
        and               w9, w8, w1
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_and::u16::release:
0:
        ldxrh             w8, [x0]
        and               w9, w8, w1
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_and::u32::acqrel:
0:
        ldaxr             w8, [x0]
        and               w9, w8, w1
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_and::u32::seqcst:
0:
        ldaxr             w8, [x0]
        and               w9, w8, w1
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_and::u32::acquire:
0:
        ldaxr             w8, [x0]
        and               w9, w8, w1
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_and::u32::relaxed:
0:
        ldxr              w8, [x0]
        and               w9, w8, w1
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_and::u32::release:
0:
        ldxr              w8, [x0]
        and               w9, w8, w1
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_and::u64::acqrel:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        and               x9, x0, x1
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_and::u64::seqcst:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        and               x9, x0, x1
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_and::u64::acquire:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        and               x9, x0, x1
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_and::u64::relaxed:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        and               x9, x0, x1
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_and::u64::release:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        and               x9, x0, x1
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_and::bool::acqrel:
0:
        ldaxrb            w8, [x0]
        and               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_and::bool::seqcst:
0:
        ldaxrb            w8, [x0]
        and               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_and::bool::acquire:
0:
        ldaxrb            w8, [x0]
        and               w9, w8, w1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_and::bool::relaxed:
0:
        ldxrb             w8, [x0]
        and               w9, w8, w1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_and::bool::release:
0:
        ldxrb             w8, [x0]
        and               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
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
        cmp               x3, x1
        sbcs              xzr, x2, x8
        csel              x10, x1, x3, lt
        csel              x9, x8, x2, lt
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_max::i128::seqcst:
0:
        ldaxp             x8, x1, [x0]
        cmp               x3, x1
        sbcs              xzr, x2, x8
        csel              x10, x1, x3, lt
        csel              x9, x8, x2, lt
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_max::i128::acquire:
0:
        ldaxp             x8, x1, [x0]
        cmp               x3, x1
        sbcs              xzr, x2, x8
        csel              x10, x1, x3, lt
        csel              x9, x8, x2, lt
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_max::i128::relaxed:
0:
        ldxp              x8, x1, [x0]
        cmp               x3, x1
        sbcs              xzr, x2, x8
        csel              x10, x1, x3, lt
        csel              x9, x8, x2, lt
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_max::i128::release:
0:
        ldxp              x8, x1, [x0]
        cmp               x3, x1
        sbcs              xzr, x2, x8
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
        cmp               x3, x1
        sbcs              xzr, x2, x8
        csel              x10, x1, x3, ge
        csel              x9, x8, x2, ge
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_min::i128::seqcst:
0:
        ldaxp             x8, x1, [x0]
        cmp               x3, x1
        sbcs              xzr, x2, x8
        csel              x10, x1, x3, ge
        csel              x9, x8, x2, ge
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_min::i128::acquire:
0:
        ldaxp             x8, x1, [x0]
        cmp               x3, x1
        sbcs              xzr, x2, x8
        csel              x10, x1, x3, ge
        csel              x9, x8, x2, ge
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_min::i128::relaxed:
0:
        ldxp              x8, x1, [x0]
        cmp               x3, x1
        sbcs              xzr, x2, x8
        csel              x10, x1, x3, ge
        csel              x9, x8, x2, ge
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_min::i128::release:
0:
        ldxp              x8, x1, [x0]
        cmp               x3, x1
        sbcs              xzr, x2, x8
        csel              x10, x1, x3, ge
        csel              x9, x8, x2, ge
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_neg::u8::acqrel:
        ldrb              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        tbnz              wzr, #0x0, 2f
1:
        ldaxrb            w8, [x0]
        cmp               w8, w9, uxtb
        b.ne              0b
        neg               w9, w9
        stlxrb            w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               w9, w8
        tbz               w10, #0x0, 1b
2:
        mov               w0, w8
        ret

asm_test::fetch_neg::u8::seqcst:
        ldrb              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        tbnz              wzr, #0x0, 2f
1:
        ldaxrb            w8, [x0]
        cmp               w8, w9, uxtb
        b.ne              0b
        neg               w9, w9
        stlxrb            w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               w9, w8
        tbz               w10, #0x0, 1b
2:
        mov               w0, w8
        ret

asm_test::fetch_neg::u8::acquire:
        ldrb              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        tbnz              wzr, #0x0, 2f
1:
        ldaxrb            w8, [x0]
        cmp               w8, w9, uxtb
        b.ne              0b
        neg               w9, w9
        stxrb             w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               w9, w8
        tbz               w10, #0x0, 1b
2:
        mov               w0, w8
        ret

asm_test::fetch_neg::u8::relaxed:
        ldrb              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        tbnz              wzr, #0x0, 2f
1:
        ldxrb             w8, [x0]
        cmp               w8, w9, uxtb
        b.ne              0b
        neg               w9, w9
        stxrb             w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               w9, w8
        tbz               w10, #0x0, 1b
2:
        mov               w0, w8
        ret

asm_test::fetch_neg::u8::release:
        ldrb              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        tbnz              wzr, #0x0, 2f
1:
        ldxrb             w8, [x0]
        cmp               w8, w9, uxtb
        b.ne              0b
        neg               w9, w9
        stlxrb            w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               w9, w8
        tbz               w10, #0x0, 1b
2:
        mov               w0, w8
        ret

asm_test::fetch_neg::u16::acqrel:
        ldrh              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        tbnz              wzr, #0x0, 2f
1:
        ldaxrh            w8, [x0]
        cmp               w8, w9, uxth
        b.ne              0b
        neg               w9, w9
        stlxrh            w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               w9, w8
        tbz               w10, #0x0, 1b
2:
        mov               w0, w8
        ret

asm_test::fetch_neg::u16::seqcst:
        ldrh              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        tbnz              wzr, #0x0, 2f
1:
        ldaxrh            w8, [x0]
        cmp               w8, w9, uxth
        b.ne              0b
        neg               w9, w9
        stlxrh            w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               w9, w8
        tbz               w10, #0x0, 1b
2:
        mov               w0, w8
        ret

asm_test::fetch_neg::u16::acquire:
        ldrh              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        tbnz              wzr, #0x0, 2f
1:
        ldaxrh            w8, [x0]
        cmp               w8, w9, uxth
        b.ne              0b
        neg               w9, w9
        stxrh             w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               w9, w8
        tbz               w10, #0x0, 1b
2:
        mov               w0, w8
        ret

asm_test::fetch_neg::u16::relaxed:
        ldrh              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        tbnz              wzr, #0x0, 2f
1:
        ldxrh             w8, [x0]
        cmp               w8, w9, uxth
        b.ne              0b
        neg               w9, w9
        stxrh             w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               w9, w8
        tbz               w10, #0x0, 1b
2:
        mov               w0, w8
        ret

asm_test::fetch_neg::u16::release:
        ldrh              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        tbnz              wzr, #0x0, 2f
1:
        ldxrh             w8, [x0]
        cmp               w8, w9, uxth
        b.ne              0b
        neg               w9, w9
        stlxrh            w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               w9, w8
        tbz               w10, #0x0, 1b
2:
        mov               w0, w8
        ret

asm_test::fetch_neg::u32::acqrel:
        ldr               w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        tbnz              wzr, #0x0, 2f
1:
        ldaxr             w8, [x0]
        cmp               w8, w9
        b.ne              0b
        neg               w9, w9
        stlxr             w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               w9, w8
        tbz               w10, #0x0, 1b
2:
        mov               w0, w8
        ret

asm_test::fetch_neg::u32::seqcst:
        ldr               w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        tbnz              wzr, #0x0, 2f
1:
        ldaxr             w8, [x0]
        cmp               w8, w9
        b.ne              0b
        neg               w9, w9
        stlxr             w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               w9, w8
        tbz               w10, #0x0, 1b
2:
        mov               w0, w8
        ret

asm_test::fetch_neg::u32::acquire:
        ldr               w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        tbnz              wzr, #0x0, 2f
1:
        ldaxr             w8, [x0]
        cmp               w8, w9
        b.ne              0b
        neg               w9, w9
        stxr              w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               w9, w8
        tbz               w10, #0x0, 1b
2:
        mov               w0, w8
        ret

asm_test::fetch_neg::u32::relaxed:
        ldr               w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        tbnz              wzr, #0x0, 2f
1:
        ldxr              w8, [x0]
        cmp               w8, w9
        b.ne              0b
        neg               w9, w9
        stxr              w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               w9, w8
        tbz               w10, #0x0, 1b
2:
        mov               w0, w8
        ret

asm_test::fetch_neg::u32::release:
        ldr               w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        tbnz              wzr, #0x0, 2f
1:
        ldxr              w8, [x0]
        cmp               w8, w9
        b.ne              0b
        neg               w9, w9
        stlxr             w10, w9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               w9, w8
        tbz               w10, #0x0, 1b
2:
        mov               w0, w8
        ret

asm_test::fetch_neg::u64::acqrel:
        ldr               x9, [x0]
        b                 1f
0:
        clrex
        mov               x9, x8
        tbnz              wzr, #0x0, 2f
1:
        ldaxr             x8, [x0]
        cmp               x8, x9
        b.ne              0b
        neg               x9, x9
        stlxr             w10, x9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               x9, x8
        tbz               w10, #0x0, 1b
2:
        mov               x0, x8
        ret

asm_test::fetch_neg::u64::seqcst:
        ldr               x9, [x0]
        b                 1f
0:
        clrex
        mov               x9, x8
        tbnz              wzr, #0x0, 2f
1:
        ldaxr             x8, [x0]
        cmp               x8, x9
        b.ne              0b
        neg               x9, x9
        stlxr             w10, x9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               x9, x8
        tbz               w10, #0x0, 1b
2:
        mov               x0, x8
        ret

asm_test::fetch_neg::u64::acquire:
        ldr               x9, [x0]
        b                 1f
0:
        clrex
        mov               x9, x8
        tbnz              wzr, #0x0, 2f
1:
        ldaxr             x8, [x0]
        cmp               x8, x9
        b.ne              0b
        neg               x9, x9
        stxr              w10, x9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               x9, x8
        tbz               w10, #0x0, 1b
2:
        mov               x0, x8
        ret

asm_test::fetch_neg::u64::relaxed:
        ldr               x9, [x0]
        b                 1f
0:
        clrex
        mov               x9, x8
        tbnz              wzr, #0x0, 2f
1:
        ldxr              x8, [x0]
        cmp               x8, x9
        b.ne              0b
        neg               x9, x9
        stxr              w10, x9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               x9, x8
        tbz               w10, #0x0, 1b
2:
        mov               x0, x8
        ret

asm_test::fetch_neg::u64::release:
        ldr               x9, [x0]
        b                 1f
0:
        clrex
        mov               x9, x8
        tbnz              wzr, #0x0, 2f
1:
        ldxr              x8, [x0]
        cmp               x8, x9
        b.ne              0b
        neg               x9, x9
        stlxr             w10, x9, [x0]
        cmp               w10, #0x0
        csetm             w10, eq
        mov               x9, x8
        tbz               w10, #0x0, 1b
2:
        mov               x0, x8
        ret

asm_test::fetch_neg::u128::acqrel:
0:
        ldaxp             x8, x1, [x0]
        negs              x10, x1
        ngc               x9, x8
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_neg::u128::seqcst:
0:
        ldaxp             x8, x1, [x0]
        negs              x10, x1
        ngc               x9, x8
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_neg::u128::acquire:
0:
        ldaxp             x8, x1, [x0]
        negs              x10, x1
        ngc               x9, x8
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_neg::u128::relaxed:
0:
        ldxp              x8, x1, [x0]
        negs              x10, x1
        ngc               x9, x8
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_neg::u128::release:
0:
        ldxp              x8, x1, [x0]
        negs              x10, x1
        ngc               x9, x8
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_not::u8::acqrel:
0:
        ldaxrb            w8, [x0]
        mvn               w9, w8
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_not::u8::seqcst:
0:
        ldaxrb            w8, [x0]
        mvn               w9, w8
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_not::u8::acquire:
0:
        ldaxrb            w8, [x0]
        mvn               w9, w8
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_not::u8::relaxed:
0:
        ldxrb             w8, [x0]
        mvn               w9, w8
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_not::u8::release:
0:
        ldxrb             w8, [x0]
        mvn               w9, w8
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_not::u16::acqrel:
0:
        ldaxrh            w8, [x0]
        mvn               w9, w8
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_not::u16::seqcst:
0:
        ldaxrh            w8, [x0]
        mvn               w9, w8
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_not::u16::acquire:
0:
        ldaxrh            w8, [x0]
        mvn               w9, w8
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_not::u16::relaxed:
0:
        ldxrh             w8, [x0]
        mvn               w9, w8
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_not::u16::release:
0:
        ldxrh             w8, [x0]
        mvn               w9, w8
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_not::u32::acqrel:
0:
        ldaxr             w8, [x0]
        mvn               w9, w8
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_not::u32::seqcst:
0:
        ldaxr             w8, [x0]
        mvn               w9, w8
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_not::u32::acquire:
0:
        ldaxr             w8, [x0]
        mvn               w9, w8
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_not::u32::relaxed:
0:
        ldxr              w8, [x0]
        mvn               w9, w8
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_not::u32::release:
0:
        ldxr              w8, [x0]
        mvn               w9, w8
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_not::u64::acqrel:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        mvn               x9, x0
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_not::u64::seqcst:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        mvn               x9, x0
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_not::u64::acquire:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        mvn               x9, x0
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_not::u64::relaxed:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        mvn               x9, x0
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_not::u64::release:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        mvn               x9, x0
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_not::bool::acqrel:
0:
        ldaxrb            w8, [x0]
        eor               w9, w8, #0x1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_not::bool::seqcst:
0:
        ldaxrb            w8, [x0]
        eor               w9, w8, #0x1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_not::bool::acquire:
0:
        ldaxrb            w8, [x0]
        eor               w9, w8, #0x1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_not::bool::relaxed:
0:
        ldxrb             w8, [x0]
        eor               w9, w8, #0x1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_not::bool::release:
0:
        ldxrb             w8, [x0]
        eor               w9, w8, #0x1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
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

asm_test::fetch_sub::u8::acqrel:
0:
        ldaxrb            w8, [x0]
        sub               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_sub::u8::seqcst:
0:
        ldaxrb            w8, [x0]
        sub               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_sub::u8::acquire:
0:
        ldaxrb            w8, [x0]
        sub               w9, w8, w1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_sub::u8::relaxed:
0:
        ldxrb             w8, [x0]
        sub               w9, w8, w1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_sub::u8::release:
0:
        ldxrb             w8, [x0]
        sub               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_sub::u16::acqrel:
0:
        ldaxrh            w8, [x0]
        sub               w9, w8, w1
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_sub::u16::seqcst:
0:
        ldaxrh            w8, [x0]
        sub               w9, w8, w1
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_sub::u16::acquire:
0:
        ldaxrh            w8, [x0]
        sub               w9, w8, w1
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_sub::u16::relaxed:
0:
        ldxrh             w8, [x0]
        sub               w9, w8, w1
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_sub::u16::release:
0:
        ldxrh             w8, [x0]
        sub               w9, w8, w1
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_sub::u32::acqrel:
0:
        ldaxr             w8, [x0]
        sub               w9, w8, w1
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_sub::u32::seqcst:
0:
        ldaxr             w8, [x0]
        sub               w9, w8, w1
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_sub::u32::acquire:
0:
        ldaxr             w8, [x0]
        sub               w9, w8, w1
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_sub::u32::relaxed:
0:
        ldxr              w8, [x0]
        sub               w9, w8, w1
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_sub::u32::release:
0:
        ldxr              w8, [x0]
        sub               w9, w8, w1
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_sub::u64::acqrel:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        sub               x9, x0, x1
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_sub::u64::seqcst:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        sub               x9, x0, x1
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_sub::u64::acquire:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        sub               x9, x0, x1
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_sub::u64::relaxed:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        sub               x9, x0, x1
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_sub::u64::release:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        sub               x9, x0, x1
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_sub::u128::acqrel:
0:
        ldaxp             x8, x1, [x0]
        subs              x10, x1, x3
        sbc               x9, x8, x2
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_sub::u128::seqcst:
0:
        ldaxp             x8, x1, [x0]
        subs              x10, x1, x3
        sbc               x9, x8, x2
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_sub::u128::acquire:
0:
        ldaxp             x8, x1, [x0]
        subs              x10, x1, x3
        sbc               x9, x8, x2
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_sub::u128::relaxed:
0:
        ldxp              x8, x1, [x0]
        subs              x10, x1, x3
        sbc               x9, x8, x2
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_sub::u128::release:
0:
        ldxp              x8, x1, [x0]
        subs              x10, x1, x3
        sbc               x9, x8, x2
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

asm_test::fetch_xor::u8::acqrel:
0:
        ldaxrb            w8, [x0]
        eor               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_xor::u8::seqcst:
0:
        ldaxrb            w8, [x0]
        eor               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_xor::u8::acquire:
0:
        ldaxrb            w8, [x0]
        eor               w9, w8, w1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_xor::u8::relaxed:
0:
        ldxrb             w8, [x0]
        eor               w9, w8, w1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_xor::u8::release:
0:
        ldxrb             w8, [x0]
        eor               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_xor::u16::acqrel:
0:
        ldaxrh            w8, [x0]
        eor               w9, w8, w1
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_xor::u16::seqcst:
0:
        ldaxrh            w8, [x0]
        eor               w9, w8, w1
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_xor::u16::acquire:
0:
        ldaxrh            w8, [x0]
        eor               w9, w8, w1
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_xor::u16::relaxed:
0:
        ldxrh             w8, [x0]
        eor               w9, w8, w1
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_xor::u16::release:
0:
        ldxrh             w8, [x0]
        eor               w9, w8, w1
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_xor::u32::acqrel:
0:
        ldaxr             w8, [x0]
        eor               w9, w8, w1
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_xor::u32::seqcst:
0:
        ldaxr             w8, [x0]
        eor               w9, w8, w1
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_xor::u32::acquire:
0:
        ldaxr             w8, [x0]
        eor               w9, w8, w1
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_xor::u32::relaxed:
0:
        ldxr              w8, [x0]
        eor               w9, w8, w1
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_xor::u32::release:
0:
        ldxr              w8, [x0]
        eor               w9, w8, w1
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

asm_test::fetch_xor::u64::acqrel:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        eor               x9, x0, x1
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_xor::u64::seqcst:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        eor               x9, x0, x1
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_xor::u64::acquire:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        eor               x9, x0, x1
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_xor::u64::relaxed:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        eor               x9, x0, x1
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_xor::u64::release:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        eor               x9, x0, x1
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

asm_test::fetch_xor::bool::acqrel:
0:
        ldaxrb            w8, [x0]
        eor               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_xor::bool::seqcst:
0:
        ldaxrb            w8, [x0]
        eor               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_xor::bool::acquire:
0:
        ldaxrb            w8, [x0]
        eor               w9, w8, w1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_xor::bool::relaxed:
0:
        ldxrb             w8, [x0]
        eor               w9, w8, w1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret

asm_test::fetch_xor::bool::release:
0:
        ldxrb             w8, [x0]
        eor               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
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


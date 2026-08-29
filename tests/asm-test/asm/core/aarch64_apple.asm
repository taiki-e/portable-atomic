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

asm_test::fetch_nand::u8::acqrel:
        ldrb              w8, [x0]
        mov               x9, x8
        and               w10, w8, w1
        mvn               w10, w10
        casalb            w9, w10, [x0]
        cmp               w9, w8, uxtb
        mov               x8, x9
        b.ne              0x28 <asm_test::fetch_nand::u8::acqrel+0x8>
        mov               x0, x8
        ret

asm_test::fetch_nand::u8::seqcst:
        ldrb              w8, [x0]
        mov               x9, x8
        and               w10, w8, w1
        mvn               w10, w10
        casalb            w9, w10, [x0]
        cmp               w9, w8, uxtb
        mov               x8, x9
        b.ne              0x50 <asm_test::fetch_nand::u8::seqcst+0x8>
        mov               x0, x8
        ret

asm_test::fetch_nand::u8::acquire:
        ldrb              w8, [x0]
        mov               x9, x8
        and               w10, w8, w1
        mvn               w10, w10
        casab             w9, w10, [x0]
        cmp               w9, w8, uxtb
        mov               x8, x9
        b.ne              0x78 <asm_test::fetch_nand::u8::acquire+0x8>
        mov               x0, x8
        ret

asm_test::fetch_nand::u8::relaxed:
        ldrb              w8, [x0]
        mov               x9, x8
        and               w10, w8, w1
        mvn               w10, w10
        casb              w9, w10, [x0]
        cmp               w9, w8, uxtb
        mov               x8, x9
        b.ne              0xa0 <asm_test::fetch_nand::u8::relaxed+0x8>
        mov               x0, x8
        ret
        ldrb              w8, [x0]
        mov               x9, x8
        and               w10, w8, w1
        mvn               w10, w10
        caslb             w9, w10, [x0]
        cmp               w9, w8, uxtb
        mov               x8, x9
        b.ne              0xc8 <asm_test::fetch_nand::u8::release+0x8>
        mov               x0, x8
        ret
        ldrh              w8, [x0]
        mov               x9, x8
        and               w10, w8, w1
        mvn               w10, w10
        casalh            w9, w10, [x0]
        cmp               w9, w8, uxth
        mov               x8, x9
        b.ne              0xf0 <asm_test::fetch_nand::u16::acqrel+0x8>
        mov               x0, x8
        ret

asm_test::fetch_nand::u16::seqcst:
        ldrh              w8, [x0]
        mov               x9, x8
        and               w10, w8, w1
        mvn               w10, w10
        casalh            w9, w10, [x0]
        cmp               w9, w8, uxth
        mov               x8, x9
        b.ne              0x118 <asm_test::fetch_nand::u16::seqcst+0x8>
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
        b.ne              0x140 <asm_test::fetch_nand::u16::acquire+0x8>
        mov               x0, x8
        ret

asm_test::fetch_nand::u16::relaxed:
        ldrh              w8, [x0]
        mov               x9, x8
        and               w10, w8, w1
        mvn               w10, w10
        cash              w9, w10, [x0]
        cmp               w9, w8, uxth
        mov               x8, x9
        b.ne              0x168 <asm_test::fetch_nand::u16::relaxed+0x8>
        mov               x0, x8
        ret

asm_test::fetch_nand::u16::release:
        ldrh              w8, [x0]
        mov               x9, x8
        and               w10, w8, w1
        mvn               w10, w10
        caslh             w9, w10, [x0]
        cmp               w9, w8, uxth
        mov               x8, x9
        b.ne              0x190 <asm_test::fetch_nand::u16::release+0x8>
        mov               x0, x8
        ret
        ldr               w8, [x0]
        mov               x9, x8
        and               w10, w8, w1
        mvn               w10, w10
        casal             w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x1b8 <asm_test::fetch_nand::u32::acqrel+0x8>
        mov               x0, x8
        ret
        ldr               w8, [x0]
        mov               x9, x8
        and               w10, w8, w1
        mvn               w10, w10
        casal             w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x1e0 <asm_test::fetch_nand::u32::seqcst+0x8>
        mov               x0, x8
        ret

asm_test::fetch_nand::u32::acquire:
        ldr               w8, [x0]
        mov               x9, x8
        and               w10, w8, w1
        mvn               w10, w10
        casa              w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x208 <asm_test::fetch_nand::u32::acquire+0x8>
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
        b.ne              0x230 <asm_test::fetch_nand::u32::relaxed+0x8>
        mov               x0, x8
        ret

asm_test::fetch_nand::u32::release:
        ldr               w8, [x0]
        mov               x9, x8
        and               w10, w8, w1
        mvn               w10, w10
        casl              w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x258 <asm_test::fetch_nand::u32::release+0x8>
        mov               x0, x8
        ret

asm_test::fetch_nand::u64::acqrel:
        ldr               x8, [x0]
        mov               x9, x8
        and               x10, x8, x1
        mvn               x10, x10
        casal             x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x280 <asm_test::fetch_nand::u64::acqrel+0x8>
        mov               x0, x8
        ret
        ldr               x8, [x0]
        mov               x9, x8
        and               x10, x8, x1
        mvn               x10, x10
        casal             x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x2a8 <asm_test::fetch_nand::u64::seqcst+0x8>
        mov               x0, x8
        ret
        ldr               x8, [x0]
        mov               x9, x8
        and               x10, x8, x1
        mvn               x10, x10
        casa              x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x2d0 <asm_test::fetch_nand::u64::acquire+0x8>
        mov               x0, x8
        ret
        ldr               x8, [x0]
        mov               x9, x8
        and               x10, x8, x1
        mvn               x10, x10
        cas               x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x2f8 <asm_test::fetch_nand::u64::relaxed+0x8>
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
        b.ne              0x320 <asm_test::fetch_nand::u64::release+0x8>
        mov               x0, x8
        ret

asm_test::fetch_nand::u128::acqrel:
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        and               x8, x7, x2
        and               x9, x4, x1
        mvn               x10, x9
        mvn               x11, x8
        mov               x5, x7
        caspal            x4, x5, x10, x11, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x344 <asm_test::fetch_nand::u128::acqrel+0x4>
        mov               x0, x4
        mov               x1, x5
        ret
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        and               x8, x7, x2
        and               x9, x4, x1
        mvn               x10, x9
        mvn               x11, x8
        mov               x5, x7
        caspal            x4, x5, x10, x11, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x380 <asm_test::fetch_nand::u128::seqcst+0x4>
        mov               x0, x4
        mov               x1, x5
        ret
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        and               x8, x7, x2
        and               x9, x4, x1
        mvn               x10, x9
        mvn               x11, x8
        mov               x5, x7
        caspa             x4, x5, x10, x11, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x3bc <asm_test::fetch_nand::u128::acquire+0x4>
        mov               x0, x4
        mov               x1, x5
        ret
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        and               x8, x7, x2
        and               x9, x4, x1
        mvn               x10, x9
        mvn               x11, x8
        mov               x5, x7
        casp              x4, x5, x10, x11, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x3f8 <asm_test::fetch_nand::u128::relaxed+0x4>
        mov               x0, x4
        mov               x1, x5
        ret

asm_test::fetch_nand::u128::release:
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        and               x8, x7, x2
        and               x9, x4, x1
        mvn               x10, x9
        mvn               x11, x8
        mov               x5, x7
        caspl             x4, x5, x10, x11, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x434 <asm_test::fetch_nand::u128::release+0x4>
        mov               x0, x4
        mov               x1, x5
        ret
        ldumaxalb         w1, w0, [x0]
        ret

asm_test::fetch_umax::u8::seqcst:
        ldumaxalb         w1, w0, [x0]
        ret
        ldumaxab          w1, w0, [x0]
        ret

asm_test::fetch_umax::u8::relaxed:
        ldumaxb           w1, w0, [x0]
        ret
        ldumaxlb          w1, w0, [x0]
        ret

asm_test::fetch_umax::u16::acqrel:
        ldumaxalh         w1, w0, [x0]
        ret
        ldumaxalh         w1, w0, [x0]
        ret
        ldumaxah          w1, w0, [x0]
        ret
        ldumaxh           w1, w0, [x0]
        ret
        ldumaxlh          w1, w0, [x0]
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

asm_test::fetch_umax::u64::release:
        ldumaxl           x1, x0, [x0]
        ret
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        cmp               x1, x4
        sbcs              xzr, x2, x7
        csel              x9, x7, x2, lo
        csel              x8, x4, x1, lo
        mov               x5, x7
        caspal            x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x510 <asm_test::fetch_umax::u128::acqrel+0x4>
        mov               x0, x4
        mov               x1, x5
        ret

asm_test::fetch_umax::u128::seqcst:
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        cmp               x1, x4
        sbcs              xzr, x2, x7
        csel              x9, x7, x2, lo
        csel              x8, x4, x1, lo
        mov               x5, x7
        caspal            x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x54c <asm_test::fetch_umax::u128::seqcst+0x4>
        mov               x0, x4
        mov               x1, x5
        ret

asm_test::fetch_umax::u128::acquire:
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        cmp               x1, x4
        sbcs              xzr, x2, x7
        csel              x9, x7, x2, lo
        csel              x8, x4, x1, lo
        mov               x5, x7
        caspa             x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x588 <asm_test::fetch_umax::u128::acquire+0x4>
        mov               x0, x4
        mov               x1, x5
        ret
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        cmp               x1, x4
        sbcs              xzr, x2, x7
        csel              x9, x7, x2, lo
        csel              x8, x4, x1, lo
        mov               x5, x7
        casp              x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x5c4 <asm_test::fetch_umax::u128::relaxed+0x4>
        mov               x0, x4
        mov               x1, x5
        ret
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        cmp               x1, x4
        sbcs              xzr, x2, x7
        csel              x9, x7, x2, lo
        csel              x8, x4, x1, lo
        mov               x5, x7
        caspl             x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x600 <asm_test::fetch_umax::u128::release+0x4>
        mov               x0, x4
        mov               x1, x5
        ret

asm_test::fetch_umin::u8::acqrel:
        lduminalb         w1, w0, [x0]
        ret

asm_test::fetch_umin::u8::seqcst:
        lduminalb         w1, w0, [x0]
        ret

asm_test::fetch_umin::u8::acquire:
        lduminab          w1, w0, [x0]
        ret

asm_test::fetch_umin::u8::relaxed:
        lduminb           w1, w0, [x0]
        ret

asm_test::fetch_umin::u8::release:
        lduminlb          w1, w0, [x0]
        ret

asm_test::fetch_umin::u16::acqrel:
        lduminalh         w1, w0, [x0]
        ret

asm_test::fetch_umin::u16::seqcst:
        lduminalh         w1, w0, [x0]
        ret

asm_test::fetch_umin::u16::acquire:
        lduminah          w1, w0, [x0]
        ret

asm_test::fetch_umin::u16::relaxed:
        lduminh           w1, w0, [x0]
        ret

asm_test::fetch_umin::u16::release:
        lduminlh          w1, w0, [x0]
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
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        cmp               x1, x4
        sbcs              xzr, x2, x7
        csel              x9, x7, x2, hs
        csel              x8, x4, x1, hs
        mov               x5, x7
        caspal            x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x6dc <asm_test::fetch_umin::u128::acqrel+0x4>
        mov               x0, x4
        mov               x1, x5
        ret

asm_test::fetch_umin::u128::seqcst:
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        cmp               x1, x4
        sbcs              xzr, x2, x7
        csel              x9, x7, x2, hs
        csel              x8, x4, x1, hs
        mov               x5, x7
        caspal            x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x718 <asm_test::fetch_umin::u128::seqcst+0x4>
        mov               x0, x4
        mov               x1, x5
        ret

asm_test::fetch_umin::u128::acquire:
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        cmp               x1, x4
        sbcs              xzr, x2, x7
        csel              x9, x7, x2, hs
        csel              x8, x4, x1, hs
        mov               x5, x7
        caspa             x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x754 <asm_test::fetch_umin::u128::acquire+0x4>
        mov               x0, x4
        mov               x1, x5
        ret
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        cmp               x1, x4
        sbcs              xzr, x2, x7
        csel              x9, x7, x2, hs
        csel              x8, x4, x1, hs
        mov               x5, x7
        casp              x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x790 <asm_test::fetch_umin::u128::relaxed+0x4>
        mov               x0, x4
        mov               x1, x5
        ret
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        cmp               x1, x4
        sbcs              xzr, x2, x7
        csel              x9, x7, x2, hs
        csel              x8, x4, x1, hs
        mov               x5, x7
        caspl             x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x7cc <asm_test::fetch_umin::u128::release+0x4>
        mov               x0, x4
        mov               x1, x5
        ret

asm_test::compare_exchange::u8::acqrel_seqcst:
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange::u8::seqcst_seqcst:
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

asm_test::compare_exchange::u8::acqrel_relaxed:
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange::u8::acquire_seqcst:
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange::u8::relaxed_seqcst:
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

asm_test::compare_exchange::u8::acquire_acquire:
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

asm_test::compare_exchange::u8::release_acquire:
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
        mov               x8, x1
        casl              x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret
        mov               x5, x4
        mov               x4, x3
        mov               x3, x2
        mov               x2, x1
        mov               x6, x2
        mov               x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x3, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x5, x4
        mov               x4, x3
        mov               x3, x2
        mov               x2, x1
        mov               x6, x2
        mov               x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x3, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x5, x4
        mov               x4, x3
        mov               x3, x2
        mov               x2, x1
        mov               x6, x2
        mov               x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x3, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x5, x4
        mov               x4, x3
        mov               x3, x2
        mov               x2, x1
        mov               x6, x2
        mov               x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x3, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x5, x4
        mov               x4, x3
        mov               x3, x2
        mov               x2, x1
        mov               x6, x2
        mov               x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x3, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x5, x4
        mov               x4, x3
        mov               x3, x2
        mov               x2, x1
        mov               x6, x2
        mov               x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x3, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x5, x4
        mov               x4, x3
        mov               x3, x2
        mov               x2, x1
        mov               x6, x2
        mov               x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x3, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::seqcst_acquire:
        mov               x5, x4
        mov               x4, x3
        mov               x3, x2
        mov               x2, x1
        mov               x6, x2
        mov               x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x3, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::seqcst_relaxed:
        mov               x5, x4
        mov               x4, x3
        mov               x3, x2
        mov               x2, x1
        mov               x6, x2
        mov               x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x3, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::acquire_acquire:
        mov               x5, x4
        mov               x4, x3
        mov               x3, x2
        mov               x2, x1
        mov               x6, x2
        mov               x7, x3
        caspa             x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x3, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x5, x4
        mov               x4, x3
        mov               x3, x2
        mov               x2, x1
        mov               x6, x2
        mov               x7, x3
        caspa             x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x3, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x5, x4
        mov               x4, x3
        mov               x3, x2
        mov               x2, x1
        mov               x6, x2
        mov               x7, x3
        caspa             x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x3, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::relaxed_relaxed:
        mov               x5, x4
        mov               x4, x3
        mov               x3, x2
        mov               x2, x1
        mov               x6, x2
        mov               x7, x3
        casp              x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x3, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange::u128::release_acquire:
        mov               x5, x4
        mov               x4, x3
        mov               x3, x2
        mov               x2, x1
        mov               x6, x2
        mov               x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x3, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x5, x4
        mov               x4, x3
        mov               x3, x2
        mov               x2, x1
        mov               x6, x2
        mov               x7, x3
        caspl             x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x3, #0x0, eq
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

asm_test::compare_exchange_weak::u8::acquire_seqcst:
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

asm_test::compare_exchange_weak::u8::release_seqcst:
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange_weak::u8::seqcst_acquire:
        mov               x8, x1
        casalb            w8, w2, [x0]
        cmp               w8, w1, uxtb
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange_weak::u8::seqcst_relaxed:
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
        mov               x8, x1
        casalh            w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange_weak::u16::acqrel_relaxed:
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

asm_test::compare_exchange_weak::u16::seqcst_acquire:
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
        mov               x8, x1
        casah             w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange_weak::u16::relaxed_acquire:
        mov               x8, x1
        casah             w8, w2, [x0]
        cmp               w8, w1, uxth
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange_weak::u16::relaxed_relaxed:
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
        mov               x8, x1
        casal             w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange_weak::u32::acquire_seqcst:
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

asm_test::compare_exchange_weak::u32::release_seqcst:
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
        mov               x8, x1
        casa              w8, w2, [x0]
        cmp               w8, w1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange_weak::u32::relaxed_relaxed:
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
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange_weak::u64::relaxed_seqcst:
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
        mov               x8, x1
        casal             x8, x2, [x0]
        cmp               x8, x1
        cset              w9, eq
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

asm_test::compare_exchange_weak::u64::acquire_acquire:
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

asm_test::compare_exchange_weak::u128::acqrel_seqcst:
        mov               x5, x4
        mov               x4, x3
        mov               x3, x2
        mov               x2, x1
        mov               x6, x2
        mov               x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x3, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::seqcst_seqcst:
        mov               x5, x4
        mov               x4, x3
        mov               x3, x2
        mov               x2, x1
        mov               x6, x2
        mov               x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x3, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::acqrel_acquire:
        mov               x5, x4
        mov               x4, x3
        mov               x3, x2
        mov               x2, x1
        mov               x6, x2
        mov               x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x3, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x5, x4
        mov               x4, x3
        mov               x3, x2
        mov               x2, x1
        mov               x6, x2
        mov               x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x3, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::acquire_seqcst:
        mov               x5, x4
        mov               x4, x3
        mov               x3, x2
        mov               x2, x1
        mov               x6, x2
        mov               x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x3, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::relaxed_seqcst:
        mov               x5, x4
        mov               x4, x3
        mov               x3, x2
        mov               x2, x1
        mov               x6, x2
        mov               x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x3, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

asm_test::compare_exchange_weak::u128::release_seqcst:
        mov               x5, x4
        mov               x4, x3
        mov               x3, x2
        mov               x2, x1
        mov               x6, x2
        mov               x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x3, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x5, x4
        mov               x4, x3
        mov               x3, x2
        mov               x2, x1
        mov               x6, x2
        mov               x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x3, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x5, x4
        mov               x4, x3
        mov               x3, x2
        mov               x2, x1
        mov               x6, x2
        mov               x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x3, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x5, x4
        mov               x4, x3
        mov               x3, x2
        mov               x2, x1
        mov               x6, x2
        mov               x7, x3
        caspa             x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x3, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x5, x4
        mov               x4, x3
        mov               x3, x2
        mov               x2, x1
        mov               x6, x2
        mov               x7, x3
        caspa             x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x3, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x5, x4
        mov               x4, x3
        mov               x3, x2
        mov               x2, x1
        mov               x6, x2
        mov               x7, x3
        caspa             x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x3, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x5, x4
        mov               x4, x3
        mov               x3, x2
        mov               x2, x1
        mov               x6, x2
        mov               x7, x3
        casp              x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x3, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x5, x4
        mov               x4, x3
        mov               x3, x2
        mov               x2, x1
        mov               x6, x2
        mov               x7, x3
        caspal            x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x3, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        mov               x5, x4
        mov               x4, x3
        mov               x3, x2
        mov               x2, x1
        mov               x6, x2
        mov               x7, x3
        caspl             x6, x7, x4, x5, [x0]
        cmp               x6, x1
        ccmp              x7, x3, #0x0, eq
        stp               x6, x7, [x8, #0x10]
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret
        ldarb             w0, [x0]
        ret
        ldaprb            w0, [x0]
        ret
        ldrb              w0, [x0]
        ret
        ldarh             w0, [x0]
        ret
        ldaprh            w0, [x0]
        ret
        ldrh              w0, [x0]
        ret
        ldar              w0, [x0]
        ret
        ldapr             w0, [x0]
        ret
        ldr               w0, [x0]
        ret
        ldar              x0, [x0]
        ret
        ldapr             x0, [x0]
        ret
        ldr               x0, [x0]
        ret
        ldar              xzr, [x0]
        ldp               x0, x1, [x0]
        dmb               ish
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
        mov               x5, x2
        ldp               x2, x3, [x0]
        mov               x4, x1
        mov               x7, x3
        mov               x6, x2
        mov               x3, x7
        caspal            x2, x3, x4, x5, [x0]
        cmp               x3, x7
        ccmp              x2, x6, #0x0, eq
        b.ne              0x1c6c <asm_test::swap::u128::acqrel+0xc>
        mov               x0, x2
        mov               x1, x3
        ret
        mov               x5, x2
        ldp               x2, x3, [x0]
        mov               x4, x1
        mov               x7, x3
        mov               x6, x2
        mov               x3, x7
        caspal            x2, x3, x4, x5, [x0]
        cmp               x3, x7
        ccmp              x2, x6, #0x0, eq
        b.ne              0x1ca0 <asm_test::swap::u128::seqcst+0xc>
        mov               x0, x2
        mov               x1, x3
        ret
        mov               x5, x2
        ldp               x2, x3, [x0]
        mov               x4, x1
        mov               x7, x3
        mov               x6, x2
        mov               x3, x7
        caspa             x2, x3, x4, x5, [x0]
        cmp               x3, x7
        ccmp              x2, x6, #0x0, eq
        b.ne              0x1cd4 <asm_test::swap::u128::acquire+0xc>
        mov               x0, x2
        mov               x1, x3
        ret
        mov               x5, x2
        ldp               x2, x3, [x0]
        mov               x4, x1
        mov               x7, x3
        mov               x6, x2
        mov               x3, x7
        casp              x2, x3, x4, x5, [x0]
        cmp               x3, x7
        ccmp              x2, x6, #0x0, eq
        b.ne              0x1d08 <asm_test::swap::u128::relaxed+0xc>
        mov               x0, x2
        mov               x1, x3
        ret
        mov               x5, x2
        ldp               x2, x3, [x0]
        mov               x4, x1
        mov               x7, x3
        mov               x6, x2
        mov               x3, x7
        caspl             x2, x3, x4, x5, [x0]
        cmp               x3, x7
        ccmp              x2, x6, #0x0, eq
        b.ne              0x1d3c <asm_test::swap::u128::release+0xc>
        mov               x0, x2
        mov               x1, x3
        ret
        stlrb             w1, [x0]
        ret
        strb              w1, [x0]
        ret
        stlrb             w1, [x0]
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
        dmb               ish
        stp               x1, x2, [x0]
        dmb               ish
        ret
        stp               x1, x2, [x0]
        ret
        dmb               ish
        stp               x1, x2, [x0]
        ret
        ldsetalb          w1, w0, [x0]
        ret
        ldsetalb          w1, w0, [x0]
        ret
        ldsetab           w1, w0, [x0]
        ret
        ldsetb            w1, w0, [x0]
        ret
        ldsetlb           w1, w0, [x0]
        ret
        ldsetalh          w1, w0, [x0]
        ret
        ldsetalh          w1, w0, [x0]
        ret
        ldsetah           w1, w0, [x0]
        ret
        ldseth            w1, w0, [x0]
        ret
        ldsetlh           w1, w0, [x0]
        ret
        ldsetal           w1, w0, [x0]
        ret
        ldsetal           w1, w0, [x0]
        ret
        ldseta            w1, w0, [x0]
        ret
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
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        orr               x8, x4, x1
        orr               x9, x7, x2
        mov               x5, x7
        caspal            x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x1e8c <asm_test::fetch_or::u128::acqrel+0x4>
        mov               x0, x4
        mov               x1, x5
        ret
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        orr               x8, x4, x1
        orr               x9, x7, x2
        mov               x5, x7
        caspal            x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x1ec0 <asm_test::fetch_or::u128::seqcst+0x4>
        mov               x0, x4
        mov               x1, x5
        ret
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        orr               x8, x4, x1
        orr               x9, x7, x2
        mov               x5, x7
        caspa             x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x1ef4 <asm_test::fetch_or::u128::acquire+0x4>
        mov               x0, x4
        mov               x1, x5
        ret
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        orr               x8, x4, x1
        orr               x9, x7, x2
        mov               x5, x7
        casp              x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x1f28 <asm_test::fetch_or::u128::relaxed+0x4>
        mov               x0, x4
        mov               x1, x5
        ret
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        orr               x8, x4, x1
        orr               x9, x7, x2
        mov               x5, x7
        caspl             x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x1f5c <asm_test::fetch_or::u128::release+0x4>
        mov               x0, x4
        mov               x1, x5
        ret
        ldaddalb          w1, w0, [x0]
        ret
        ldaddalb          w1, w0, [x0]
        ret
        ldaddab           w1, w0, [x0]
        ret
        ldaddb            w1, w0, [x0]
        ret
        ldaddlb           w1, w0, [x0]
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
        ldadd             w1, w0, [x0]
        ret
        ldaddl            w1, w0, [x0]
        ret

asm_test::fetch_add::u64::acqrel:
        ldaddal           x1, x0, [x0]
        ret
        ldaddal           x1, x0, [x0]
        ret

asm_test::fetch_add::u64::acquire:
        ldadda            x1, x0, [x0]
        ret
        ldadd             x1, x0, [x0]
        ret

asm_test::fetch_add::u64::release:
        ldaddl            x1, x0, [x0]
        ret
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        adds              x8, x4, x1
        adc               x9, x7, x2
        mov               x5, x7
        caspal            x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x2030 <asm_test::fetch_add::u128::acqrel+0x4>
        mov               x0, x4
        mov               x1, x5
        ret

asm_test::fetch_add::u128::seqcst:
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        adds              x8, x4, x1
        adc               x9, x7, x2
        mov               x5, x7
        caspal            x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x2064 <asm_test::fetch_add::u128::seqcst+0x4>
        mov               x0, x4
        mov               x1, x5
        ret

asm_test::fetch_add::u128::acquire:
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        adds              x8, x4, x1
        adc               x9, x7, x2
        mov               x5, x7
        caspa             x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x2098 <asm_test::fetch_add::u128::acquire+0x4>
        mov               x0, x4
        mov               x1, x5
        ret
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        adds              x8, x4, x1
        adc               x9, x7, x2
        mov               x5, x7
        casp              x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x20cc <asm_test::fetch_add::u128::relaxed+0x4>
        mov               x0, x4
        mov               x1, x5
        ret
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        adds              x8, x4, x1
        adc               x9, x7, x2
        mov               x5, x7
        caspl             x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x2100 <asm_test::fetch_add::u128::release+0x4>
        mov               x0, x4
        mov               x1, x5
        ret

asm_test::fetch_and::u8::acqrel:
        mvn               w8, w1
        ldclralb          w8, w0, [x0]
        ret
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
        mvn               w8, w1
        ldclrlh           w8, w0, [x0]
        ret
        mvn               w8, w1
        ldclral           w8, w0, [x0]
        ret
        mvn               w8, w1
        ldclral           w8, w0, [x0]
        ret
        mvn               w8, w1
        ldclra            w8, w0, [x0]
        ret
        mvn               w8, w1
        ldclr             w8, w0, [x0]
        ret
        mvn               w8, w1
        ldclrl            w8, w0, [x0]
        ret
        mvn               x8, x1
        ldclral           x8, x0, [x0]
        ret
        mvn               x8, x1
        ldclral           x8, x0, [x0]
        ret
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

asm_test::fetch_and::u128::acqrel:
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        and               x8, x4, x1
        and               x9, x7, x2
        mov               x5, x7
        caspal            x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x2224 <asm_test::fetch_and::u128::acqrel+0x4>
        mov               x0, x4
        mov               x1, x5
        ret

asm_test::fetch_and::u128::seqcst:
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        and               x8, x4, x1
        and               x9, x7, x2
        mov               x5, x7
        caspal            x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x2258 <asm_test::fetch_and::u128::seqcst+0x4>
        mov               x0, x4
        mov               x1, x5
        ret

asm_test::fetch_and::u128::acquire:
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        and               x8, x4, x1
        and               x9, x7, x2
        mov               x5, x7
        caspa             x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x228c <asm_test::fetch_and::u128::acquire+0x4>
        mov               x0, x4
        mov               x1, x5
        ret
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        and               x8, x4, x1
        and               x9, x7, x2
        mov               x5, x7
        casp              x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x22c0 <asm_test::fetch_and::u128::relaxed+0x4>
        mov               x0, x4
        mov               x1, x5
        ret
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        and               x8, x4, x1
        and               x9, x7, x2
        mov               x5, x7
        caspl             x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x22f4 <asm_test::fetch_and::u128::release+0x4>
        mov               x0, x4
        mov               x1, x5
        ret

asm_test::fetch_max::i8::acqrel:
        ldsmaxalb         w1, w0, [x0]
        ret
        ldsmaxalb         w1, w0, [x0]
        ret

asm_test::fetch_max::i8::acquire:
        ldsmaxab          w1, w0, [x0]
        ret
        ldsmaxb           w1, w0, [x0]
        ret

asm_test::fetch_max::i8::release:
        ldsmaxlb          w1, w0, [x0]
        ret
        ldsmaxalh         w1, w0, [x0]
        ret

asm_test::fetch_max::i16::seqcst:
        ldsmaxalh         w1, w0, [x0]
        ret
        ldsmaxah          w1, w0, [x0]
        ret

asm_test::fetch_max::i16::relaxed:
        ldsmaxh           w1, w0, [x0]
        ret
        ldsmaxlh          w1, w0, [x0]
        ret

asm_test::fetch_max::i32::acqrel:
        ldsmaxal          w1, w0, [x0]
        ret
        ldsmaxal          w1, w0, [x0]
        ret

asm_test::fetch_max::i32::acquire:
        ldsmaxa           w1, w0, [x0]
        ret
        ldsmax            w1, w0, [x0]
        ret

asm_test::fetch_max::i32::release:
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
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        cmp               x1, x4
        sbcs              xzr, x2, x7
        csel              x9, x7, x2, lt
        csel              x8, x4, x1, lt
        mov               x5, x7
        caspal            x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x23c8 <asm_test::fetch_max::i128::acqrel+0x4>
        mov               x0, x4
        mov               x1, x5
        ret

asm_test::fetch_max::i128::seqcst:
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        cmp               x1, x4
        sbcs              xzr, x2, x7
        csel              x9, x7, x2, lt
        csel              x8, x4, x1, lt
        mov               x5, x7
        caspal            x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x2404 <asm_test::fetch_max::i128::seqcst+0x4>
        mov               x0, x4
        mov               x1, x5
        ret
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        cmp               x1, x4
        sbcs              xzr, x2, x7
        csel              x9, x7, x2, lt
        csel              x8, x4, x1, lt
        mov               x5, x7
        caspa             x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x2440 <asm_test::fetch_max::i128::acquire+0x4>
        mov               x0, x4
        mov               x1, x5
        ret

asm_test::fetch_max::i128::relaxed:
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        cmp               x1, x4
        sbcs              xzr, x2, x7
        csel              x9, x7, x2, lt
        csel              x8, x4, x1, lt
        mov               x5, x7
        casp              x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x247c <asm_test::fetch_max::i128::relaxed+0x4>
        mov               x0, x4
        mov               x1, x5
        ret
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        cmp               x1, x4
        sbcs              xzr, x2, x7
        csel              x9, x7, x2, lt
        csel              x8, x4, x1, lt
        mov               x5, x7
        caspl             x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x24b8 <asm_test::fetch_max::i128::release+0x4>
        mov               x0, x4
        mov               x1, x5
        ret
        ldsminalb         w1, w0, [x0]
        ret
        ldsminalb         w1, w0, [x0]
        ret

asm_test::fetch_min::i8::acquire:
        ldsminab          w1, w0, [x0]
        ret

asm_test::fetch_min::i8::relaxed:
        ldsminb           w1, w0, [x0]
        ret

asm_test::fetch_min::i8::release:
        ldsminlb          w1, w0, [x0]
        ret

asm_test::fetch_min::i16::acqrel:
        ldsminalh         w1, w0, [x0]
        ret

asm_test::fetch_min::i16::seqcst:
        ldsminalh         w1, w0, [x0]
        ret

asm_test::fetch_min::i16::acquire:
        ldsminah          w1, w0, [x0]
        ret

asm_test::fetch_min::i16::relaxed:
        ldsminh           w1, w0, [x0]
        ret

asm_test::fetch_min::i16::release:
        ldsminlh          w1, w0, [x0]
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
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        cmp               x1, x4
        sbcs              xzr, x2, x7
        csel              x9, x7, x2, ge
        csel              x8, x4, x1, ge
        mov               x5, x7
        caspal            x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x2594 <asm_test::fetch_min::i128::acqrel+0x4>
        mov               x0, x4
        mov               x1, x5
        ret
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        cmp               x1, x4
        sbcs              xzr, x2, x7
        csel              x9, x7, x2, ge
        csel              x8, x4, x1, ge
        mov               x5, x7
        caspal            x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x25d0 <asm_test::fetch_min::i128::seqcst+0x4>
        mov               x0, x4
        mov               x1, x5
        ret

asm_test::fetch_min::i128::acquire:
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        cmp               x1, x4
        sbcs              xzr, x2, x7
        csel              x9, x7, x2, ge
        csel              x8, x4, x1, ge
        mov               x5, x7
        caspa             x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x260c <asm_test::fetch_min::i128::acquire+0x4>
        mov               x0, x4
        mov               x1, x5
        ret

asm_test::fetch_min::i128::relaxed:
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        cmp               x1, x4
        sbcs              xzr, x2, x7
        csel              x9, x7, x2, ge
        csel              x8, x4, x1, ge
        mov               x5, x7
        casp              x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x2648 <asm_test::fetch_min::i128::relaxed+0x4>
        mov               x0, x4
        mov               x1, x5
        ret

asm_test::fetch_min::i128::release:
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        cmp               x1, x4
        sbcs              xzr, x2, x7
        csel              x9, x7, x2, ge
        csel              x8, x4, x1, ge
        mov               x5, x7
        caspl             x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x2684 <asm_test::fetch_min::i128::release+0x4>
        mov               x0, x4
        mov               x1, x5
        ret
        ldrb              w8, [x0]
        mov               x9, x8
        neg               w10, w8
        casalb            w9, w10, [x0]
        cmp               w9, w8, uxtb
        mov               x8, x9
        b.ne              0x26c4 <asm_test::fetch_neg::u8::acqrel+0x8>
        mov               x0, x8
        ret
        ldrb              w8, [x0]
        mov               x9, x8
        neg               w10, w8
        casalb            w9, w10, [x0]
        cmp               w9, w8, uxtb
        mov               x8, x9
        b.ne              0x26e8 <asm_test::fetch_neg::u8::seqcst+0x8>
        mov               x0, x8
        ret

asm_test::fetch_neg::u8::acquire:
        ldrb              w8, [x0]
        mov               x9, x8
        neg               w10, w8
        casab             w9, w10, [x0]
        cmp               w9, w8, uxtb
        mov               x8, x9
        b.ne              0x270c <asm_test::fetch_neg::u8::acquire+0x8>
        mov               x0, x8
        ret

asm_test::fetch_neg::u8::relaxed:
        ldrb              w8, [x0]
        mov               x9, x8
        neg               w10, w8
        casb              w9, w10, [x0]
        cmp               w9, w8, uxtb
        mov               x8, x9
        b.ne              0x2730 <asm_test::fetch_neg::u8::relaxed+0x8>
        mov               x0, x8
        ret
        ldrb              w8, [x0]
        mov               x9, x8
        neg               w10, w8
        caslb             w9, w10, [x0]
        cmp               w9, w8, uxtb
        mov               x8, x9
        b.ne              0x2754 <asm_test::fetch_neg::u8::release+0x8>
        mov               x0, x8
        ret

asm_test::fetch_neg::u16::acqrel:
        ldrh              w8, [x0]
        mov               x9, x8
        neg               w10, w8
        casalh            w9, w10, [x0]
        cmp               w9, w8, uxth
        mov               x8, x9
        b.ne              0x2778 <asm_test::fetch_neg::u16::acqrel+0x8>
        mov               x0, x8
        ret

asm_test::fetch_neg::u16::seqcst:
        ldrh              w8, [x0]
        mov               x9, x8
        neg               w10, w8
        casalh            w9, w10, [x0]
        cmp               w9, w8, uxth
        mov               x8, x9
        b.ne              0x279c <asm_test::fetch_neg::u16::seqcst+0x8>
        mov               x0, x8
        ret
        ldrh              w8, [x0]
        mov               x9, x8
        neg               w10, w8
        casah             w9, w10, [x0]
        cmp               w9, w8, uxth
        mov               x8, x9
        b.ne              0x27c0 <asm_test::fetch_neg::u16::acquire+0x8>
        mov               x0, x8
        ret
        ldrh              w8, [x0]
        mov               x9, x8
        neg               w10, w8
        cash              w9, w10, [x0]
        cmp               w9, w8, uxth
        mov               x8, x9
        b.ne              0x27e4 <asm_test::fetch_neg::u16::relaxed+0x8>
        mov               x0, x8
        ret

asm_test::fetch_neg::u16::release:
        ldrh              w8, [x0]
        mov               x9, x8
        neg               w10, w8
        caslh             w9, w10, [x0]
        cmp               w9, w8, uxth
        mov               x8, x9
        b.ne              0x2808 <asm_test::fetch_neg::u16::release+0x8>
        mov               x0, x8
        ret

asm_test::fetch_neg::u32::acqrel:
        ldr               w8, [x0]
        mov               x9, x8
        neg               w10, w8
        casal             w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x282c <asm_test::fetch_neg::u32::acqrel+0x8>
        mov               x0, x8
        ret

asm_test::fetch_neg::u32::seqcst:
        ldr               w8, [x0]
        mov               x9, x8
        neg               w10, w8
        casal             w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x2850 <asm_test::fetch_neg::u32::seqcst+0x8>
        mov               x0, x8
        ret
        ldr               w8, [x0]
        mov               x9, x8
        neg               w10, w8
        casa              w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x2874 <asm_test::fetch_neg::u32::acquire+0x8>
        mov               x0, x8
        ret

asm_test::fetch_neg::u32::relaxed:
        ldr               w8, [x0]
        mov               x9, x8
        neg               w10, w8
        cas               w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x2898 <asm_test::fetch_neg::u32::relaxed+0x8>
        mov               x0, x8
        ret
        ldr               w8, [x0]
        mov               x9, x8
        neg               w10, w8
        casl              w9, w10, [x0]
        cmp               w9, w8
        mov               x8, x9
        b.ne              0x28bc <asm_test::fetch_neg::u32::release+0x8>
        mov               x0, x8
        ret
        ldr               x8, [x0]
        mov               x9, x8
        neg               x10, x8
        casal             x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x28e0 <asm_test::fetch_neg::u64::acqrel+0x8>
        mov               x0, x8
        ret
        ldr               x8, [x0]
        mov               x9, x8
        neg               x10, x8
        casal             x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x2904 <asm_test::fetch_neg::u64::seqcst+0x8>
        mov               x0, x8
        ret

asm_test::fetch_neg::u64::acquire:
        ldr               x8, [x0]
        mov               x9, x8
        neg               x10, x8
        casa              x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x2928 <asm_test::fetch_neg::u64::acquire+0x8>
        mov               x0, x8
        ret

asm_test::fetch_neg::u64::relaxed:
        ldr               x8, [x0]
        mov               x9, x8
        neg               x10, x8
        cas               x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x294c <asm_test::fetch_neg::u64::relaxed+0x8>
        mov               x0, x8
        ret

asm_test::fetch_neg::u64::release:
        ldr               x8, [x0]
        mov               x9, x8
        neg               x10, x8
        casl              x9, x10, [x0]
        cmp               x9, x8
        mov               x8, x9
        b.ne              0x2970 <asm_test::fetch_neg::u64::release+0x8>
        mov               x0, x8
        ret
        ldp               x2, x3, [x0]
        mov               x5, x3
        mov               x4, x2
        negs              x6, x2
        ngc               x7, x5
        mov               x3, x5
        caspal            x2, x3, x6, x7, [x0]
        cmp               x3, x5
        ccmp              x2, x4, #0x0, eq
        b.ne              0x2990 <asm_test::fetch_neg::u128::acqrel+0x4>
        mov               x0, x2
        mov               x1, x3
        ret
        ldp               x2, x3, [x0]
        mov               x5, x3
        mov               x4, x2
        negs              x6, x2
        ngc               x7, x5
        mov               x3, x5
        caspal            x2, x3, x6, x7, [x0]
        cmp               x3, x5
        ccmp              x2, x4, #0x0, eq
        b.ne              0x29c4 <asm_test::fetch_neg::u128::seqcst+0x4>
        mov               x0, x2
        mov               x1, x3
        ret
        ldp               x2, x3, [x0]
        mov               x5, x3
        mov               x4, x2
        negs              x6, x2
        ngc               x7, x5
        mov               x3, x5
        caspa             x2, x3, x6, x7, [x0]
        cmp               x3, x5
        ccmp              x2, x4, #0x0, eq
        b.ne              0x29f8 <asm_test::fetch_neg::u128::acquire+0x4>
        mov               x0, x2
        mov               x1, x3
        ret
        ldp               x2, x3, [x0]
        mov               x5, x3
        mov               x4, x2
        negs              x6, x2
        ngc               x7, x5
        mov               x3, x5
        casp              x2, x3, x6, x7, [x0]
        cmp               x3, x5
        ccmp              x2, x4, #0x0, eq
        b.ne              0x2a2c <asm_test::fetch_neg::u128::relaxed+0x4>
        mov               x0, x2
        mov               x1, x3
        ret
        ldp               x2, x3, [x0]
        mov               x5, x3
        mov               x4, x2
        negs              x6, x2
        ngc               x7, x5
        mov               x3, x5
        caspl             x2, x3, x6, x7, [x0]
        cmp               x3, x5
        ccmp              x2, x4, #0x0, eq
        b.ne              0x2a60 <asm_test::fetch_neg::u128::release+0x4>
        mov               x0, x2
        mov               x1, x3
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
        ldp               x2, x3, [x0]
        mov               x5, x3
        mov               x4, x2
        mvn               x6, x2
        mvn               x7, x5
        mov               x3, x5
        caspal            x2, x3, x6, x7, [x0]
        cmp               x3, x5
        ccmp              x2, x4, #0x0, eq
        b.ne              0x2b84 <asm_test::fetch_not::u128::acqrel+0x4>
        mov               x0, x2
        mov               x1, x3
        ret
        ldp               x2, x3, [x0]
        mov               x5, x3
        mov               x4, x2
        mvn               x6, x2
        mvn               x7, x5
        mov               x3, x5
        caspal            x2, x3, x6, x7, [x0]
        cmp               x3, x5
        ccmp              x2, x4, #0x0, eq
        b.ne              0x2bb8 <asm_test::fetch_not::u128::seqcst+0x4>
        mov               x0, x2
        mov               x1, x3
        ret
        ldp               x2, x3, [x0]
        mov               x5, x3
        mov               x4, x2
        mvn               x6, x2
        mvn               x7, x5
        mov               x3, x5
        caspa             x2, x3, x6, x7, [x0]
        cmp               x3, x5
        ccmp              x2, x4, #0x0, eq
        b.ne              0x2bec <asm_test::fetch_not::u128::acquire+0x4>
        mov               x0, x2
        mov               x1, x3
        ret
        ldp               x2, x3, [x0]
        mov               x5, x3
        mov               x4, x2
        mvn               x6, x2
        mvn               x7, x5
        mov               x3, x5
        casp              x2, x3, x6, x7, [x0]
        cmp               x3, x5
        ccmp              x2, x4, #0x0, eq
        b.ne              0x2c20 <asm_test::fetch_not::u128::relaxed+0x4>
        mov               x0, x2
        mov               x1, x3
        ret
        ldp               x2, x3, [x0]
        mov               x5, x3
        mov               x4, x2
        mvn               x6, x2
        mvn               x7, x5
        mov               x3, x5
        caspl             x2, x3, x6, x7, [x0]
        cmp               x3, x5
        ccmp              x2, x4, #0x0, eq
        b.ne              0x2c54 <asm_test::fetch_not::u128::release+0x4>
        mov               x0, x2
        mov               x1, x3
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
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        subs              x8, x4, x1
        sbc               x9, x7, x2
        mov               x5, x7
        caspal            x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x2d78 <asm_test::fetch_sub::u128::acqrel+0x4>
        mov               x0, x4
        mov               x1, x5
        ret
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        subs              x8, x4, x1
        sbc               x9, x7, x2
        mov               x5, x7
        caspal            x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x2dac <asm_test::fetch_sub::u128::seqcst+0x4>
        mov               x0, x4
        mov               x1, x5
        ret
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        subs              x8, x4, x1
        sbc               x9, x7, x2
        mov               x5, x7
        caspa             x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x2de0 <asm_test::fetch_sub::u128::acquire+0x4>
        mov               x0, x4
        mov               x1, x5
        ret
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        subs              x8, x4, x1
        sbc               x9, x7, x2
        mov               x5, x7
        casp              x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x2e14 <asm_test::fetch_sub::u128::relaxed+0x4>
        mov               x0, x4
        mov               x1, x5
        ret
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        subs              x8, x4, x1
        sbc               x9, x7, x2
        mov               x5, x7
        caspl             x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x2e48 <asm_test::fetch_sub::u128::release+0x4>
        mov               x0, x4
        mov               x1, x5
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
        ldeorl            x1, x0, [x0]
        ret
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        eor               x8, x4, x1
        eor               x9, x7, x2
        mov               x5, x7
        caspal            x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x2f1c <asm_test::fetch_xor::u128::acqrel+0x4>
        mov               x0, x4
        mov               x1, x5
        ret
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        eor               x8, x4, x1
        eor               x9, x7, x2
        mov               x5, x7
        caspal            x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x2f50 <asm_test::fetch_xor::u128::seqcst+0x4>
        mov               x0, x4
        mov               x1, x5
        ret
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        eor               x8, x4, x1
        eor               x9, x7, x2
        mov               x5, x7
        caspa             x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x2f84 <asm_test::fetch_xor::u128::acquire+0x4>
        mov               x0, x4
        mov               x1, x5
        ret
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        eor               x8, x4, x1
        eor               x9, x7, x2
        mov               x5, x7
        casp              x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x2fb8 <asm_test::fetch_xor::u128::relaxed+0x4>
        mov               x0, x4
        mov               x1, x5
        ret
        ldp               x4, x5, [x0]
        mov               x7, x5
        mov               x6, x4
        eor               x8, x4, x1
        eor               x9, x7, x2
        mov               x5, x7
        caspl             x4, x5, x8, x9, [x0]
        cmp               x5, x7
        ccmp              x4, x6, #0x0, eq
        b.ne              0x2fec <asm_test::fetch_xor::u128::release+0x4>
        mov               x0, x4
        mov               x1, x5
        ret

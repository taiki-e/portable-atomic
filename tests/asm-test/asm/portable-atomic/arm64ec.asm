.text:
0:
        ldaxrb            w8, [x0]
        and               w9, w8, w1
        mvn               w9, w9
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxrb            w0, [x8]
        and               w9, w0, w1
        mvn               w9, w9
        stlxrb            w10, w9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
0:
        ldaxrb            w8, [x0]
        and               w9, w8, w1
        mvn               w9, w9
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrb             w8, [x0]
        and               w9, w8, w1
        mvn               w9, w9
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrb             w8, [x0]
        and               w9, w8, w1
        mvn               w9, w9
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldaxrh            w8, [x0]
        and               w9, w8, w1
        mvn               w9, w9
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxrh            w0, [x8]
        and               w9, w0, w1
        mvn               w9, w9
        stlxrh            w10, w9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
0:
        ldaxrh            w8, [x0]
        and               w9, w8, w1
        mvn               w9, w9
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrh             w8, [x0]
        and               w9, w8, w1
        mvn               w9, w9
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrh             w8, [x0]
        and               w9, w8, w1
        mvn               w9, w9
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldaxr             w8, [x0]
        and               w9, w8, w1
        mvn               w9, w9
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxr             w0, [x8]
        and               w9, w0, w1
        mvn               w9, w9
        stlxr             w10, w9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
0:
        ldaxr             w8, [x0]
        and               w9, w8, w1
        mvn               w9, w9
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxr              w8, [x0]
        and               w9, w8, w1
        mvn               w9, w9
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxr              w8, [x0]
        and               w9, w8, w1
        mvn               w9, w9
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        and               x9, x0, x1
        mvn               x9, x9
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        and               x9, x0, x1
        mvn               x9, x9
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        and               x9, x0, x1
        mvn               x9, x9
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        and               x9, x0, x1
        mvn               x9, x9
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        and               x9, x0, x1
        mvn               x9, x9
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
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

.text:
        tbz               w1, #0x0, 1f
0:
        ldaxrb            w8, [x0]
        eor               w9, w8, #0x1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        dmb               ish
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
        dmb               ish
        cset              w0, ne
        ret

.text:
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

.text:
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

.text:
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

.text:
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

.text:
0:
        ldaxp             x8, x1, [x0]
        and               x9, x8, x2
        and               x10, x1, x3
        mvn               x9, x9
        mvn               x10, x10
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        dmb               ish
        mov               x0, x8
        ret

.text:
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

.text:
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

.text:
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

.text:
        and               w9, w1, #0xff
0:
        ldaxrb            w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, hi
        stlxrb            w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

.text:
        and               w9, w1, #0xff
0:
        ldaxrb            w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, hi
        stlxrb            w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        dmb               ish
        ret

.text:
        and               w9, w1, #0xff
0:
        ldaxrb            w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, hi
        stxrb             w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

.text:
        and               w9, w1, #0xff
0:
        ldxrb             w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, hi
        stxrb             w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

.text:
        and               w9, w1, #0xff
0:
        ldxrb             w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, hi
        stlxrb            w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

.text:
        and               w9, w1, #0xffff
0:
        ldaxrh            w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, hi
        stlxrh            w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

.text:
        and               w9, w1, #0xffff
0:
        ldaxrh            w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, hi
        stlxrh            w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        dmb               ish
        ret

.text:
        and               w9, w1, #0xffff
0:
        ldaxrh            w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, hi
        stxrh             w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

.text:
        and               w9, w1, #0xffff
0:
        ldxrh             w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, hi
        stxrh             w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

.text:
        and               w9, w1, #0xffff
0:
        ldxrh             w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, hi
        stlxrh            w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

.text:
0:
        ldaxr             w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, hi
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxr             w0, [x8]
        cmp               w0, w1
        csel              w9, w0, w1, hi
        stlxr             w10, w9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
0:
        ldaxr             w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, hi
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxr              w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, hi
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxr              w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, hi
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, hi
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, hi
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, hi
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, hi
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, hi
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
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

.text:
0:
        ldaxp             x8, x1, [x0]
        cmp               x2, x8
        sbcs              xzr, x3, x1
        csel              x10, x1, x3, lo
        csel              x9, x8, x2, lo
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        dmb               ish
        mov               x0, x8
        ret

.text:
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

.text:
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

.text:
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

.text:
        and               w9, w1, #0xff
0:
        ldaxrb            w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, ls
        stlxrb            w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

.text:
        and               w9, w1, #0xff
0:
        ldaxrb            w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, ls
        stlxrb            w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        dmb               ish
        ret

.text:
        and               w9, w1, #0xff
0:
        ldaxrb            w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, ls
        stxrb             w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

.text:
        and               w9, w1, #0xff
0:
        ldxrb             w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, ls
        stxrb             w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

.text:
        and               w9, w1, #0xff
0:
        ldxrb             w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, ls
        stlxrb            w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

.text:
        and               w9, w1, #0xffff
0:
        ldaxrh            w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, ls
        stlxrh            w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

.text:
        and               w9, w1, #0xffff
0:
        ldaxrh            w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, ls
        stlxrh            w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        dmb               ish
        ret

.text:
        and               w9, w1, #0xffff
0:
        ldaxrh            w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, ls
        stxrh             w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

.text:
        and               w9, w1, #0xffff
0:
        ldxrh             w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, ls
        stxrh             w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

.text:
        and               w9, w1, #0xffff
0:
        ldxrh             w8, [x0]
        cmp               w8, w9
        csel              w10, w8, w9, ls
        stlxrh            w11, w10, [x0]
        cbnz              w11, 0b
        mov               w0, w8
        ret

.text:
0:
        ldaxr             w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, ls
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxr             w0, [x8]
        cmp               w0, w1
        csel              w9, w0, w1, ls
        stlxr             w10, w9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
0:
        ldaxr             w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, ls
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxr              w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, ls
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxr              w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, ls
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, ls
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, ls
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, ls
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, ls
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, ls
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
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

.text:
0:
        ldaxp             x8, x1, [x0]
        cmp               x2, x8
        sbcs              xzr, x3, x1
        csel              x10, x1, x3, hs
        csel              x9, x8, x2, hs
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        dmb               ish
        mov               x0, x8
        ret

.text:
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

.text:
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

.text:
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

.text:
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

.text:
        mov               w8, w1
0:
        ldaxrb            w1, [x0]
        cmp               w1, w8, uxtb
        b.ne              1f
        stlxrb            w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        dmb               ish
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
        mov               w8, w1
0:
        ldaxrb            w1, [x0]
        cmp               w1, w8, uxtb
        b.ne              1f
        stlxrb            w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        dmb               ish
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

.text:
        mov               w8, w1
0:
        ldaxrb            w1, [x0]
        cmp               w1, w8, uxtb
        b.ne              1f
        stlxrb            w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        dmb               ish
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
        mov               w8, w1
0:
        ldaxrh            w1, [x0]
        cmp               w1, w8, uxth
        b.ne              1f
        stlxrh            w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        dmb               ish
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
        mov               w8, w1
0:
        ldaxrh            w1, [x0]
        cmp               w1, w8, uxth
        b.ne              1f
        stlxrh            w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        dmb               ish
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

.text:
        mov               w8, w1
0:
        ldaxrh            w1, [x0]
        cmp               w1, w8, uxth
        b.ne              1f
        stlxrh            w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        dmb               ish
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
        mov               w8, w1
0:
        ldaxr             w1, [x0]
        cmp               w1, w8
        b.ne              1f
        stlxr             w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        dmb               ish
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
        mov               w8, w1
0:
        ldaxr             w1, [x0]
        cmp               w1, w8
        b.ne              1f
        stlxr             w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        dmb               ish
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

.text:
        mov               w8, w1
0:
        ldaxr             w1, [x0]
        cmp               w1, w8
        b.ne              1f
        stlxr             w9, w2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        dmb               ish
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
        mov               x8, x1
0:
        ldaxr             x1, [x0]
        cmp               x1, x8
        b.ne              1f
        stlxr             w9, x2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        dmb               ish
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
        mov               x8, x1
0:
        ldaxr             x1, [x0]
        cmp               x1, x8
        b.ne              1f
        stlxr             w9, x2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        dmb               ish
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

.text:
        mov               x8, x1
0:
        ldaxr             x1, [x0]
        cmp               x1, x8
        b.ne              1f
        stlxr             w9, x2, [x0]
        cbnz              w9, 0b
        mov               w8, #0x1                // =1
        dmb               ish
        eor               w0, w8, #0x1
        ret
1:
        eor               w0, wzr, #0x1
        clrex
        ret

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
        mov               w9, w2
0:
        ldaxrb            w8, [x0]
        cmp               w8, w1
        b.ne              1f
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        dmb               ish
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
        mov               w9, w2
0:
        ldaxrb            w8, [x0]
        cmp               w8, w1
        b.ne              1f
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        dmb               ish
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

.text:
        mov               w9, w2
0:
        ldaxrb            w8, [x0]
        cmp               w8, w1
        b.ne              1f
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        dmb               ish
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

.text:
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
        dmb               ish
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

.text:
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
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

.text:
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
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

.text:
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
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

.text:
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
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

.text:
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
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

.text:
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
        dmb               ish
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

.text:
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
        dmb               ish
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

.text:
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
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

.text:
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
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

.text:
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
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

.text:
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
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

.text:
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
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

.text:
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
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

.text:
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

.text:
        ldaxrb            w8, [x0]
        cmp               w8, w1, uxtb
        b.ne              0f
        stlxrb            w9, w2, [x0]
        cbz               w9, 1f
        eor               w0, wzr, #0x1
        mov               w1, w8
        ret
0:
        clrex
        eor               w0, wzr, #0x1
        mov               w1, w8
        ret
1:
        dmb               ish
        mov               w9, #0x1                // =1
        eor               w0, w9, #0x1
        mov               w1, w8
        ret

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
        ldaxrb            w8, [x0]
        cmp               w8, w1, uxtb
        b.ne              0f
        stlxrb            w9, w2, [x0]
        cbz               w9, 1f
        eor               w0, wzr, #0x1
        mov               w1, w8
        ret
0:
        clrex
        eor               w0, wzr, #0x1
        mov               w1, w8
        ret
1:
        dmb               ish
        mov               w9, #0x1                // =1
        eor               w0, w9, #0x1
        mov               w1, w8
        ret

.text:
        ldaxrb            w8, [x0]
        cmp               w8, w1, uxtb
        b.ne              0f
        stlxrb            w9, w2, [x0]
        cbz               w9, 1f
        eor               w0, wzr, #0x1
        mov               w1, w8
        ret
0:
        clrex
        eor               w0, wzr, #0x1
        mov               w1, w8
        ret
1:
        dmb               ish
        mov               w9, #0x1                // =1
        eor               w0, w9, #0x1
        mov               w1, w8
        ret

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
        ldaxrh            w8, [x0]
        cmp               w8, w1, uxth
        b.ne              0f
        stlxrh            w9, w2, [x0]
        cbz               w9, 1f
        eor               w0, wzr, #0x1
        mov               w1, w8
        ret
0:
        clrex
        eor               w0, wzr, #0x1
        mov               w1, w8
        ret
1:
        dmb               ish
        mov               w9, #0x1                // =1
        eor               w0, w9, #0x1
        mov               w1, w8
        ret

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
        ldaxrh            w8, [x0]
        cmp               w8, w1, uxth
        b.ne              0f
        stlxrh            w9, w2, [x0]
        cbz               w9, 1f
        eor               w0, wzr, #0x1
        mov               w1, w8
        ret
0:
        clrex
        eor               w0, wzr, #0x1
        mov               w1, w8
        ret
1:
        dmb               ish
        mov               w9, #0x1                // =1
        eor               w0, w9, #0x1
        mov               w1, w8
        ret

.text:
        ldaxrh            w8, [x0]
        cmp               w8, w1, uxth
        b.ne              0f
        stlxrh            w9, w2, [x0]
        cbz               w9, 1f
        eor               w0, wzr, #0x1
        mov               w1, w8
        ret
0:
        clrex
        eor               w0, wzr, #0x1
        mov               w1, w8
        ret
1:
        dmb               ish
        mov               w9, #0x1                // =1
        eor               w0, w9, #0x1
        mov               w1, w8
        ret

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
        ldaxr             w8, [x0]
        cmp               w8, w1
        b.ne              0f
        stlxr             w9, w2, [x0]
        cbz               w9, 1f
        eor               w0, wzr, #0x1
        mov               w1, w8
        ret
0:
        clrex
        eor               w0, wzr, #0x1
        mov               w1, w8
        ret
1:
        dmb               ish
        mov               w9, #0x1                // =1
        eor               w0, w9, #0x1
        mov               w1, w8
        ret

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
        ldaxr             w8, [x0]
        cmp               w8, w1
        b.ne              0f
        stlxr             w9, w2, [x0]
        cbz               w9, 1f
        eor               w0, wzr, #0x1
        mov               w1, w8
        ret
0:
        clrex
        eor               w0, wzr, #0x1
        mov               w1, w8
        ret
1:
        dmb               ish
        mov               w9, #0x1                // =1
        eor               w0, w9, #0x1
        mov               w1, w8
        ret

.text:
        ldaxr             w8, [x0]
        cmp               w8, w1
        b.ne              0f
        stlxr             w9, w2, [x0]
        cbz               w9, 1f
        eor               w0, wzr, #0x1
        mov               w1, w8
        ret
0:
        clrex
        eor               w0, wzr, #0x1
        mov               w1, w8
        ret
1:
        dmb               ish
        mov               w9, #0x1                // =1
        eor               w0, w9, #0x1
        mov               w1, w8
        ret

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
        ldaxr             x8, [x0]
        cmp               x8, x1
        b.ne              0f
        stlxr             w9, x2, [x0]
        cbz               w9, 1f
        eor               w0, wzr, #0x1
        mov               x1, x8
        ret
0:
        clrex
        eor               w0, wzr, #0x1
        mov               x1, x8
        ret
1:
        dmb               ish
        mov               w9, #0x1                // =1
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
        ldaxr             x8, [x0]
        cmp               x8, x1
        b.ne              0f
        stlxr             w9, x2, [x0]
        cbz               w9, 1f
        eor               w0, wzr, #0x1
        mov               x1, x8
        ret
0:
        clrex
        eor               w0, wzr, #0x1
        mov               x1, x8
        ret
1:
        dmb               ish
        mov               w9, #0x1                // =1
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

.text:
        ldaxr             x8, [x0]
        cmp               x8, x1
        b.ne              0f
        stlxr             w9, x2, [x0]
        cbz               w9, 1f
        eor               w0, wzr, #0x1
        mov               x1, x8
        ret
0:
        clrex
        eor               w0, wzr, #0x1
        mov               x1, x8
        ret
1:
        dmb               ish
        mov               w9, #0x1                // =1
        eor               w0, w9, #0x1
        mov               x1, x8
        ret

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
        ldaxrb            w8, [x0]
        cmp               w8, w1
        b.ne              0f
        mov               w9, w2
        stlxrb            w10, w9, [x0]
        cbz               w10, 1f
        cmp               w8, #0x0
        eor               w0, wzr, #0x1
        cset              w1, ne
        ret
0:
        clrex
        cmp               w8, #0x0
        eor               w0, wzr, #0x1
        cset              w1, ne
        ret
1:
        dmb               ish
        mov               w9, #0x1                // =1
        cmp               w8, #0x0
        eor               w0, w9, #0x1
        cset              w1, ne
        ret

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
        ldaxrb            w8, [x0]
        cmp               w8, w1
        b.ne              0f
        mov               w9, w2
        stlxrb            w10, w9, [x0]
        cbz               w10, 1f
        cmp               w8, #0x0
        eor               w0, wzr, #0x1
        cset              w1, ne
        ret
0:
        clrex
        cmp               w8, #0x0
        eor               w0, wzr, #0x1
        cset              w1, ne
        ret
1:
        dmb               ish
        mov               w9, #0x1                // =1
        cmp               w8, #0x0
        eor               w0, w9, #0x1
        cset              w1, ne
        ret

.text:
        ldaxrb            w8, [x0]
        cmp               w8, w1
        b.ne              0f
        mov               w9, w2
        stlxrb            w10, w9, [x0]
        cbz               w10, 1f
        cmp               w8, #0x0
        eor               w0, wzr, #0x1
        cset              w1, ne
        ret
0:
        clrex
        cmp               w8, #0x0
        eor               w0, wzr, #0x1
        cset              w1, ne
        ret
1:
        dmb               ish
        mov               w9, #0x1                // =1
        cmp               w8, #0x0
        eor               w0, w9, #0x1
        cset              w1, ne
        ret

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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

.text:
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
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

.text:
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
        dmb               ish
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

.text:
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
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

.text:
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
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

.text:
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
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

.text:
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
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

.text:
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
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

.text:
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
        dmb               ish
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

.text:
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
        dmb               ish
        stp               x9, x10, [x8, #0x10]
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

.text:
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
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

.text:
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
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

.text:
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
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

.text:
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
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

.text:
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
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

.text:
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
        cmp               x9, x2
        ccmp              x10, x3, #0x0, eq
        cset              w9, ne
        stp               x9, xzr, [x8]
        ret

.text:
0:
        ldaxrb            w8, [x0]
        orr               w8, w8, w1
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxrb            w8, [x0]
        orr               w8, w8, w1
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        dmb               ish
        ret

.text:
0:
        ldaxrb            w8, [x0]
        orr               w8, w8, w1
        stxrb             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxrb             w8, [x0]
        orr               w8, w8, w1
        stxrb             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxrb             w8, [x0]
        orr               w8, w8, w1
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxrh            w8, [x0]
        orr               w8, w8, w1
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxrh            w8, [x0]
        orr               w8, w8, w1
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        dmb               ish
        ret

.text:
0:
        ldaxrh            w8, [x0]
        orr               w8, w8, w1
        stxrh             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxrh             w8, [x0]
        orr               w8, w8, w1
        stxrh             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxrh             w8, [x0]
        orr               w8, w8, w1
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxr             w8, [x0]
        orr               w8, w8, w1
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxr             w8, [x0]
        orr               w8, w8, w1
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        dmb               ish
        ret

.text:
0:
        ldaxr             w8, [x0]
        orr               w8, w8, w1
        stxr              w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxr              w8, [x0]
        orr               w8, w8, w1
        stxr              w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxr              w8, [x0]
        orr               w8, w8, w1
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxr             x8, [x0]
        orr               x8, x8, x1
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxr             x8, [x0]
        orr               x8, x8, x1
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
        dmb               ish
        ret

.text:
0:
        ldaxr             x8, [x0]
        orr               x8, x8, x1
        stxr              w9, x8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxr              x8, [x0]
        orr               x8, x8, x1
        stxr              w9, x8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxr              x8, [x0]
        orr               x8, x8, x1
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxp             x8, x9, [x0]
        orr               x10, x8, x2
        orr               x11, x9, x3
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

.text:
0:
        ldaxp             x8, x9, [x0]
        orr               x10, x8, x2
        orr               x11, x9, x3
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        dmb               ish
        ret

.text:
0:
        ldaxp             x8, x9, [x0]
        orr               x10, x8, x2
        orr               x11, x9, x3
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

.text:
0:
        ldxp              x8, x9, [x0]
        orr               x10, x8, x2
        orr               x11, x9, x3
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

.text:
0:
        ldxp              x8, x9, [x0]
        orr               x10, x8, x2
        orr               x11, x9, x3
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

.text:
0:
        ldaxrb            w8, [x0]
        add               w8, w8, w1
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxrb            w8, [x0]
        add               w8, w8, w1
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        dmb               ish
        ret

.text:
0:
        ldaxrb            w8, [x0]
        add               w8, w8, w1
        stxrb             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxrb             w8, [x0]
        add               w8, w8, w1
        stxrb             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxrb             w8, [x0]
        add               w8, w8, w1
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxrh            w8, [x0]
        add               w8, w8, w1
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxrh            w8, [x0]
        add               w8, w8, w1
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        dmb               ish
        ret

.text:
0:
        ldaxrh            w8, [x0]
        add               w8, w8, w1
        stxrh             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxrh             w8, [x0]
        add               w8, w8, w1
        stxrh             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxrh             w8, [x0]
        add               w8, w8, w1
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxr             w8, [x0]
        add               w8, w8, w1
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxr             w8, [x0]
        add               w8, w8, w1
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        dmb               ish
        ret

.text:
0:
        ldaxr             w8, [x0]
        add               w8, w8, w1
        stxr              w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxr              w8, [x0]
        add               w8, w8, w1
        stxr              w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxr              w8, [x0]
        add               w8, w8, w1
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxr             x8, [x0]
        add               x8, x8, x1
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxr             x8, [x0]
        add               x8, x8, x1
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
        dmb               ish
        ret

.text:
0:
        ldaxr             x8, [x0]
        add               x8, x8, x1
        stxr              w9, x8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxr              x8, [x0]
        add               x8, x8, x1
        stxr              w9, x8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxr              x8, [x0]
        add               x8, x8, x1
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxp             x8, x9, [x0]
        adds              x10, x8, x2
        adc               x11, x9, x3
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

.text:
0:
        ldaxp             x8, x9, [x0]
        adds              x10, x8, x2
        adc               x11, x9, x3
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        dmb               ish
        ret

.text:
0:
        ldaxp             x8, x9, [x0]
        adds              x10, x8, x2
        adc               x11, x9, x3
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

.text:
0:
        ldxp              x8, x9, [x0]
        adds              x10, x8, x2
        adc               x11, x9, x3
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

.text:
0:
        ldxp              x8, x9, [x0]
        adds              x10, x8, x2
        adc               x11, x9, x3
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

.text:
0:
        ldaxrb            w8, [x0]
        and               w8, w8, w1
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxrb            w8, [x0]
        and               w8, w8, w1
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        dmb               ish
        ret

.text:
0:
        ldaxrb            w8, [x0]
        and               w8, w8, w1
        stxrb             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxrb             w8, [x0]
        and               w8, w8, w1
        stxrb             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxrb             w8, [x0]
        and               w8, w8, w1
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxrh            w8, [x0]
        and               w8, w8, w1
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxrh            w8, [x0]
        and               w8, w8, w1
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        dmb               ish
        ret

.text:
0:
        ldaxrh            w8, [x0]
        and               w8, w8, w1
        stxrh             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxrh             w8, [x0]
        and               w8, w8, w1
        stxrh             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxrh             w8, [x0]
        and               w8, w8, w1
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxr             w8, [x0]
        and               w8, w8, w1
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxr             w8, [x0]
        and               w8, w8, w1
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        dmb               ish
        ret

.text:
0:
        ldaxr             w8, [x0]
        and               w8, w8, w1
        stxr              w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxr              w8, [x0]
        and               w8, w8, w1
        stxr              w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxr              w8, [x0]
        and               w8, w8, w1
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxr             x8, [x0]
        and               x8, x8, x1
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxr             x8, [x0]
        and               x8, x8, x1
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
        dmb               ish
        ret

.text:
0:
        ldaxr             x8, [x0]
        and               x8, x8, x1
        stxr              w9, x8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxr              x8, [x0]
        and               x8, x8, x1
        stxr              w9, x8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxr              x8, [x0]
        and               x8, x8, x1
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxp             x8, x9, [x0]
        and               x10, x8, x2
        and               x11, x9, x3
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

.text:
0:
        ldaxp             x8, x9, [x0]
        and               x10, x8, x2
        and               x11, x9, x3
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        dmb               ish
        ret

.text:
0:
        ldaxp             x8, x9, [x0]
        and               x10, x8, x2
        and               x11, x9, x3
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

.text:
0:
        ldxp              x8, x9, [x0]
        and               x10, x8, x2
        and               x11, x9, x3
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

.text:
0:
        ldxp              x8, x9, [x0]
        and               x10, x8, x2
        and               x11, x9, x3
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

.text:
        ldrb              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        cbnz              wzr, 2f
1:
        ldaxrb            w8, [x0]
        cmp               w8, w9, uxtb
        b.ne              0b
        neg               w9, w9
        stlxrb            w10, w9, [x0]
        cmp               w10, #0x0
        cset              w10, eq
        mov               w9, w8
        cbz               w10, 1b
2:
        ret

.text:
        ldrb              w8, [x0]
        b                 2f
0:
        mov               w9, wzr
        clrex
1:
        cbnz              w9, 4f
2:
        mov               w9, w8
        ldaxrb            w8, [x0]
        cmp               w8, w9, uxtb
        b.ne              0b
        neg               w9, w9
        stlxrb            w10, w9, [x0]
        cbz               w10, 3f
        mov               w9, wzr
        b                 1b
3:
        dmb               ish
        mov               w9, #0x1                // =1
        b                 1b
4:
        ret

.text:
        ldrb              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        cbnz              wzr, 2f
1:
        ldaxrb            w8, [x0]
        cmp               w8, w9, uxtb
        b.ne              0b
        neg               w9, w9
        stxrb             w10, w9, [x0]
        cmp               w10, #0x0
        cset              w10, eq
        mov               w9, w8
        cbz               w10, 1b
2:
        ret

.text:
        ldrb              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        cbnz              wzr, 2f
1:
        ldxrb             w8, [x0]
        cmp               w8, w9, uxtb
        b.ne              0b
        neg               w9, w9
        stxrb             w10, w9, [x0]
        cmp               w10, #0x0
        cset              w10, eq
        mov               w9, w8
        cbz               w10, 1b
2:
        ret

.text:
        ldrb              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        cbnz              wzr, 2f
1:
        ldxrb             w8, [x0]
        cmp               w8, w9, uxtb
        b.ne              0b
        neg               w9, w9
        stlxrb            w10, w9, [x0]
        cmp               w10, #0x0
        cset              w10, eq
        mov               w9, w8
        cbz               w10, 1b
2:
        ret

.text:
        ldrh              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        cbnz              wzr, 2f
1:
        ldaxrh            w8, [x0]
        cmp               w8, w9, uxth
        b.ne              0b
        neg               w9, w9
        stlxrh            w10, w9, [x0]
        cmp               w10, #0x0
        cset              w10, eq
        mov               w9, w8
        cbz               w10, 1b
2:
        ret

.text:
        ldrh              w8, [x0]
        b                 2f
0:
        mov               w9, wzr
        clrex
1:
        cbnz              w9, 4f
2:
        mov               w9, w8
        ldaxrh            w8, [x0]
        cmp               w8, w9, uxth
        b.ne              0b
        neg               w9, w9
        stlxrh            w10, w9, [x0]
        cbz               w10, 3f
        mov               w9, wzr
        b                 1b
3:
        dmb               ish
        mov               w9, #0x1                // =1
        b                 1b
4:
        ret

.text:
        ldrh              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        cbnz              wzr, 2f
1:
        ldaxrh            w8, [x0]
        cmp               w8, w9, uxth
        b.ne              0b
        neg               w9, w9
        stxrh             w10, w9, [x0]
        cmp               w10, #0x0
        cset              w10, eq
        mov               w9, w8
        cbz               w10, 1b
2:
        ret

.text:
        ldrh              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        cbnz              wzr, 2f
1:
        ldxrh             w8, [x0]
        cmp               w8, w9, uxth
        b.ne              0b
        neg               w9, w9
        stxrh             w10, w9, [x0]
        cmp               w10, #0x0
        cset              w10, eq
        mov               w9, w8
        cbz               w10, 1b
2:
        ret

.text:
        ldrh              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        cbnz              wzr, 2f
1:
        ldxrh             w8, [x0]
        cmp               w8, w9, uxth
        b.ne              0b
        neg               w9, w9
        stlxrh            w10, w9, [x0]
        cmp               w10, #0x0
        cset              w10, eq
        mov               w9, w8
        cbz               w10, 1b
2:
        ret

.text:
        ldr               w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        cbnz              wzr, 2f
1:
        ldaxr             w8, [x0]
        cmp               w8, w9
        b.ne              0b
        neg               w9, w9
        stlxr             w10, w9, [x0]
        cmp               w10, #0x0
        cset              w10, eq
        mov               w9, w8
        cbz               w10, 1b
2:
        ret

.text:
        ldr               w8, [x0]
        b                 2f
0:
        mov               w9, wzr
        clrex
1:
        cbnz              w9, 4f
2:
        mov               w9, w8
        ldaxr             w8, [x0]
        cmp               w8, w9
        b.ne              0b
        neg               w9, w9
        stlxr             w10, w9, [x0]
        cbz               w10, 3f
        mov               w9, wzr
        b                 1b
3:
        dmb               ish
        mov               w9, #0x1                // =1
        b                 1b
4:
        ret

.text:
        ldr               w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        cbnz              wzr, 2f
1:
        ldaxr             w8, [x0]
        cmp               w8, w9
        b.ne              0b
        neg               w9, w9
        stxr              w10, w9, [x0]
        cmp               w10, #0x0
        cset              w10, eq
        mov               w9, w8
        cbz               w10, 1b
2:
        ret

.text:
        ldr               w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        cbnz              wzr, 2f
1:
        ldxr              w8, [x0]
        cmp               w8, w9
        b.ne              0b
        neg               w9, w9
        stxr              w10, w9, [x0]
        cmp               w10, #0x0
        cset              w10, eq
        mov               w9, w8
        cbz               w10, 1b
2:
        ret

.text:
        ldr               w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        cbnz              wzr, 2f
1:
        ldxr              w8, [x0]
        cmp               w8, w9
        b.ne              0b
        neg               w9, w9
        stlxr             w10, w9, [x0]
        cmp               w10, #0x0
        cset              w10, eq
        mov               w9, w8
        cbz               w10, 1b
2:
        ret

.text:
        ldr               x9, [x0]
        b                 1f
0:
        clrex
        mov               x9, x8
        cbnz              wzr, 2f
1:
        ldaxr             x8, [x0]
        cmp               x8, x9
        b.ne              0b
        neg               x9, x9
        stlxr             w10, x9, [x0]
        cmp               w10, #0x0
        cset              w10, eq
        mov               x9, x8
        cbz               w10, 1b
2:
        ret

.text:
        ldr               x10, [x0]
        b                 2f
0:
        mov               w9, wzr
        clrex
1:
        mov               x10, x8
        cbnz              w9, 4f
2:
        ldaxr             x8, [x0]
        cmp               x8, x10
        b.ne              0b
        neg               x9, x10
        stlxr             w10, x9, [x0]
        cbz               w10, 3f
        mov               w9, wzr
        b                 1b
3:
        dmb               ish
        mov               w9, #0x1                // =1
        b                 1b
4:
        ret

.text:
        ldr               x9, [x0]
        b                 1f
0:
        clrex
        mov               x9, x8
        cbnz              wzr, 2f
1:
        ldaxr             x8, [x0]
        cmp               x8, x9
        b.ne              0b
        neg               x9, x9
        stxr              w10, x9, [x0]
        cmp               w10, #0x0
        cset              w10, eq
        mov               x9, x8
        cbz               w10, 1b
2:
        ret

.text:
        ldr               x9, [x0]
        b                 1f
0:
        clrex
        mov               x9, x8
        cbnz              wzr, 2f
1:
        ldxr              x8, [x0]
        cmp               x8, x9
        b.ne              0b
        neg               x9, x9
        stxr              w10, x9, [x0]
        cmp               w10, #0x0
        cset              w10, eq
        mov               x9, x8
        cbz               w10, 1b
2:
        ret

.text:
        ldr               x9, [x0]
        b                 1f
0:
        clrex
        mov               x9, x8
        cbnz              wzr, 2f
1:
        ldxr              x8, [x0]
        cmp               x8, x9
        b.ne              0b
        neg               x9, x9
        stlxr             w10, x9, [x0]
        cmp               w10, #0x0
        cset              w10, eq
        mov               x9, x8
        cbz               w10, 1b
2:
        ret

.text:
0:
        ldaxp             x8, x9, [x0]
        negs              x10, x8
        ngc               x11, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

.text:
0:
        ldaxp             x8, x9, [x0]
        negs              x10, x8
        ngc               x11, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        dmb               ish
        ret

.text:
0:
        ldaxp             x8, x9, [x0]
        negs              x10, x8
        ngc               x11, x9
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

.text:
0:
        ldxp              x8, x9, [x0]
        negs              x10, x8
        ngc               x11, x9
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

.text:
0:
        ldxp              x8, x9, [x0]
        negs              x10, x8
        ngc               x11, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

.text:
0:
        ldaxrb            w8, [x0]
        mvn               w8, w8
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxrb            w8, [x0]
        mvn               w8, w8
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        dmb               ish
        ret

.text:
0:
        ldaxrb            w8, [x0]
        mvn               w8, w8
        stxrb             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxrb             w8, [x0]
        mvn               w8, w8
        stxrb             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxrb             w8, [x0]
        mvn               w8, w8
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxrh            w8, [x0]
        mvn               w8, w8
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxrh            w8, [x0]
        mvn               w8, w8
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        dmb               ish
        ret

.text:
0:
        ldaxrh            w8, [x0]
        mvn               w8, w8
        stxrh             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxrh             w8, [x0]
        mvn               w8, w8
        stxrh             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxrh             w8, [x0]
        mvn               w8, w8
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxr             w8, [x0]
        mvn               w8, w8
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxr             w8, [x0]
        mvn               w8, w8
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        dmb               ish
        ret

.text:
0:
        ldaxr             w8, [x0]
        mvn               w8, w8
        stxr              w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxr              w8, [x0]
        mvn               w8, w8
        stxr              w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxr              w8, [x0]
        mvn               w8, w8
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxr             x8, [x0]
        mvn               x8, x8
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxr             x8, [x0]
        mvn               x8, x8
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
        dmb               ish
        ret

.text:
0:
        ldaxr             x8, [x0]
        mvn               x8, x8
        stxr              w9, x8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxr              x8, [x0]
        mvn               x8, x8
        stxr              w9, x8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxr              x8, [x0]
        mvn               x8, x8
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxp             x8, x9, [x0]
        mvn               x10, x8
        mvn               x11, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

.text:
0:
        ldaxp             x8, x9, [x0]
        mvn               x10, x8
        mvn               x11, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        dmb               ish
        ret

.text:
0:
        ldaxp             x8, x9, [x0]
        mvn               x10, x8
        mvn               x11, x9
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

.text:
0:
        ldxp              x8, x9, [x0]
        mvn               x10, x8
        mvn               x11, x9
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

.text:
0:
        ldxp              x8, x9, [x0]
        mvn               x10, x8
        mvn               x11, x9
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

.text:
0:
        ldaxrb            w8, [x0]
        sub               w8, w8, w1
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxrb            w8, [x0]
        sub               w8, w8, w1
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        dmb               ish
        ret

.text:
0:
        ldaxrb            w8, [x0]
        sub               w8, w8, w1
        stxrb             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxrb             w8, [x0]
        sub               w8, w8, w1
        stxrb             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxrb             w8, [x0]
        sub               w8, w8, w1
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxrh            w8, [x0]
        sub               w8, w8, w1
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxrh            w8, [x0]
        sub               w8, w8, w1
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        dmb               ish
        ret

.text:
0:
        ldaxrh            w8, [x0]
        sub               w8, w8, w1
        stxrh             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxrh             w8, [x0]
        sub               w8, w8, w1
        stxrh             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxrh             w8, [x0]
        sub               w8, w8, w1
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxr             w8, [x0]
        sub               w8, w8, w1
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxr             w8, [x0]
        sub               w8, w8, w1
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        dmb               ish
        ret

.text:
0:
        ldaxr             w8, [x0]
        sub               w8, w8, w1
        stxr              w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxr              w8, [x0]
        sub               w8, w8, w1
        stxr              w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxr              w8, [x0]
        sub               w8, w8, w1
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxr             x8, [x0]
        sub               x8, x8, x1
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxr             x8, [x0]
        sub               x8, x8, x1
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
        dmb               ish
        ret

.text:
0:
        ldaxr             x8, [x0]
        sub               x8, x8, x1
        stxr              w9, x8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxr              x8, [x0]
        sub               x8, x8, x1
        stxr              w9, x8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxr              x8, [x0]
        sub               x8, x8, x1
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxp             x8, x9, [x0]
        subs              x10, x8, x2
        sbc               x11, x9, x3
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

.text:
0:
        ldaxp             x8, x9, [x0]
        subs              x10, x8, x2
        sbc               x11, x9, x3
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        dmb               ish
        ret

.text:
0:
        ldaxp             x8, x9, [x0]
        subs              x10, x8, x2
        sbc               x11, x9, x3
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

.text:
0:
        ldxp              x8, x9, [x0]
        subs              x10, x8, x2
        sbc               x11, x9, x3
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

.text:
0:
        ldxp              x8, x9, [x0]
        subs              x10, x8, x2
        sbc               x11, x9, x3
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

.text:
0:
        ldaxrb            w8, [x0]
        eor               w8, w8, w1
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxrb            w8, [x0]
        eor               w8, w8, w1
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        dmb               ish
        ret

.text:
0:
        ldaxrb            w8, [x0]
        eor               w8, w8, w1
        stxrb             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxrb             w8, [x0]
        eor               w8, w8, w1
        stxrb             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxrb             w8, [x0]
        eor               w8, w8, w1
        stlxrb            w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxrh            w8, [x0]
        eor               w8, w8, w1
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxrh            w8, [x0]
        eor               w8, w8, w1
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        dmb               ish
        ret

.text:
0:
        ldaxrh            w8, [x0]
        eor               w8, w8, w1
        stxrh             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxrh             w8, [x0]
        eor               w8, w8, w1
        stxrh             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxrh             w8, [x0]
        eor               w8, w8, w1
        stlxrh            w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxr             w8, [x0]
        eor               w8, w8, w1
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxr             w8, [x0]
        eor               w8, w8, w1
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        dmb               ish
        ret

.text:
0:
        ldaxr             w8, [x0]
        eor               w8, w8, w1
        stxr              w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxr              w8, [x0]
        eor               w8, w8, w1
        stxr              w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxr              w8, [x0]
        eor               w8, w8, w1
        stlxr             w9, w8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxr             x8, [x0]
        eor               x8, x8, x1
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxr             x8, [x0]
        eor               x8, x8, x1
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
        dmb               ish
        ret

.text:
0:
        ldaxr             x8, [x0]
        eor               x8, x8, x1
        stxr              w9, x8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxr              x8, [x0]
        eor               x8, x8, x1
        stxr              w9, x8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldxr              x8, [x0]
        eor               x8, x8, x1
        stlxr             w9, x8, [x0]
        cbnz              w9, 0b
        ret

.text:
0:
        ldaxp             x8, x9, [x0]
        eor               x10, x8, x2
        eor               x11, x9, x3
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

.text:
0:
        ldaxp             x8, x9, [x0]
        eor               x10, x8, x2
        eor               x11, x9, x3
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        dmb               ish
        ret

.text:
0:
        ldaxp             x8, x9, [x0]
        eor               x10, x8, x2
        eor               x11, x9, x3
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

.text:
0:
        ldxp              x8, x9, [x0]
        eor               x10, x8, x2
        eor               x11, x9, x3
        stxp              w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

.text:
0:
        ldxp              x8, x9, [x0]
        eor               x10, x8, x2
        eor               x11, x9, x3
        stlxp             w12, x10, x11, [x0]
        cbnz              w12, 0b
        ret

.text:
        ldarb             w0, [x0]
        ret

.text:
        ldarb             w0, [x0]
        ret

.text:
        ldrb              w0, [x0]
        ret

.text:
        ldarh             w0, [x0]
        ret

.text:
        ldarh             w0, [x0]
        ret

.text:
        ldrh              w0, [x0]
        ret

.text:
        ldar              w0, [x0]
        ret

.text:
        ldar              w0, [x0]
        ret

.text:
        ldr               w0, [x0]
        ret

.text:
        ldar              x0, [x0]
        ret

.text:
        ldar              x0, [x0]
        ret

.text:
        ldr               x0, [x0]
        ret

.text:
        ldarb             w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

.text:
        ldarb             w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

.text:
        ldrb              w8, [x0]
        cmp               w8, #0x0
        cset              w0, ne
        ret

.text:
0:
        ldaxp             x8, x1, [x0]
        stlxp             w9, x8, x1, [x0]
        cbnz              w9, 0b
        mov               x0, x8
        ret

.text:
0:
        ldaxp             x8, x1, [x0]
        stxp              w9, x8, x1, [x0]
        cbnz              w9, 0b
        mov               x0, x8
        ret

.text:
0:
        ldxp              x8, x1, [x0]
        stxp              w9, x8, x1, [x0]
        cbnz              w9, 0b
        mov               x0, x8
        ret

.text:
        mov               x8, x0
0:
        ldaxrb            w0, [x8]
        stlxrb            w9, w1, [x8]
        cbnz              w9, 0b
        ret

.text:
        mov               x8, x0
0:
        ldaxrb            w0, [x8]
        stlxrb            w9, w1, [x8]
        cbnz              w9, 0b
        dmb               ish
        ret

.text:
        mov               x8, x0
0:
        ldaxrb            w0, [x8]
        stxrb             w9, w1, [x8]
        cbnz              w9, 0b
        ret

.text:
        mov               x8, x0
0:
        ldxrb             w0, [x8]
        stxrb             w9, w1, [x8]
        cbnz              w9, 0b
        ret

.text:
        mov               x8, x0
0:
        ldxrb             w0, [x8]
        stlxrb            w9, w1, [x8]
        cbnz              w9, 0b
        ret

.text:
        mov               x8, x0
0:
        ldaxrh            w0, [x8]
        stlxrh            w9, w1, [x8]
        cbnz              w9, 0b
        ret

.text:
        mov               x8, x0
0:
        ldaxrh            w0, [x8]
        stlxrh            w9, w1, [x8]
        cbnz              w9, 0b
        dmb               ish
        ret

.text:
        mov               x8, x0
0:
        ldaxrh            w0, [x8]
        stxrh             w9, w1, [x8]
        cbnz              w9, 0b
        ret

.text:
        mov               x8, x0
0:
        ldxrh             w0, [x8]
        stxrh             w9, w1, [x8]
        cbnz              w9, 0b
        ret

.text:
        mov               x8, x0
0:
        ldxrh             w0, [x8]
        stlxrh            w9, w1, [x8]
        cbnz              w9, 0b
        ret

.text:
        mov               x8, x0
0:
        ldaxr             w0, [x8]
        stlxr             w9, w1, [x8]
        cbnz              w9, 0b
        ret

.text:
        mov               x8, x0
0:
        ldaxr             w0, [x8]
        stlxr             w9, w1, [x8]
        cbnz              w9, 0b
        dmb               ish
        ret

.text:
        mov               x8, x0
0:
        ldaxr             w0, [x8]
        stxr              w9, w1, [x8]
        cbnz              w9, 0b
        ret

.text:
        mov               x8, x0
0:
        ldxr              w0, [x8]
        stxr              w9, w1, [x8]
        cbnz              w9, 0b
        ret

.text:
        mov               x8, x0
0:
        ldxr              w0, [x8]
        stlxr             w9, w1, [x8]
        cbnz              w9, 0b
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        stlxr             w9, x1, [x8]
        cbnz              w9, 0b
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        stlxr             w9, x1, [x8]
        cbnz              w9, 0b
        dmb               ish
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        stxr              w9, x1, [x8]
        cbnz              w9, 0b
        ret

.text:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        stxr              w9, x1, [x8]
        cbnz              w9, 0b
        ret

.text:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        stlxr             w9, x1, [x8]
        cbnz              w9, 0b
        ret

.text:
        mov               w8, w1
0:
        ldaxrb            w9, [x0]
        stlxrb            w10, w8, [x0]
        cbnz              w10, 0b
        cmp               w9, #0x0
        cset              w0, ne
        ret

.text:
        mov               w9, w1
0:
        ldaxrb            w8, [x0]
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        dmb               ish
        cset              w0, ne
        ret

.text:
        mov               w8, w1
0:
        ldaxrb            w9, [x0]
        stxrb             w10, w8, [x0]
        cbnz              w10, 0b
        cmp               w9, #0x0
        cset              w0, ne
        ret

.text:
        mov               w8, w1
0:
        ldxrb             w9, [x0]
        stxrb             w10, w8, [x0]
        cbnz              w10, 0b
        cmp               w9, #0x0
        cset              w0, ne
        ret

.text:
        mov               w8, w1
0:
        ldxrb             w9, [x0]
        stlxrb            w10, w8, [x0]
        cbnz              w10, 0b
        cmp               w9, #0x0
        cset              w0, ne
        ret

.text:
0:
        ldaxp             x8, x1, [x0]
        stlxp             w9, x2, x3, [x0]
        cbnz              w9, 0b
        mov               x0, x8
        ret

.text:
0:
        ldaxp             x8, x1, [x0]
        stlxp             w9, x2, x3, [x0]
        cbnz              w9, 0b
        dmb               ish
        mov               x0, x8
        ret

.text:
0:
        ldaxp             x8, x1, [x0]
        stxp              w9, x2, x3, [x0]
        cbnz              w9, 0b
        mov               x0, x8
        ret

.text:
0:
        ldxp              x8, x1, [x0]
        stxp              w9, x2, x3, [x0]
        cbnz              w9, 0b
        mov               x0, x8
        ret

.text:
0:
        ldxp              x8, x1, [x0]
        stlxp             w9, x2, x3, [x0]
        cbnz              w9, 0b
        mov               x0, x8
        ret

.text:
        stlrb             w1, [x0]
        dmb               ish
        ret

.text:
        strb              w1, [x0]
        ret

.text:
        stlrb             w1, [x0]
        ret

.text:
        stlrh             w1, [x0]
        dmb               ish
        ret

.text:
        strh              w1, [x0]
        ret

.text:
        stlrh             w1, [x0]
        ret

.text:
        stlr              w1, [x0]
        dmb               ish
        ret

.text:
        str               w1, [x0]
        ret

.text:
        stlr              w1, [x0]
        ret

.text:
        stlr              x1, [x0]
        dmb               ish
        ret

.text:
        str               x1, [x0]
        ret

.text:
        stlr              x1, [x0]
        ret

.text:
        stlrb             w1, [x0]
        dmb               ish
        ret

.text:
        strb              w1, [x0]
        ret

.text:
        stlrb             w1, [x0]
        ret

.text:
0:
        ldaxp             xzr, x8, [x0]
        stlxp             w8, x2, x3, [x0]
        cbnz              w8, 0b
        dmb               ish
        ret

.text:
0:
        ldxp              xzr, x8, [x0]
        stxp              w8, x2, x3, [x0]
        cbnz              w8, 0b
        ret

.text:
0:
        ldxp              xzr, x8, [x0]
        stlxp             w8, x2, x3, [x0]
        cbnz              w8, 0b
        ret

.text:
0:
        ldaxrb            w8, [x0]
        orr               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxrb            w0, [x8]
        orr               w9, w0, w1
        stlxrb            w10, w9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
0:
        ldaxrb            w8, [x0]
        orr               w9, w8, w1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrb             w8, [x0]
        orr               w9, w8, w1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrb             w8, [x0]
        orr               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldaxrh            w8, [x0]
        orr               w9, w8, w1
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxrh            w0, [x8]
        orr               w9, w0, w1
        stlxrh            w10, w9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
0:
        ldaxrh            w8, [x0]
        orr               w9, w8, w1
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrh             w8, [x0]
        orr               w9, w8, w1
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrh             w8, [x0]
        orr               w9, w8, w1
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldaxr             w8, [x0]
        orr               w9, w8, w1
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxr             w0, [x8]
        orr               w9, w0, w1
        stlxr             w10, w9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
0:
        ldaxr             w8, [x0]
        orr               w9, w8, w1
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxr              w8, [x0]
        orr               w9, w8, w1
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxr              w8, [x0]
        orr               w9, w8, w1
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        orr               x9, x0, x1
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        orr               x9, x0, x1
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        orr               x9, x0, x1
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        orr               x9, x0, x1
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        orr               x9, x0, x1
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
0:
        ldaxrb            w8, [x0]
        orr               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret

.text:
0:
        ldaxrb            w8, [x0]
        orr               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        dmb               ish
        cset              w0, ne
        ret

.text:
0:
        ldaxrb            w8, [x0]
        orr               w9, w8, w1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret

.text:
0:
        ldxrb             w8, [x0]
        orr               w9, w8, w1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret

.text:
0:
        ldxrb             w8, [x0]
        orr               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret

.text:
0:
        ldaxp             x8, x1, [x0]
        orr               x9, x8, x2
        orr               x10, x1, x3
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

.text:
0:
        ldaxp             x8, x1, [x0]
        orr               x9, x8, x2
        orr               x10, x1, x3
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        dmb               ish
        mov               x0, x8
        ret

.text:
0:
        ldaxp             x8, x1, [x0]
        orr               x9, x8, x2
        orr               x10, x1, x3
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

.text:
0:
        ldxp              x8, x1, [x0]
        orr               x9, x8, x2
        orr               x10, x1, x3
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

.text:
0:
        ldxp              x8, x1, [x0]
        orr               x9, x8, x2
        orr               x10, x1, x3
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

.text:
0:
        ldaxrb            w8, [x0]
        add               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxrb            w0, [x8]
        add               w9, w0, w1
        stlxrb            w10, w9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
0:
        ldaxrb            w8, [x0]
        add               w9, w8, w1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrb             w8, [x0]
        add               w9, w8, w1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrb             w8, [x0]
        add               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldaxrh            w8, [x0]
        add               w9, w8, w1
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxrh            w0, [x8]
        add               w9, w0, w1
        stlxrh            w10, w9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
0:
        ldaxrh            w8, [x0]
        add               w9, w8, w1
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrh             w8, [x0]
        add               w9, w8, w1
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrh             w8, [x0]
        add               w9, w8, w1
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldaxr             w8, [x0]
        add               w9, w8, w1
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxr             w0, [x8]
        add               w9, w0, w1
        stlxr             w10, w9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
0:
        ldaxr             w8, [x0]
        add               w9, w8, w1
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxr              w8, [x0]
        add               w9, w8, w1
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxr              w8, [x0]
        add               w9, w8, w1
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        add               x9, x0, x1
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        add               x9, x0, x1
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        add               x9, x0, x1
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        add               x9, x0, x1
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        add               x9, x0, x1
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
0:
        ldaxp             x8, x1, [x0]
        adds              x9, x8, x2
        adc               x10, x1, x3
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

.text:
0:
        ldaxp             x8, x1, [x0]
        adds              x9, x8, x2
        adc               x10, x1, x3
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        dmb               ish
        mov               x0, x8
        ret

.text:
0:
        ldaxp             x8, x1, [x0]
        adds              x9, x8, x2
        adc               x10, x1, x3
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

.text:
0:
        ldxp              x8, x1, [x0]
        adds              x9, x8, x2
        adc               x10, x1, x3
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

.text:
0:
        ldxp              x8, x1, [x0]
        adds              x9, x8, x2
        adc               x10, x1, x3
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

.text:
0:
        ldaxrb            w8, [x0]
        and               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxrb            w0, [x8]
        and               w9, w0, w1
        stlxrb            w10, w9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
0:
        ldaxrb            w8, [x0]
        and               w9, w8, w1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrb             w8, [x0]
        and               w9, w8, w1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrb             w8, [x0]
        and               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldaxrh            w8, [x0]
        and               w9, w8, w1
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxrh            w0, [x8]
        and               w9, w0, w1
        stlxrh            w10, w9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
0:
        ldaxrh            w8, [x0]
        and               w9, w8, w1
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrh             w8, [x0]
        and               w9, w8, w1
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrh             w8, [x0]
        and               w9, w8, w1
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldaxr             w8, [x0]
        and               w9, w8, w1
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxr             w0, [x8]
        and               w9, w0, w1
        stlxr             w10, w9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
0:
        ldaxr             w8, [x0]
        and               w9, w8, w1
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxr              w8, [x0]
        and               w9, w8, w1
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxr              w8, [x0]
        and               w9, w8, w1
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        and               x9, x0, x1
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        and               x9, x0, x1
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        and               x9, x0, x1
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        and               x9, x0, x1
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        and               x9, x0, x1
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
0:
        ldaxrb            w8, [x0]
        and               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret

.text:
0:
        ldaxrb            w8, [x0]
        and               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        dmb               ish
        cset              w0, ne
        ret

.text:
0:
        ldaxrb            w8, [x0]
        and               w9, w8, w1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret

.text:
0:
        ldxrb             w8, [x0]
        and               w9, w8, w1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret

.text:
0:
        ldxrb             w8, [x0]
        and               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret

.text:
0:
        ldaxp             x8, x1, [x0]
        and               x9, x8, x2
        and               x10, x1, x3
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

.text:
0:
        ldaxp             x8, x1, [x0]
        and               x9, x8, x2
        and               x10, x1, x3
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        dmb               ish
        mov               x0, x8
        ret

.text:
0:
        ldaxp             x8, x1, [x0]
        and               x9, x8, x2
        and               x10, x1, x3
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

.text:
0:
        ldxp              x8, x1, [x0]
        and               x9, x8, x2
        and               x10, x1, x3
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

.text:
0:
        ldxp              x8, x1, [x0]
        and               x9, x8, x2
        and               x10, x1, x3
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

.text:
0:
        ldaxrb            w9, [x0]
        sxtb              w8, w9
        cmp               w8, w1, sxtb
        csel              w9, w9, w1, gt
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldaxrb            w9, [x0]
        sxtb              w8, w9
        cmp               w8, w1, sxtb
        csel              w9, w9, w1, gt
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        dmb               ish
        ret

.text:
0:
        ldaxrb            w9, [x0]
        sxtb              w8, w9
        cmp               w8, w1, sxtb
        csel              w9, w9, w1, gt
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrb             w9, [x0]
        sxtb              w8, w9
        cmp               w8, w1, sxtb
        csel              w9, w9, w1, gt
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrb             w9, [x0]
        sxtb              w8, w9
        cmp               w8, w1, sxtb
        csel              w9, w9, w1, gt
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldaxrh            w9, [x0]
        sxth              w8, w9
        cmp               w8, w1, sxth
        csel              w9, w9, w1, gt
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldaxrh            w9, [x0]
        sxth              w8, w9
        cmp               w8, w1, sxth
        csel              w9, w9, w1, gt
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        dmb               ish
        ret

.text:
0:
        ldaxrh            w9, [x0]
        sxth              w8, w9
        cmp               w8, w1, sxth
        csel              w9, w9, w1, gt
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrh             w9, [x0]
        sxth              w8, w9
        cmp               w8, w1, sxth
        csel              w9, w9, w1, gt
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrh             w9, [x0]
        sxth              w8, w9
        cmp               w8, w1, sxth
        csel              w9, w9, w1, gt
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldaxr             w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, gt
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxr             w0, [x8]
        cmp               w0, w1
        csel              w9, w0, w1, gt
        stlxr             w10, w9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
0:
        ldaxr             w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, gt
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxr              w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, gt
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxr              w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, gt
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, gt
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, gt
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, gt
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, gt
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, gt
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
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

.text:
0:
        ldaxp             x8, x1, [x0]
        cmp               x2, x8
        sbcs              xzr, x3, x1
        csel              x10, x1, x3, lt
        csel              x9, x8, x2, lt
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        dmb               ish
        mov               x0, x8
        ret

.text:
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

.text:
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

.text:
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

.text:
0:
        ldaxrb            w9, [x0]
        sxtb              w8, w9
        cmp               w8, w1, sxtb
        csel              w9, w9, w1, le
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldaxrb            w9, [x0]
        sxtb              w8, w9
        cmp               w8, w1, sxtb
        csel              w9, w9, w1, le
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        dmb               ish
        ret

.text:
0:
        ldaxrb            w9, [x0]
        sxtb              w8, w9
        cmp               w8, w1, sxtb
        csel              w9, w9, w1, le
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrb             w9, [x0]
        sxtb              w8, w9
        cmp               w8, w1, sxtb
        csel              w9, w9, w1, le
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrb             w9, [x0]
        sxtb              w8, w9
        cmp               w8, w1, sxtb
        csel              w9, w9, w1, le
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldaxrh            w9, [x0]
        sxth              w8, w9
        cmp               w8, w1, sxth
        csel              w9, w9, w1, le
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldaxrh            w9, [x0]
        sxth              w8, w9
        cmp               w8, w1, sxth
        csel              w9, w9, w1, le
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        dmb               ish
        ret

.text:
0:
        ldaxrh            w9, [x0]
        sxth              w8, w9
        cmp               w8, w1, sxth
        csel              w9, w9, w1, le
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrh             w9, [x0]
        sxth              w8, w9
        cmp               w8, w1, sxth
        csel              w9, w9, w1, le
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrh             w9, [x0]
        sxth              w8, w9
        cmp               w8, w1, sxth
        csel              w9, w9, w1, le
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldaxr             w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, le
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxr             w0, [x8]
        cmp               w0, w1
        csel              w9, w0, w1, le
        stlxr             w10, w9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
0:
        ldaxr             w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, le
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxr              w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, le
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxr              w8, [x0]
        cmp               w8, w1
        csel              w9, w8, w1, le
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, le
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, le
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, le
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, le
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        cmp               x0, x1
        csel              x9, x0, x1, le
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
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

.text:
0:
        ldaxp             x8, x1, [x0]
        cmp               x2, x8
        sbcs              xzr, x3, x1
        csel              x10, x1, x3, ge
        csel              x9, x8, x2, ge
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        dmb               ish
        mov               x0, x8
        ret

.text:
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

.text:
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

.text:
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

.text:
        ldrb              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        cbnz              wzr, 2f
1:
        ldaxrb            w8, [x0]
        cmp               w8, w9, uxtb
        b.ne              0b
        neg               w9, w9
        stlxrb            w10, w9, [x0]
        cmp               w10, #0x0
        cset              w10, eq
        mov               w9, w8
        cbz               w10, 1b
2:
        mov               w0, w8
        ret

.text:
        ldrb              w8, [x0]
        b                 2f
0:
        mov               w9, wzr
        clrex
1:
        cbnz              w9, 4f
2:
        mov               w9, w8
        ldaxrb            w8, [x0]
        cmp               w8, w9, uxtb
        b.ne              0b
        neg               w9, w9
        stlxrb            w10, w9, [x0]
        cbz               w10, 3f
        mov               w9, wzr
        b                 1b
3:
        dmb               ish
        mov               w9, #0x1                // =1
        b                 1b
4:
        mov               w0, w8
        ret

.text:
        ldrb              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        cbnz              wzr, 2f
1:
        ldaxrb            w8, [x0]
        cmp               w8, w9, uxtb
        b.ne              0b
        neg               w9, w9
        stxrb             w10, w9, [x0]
        cmp               w10, #0x0
        cset              w10, eq
        mov               w9, w8
        cbz               w10, 1b
2:
        mov               w0, w8
        ret

.text:
        ldrb              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        cbnz              wzr, 2f
1:
        ldxrb             w8, [x0]
        cmp               w8, w9, uxtb
        b.ne              0b
        neg               w9, w9
        stxrb             w10, w9, [x0]
        cmp               w10, #0x0
        cset              w10, eq
        mov               w9, w8
        cbz               w10, 1b
2:
        mov               w0, w8
        ret

.text:
        ldrb              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        cbnz              wzr, 2f
1:
        ldxrb             w8, [x0]
        cmp               w8, w9, uxtb
        b.ne              0b
        neg               w9, w9
        stlxrb            w10, w9, [x0]
        cmp               w10, #0x0
        cset              w10, eq
        mov               w9, w8
        cbz               w10, 1b
2:
        mov               w0, w8
        ret

.text:
        ldrh              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        cbnz              wzr, 2f
1:
        ldaxrh            w8, [x0]
        cmp               w8, w9, uxth
        b.ne              0b
        neg               w9, w9
        stlxrh            w10, w9, [x0]
        cmp               w10, #0x0
        cset              w10, eq
        mov               w9, w8
        cbz               w10, 1b
2:
        mov               w0, w8
        ret

.text:
        ldrh              w8, [x0]
        b                 2f
0:
        mov               w9, wzr
        clrex
1:
        cbnz              w9, 4f
2:
        mov               w9, w8
        ldaxrh            w8, [x0]
        cmp               w8, w9, uxth
        b.ne              0b
        neg               w9, w9
        stlxrh            w10, w9, [x0]
        cbz               w10, 3f
        mov               w9, wzr
        b                 1b
3:
        dmb               ish
        mov               w9, #0x1                // =1
        b                 1b
4:
        mov               w0, w8
        ret

.text:
        ldrh              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        cbnz              wzr, 2f
1:
        ldaxrh            w8, [x0]
        cmp               w8, w9, uxth
        b.ne              0b
        neg               w9, w9
        stxrh             w10, w9, [x0]
        cmp               w10, #0x0
        cset              w10, eq
        mov               w9, w8
        cbz               w10, 1b
2:
        mov               w0, w8
        ret

.text:
        ldrh              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        cbnz              wzr, 2f
1:
        ldxrh             w8, [x0]
        cmp               w8, w9, uxth
        b.ne              0b
        neg               w9, w9
        stxrh             w10, w9, [x0]
        cmp               w10, #0x0
        cset              w10, eq
        mov               w9, w8
        cbz               w10, 1b
2:
        mov               w0, w8
        ret

.text:
        ldrh              w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        cbnz              wzr, 2f
1:
        ldxrh             w8, [x0]
        cmp               w8, w9, uxth
        b.ne              0b
        neg               w9, w9
        stlxrh            w10, w9, [x0]
        cmp               w10, #0x0
        cset              w10, eq
        mov               w9, w8
        cbz               w10, 1b
2:
        mov               w0, w8
        ret

.text:
        ldr               w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        cbnz              wzr, 2f
1:
        ldaxr             w8, [x0]
        cmp               w8, w9
        b.ne              0b
        neg               w9, w9
        stlxr             w10, w9, [x0]
        cmp               w10, #0x0
        cset              w10, eq
        mov               w9, w8
        cbz               w10, 1b
2:
        mov               w0, w8
        ret

.text:
        ldr               w8, [x0]
        b                 2f
0:
        mov               w9, wzr
        clrex
1:
        cbnz              w9, 4f
2:
        mov               w9, w8
        ldaxr             w8, [x0]
        cmp               w8, w9
        b.ne              0b
        neg               w9, w9
        stlxr             w10, w9, [x0]
        cbz               w10, 3f
        mov               w9, wzr
        b                 1b
3:
        dmb               ish
        mov               w9, #0x1                // =1
        b                 1b
4:
        mov               w0, w8
        ret

.text:
        ldr               w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        cbnz              wzr, 2f
1:
        ldaxr             w8, [x0]
        cmp               w8, w9
        b.ne              0b
        neg               w9, w9
        stxr              w10, w9, [x0]
        cmp               w10, #0x0
        cset              w10, eq
        mov               w9, w8
        cbz               w10, 1b
2:
        mov               w0, w8
        ret

.text:
        ldr               w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        cbnz              wzr, 2f
1:
        ldxr              w8, [x0]
        cmp               w8, w9
        b.ne              0b
        neg               w9, w9
        stxr              w10, w9, [x0]
        cmp               w10, #0x0
        cset              w10, eq
        mov               w9, w8
        cbz               w10, 1b
2:
        mov               w0, w8
        ret

.text:
        ldr               w9, [x0]
        b                 1f
0:
        clrex
        mov               w9, w8
        cbnz              wzr, 2f
1:
        ldxr              w8, [x0]
        cmp               w8, w9
        b.ne              0b
        neg               w9, w9
        stlxr             w10, w9, [x0]
        cmp               w10, #0x0
        cset              w10, eq
        mov               w9, w8
        cbz               w10, 1b
2:
        mov               w0, w8
        ret

.text:
        ldr               x9, [x0]
        b                 1f
0:
        clrex
        mov               x9, x8
        cbnz              wzr, 2f
1:
        ldaxr             x8, [x0]
        cmp               x8, x9
        b.ne              0b
        neg               x9, x9
        stlxr             w10, x9, [x0]
        cmp               w10, #0x0
        cset              w10, eq
        mov               x9, x8
        cbz               w10, 1b
2:
        mov               x0, x8
        ret

.text:
        ldr               x8, [x0]
        b                 2f
0:
        mov               w9, wzr
        clrex
1:
        cbnz              w9, 4f
2:
        mov               x9, x8
        ldaxr             x8, [x0]
        cmp               x8, x9
        b.ne              0b
        neg               x9, x9
        stlxr             w10, x9, [x0]
        cbz               w10, 3f
        mov               w9, wzr
        b                 1b
3:
        dmb               ish
        mov               w9, #0x1                // =1
        b                 1b
4:
        mov               x0, x8
        ret

.text:
        ldr               x9, [x0]
        b                 1f
0:
        clrex
        mov               x9, x8
        cbnz              wzr, 2f
1:
        ldaxr             x8, [x0]
        cmp               x8, x9
        b.ne              0b
        neg               x9, x9
        stxr              w10, x9, [x0]
        cmp               w10, #0x0
        cset              w10, eq
        mov               x9, x8
        cbz               w10, 1b
2:
        mov               x0, x8
        ret

.text:
        ldr               x9, [x0]
        b                 1f
0:
        clrex
        mov               x9, x8
        cbnz              wzr, 2f
1:
        ldxr              x8, [x0]
        cmp               x8, x9
        b.ne              0b
        neg               x9, x9
        stxr              w10, x9, [x0]
        cmp               w10, #0x0
        cset              w10, eq
        mov               x9, x8
        cbz               w10, 1b
2:
        mov               x0, x8
        ret

.text:
        ldr               x9, [x0]
        b                 1f
0:
        clrex
        mov               x9, x8
        cbnz              wzr, 2f
1:
        ldxr              x8, [x0]
        cmp               x8, x9
        b.ne              0b
        neg               x9, x9
        stlxr             w10, x9, [x0]
        cmp               w10, #0x0
        cset              w10, eq
        mov               x9, x8
        cbz               w10, 1b
2:
        mov               x0, x8
        ret

.text:
0:
        ldaxp             x8, x1, [x0]
        negs              x9, x8
        ngc               x10, x1
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

.text:
0:
        ldaxp             x8, x1, [x0]
        negs              x9, x8
        ngc               x10, x1
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        dmb               ish
        mov               x0, x8
        ret

.text:
0:
        ldaxp             x8, x1, [x0]
        negs              x9, x8
        ngc               x10, x1
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

.text:
0:
        ldxp              x8, x1, [x0]
        negs              x9, x8
        ngc               x10, x1
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

.text:
0:
        ldxp              x8, x1, [x0]
        negs              x9, x8
        ngc               x10, x1
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

.text:
0:
        ldaxrb            w8, [x0]
        mvn               w9, w8
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxrb            w0, [x8]
        mvn               w9, w0
        stlxrb            w10, w9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
0:
        ldaxrb            w8, [x0]
        mvn               w9, w8
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrb             w8, [x0]
        mvn               w9, w8
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrb             w8, [x0]
        mvn               w9, w8
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldaxrh            w8, [x0]
        mvn               w9, w8
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxrh            w0, [x8]
        mvn               w9, w0
        stlxrh            w10, w9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
0:
        ldaxrh            w8, [x0]
        mvn               w9, w8
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrh             w8, [x0]
        mvn               w9, w8
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrh             w8, [x0]
        mvn               w9, w8
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldaxr             w8, [x0]
        mvn               w9, w8
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxr             w0, [x8]
        mvn               w9, w0
        stlxr             w10, w9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
0:
        ldaxr             w8, [x0]
        mvn               w9, w8
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxr              w8, [x0]
        mvn               w9, w8
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxr              w8, [x0]
        mvn               w9, w8
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        mvn               x9, x0
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        mvn               x9, x0
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        mvn               x9, x0
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        mvn               x9, x0
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        mvn               x9, x0
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
0:
        ldaxrb            w8, [x0]
        eor               w9, w8, #0x1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret

.text:
0:
        ldaxrb            w8, [x0]
        eor               w9, w8, #0x1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        dmb               ish
        cset              w0, ne
        ret

.text:
0:
        ldaxrb            w8, [x0]
        eor               w9, w8, #0x1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret

.text:
0:
        ldxrb             w8, [x0]
        eor               w9, w8, #0x1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret

.text:
0:
        ldxrb             w8, [x0]
        eor               w9, w8, #0x1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret

.text:
0:
        ldaxp             x8, x1, [x0]
        mvn               x9, x8
        mvn               x10, x1
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

.text:
0:
        ldaxp             x8, x1, [x0]
        mvn               x9, x8
        mvn               x10, x1
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        dmb               ish
        mov               x0, x8
        ret

.text:
0:
        ldaxp             x8, x1, [x0]
        mvn               x9, x8
        mvn               x10, x1
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

.text:
0:
        ldxp              x8, x1, [x0]
        mvn               x9, x8
        mvn               x10, x1
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

.text:
0:
        ldxp              x8, x1, [x0]
        mvn               x9, x8
        mvn               x10, x1
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

.text:
0:
        ldaxrb            w8, [x0]
        sub               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxrb            w0, [x8]
        sub               w9, w0, w1
        stlxrb            w10, w9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
0:
        ldaxrb            w8, [x0]
        sub               w9, w8, w1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrb             w8, [x0]
        sub               w9, w8, w1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrb             w8, [x0]
        sub               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldaxrh            w8, [x0]
        sub               w9, w8, w1
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxrh            w0, [x8]
        sub               w9, w0, w1
        stlxrh            w10, w9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
0:
        ldaxrh            w8, [x0]
        sub               w9, w8, w1
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrh             w8, [x0]
        sub               w9, w8, w1
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrh             w8, [x0]
        sub               w9, w8, w1
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldaxr             w8, [x0]
        sub               w9, w8, w1
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxr             w0, [x8]
        sub               w9, w0, w1
        stlxr             w10, w9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
0:
        ldaxr             w8, [x0]
        sub               w9, w8, w1
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxr              w8, [x0]
        sub               w9, w8, w1
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxr              w8, [x0]
        sub               w9, w8, w1
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        sub               x9, x0, x1
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        sub               x9, x0, x1
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        sub               x9, x0, x1
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        sub               x9, x0, x1
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        sub               x9, x0, x1
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
0:
        ldaxp             x8, x1, [x0]
        subs              x9, x8, x2
        sbc               x10, x1, x3
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

.text:
0:
        ldaxp             x8, x1, [x0]
        subs              x9, x8, x2
        sbc               x10, x1, x3
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        dmb               ish
        mov               x0, x8
        ret

.text:
0:
        ldaxp             x8, x1, [x0]
        subs              x9, x8, x2
        sbc               x10, x1, x3
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

.text:
0:
        ldxp              x8, x1, [x0]
        subs              x9, x8, x2
        sbc               x10, x1, x3
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

.text:
0:
        ldxp              x8, x1, [x0]
        subs              x9, x8, x2
        sbc               x10, x1, x3
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

.text:
0:
        ldaxrb            w8, [x0]
        eor               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxrb            w0, [x8]
        eor               w9, w0, w1
        stlxrb            w10, w9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
0:
        ldaxrb            w8, [x0]
        eor               w9, w8, w1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrb             w8, [x0]
        eor               w9, w8, w1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrb             w8, [x0]
        eor               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldaxrh            w8, [x0]
        eor               w9, w8, w1
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxrh            w0, [x8]
        eor               w9, w0, w1
        stlxrh            w10, w9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
0:
        ldaxrh            w8, [x0]
        eor               w9, w8, w1
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrh             w8, [x0]
        eor               w9, w8, w1
        stxrh             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxrh             w8, [x0]
        eor               w9, w8, w1
        stlxrh            w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldaxr             w8, [x0]
        eor               w9, w8, w1
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxr             w0, [x8]
        eor               w9, w0, w1
        stlxr             w10, w9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
0:
        ldaxr             w8, [x0]
        eor               w9, w8, w1
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxr              w8, [x0]
        eor               w9, w8, w1
        stxr              w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
0:
        ldxr              w8, [x0]
        eor               w9, w8, w1
        stlxr             w10, w9, [x0]
        cbnz              w10, 0b
        mov               w0, w8
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        eor               x9, x0, x1
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        eor               x9, x0, x1
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        dmb               ish
        ret

.text:
        mov               x8, x0
0:
        ldaxr             x0, [x8]
        eor               x9, x0, x1
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        eor               x9, x0, x1
        stxr              w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
        mov               x8, x0
0:
        ldxr              x0, [x8]
        eor               x9, x0, x1
        stlxr             w10, x9, [x8]
        cbnz              w10, 0b
        ret

.text:
0:
        ldaxrb            w8, [x0]
        eor               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret

.text:
0:
        ldaxrb            w8, [x0]
        eor               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        dmb               ish
        cset              w0, ne
        ret

.text:
0:
        ldaxrb            w8, [x0]
        eor               w9, w8, w1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret

.text:
0:
        ldxrb             w8, [x0]
        eor               w9, w8, w1
        stxrb             w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret

.text:
0:
        ldxrb             w8, [x0]
        eor               w9, w8, w1
        stlxrb            w10, w9, [x0]
        cbnz              w10, 0b
        cmp               w8, #0x0
        cset              w0, ne
        ret

.text:
0:
        ldaxp             x8, x1, [x0]
        eor               x9, x8, x2
        eor               x10, x1, x3
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

.text:
0:
        ldaxp             x8, x1, [x0]
        eor               x9, x8, x2
        eor               x10, x1, x3
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        dmb               ish
        mov               x0, x8
        ret

.text:
0:
        ldaxp             x8, x1, [x0]
        eor               x9, x8, x2
        eor               x10, x1, x3
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

.text:
0:
        ldxp              x8, x1, [x0]
        eor               x9, x8, x2
        eor               x10, x1, x3
        stxp              w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

.text:
0:
        ldxp              x8, x1, [x0]
        eor               x9, x8, x2
        eor               x10, x1, x3
        stlxp             w11, x9, x10, [x0]
        cbnz              w11, 0b
        mov               x0, x8
        ret

.wowthk$aa:
        stp               q6, q7, [sp, #-0xb0]!
        stp               q8, q9, [sp, #0x20]
        stp               q10, q11, [sp, #0x40]
        stp               q12, q13, [sp, #0x60]
        stp               q14, q15, [sp, #0x80]
        stp               x29, x30, [sp, #0xa0]
        add               x29, sp, #0xa0
        blr               x9
        adrp              x8, 0x0 <.wowthk$aa>
        ldr               x1, [x8]
        mov               x8, x0
        ldp               x29, x30, [sp, #0xa0]
        ldp               q14, q15, [sp, #0x80]
        ldp               q12, q13, [sp, #0x60]
        ldp               q10, q11, [sp, #0x40]
        ldp               q8, q9, [sp, #0x20]
        ldp               q6, q7, [sp], #0xb0
        br                x1

.wowthk$aa:
        stp               q6, q7, [sp, #-0xc0]!
        stp               q8, q9, [sp, #0x20]
        stp               q10, q11, [sp, #0x40]
        stp               q12, q13, [sp, #0x60]
        stp               q14, q15, [sp, #0x80]
        str               x19, [sp, #0xa0]
        stp               x29, x30, [sp, #0xa8]
        add               x29, sp, #0xa8
        ldp               x2, x3, [x2]
        mov               x19, x0
        mov               x0, x1
        blr               x9
        adrp              x8, 0x0 <.wowthk$aa>
        stp               x0, x1, [x19]
        ldr               x0, [x8]
        ldp               x29, x30, [sp, #0xa8]
        ldr               x19, [sp, #0xa0]
        ldp               q14, q15, [sp, #0x80]
        ldp               q12, q13, [sp, #0x60]
        ldp               q10, q11, [sp, #0x40]
        ldp               q8, q9, [sp, #0x20]
        ldp               q6, q7, [sp], #0xc0
        br                x0

.wowthk$aa:
        sub               sp, sp, #0xc0
        stp               q6, q7, [sp, #0x10]
        stp               q8, q9, [sp, #0x30]
        stp               q10, q11, [sp, #0x50]
        stp               q12, q13, [sp, #0x70]
        stp               q14, q15, [sp, #0x90]
        stp               x29, x30, [sp, #0xb0]
        add               x29, sp, #0xb0
        blr               x9
        and               w8, w0, #0x1
        adrp              x9, 0x0 <.wowthk$aa>
        strb              w1, [sp, #0xf]
        strb              w8, [sp, #0xe]
        ldrh              w8, [sp, #0xe]
        ldr               x0, [x9]
        ldp               x29, x30, [sp, #0xb0]
        ldp               q14, q15, [sp, #0x90]
        ldp               q12, q13, [sp, #0x70]
        ldp               q10, q11, [sp, #0x50]
        ldp               q8, q9, [sp, #0x30]
        ldp               q6, q7, [sp, #0x10]
        add               sp, sp, #0xc0
        br                x0

.wowthk$aa:
        sub               sp, sp, #0xc0
        stp               q6, q7, [sp, #0x10]
        stp               q8, q9, [sp, #0x30]
        stp               q10, q11, [sp, #0x50]
        stp               q12, q13, [sp, #0x70]
        stp               q14, q15, [sp, #0x90]
        stp               x29, x30, [sp, #0xb0]
        add               x29, sp, #0xb0
        blr               x9
        adrp              x9, 0x0 <.wowthk$aa>
        strh              w0, [sp, #0xc]
        strh              w1, [sp, #0xe]
        ldr               w8, [sp, #0xc]
        ldr               x0, [x9]
        ldp               x29, x30, [sp, #0xb0]
        ldp               q14, q15, [sp, #0x90]
        ldp               q12, q13, [sp, #0x70]
        ldp               q10, q11, [sp, #0x50]
        ldp               q8, q9, [sp, #0x30]
        ldp               q6, q7, [sp, #0x10]
        add               sp, sp, #0xc0
        br                x0

.wowthk$aa:
        sub               sp, sp, #0xc0
        stp               q6, q7, [sp, #0x10]
        stp               q8, q9, [sp, #0x30]
        stp               q10, q11, [sp, #0x50]
        stp               q12, q13, [sp, #0x70]
        stp               q14, q15, [sp, #0x90]
        stp               x29, x30, [sp, #0xb0]
        add               x29, sp, #0xb0
        blr               x9
        adrp              x9, 0x0 <.wowthk$aa>
        stp               w0, w1, [sp, #0x8]
        ldr               x8, [sp, #0x8]
        ldr               x0, [x9]
        ldp               x29, x30, [sp, #0xb0]
        ldp               q14, q15, [sp, #0x90]
        ldp               q12, q13, [sp, #0x70]
        ldp               q10, q11, [sp, #0x50]
        ldp               q8, q9, [sp, #0x30]
        ldp               q6, q7, [sp, #0x10]
        add               sp, sp, #0xc0
        br                x0

.wowthk$aa:
        stp               q6, q7, [sp, #-0xc0]!
        stp               q8, q9, [sp, #0x20]
        stp               q10, q11, [sp, #0x40]
        stp               q12, q13, [sp, #0x60]
        stp               q14, q15, [sp, #0x80]
        str               x19, [sp, #0xa0]
        stp               x29, x30, [sp, #0xa8]
        add               x29, sp, #0xa8
        mov               x19, x0
        mov               x0, x1
        mov               x1, x2
        mov               x2, x3
        blr               x9
        adrp              x8, 0x0 <.wowthk$aa>
        stp               x0, x1, [x19]
        ldr               x0, [x8]
        ldp               x29, x30, [sp, #0xa8]
        ldr               x19, [sp, #0xa0]
        ldp               q14, q15, [sp, #0x80]
        ldp               q12, q13, [sp, #0x60]
        ldp               q10, q11, [sp, #0x40]
        ldp               q8, q9, [sp, #0x20]
        ldp               q6, q7, [sp], #0xc0
        br                x0

.wowthk$aa:
        stp               q6, q7, [sp, #-0xc0]!
        stp               q8, q9, [sp, #0x20]
        stp               q10, q11, [sp, #0x40]
        stp               q12, q13, [sp, #0x60]
        stp               q14, q15, [sp, #0x80]
        str               x19, [sp, #0xa0]
        stp               x29, x30, [sp, #0xa8]
        add               x29, sp, #0xa8
        ldp               x2, x10, [x2]
        mov               x19, x0
        ldp               x4, x5, [x3]
        mov               x8, x0
        mov               x0, x1
        mov               x3, x10
        blr               x9
        adrp              x8, 0x0 <.wowthk$aa>
        ldr               x0, [x8]
        mov               x8, x19
        ldp               x29, x30, [sp, #0xa8]
        ldr               x19, [sp, #0xa0]
        ldp               q14, q15, [sp, #0x80]
        ldp               q12, q13, [sp, #0x60]
        ldp               q10, q11, [sp, #0x40]
        ldp               q8, q9, [sp, #0x20]
        ldp               q6, q7, [sp], #0xc0
        br                x0

.wowthk$aa:
        stp               q6, q7, [sp, #-0xb0]!
        stp               q8, q9, [sp, #0x20]
        stp               q10, q11, [sp, #0x40]
        stp               q12, q13, [sp, #0x60]
        stp               q14, q15, [sp, #0x80]
        stp               x29, x30, [sp, #0xa0]
        add               x29, sp, #0xa0
        blr               x9
        adrp              x8, 0x0 <.wowthk$aa>
        ldr               x0, [x8]
        ldp               x29, x30, [sp, #0xa0]
        ldp               q14, q15, [sp, #0x80]
        ldp               q12, q13, [sp, #0x60]
        ldp               q10, q11, [sp, #0x40]
        ldp               q8, q9, [sp, #0x20]
        ldp               q6, q7, [sp], #0xb0
        br                x0

.wowthk$aa:
        stp               q6, q7, [sp, #-0xb0]!
        stp               q8, q9, [sp, #0x20]
        stp               q10, q11, [sp, #0x40]
        stp               q12, q13, [sp, #0x60]
        stp               q14, q15, [sp, #0x80]
        stp               x29, x30, [sp, #0xa0]
        add               x29, sp, #0xa0
        ldp               x2, x3, [x1]
        blr               x9
        adrp              x8, 0x0 <.wowthk$aa>
        ldr               x0, [x8]
        ldp               x29, x30, [sp, #0xa0]
        ldp               q14, q15, [sp, #0x80]
        ldp               q12, q13, [sp, #0x60]
        ldp               q10, q11, [sp, #0x40]
        ldp               q8, q9, [sp, #0x20]
        ldp               q6, q7, [sp], #0xb0
        br                x0

.wowthk$aa:
        stp               q6, q7, [sp, #-0xb0]!
        stp               q8, q9, [sp, #0x20]
        stp               q10, q11, [sp, #0x40]
        stp               q12, q13, [sp, #0x60]
        stp               q14, q15, [sp, #0x80]
        stp               x29, x30, [sp, #0xa0]
        add               x29, sp, #0xa0
        blr               x9
        adrp              x8, 0x0 <.wowthk$aa>
        ldr               x0, [x8]
        ldp               x29, x30, [sp, #0xa0]
        ldp               q14, q15, [sp, #0x80]
        ldp               q12, q13, [sp, #0x60]
        ldp               q10, q11, [sp, #0x40]
        ldp               q8, q9, [sp, #0x20]
        ldp               q6, q7, [sp], #0xb0
        br                x0

.wowthk$aa:
        stp               q6, q7, [sp, #-0xb0]!
        stp               q8, q9, [sp, #0x20]
        stp               q10, q11, [sp, #0x40]
        stp               q12, q13, [sp, #0x60]
        stp               q14, q15, [sp, #0x80]
        stp               x29, x30, [sp, #0xa0]
        add               x29, sp, #0xa0
        blr               x9
        adrp              x8, 0x0 <.wowthk$aa>
        ldr               x1, [x8]
        mov               x8, x0
        ldp               x29, x30, [sp, #0xa0]
        ldp               q14, q15, [sp, #0x80]
        ldp               q12, q13, [sp, #0x60]
        ldp               q10, q11, [sp, #0x40]
        ldp               q8, q9, [sp, #0x20]
        ldp               q6, q7, [sp], #0xb0
        br                x1

.wowthk$aa:
        stp               q6, q7, [sp, #-0xc0]!
        stp               q8, q9, [sp, #0x20]
        stp               q10, q11, [sp, #0x40]
        stp               q12, q13, [sp, #0x60]
        stp               q14, q15, [sp, #0x80]
        str               x19, [sp, #0xa0]
        stp               x29, x30, [sp, #0xa8]
        add               x29, sp, #0xa8
        mov               x19, x0
        mov               x0, x1
        blr               x9
        adrp              x8, 0x0 <.wowthk$aa>
        stp               x0, x1, [x19]
        ldr               x0, [x8]
        ldp               x29, x30, [sp, #0xa8]
        ldr               x19, [sp, #0xa0]
        ldp               q14, q15, [sp, #0x80]
        ldp               q12, q13, [sp, #0x60]
        ldp               q10, q11, [sp, #0x40]
        ldp               q8, q9, [sp, #0x20]
        ldp               q6, q7, [sp], #0xc0
        br                x0

